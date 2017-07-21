/*
 * \brief  mpct - mosquitto publish client test
 * \author Alexander Weidinger
 * \date   2017-06-27
 */

/* mosquitto includes */
#include <mosquittopp.h>

/* genode includes */
#include <base/env.h>
#include <base/printf.h>
#include <util/xml_node.h>
#include <os/config.h>

/* lwip includes */
extern "C" {
#include <lwip/sockets.h>
}
#include <lwip/genode.h>
#include <nic/packet_allocator.h>

/* etc */
#include <cstdio>
#include <cstring>

class MPCT : public mosqpp::mosquittopp {
public:
		MPCT(const char* id, const char* host, int port) : mosquittopp(id) {
			/* init the library */
			mosqpp::lib_init();

			int keepalive = 60;
			MPCT::connect(host, port, keepalive);
		}

		/* connect callback */
		void on_connect(int ret) {
			PDBG("Connected with code %d!", ret);

			MPCT::my_publish();
		}

		/* publish callback */
		void on_publish(int ret) {
			PDBG("Published with code %d!", ret);

			MPCT::my_publish();
		}

		/* disconnect callback */
		void on_disconnect(int ret) {
			PDBG("Disconnected with code %d!", ret);
		}

		/* error callback */
		void on_error() {
			PDBG("Error!");
		}


private:
		char buffer[1024] = { 0 };
		int i = 0, ret = -1;

		void my_publish() {
			sprintf(buffer, "Hello World: %d", i);
			ret = MPCT::publish(NULL, "mpct", strlen(buffer), buffer);
			PDBG("Publish '%s' successful: %d", buffer, MOSQ_ERR_SUCCESS == ret);
			i++;
		};
};

int main(int argc, char* argv[]) {
	//lwip_tcpip_init(); /* causes freeze, code works fine without it */

	enum { BUF_SIZE = Nic::Packet_allocator::DEFAULT_PACKET_SIZE * 128 };

	Genode::Xml_node network = Genode::config()->xml_node().sub_node("network");

	if (network.attribute_value<bool>("dhcp", true)) {
		PDBG("DHCP network...");
		if (lwip_nic_init(0,
		                  0,
		                  0,
		                  BUF_SIZE,
		                  BUF_SIZE)) {
			PERR("lwip init failed!");
			return 1;
		}
		PDBG("done");
	} else {
		PDBG("manual network...");
		char ip_addr[16] = {0};
		char subnet[16] = {0};
		char gateway[16] = {0};

		network.attribute("ip-address").value(ip_addr, sizeof(ip_addr));
		network.attribute("subnet-mask").value(subnet, sizeof(subnet));
		network.attribute("default-gateway").value(gateway, sizeof(gateway));

		if (lwip_nic_init(inet_addr(ip_addr),
		                  inet_addr(subnet),
		                  inet_addr(gateway),
		                  BUF_SIZE,
		                  BUF_SIZE)) {
			PERR("lwip init failed!");
			return 1;
		}
		PDBG("done");
	}

	/* get config */
	Genode::Xml_node mosquitto = Genode::config()->xml_node().sub_node("mosquitto");

	char ip_addr[16] = {0};
	char port[5] = {0};

	mosquitto.attribute("ip-address").value(ip_addr, sizeof(ip_addr));
	mosquitto.attribute("port").value(port, sizeof(port));

	/* create new mosquitto peer */
	PDBG("mosquitto init");
	class MPCT *mpct = new MPCT("mpct", ip_addr, atoi(port));
	PDBG("done");

	/* endless loop with auto reconnect */
	mpct->loop_forever();

	/* cleanup */
	mosqpp::lib_cleanup();
	return 0;
}

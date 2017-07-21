#!groovy
pipeline {
 agent any
 stages {
    stage('Prepare') {
      steps {
        //preparing for github log
        sh "mkdir -p log"
        sh "touch log/prepare.log.txt"
        // download and extract genode toolchain
        sh 'wget https://nextcloud.os.in.tum.de/s/QaJM5IPYoZ2RNXW/download -O genode-toolchain-15.05-x86_64.tar.bz2 >> log/prepare.log.txt 2>&1'
        sh 'tar xfj genode-toolchain-15.05-x86_64.tar.bz2 -C . >> log/prepare.log.txt 2>&1'
        // clone the genode repo
        sh 'git clone --depth 1 -b focnados-AR https://github.com/argos-research/genode >> log/prepare.log.txt 2>&1'
        sh "ln -s ${env.WORKSPACE} genode/repos/world" // add genode-world to repos/world

        // create build directory
        sh './genode/tool/create_builddir focnados_pbxa9 >> log/prepare.log.txt 2>&1'
        // add genode-world, libports and dde_linux to build
        sh 'echo "REPOSITORIES += \\$(GENODE_DIR)/repos/libports" >> genode/build/focnados_pbxa9/etc/build.conf'
        sh 'echo "REPOSITORIES += \\$(GENODE_DIR)/repos/dde_linux" >> genode/build/focnados_pbxa9/etc/build.conf'
        sh 'echo "REPOSITORIES += \\$(GENODE_DIR)/repos/world" >> genode/build/focnados_pbxa9/etc/build.conf'
        sh 'echo "MAKE += -j" >> genode/build/focnados_pbxa9/etc/build.conf'
        sh 'cat genode/build/focnados_pbxa9/etc/build.conf >> log/prepare.log.txt 2>&1'
        // add path to toolchain
        sh 'touch genode/build/focnados_pbxa9/etc/tools.conf >> log/prepare.log.txt 2>&1'
        sh 'echo "CROSS_DEV_PREFIX=$(pwd)/usr/local/genode-gcc/bin/genode-arm-" >> genode/build/focnados_pbxa9/etc/tools.conf'
        // download and extract libports
        sh 'wget https://nextcloud.os.in.tum.de/s/KVfFOeRXVszFROl/download -O libports.tar.bz2 >> log/prepare.log.txt 2>&1'
        sh 'tar xvjC genode/ -f libports.tar.bz2  >> log/prepare.log.txt 2>&1'
        // prepare focnados, ...
        sh './genode/tool/ports/prepare_port focnados >> log/prepare.log.txt 2>&1' // focnados
        // dependencies, ...
        sh './genode/tool/ports/prepare_port libc >> log/prepare.log.txt 2>&1'
        sh './genode/tool/ports/prepare_port lwip >> log/prepare.log.txt 2>&1'
        sh './genode/tool/ports/prepare_port openssl >> log/prepare.log.txt 2>&1'
        sh './genode/tool/ports/prepare_port stdcxx >> log/prepare.log.txt 2>&1'
        sh './genode/tool/ports/prepare_port zlib >> log/prepare.log.txt 2>&1'
        // libraries
        sh './genode/tool/ports/prepare_port libprotobuf >> log/prepare.log.txt 2>&1' // libprotobuf
        sh './genode/tool/ports/prepare_port libmosquitto >> log/prepare.log.txt 2>&1' // libmosquitto
      }
    }
    stage('Build') {
      steps {
        // preparing for github log
        sh "mkdir -p log"
        sh "touch log/build.log.txt"
        // run tests
        sh "make -C ${env.WORKSPACE}/genode/build/focnados_pbxa9 test/libprotobuf >> ${env.WORKSPACE}/log/build.log.txt 2>&1" // libprotobuf
        sh "make -C ${env.WORKSPACE}/genode/build/focnados_pbxa9 test/libmosquitto >> ${env.WORKSPACE}/log/build.log.txt 2>&1" // libmosquitto
        sh "VERBOSE= make -C ${env.WORKSPACE}/genode/build/focnados_pbxa9 app/mpct >> ${env.WORKSPACE}/log/build.log.txt 2>&1" // app/mpct
      }
    }

  } // stages ends here
  post {
   failure {
    mattermostSend color: "#E01818", message: "Build Failed: [${env.JOB_NAME} ${env.BUILD_NUMBER}](${env.BUILD_URL}) ; See more log information here: https://nextcloud.os.in.tum.de/apps/files/?dir=/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
   }
   success {
    mattermostSend color: "#3cc435", message: "Build Successful: [${env.JOB_NAME} ${env.BUILD_NUMBER}](${env.BUILD_URL}) ; See more log information here: https://nextcloud.os.in.tum.de/apps/files/?dir=/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
}
    always {
        sh "mkdir -p /home/bliening/ownCloud/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}"
        sh "cp -R log/* /home/bliening/ownCloud/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
      deleteDir()
    }
  } //post ends here
} // pipeline ends here

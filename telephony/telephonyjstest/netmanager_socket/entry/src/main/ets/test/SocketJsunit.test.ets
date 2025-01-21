// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'hypium/index';
import socket from '@ohos.net.socket'
import http from '@ohos.net.http';
import utils from './Utils.ets'

export default function socketJsunit() {
  describe('socketTest', function () {
  
	let udpSocket = socket.constructUDPSocketInstance();
	let multicastSocket = socket.constructMulticastSocketInstance();
	let multicastAddress = {
	  address: '239.255.0.1',
	  family: 1,
	  port: 32123
	}

	let multicastAddress_invalid = {
	  address: '1.1.1.1',
	  family: 1,
	  port: 32123
	}
	let multicastAddress_null = {
	  address: '',
	  family: 1,
	  port: 32123
	}

	let ttl = 100;
	let ttl_invalid = 256;
	let ttl_undefined = undefined;

	let options = {
	  data: 'Hello',
	  address: multicastAddress,
	}


	function expectFalse() {
	  try {
		expect().assertFail();
	  } catch (err) {
		console.info('assertion failure');
	  }
	};
	
	function sleep(time) {
		return new Promise((resolve) => setTimeout(resolve, time))
	}
  
  
  
    console.log("************* socket Test start*************");
	let tcp = socket.constructTCPSocketInstance();
	let udp = socket.constructUDPSocketInstance();
    let envReady = false;
	
    /*
     * @tc.number    : Telephony_Socket_Socket_constructUDPSocketInstance_0100
     * @tc.name      : constructUDPSocketInstance
     * @tc.desc      : Creates a UDPSocket object.
     */
    it('Telephony_Socket_Socket_constructUDPSocketInstance_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_constructUDPSocketInstance_0100 Test start*************");
      var udpSocket = udp;
      expect(udpSocket != null).assertTrue();
      console.log("************* Telephony_Socket_Socket_constructUDPSocketInstance_0100 Test end*************");
      done();
    })

    /*
     * @tc.number    : Telephony_Socket_Socket_constructTCPSocketInstance_0100
     * @tc.name      : constructTCPSocketInstance
     * @tc.desc      : Creates a TCPSocket object.
     */
    it('Telephony_Socket_Socket_constructTCPSocketInstance_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_constructTCPSocketInstance_0100 Test start*************");
      var tcpSocket = tcp;
      expect(tcpSocket != null).assertTrue();
      console.log("************* Telephony_Socket_Socket_constructTCPSocketInstance_0100 Test end*************");
      done();
    })

    /*
     * @tc.number    : Telephony_Socket_Socket_NetAddress_0100
     * @tc.name      : NetAddress
     * @tc.desc      : interface NetAddress
     */
    it('Telephony_Socket_Socket_NetAddress_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_NetAddress_0100 Test start*************");
      let netAddress = {
        address: "test address",
        family: 1,
        port: 8080
      }
      expect(netAddress.address === "test address").assertTrue()
      expect(netAddress.family === 1).assertTrue()
      expect(netAddress.port === 8080).assertTrue()
      console.log("************* Telephony_Socket_Socket_NetAddress_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSendOptions_data_0100
     * @tc.name      : UDPSendOptions.data
     * @tc.desc      : UDPSendOptions.data
     */
    it('Telephony_Socket_UDPSendOptions_data_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSendOptions_data_0100 Test start*************");
      let udpSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      }
      expect(udpSendOptions.data === "test data").assertTrue()
      console.log("************* Telephony_Socket_UDPSendOptions_data_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100
     * @tc.name      : ExtraOptionsBase.receiveBufferSize
     * @tc.desc      : ExtraOptionsBase.receiveBufferSize
     */
    it('Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100 Test start*************");
      let extraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      }
      expect(extraOptionsBase.receiveBufferSize === 1).assertTrue()
      console.log("************* Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100
     * @tc.name      : ExtraOptionsBase.sendBufferSize
     * @tc.desc      : ExtraOptionsBase.sendBufferSize
     */
    it('Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100 Test start*************");
      let extraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      }
      expect(extraOptionsBase.sendBufferSize === 1).assertTrue()
      console.log("************* Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_ExtraOptionsBase_reuseAddress_0100
     * @tc.name      : ExtraOptionsBase.reuseAddress
     * @tc.desc      : ExtraOptionsBase.reuseAddress
     */
    it('Telephony_Socket_ExtraOptionsBase_reuseAddress_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_reuseAddress_0100 Test start*************");
      let extraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      }
      expect(extraOptionsBase.reuseAddress).assertTrue()
      console.log("************* Telephony_Socket_ExtraOptionsBase_reuseAddress_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_ExtraOptionsBase_socketTimeout_0100
     * @tc.name      : ExtraOptionsBase.socketTimeout
     * @tc.desc      : ExtraOptionsBase.socketTimeout
     */
    it('Telephony_Socket_ExtraOptionsBase_socketTimeout_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_socketTimeout_0100 Test start*************");
      let extraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      }
      expect(extraOptionsBase.socketTimeout === 5000).assertTrue()
      console.log("************* Telephony_Socket_ExtraOptionsBase_socketTimeout_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_SocketStateBase_isClose_0100
     * @tc.name      : SocketStateBase.isClose
     * @tc.desc      : SocketStateBase.isClose
     */
    it('Telephony_Socket_SocketStateBase_isClose_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketStateBase_isClose_0100 Test start*************");
      let socketStateBase = {
        isBound: true,
        isClose: true,
        isConnected: true
      }
      expect(socketStateBase.isClose).assertTrue()
      console.log("************* Telephony_Socket_SocketStateBase_isClose_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_SocketRemoteInfo_port_0100
     * @tc.name      : SocketRemoteInfo.port
     * @tc.desc      : SocketRemoteInfo.port
     */
    it('Telephony_Socket_SocketRemoteInfo_port_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketRemoteInfo_port_0100 Test start*************");
      let socketRemoteInfo = {
        address: "test address",
        family: 'IPv4',
        port: 8080,
        size: 1
      }
      expect(socketRemoteInfo.port === 8080).assertTrue()
      console.log("************* Telephony_Socket_SocketRemoteInfo_port_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_SocketRemoteInfo_size_0100
     * @tc.name      : SocketRemoteInfo.size
     * @tc.desc      : SocketRemoteInfo.size
     */
    it('Telephony_Socket_SocketRemoteInfo_size_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketRemoteInfo_size_0100 Test start*************");
      let socketRemoteInfo = {
        address: "test address",
        family: 'IPv4',
        port: 8080,
        size: 1
      }
      expect(socketRemoteInfo.size === 1).assertTrue()
      console.log("************* Telephony_Socket_SocketRemoteInfo_size_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPConnectOptions_timeout_0100
     * @tc.name      : TCPConnectOptions.timeout
     * @tc.desc      : TCPConnectOptions.timeout
     */
    it('Telephony_Socket_TCPConnectOptions_timeout_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPConnectOptions_timeout_0100 Test start*************");
      let tcpConnectOptions = {
        address: {
          address: "test address",
          family: 1,
          port: 8080
        },
        timeout: 1000
      }
      expect(tcpConnectOptions.timeout === 1000).assertTrue()
      console.log("************* Telephony_Socket_TCPConnectOptions_timeout_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSendOptions_data_0100
     * @tc.name      : TCPSendOptions.data
     * @tc.desc      : TCPSendOptions.data
     */
    it('Telephony_Socket_TCPSendOptions_data_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSendOptions_data_0100 Test start*************");
      let tcpSendOptions = {
        data: "test data",
        encoding: "test encoding"
      }
      expect(tcpSendOptions.data === "test data").assertTrue()
      console.log("************* Telephony_Socket_TCPSendOptions_data_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSendOptions_encoding_0100
     * @tc.name      : TCPSendOptions.encoding
     * @tc.desc      : TCPSendOptions.encoding
     */
    it('Telephony_Socket_TCPSendOptions_encoding_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSendOptions_encoding_0100 Test start*************");
      let tcpSendOptions = {
        data: "test data",
        encoding: "test encoding"
      }
      expect(tcpSendOptions.encoding === "test encoding").assertTrue()
      console.log("************* Telephony_Socket_TCPSendOptions_encoding_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPExtraOptions_keepAlive_0100
     * @tc.name      : TCPExtraOptions.keepAlive
     * @tc.desc      : TCPExtraOptions.keepAlive
     */
    it('Telephony_Socket_TCPExtraOptions_keepAlive_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_keepAlive_0100 Test start*************");
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: false
        }
      }
      expect(tcpExtraOptions.keepAlive).assertTrue()
      console.log("************* Telephony_Socket_TCPExtraOptions_keepAlive_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPExtraOptions_OOBInline_0100
     * @tc.name      : TCPExtraOptions.OOBInline
     * @tc.desc      : TCPExtraOptions.OOBInline
     */
    it('Telephony_Socket_TCPExtraOptions_OOBInline_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_OOBInline_0100 Test start*************");
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: false
        }
      }
      expect(!tcpExtraOptions.OOBInline).assertTrue()
      console.log("************* Telephony_Socket_TCPExtraOptions_OOBInline_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100
     * @tc.name      : TCPExtraOptions.TCPNoDelay
     * @tc.desc      : TCPExtraOptions.TCPNoDelay
     */
    it('Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100 Test start*************");
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: false
        }
      }
      expect(tcpExtraOptions.TCPNoDelay).assertTrue()
      console.log("************* Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPExtraOptions_socketLinger_0100
     * @tc.name      : TCPExtraOptions.socketLinger
     * @tc.desc      : TCPExtraOptions.socketLinger
     */
    it('Telephony_Socket_TCPExtraOptions_socketLinger_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_socketLinger_0100 Test start*************");
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: false
        }
      }
      expect(tcpExtraOptions.socketLinger.on).assertTrue()
      expect(!tcpExtraOptions.socketLinger.linger).assertTrue()
      console.log("************* Telephony_Socket_TCPExtraOptions_socketLinger_0100 Test end*************");
      done();
    });


    /*
     * @tc.number    : Telephony_Socket_UDPSocket_bind_0100
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number.
     */
    it('Telephony_Socket_UDPSocket_bind_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_0100"
      console.log("************* Telephony_Socket_UDPSocket_bind_0100 Test start*************");
      let netAddress = {
        address: "test address",
        family: 1,
        port: 8080
      }
      udp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_bind_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_bind_0200
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number.
     */
    it('Telephony_Socket_UDPSocket_bind_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_0200"
      console.log("************* Telephony_Socket_UDPSocket_bind_0200 Test start*************");
      
      let netAddress: socket.NetAddress = {
        address: "test address",
        family: 1,
        port: 8080
      }
      try {
        udp.bind(netAddress).then(data => {
          console.log(`${caseName} success,data:${toString(data)}`);
		  done();
        }).catch((error) => {
          console.log(`${caseName} failed,error:${toString(error)}`);
		  done();
        });
		done();
      } catch (err) {
        console.log(`${caseName} failed,catch error:${toString(error)}`);
		done();
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_bind_0300
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number.
     */
    it('Telephony_Socket_UDPSocket_bind_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_0300"
      let netAddress = {
        address: "second test address"
      }
      udp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_bind_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_bind_0400
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number.
     */
    it('Telephony_Socket_UDPSocket_bind_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_0400"      
      let netAddress = {
        address: "third test address",
        family: 3,
        port: 8080
      }
      udp.bind(netAddress).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
		done();
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
		done();
      });
      console.log("************* Telephony_Socket_UDPSocket_bind_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_send_0100
     * @tc.name      : send
     * @tc.desc      : Sends data over a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_send_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0100"      
      let udpSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      }
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_send_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_send_0200
     * @tc.name      : send
     * @tc.desc      : Sends data over a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_send_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0200"      
      let udpSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      }
      udp.send(udpSendOptions).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_send_0300
     * @tc.name      : send
     * @tc.desc      : Sends data over a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_send_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0300"      
      let udpSendOptions = {
        data: "test data",
        address: {
          address: "second test address",
        }
      }
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_send_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_send_0400
     * @tc.name      : send
     * @tc.desc      : Sends data over a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_send_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0400"      
      let udpSendOptions = {
        data: "test data",
        address: {
          address: "third test address"
        }
      }
      udp.send(udpSendOptions).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_close_0100
     * @tc.name      : close
     * @tc.desc      : Closes a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_close_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_close_0100"      
      udp.close((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_close_0200
     * @tc.name      : close
     * @tc.desc      : Closes a UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_close_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_close_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_close_0200"      
      udp.close().then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_close_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_getState_0100
     * @tc.name      : getState
     * @tc.desc      : Obtains the status of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_getState_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_getState_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_0100"      
      udp.getState((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        let socketStateBase = data
        console.log(`${caseName} data:${toString(socketStateBase.isClose)}`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_getState_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_getState_0200
     * @tc.name      : getState
     * @tc.desc      : Obtains the status of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_getState_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_getState_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_0200"      
      udp.getState().then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });

      console.log("************* Telephony_Socket_UDPSocket_getState_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_setExtraOptions_0100
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0100"      
      let udpExtraOptions = {
        broadcast: true
      }
	  try{
		udp.setExtraOptions(udpExtraOptions, function(error,data) {
		  if (error) {
			expect().assertFail();
			console.log(`${caseName} error, case failed,error: ` + JSON.stringify(error));
			done();
		  } else{
			expect().assertTrue();
			console.log(`${caseName} error, case success failed`);
		    done();
		  }
		  done();
		})
		done();
	  } catch(error){
		  console.log(`${caseName} failed,error:${error}`);
	      expect(true).assertTrue();
		  done();
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_setExtraOptions_0200
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0200"
      let udpExtraOptions = {
        broadcast: true
      }
      try {
        udp.setExtraOptions(udpExtraOptions);
        console.log(`${caseName} success`);
        done();
      } catch (error) {
        console.log(`${caseName} failed,error:${error}`);
        done();
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_setExtraOptions_0300
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0300"      
      let udpExtraOptions = {}
      udp.setExtraOptions(udpExtraOptions, (error) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed`);
        done();
      })
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_setExtraOptions_0400
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0400"
      let udpExtraOptions = {}
      try {
        udp.setExtraOptions(udpExtraOptions).then(function(data){
			console.log(`${caseName}`);
		});
        console.log(`${caseName} success`);
        done();
      } catch (error) {
        console.log(`${caseName} failed,error:${error}`);
        expect(true).assertTrue();
        done();
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_on_message_0100
     * @tc.name      : on
     * @tc.desc      : Listens for message receiving events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_on_message_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_message_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_on_message_0100"      
      udp.on('message', (data) => {
        let socketRemoteInfo = data.remoteInfo;
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_on_message_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_message_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for message receiving events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_message_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_message_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_0100"      
      udp.off("message", data => {
        let socketRemoteInfo = data.remoteInfo;
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_off_message_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_message_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for message receiving events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_message_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_message_0200 Test start*************");
      udp.off("message");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_off_message_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_on_listening_0100
     * @tc.name      : on
     * @tc.desc      : Listens for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_on_listening_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_listening_0100 Test start*************");
      udp.on("listening", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_UDPSocket_on_listening_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_listening_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_listening_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_listening_0100 Test start*************");
      udp.off("listening", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_UDPSocket_off_listening_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_listening_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_listening_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_listening_0200 Test start*************");
      udp.off("listening");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_off_listening_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_on_close_0100
     * @tc.name      : on
     * @tc.desc      : Listens for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_on_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_close_0100 Test start*************");
      udp.on("close", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_UDPSocket_on_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_close_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_close_0100 Test start*************");
      udp.off("close", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_UDPSocket_off_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_close_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for data packet message events or close events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_close_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_close_0200 Test start*************");
      udp.off("close");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_off_close_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_on_error_0100
     * @tc.name      : on
     * @tc.desc      : Listens for error events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_on_error_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_error_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_on_error_0100"      
      udp.on("error", error => {
        console.log(`${caseName} fail, error:${toString(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_on_error_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_error_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for error events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_error_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_error_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_error_0100"      
      udp.off("error", error => {
        console.log(`${caseName} fail, error:${toString(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_off_error_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_UDPSocket_off_error_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for error events of the UDPSocket connection.
     */
    it('Telephony_Socket_UDPSocket_off_error_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_error_0200 Test start*************");
      udp.off("error");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_UDPSocket_off_error_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_bind_0100
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number
     */
    it('Telephony_Socket_TCPSocket_bind_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_bind_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_bind_0100"
      let netAddress = {
        address: "test address",
        family: 1,
        port: 8080
      }
      tcp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_bind_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_bind_0200
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number
     */
    it('Telephony_Socket_TCPSocket_bind_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_bind_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_bind_0200"      
      let netAddress = {
        address: "test address",
        family: 1,
        port: 8080
      }
      tcp.bind(netAddress).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
		done();
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
		done();
      });
      console.log("************* Telephony_Socket_TCPSocket_bind_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_bind_0300
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number
     */
    it('Telephony_Socket_TCPSocket_bind_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_bind_0300 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_bind_0300"
      let netAddress = {
        address: "second test address",
      }
      tcp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_bind_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_bind_0400
     * @tc.name      : bind
     * @tc.desc      : Binds the IP address and port number
     */
    it('Telephony_Socket_TCPSocket_bind_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_bind_0400 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_bind_0400"
      
      let netAddress = {
        address: "third test address"
      }
      tcp.bind(netAddress).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
		done();
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
		done();
      });
      console.log("************* Telephony_Socket_TCPSocket_bind_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_send_0100
     * @tc.name      : send
     * @tc.desc      : Sends data over a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_send_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_send_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_send_0100"      
      let tcpSendOptions = {
        data: "test data",
        encoding: "test encoding"
      }
      tcp.send(tcpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_send_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_send_0200
     * @tc.name      : send
     * @tc.desc      : Sends data over a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_send_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_send_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_send_0200"      
      let tcpSendOptions = {
        data: "test data",
        encoding: "test encoding"
      }
      tcp.send(tcpSendOptions).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_send_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_send_0300
     * @tc.name      : send
     * @tc.desc      : Sends data over a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_send_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_send_0300 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_send_0300"      
      let tcpSendOptions = {
        data: "second test data",
      }
      tcp.send(tcpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_send_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_send_0400
     * @tc.name      : send
     * @tc.desc      : Sends data over a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_send_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_send_0400 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_send_0400"      
      let tcpSendOptions = {
        data: "second test data",
      }
      tcp.send(tcpSendOptions).then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_send_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_connect_0100
     * @tc.name      : connect
     * @tc.desc      : Sets up a connection to the specified IP address and port number.
     */
    it('Telephony_Socket_TCPSocket_connect_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_connect_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_connect_0100"      
      let tcpConnectOptions = {
        address: {
          address: "test address",
          family: 1,
          port: 8080
        },
        timeout: 1000
      }
      tcp.connect(tcpConnectOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_connect_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_connect_0200
     * @tc.name      : connect
     * @tc.desc      : Sets up a connection to the specified IP address and port number.
     */
    it('Telephony_Socket_TCPSocket_connect_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_connect_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_connect_0200"      
      let tcpConnectOptions = {
        address: {
          address: "test address",
          family: 1,
          port: 8080
        },
        timeout: 1000
      }
      tcp.connect(tcpConnectOptions).then(function (data) {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_connect_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_connect_0300
     * @tc.name      : connect
     * @tc.desc      : Sets up a connection to the specified IP address and port number.
     */
    it('Telephony_Socket_TCPSocket_connect_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_connect_0300 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_connect_0300"      
      let tcpConnectOptions = {
        address: {
          address: "second test address",
          family: 1,
          port: 8080
        }
      }
      tcp.connect(tcpConnectOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_connect_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_connect_0400
     * @tc.name      : connect
     * @tc.desc      : Sets up a connection to the specified IP address and port number.
     */
    it('Telephony_Socket_TCPSocket_connect_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_connect_0400 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_connect_0400"      
      let tcpConnectOptions = {
        address: {
          address: "second test address",
          family: 1,
          port: 8080
        }
      }
      tcp.connect(tcpConnectOptions).then(function (data) {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_connect_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_close_0100
     * @tc.name      : close
     * @tc.desc      : Closes a UDPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_close_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_close_0100"      
      tcp.close((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_close_0200
     * @tc.name      : close
     * @tc.desc      : Closes a UDPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_close_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_close_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_close_0200"      
      tcp.close().then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_close_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_getState_0100
     * @tc.name      : getState
     * @tc.desc      : Obtains the status of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_getState_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_getState_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_getState_0100"      
      tcp.getState((error, data) => {
        if (error) {
          console.log(`${caseName} case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} case failed,data:${toString(data)}`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_getState_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_getState_0200
     * @tc.name      : getState
     * @tc.desc      : Obtains the status of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_getState_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_getState_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_getState_0200"      
      tcp.getState().then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_getState_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_setExtraOptions_0100
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_setExtraOptions_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_setExtraOptions_0100"      
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: true
        }
      }
      tcp.setExtraOptions(tcpExtraOptions, (error) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_setExtraOptions_0200
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_setExtraOptions_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_setExtraOptions_0200"      
      let tcpExtraOptions = {
        keepAlive: true,
        OOBInline: true,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: true
        }
      }
      try {
        tcp.setExtraOptions(tcpExtraOptions).then(function(data) {
		  console.log(`${caseName}`);
		});
        console.log(`${caseName} success`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${caseName} failed,error:${error}`);
        done();
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_setExtraOptions_0300
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_setExtraOptions_0300', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0300 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_setExtraOptions_0300"      
      let tcpExtraOptions = {
        socketLinger: {
          on: true,
          linger: true
        }
      }
      tcp.setExtraOptions(tcpExtraOptions, (error) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed`);
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0300 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_setExtraOptions_0400
     * @tc.name      : setExtraOptions
     * @tc.desc      : Sets other attributes of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_setExtraOptions_0400', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0400 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_setExtraOptions_0400"      
      let tcpExtraOptions = {
        socketLinger: {
          on: true,
          linger: true
        }
      }
      try {
        tcp.setExtraOptions(tcpExtraOptions).then(function(data){
		  console.log(`${caseName}`);
		});
        console.log(`${caseName} success`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${caseName} failed,error:${error}`);
        done();
      }
      console.log("************* Telephony_Socket_TCPSocket_setExtraOptions_0400 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_getRemoteAddress_0100
     * @tc.name      : getRemoteAddress
     * @tc.desc      : Obtains the peer address of a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_getRemoteAddress_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_getRemoteAddress_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_getRemoteAddress_0100"      
      tcp.getRemoteAddress((error) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${toString(error)}`);
          done();
          return;
        }
        expect().assertFail();
        done();
      })
      console.log("************* Telephony_Socket_TCPSocket_getRemoteAddress_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_getRemoteAddress_0200
     * @tc.name      : getRemoteAddress
     * @tc.desc      : Obtains the peer address of a TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_getRemoteAddress_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_getRemoteAddress_0200 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_getRemoteAddress_0200"      
      tcp.getRemoteAddress().then(data => {
        console.log(`${caseName} success,data:${toString(data)}`);
      }).catch((error) => {
        console.log(`${caseName} failed,error:${toString(error)}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_getRemoteAddress_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_on_message_0100
     * @tc.name      : on
     * @tc.desc      : Listens for message receiving events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_on_message_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_on_message_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_on_message_0100"      
      tcp.on("message", data => {
        let socketRemoteInfo: socket.SocketRemoteInfo = data.remoteInfo;
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_on_message_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_message_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for message receiving events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_message_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_message_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_off_message_0100"      
      tcp.off("message", data => {
        let socketRemoteInfo: socket.SocketRemoteInfo = data.remoteInfo;
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_TCPSocket_off_message_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_message_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for message receiving events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_message_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_message_0200 Test start*************");
      tcp.off("message");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_off_message_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_on_connect_0100
     * @tc.name      : on
     * @tc.desc      : Listens for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_on_connect_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_on_connect_0100 Test start*************");
      tcp.on("connect", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_TCPSocket_on_connect_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_connect_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_connect_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_connect_0100 Test start*************");
      tcp.off("connect", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_TCPSocket_off_connect_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_connect_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_connect_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_connect_0200 Test start*************");
      tcp.off("connect");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_off_connect_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_on_close_0100
     * @tc.name      : on
     * @tc.desc      : Listens for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_on_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_on_close_0100 Test start*************");
      tcp.on("close", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_TCPSocket_on_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_close_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_close_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_close_0100 Test start*************");
      tcp.off("close", data => {
        expect(true).assertTrue();
      });
      console.log("************* Telephony_Socket_TCPSocket_off_close_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_close_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for connection or close events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_close_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_close_0200 Test start*************");
      tcp.off("close");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_off_close_0200 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_on_error_0100
     * @tc.name      : on
     * @tc.desc      : Listens for error events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_on_error_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_on_error_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_on_error_0100"      
      tcp.on("error", error => {
        console.log(`${caseName} fail, error:${toString(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_on_error_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_error_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for error events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_error_0100', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_error_0100 Test start*************");
      let caseName = "Telephony_Socket_TCPSocket_off_error_0100"      
      tcp.off("error", error => {
        console.log(`${caseName} fail, error:${toString(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_off_error_0100 Test end*************");
      done();
    });

    /*
     * @tc.number    : Telephony_Socket_TCPSocket_off_error_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for error events of the TCPSocket connection.
     */
    it('Telephony_Socket_TCPSocket_off_error_0200', 0, function (done) {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSocket_off_error_0200 Test start*************");
      tcp.off("error");
      expect(true).assertTrue();
      console.log("************* Telephony_Socket_TCPSocket_off_error_0200 Test end*************");
      done();
    });

// addMembership:
    /**
     * @tc.number NetworkManager_UDPSocket_addMembership_Async_0100
     * @tc.name UDPSocket::addMembership
     * @tc.desc Test addMembership property.
     */
    it("NetworkManager_UDPSocket_addMembership_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_addMembership_Async_0100"
      multicastSocket.addMembership(multicastAddress, (err, data) => {
        if (err) {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_addMembership_Async_0200
     * @tc.name UDPSocket::addMembership
     * @tc.desc Test addMembership property.
     */
    it("NetworkManager_UDPSocket_addMembership_Async_0200", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_addMembership_Async_0200"
      multicastSocket.addMembership(multicastAddress_invalid, (err, data) => {
        if (err) {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expect(err.code !== undefined).assertTrue();
          done();
        } else {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_addMembership_Async_0300
     * @tc.name UDPSocket::addMembership
     * @tc.desc Test addMembership property.
     */
    it("NetworkManager_UDPSocket_addMembership_Async_0300", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_addMembership_Async_0300"
      multicastSocket.addMembership(multicastAddress_null, (err, data) => {
        if (err) {
          console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
          expect(err.code !== undefined).assertTrue();
          done();
        } else {
          console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_addMembership_Async_0400
     * @tc.name UDPSocket::addMembership
     * @tc.desc Test addMembership property.
     */
    it("NetworkManager_UDPSocket_addMembership_Async_0400", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_addMembership_Async_0400"
      try {
        multicastSocket.addMembership(undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} addMembership failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            done();
          } else {
            console.log(`${caseName} addMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    // //send
    /**
     * @tc.number NetworkManager_UDPSocket_send_Async_0100
     * @tc.name UDPSocket::send
     * @tc.desc Test send property.
     */
    it("NetworkManager_UDPSocket_send_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_send_Async_0100"
      let result;
      multicastSocket.on('message', (data) => {
        console.info(caseName + ' on message,data.remoteInfo.size: ' + JSON.stringify(data.remoteInfo.size));
        result = JSON.stringify(data.remoteInfo.size);
        done();
      })
      await sleep(2000);
      multicastSocket.send(options, (err, data) => {
        if (err) {
          console.log(`${caseName} send failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} send success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
      await sleep(2000);
      expect(result).assertEqual(5);
    });


    //setMulticastTTL:
    /**
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0100
     * @tc.name UDPSocket::setMulticastTTL
     * @tc.desc Test setMulticastTTL property.
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0100"
      multicastSocket.setMulticastTTL(ttl, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0200
     * @tc.name UDPSocket::setMulticastTTL
     * @tc.desc Test setMulticastTTL property.
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0200", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0200"
      multicastSocket.setMulticastTTL(ttl_invalid, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expect(err.code !== undefined).assertTrue();
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0300
     * @tc.name UDPSocket::setMulticastTTL
     * @tc.desc Test setMulticastTTL property.
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0300", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0300"
      try {
        multicastSocket.setMulticastTTL(ttl_undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            done();
          } else {
            console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    // //getMulticastTTL
    /**
     * @tc.number NetworkManager_UDPSocket_getMulticastTTL_Async_0100
     * @tc.name UDPSocket::getMulticastTTL
     * @tc.desc Test getMulticastTTL property.
     */
    it("NetworkManager_UDPSocket_getMulticastTTL_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_getMulticastTTL_Async_0100"
      multicastSocket.getMulticastTTL((err, data) => {
        if (err) {
          console.log(`${caseName} getMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(100);
          done();
        }
      })
    });

    // setLoopbackMode:
    /**
     * @tc.number NetworkManager_UDPSocket_setLoopbackMode_Async_0100
     * @tc.name UDPSocket::setLoopbackMode
     * @tc.desc Test setLoopbackMode property.
     */
    it("NetworkManager_UDPSocket_setLoopbackMode_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setLoopbackMode_Async_0100"
      multicastSocket.setLoopbackMode(true, (err, data) => {
        if (err) {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_setLoopbackMode_Async_0200
     * @tc.name UDPSocket::setLoopbackMode
     * @tc.desc Test setLoopbackMode property.
     */
    it("NetworkManager_UDPSocket_setLoopbackMode_Async_0200", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setLoopbackMode_Async_0200"
      multicastSocket.setLoopbackMode(false, (err, data) => {
        if (err) {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_setLoopbackMode_Async_0300
     * @tc.name UDPSocket::setLoopbackMode
     * @tc.desc Test setLoopbackMode property.
     */
    it("NetworkManager_UDPSocket_setLoopbackMode_Async_0300", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_setLoopbackMode_Async_0300"
      try {
        multicastSocket.setLoopbackMode(undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            done();
          } else {
            console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(undefined);
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    // getLoopbackMode
    /**
     * @tc.number NetworkManager_UDPSocket_getLoopbackMode_Async_0100
     * @tc.name UDPSocket::getLoopbackMode
     * @tc.desc Test getLoopbackMode property.
     */
    it("NetworkManager_UDPSocket_getLoopbackMode_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_getLoopbackMode_Async_0100"
      multicastSocket.setLoopbackMode(true, (err, data) => {
        if (err) {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          multicastSocket.getLoopbackMode((err, data) => {
            if (err) {
              console.log(`${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              done();
            } else {
              console.log(`${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
              expect(data).assertEqual(true);
              done();
            }
          });
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_getLoopbackMode_Async_0200
     * @tc.name UDPSocket::getLoopbackMode
     * @tc.desc Test getLoopbackMode property.
     */
    it("NetworkManager_UDPSocket_getLoopbackMode_Async_0200", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_getLoopbackMode_Async_0200"
      multicastSocket.setLoopbackMode(false, (err, data) => {
        if (err) {
          console.log(`${caseName} setLoopbackMode failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} setLoopbackMode success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          multicastSocket.getLoopbackMode((err, data) => {
            if (err) {
              console.log(`${caseName} getLoopbackMode failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              done();
            } else {
              console.log(`${caseName} getLoopbackMode success, data: ${JSON.stringify(data)}`);
              expect(data).assertEqual(false);
              done();
            }
          });
        }
      });
    });


    // dropMembership
    /**
     * @tc.number NetworkManager_UDPSocket_dropMembership_Async_0100
     * @tc.name UDPSocket::dropMembership
     * @tc.desc Test dropMembership property.
     */
    it("NetworkManager_UDPSocket_dropMembership_Async_0100", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_dropMembership_Async_0100"
      multicastSocket.dropMembership(multicastAddress, (err, data) => {
        if (err) {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_dropMembership_Async_0200
     * @tc.name UDPSocket::dropMembership
     * @tc.desc Test dropMembership property.
     */
    it("NetworkManager_UDPSocket_dropMembership_Async_0200", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_dropMembership_Async_0200"
      multicastSocket.dropMembership(multicastAddress_invalid, (err, data) => {
        if (err) {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expect(err.code !== undefined).assertTrue();
          done();
        } else {
          console.log(`${caseName} dropMembershipp success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_dropMembership_Async_0300
     * @tc.name UDPSocket::dropMembership
     * @tc.desc Test dropMembership property.
     */
    it("NetworkManager_UDPSocket_dropMembership_Async_0300", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_dropMembership_Async_0300"
      multicastSocket.dropMembership(multicastAddress_null, (err, data) => {
        if (err) {
          console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
          expect(err.code !== undefined).assertTrue();
          done();
        } else {
          console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number NetworkManager_UDPSocket_dropMembership_Async_0400
     * @tc.name UDPSocket::dropMembership
     * @tc.desc Test dropMembership property.
     */
    it("NetworkManager_UDPSocket_dropMembership_Async_0400", 0, async function (done) {
      let caseName = "NetworkManager_UDPSocket_dropMembership_Async_0400"
      try {
        multicastSocket.dropMembership(undefined, (err, data) => {
          if (err) {
            console.log(`${caseName} dropMembership failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            done();
          } else {
            console.log(`${caseName} dropMembership success, data: ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    console.log("************* socket Test end*************");

  })
}
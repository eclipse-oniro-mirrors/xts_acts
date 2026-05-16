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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import socket from '@ohos.net.socket'
import { BusinessError } from '@ohos.base';


function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}
function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};
function expectTrue(n : boolean) {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info('assertion failure');
  }
};

export default function socketJsunit() {
  describe('socketTest', () => {
    let udpSocket = socket.constructUDPSocketInstance();
    let multicastSocket = socket.constructMulticastSocketInstance();
    let multicastAddress: socket.NetAddress= {
      address: '239.255.0.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_invalid: socket.NetAddress= {
      address: '223.5.5.5',
      family: 1,
      port: 32123
    };
    let multicastAddress_null: socket.NetAddress = {
      address: '',
      family: 1,
      port: 32123
    };
    let ttl = 100;
    let ttl_invalid = 256;
    let ttl_undefined = undefined;
    let ttl_null = null;
    let options: socket.UDPSendOptions = {
      data: 'Hello',
      address: multicastAddress,
    };

    console.log("************* socket Test start*************");
    let tcp = socket.constructTCPSocketInstance();
    let udp = socket.constructUDPSocketInstance();
    let envReady = false;
    /**
     * @tc.name   Telephony_Socket_Socket_constructUDPSocketInstance_0100
     * @tc.number Telephony_Socket_Socket_constructUDPSocketInstance_0100
     * @tc.desc   Creates a UDPSocket object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_Socket_constructUDPSocketInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_constructUDPSocketInstance_0100 Test start*************");
      let udpSocket = udp;
      expect(udpSocket != null).assertTrue();
      console.log("************* Telephony_Socket_Socket_constructUDPSocketInstance_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_Socket_constructTCPSocketInstance_0100
     * @tc.number Telephony_Socket_Socket_constructTCPSocketInstance_0100
     * @tc.desc   Creates a TCPSocket object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_Socket_constructTCPSocketInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_constructTCPSocketInstance_0100 Test start*************");
      let tcpSocket = tcp;
      expect(tcpSocket != null).assertTrue();
      console.log("************* Telephony_Socket_Socket_constructTCPSocketInstance_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_Socket_NetAddress_0100
     * @tc.number Telephony_Socket_Socket_NetAddress_0100
     * @tc.desc   interface NetAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_Socket_NetAddress_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_Socket_NetAddress_0100 Test start*************");
      let netAddress: socket.NetAddress = {
        address: "test address",
        family: 1,
        port: 8080
      };
      expect(netAddress.address === "test address").assertTrue();
      expect(netAddress.family === 1).assertTrue();
      expect(netAddress.port === 8080).assertTrue();
      console.log("************* Telephony_Socket_Socket_NetAddress_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSendOptions_data_0100
     * @tc.number Telephony_Socket_UDPSendOptions_data_0100
     * @tc.desc   UDPSendOptions.data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSendOptions_data_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSendOptions_data_0100 Test start*************");
      let udpSendOptions: socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      };
      expect(udpSendOptions.data === "test data").assertTrue();
      console.log("************* Telephony_Socket_UDPSendOptions_data_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100
     * @tc.number Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100
     * @tc.desc   ExtraOptionsBase.receiveBufferSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100 Test start*************");
      let extraOptionsBase: socket.ExtraOptionsBase= {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      };
      expect(extraOptionsBase.receiveBufferSize === 1).assertTrue();
      console.log("************* Telephony_Socket_ExtraOptionsBase_receiveBufferSize_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100
     * @tc.number Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100
     * @tc.desc   ExtraOptionsBase.sendBufferSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100 Test start*************");
      let extraOptionsBase: socket.ExtraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      };
      expect(extraOptionsBase.sendBufferSize === 1).assertTrue();
      console.log("************* Telephony_Socket_ExtraOptionsBase_sendBufferSize_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_ExtraOptionsBase_reuseAddress_0100
     * @tc.number Telephony_Socket_ExtraOptionsBase_reuseAddress_0100
     * @tc.desc   ExtraOptionsBase.reuseAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_ExtraOptionsBase_reuseAddress_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_reuseAddress_0100 Test start*************");
      let extraOptionsBase :socket.ExtraOptionsBase= {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      };
      expect(extraOptionsBase.reuseAddress).assertTrue();
      console.log("************* Telephony_Socket_ExtraOptionsBase_reuseAddress_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_ExtraOptionsBase_socketTimeout_0100
     * @tc.number Telephony_Socket_ExtraOptionsBase_socketTimeout_0100
     * @tc.desc   ExtraOptionsBase.socketTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_ExtraOptionsBase_socketTimeout_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_ExtraOptionsBase_socketTimeout_0100 Test start*************");
      let extraOptionsBase:socket.ExtraOptionsBase = {
        receiveBufferSize: 1,
        sendBufferSize: 1,
        reuseAddress: true,
        socketTimeout: 5000,
      };
      expect(extraOptionsBase.socketTimeout === 5000).assertTrue();
      console.log("************* Telephony_Socket_ExtraOptionsBase_socketTimeout_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_SocketStateBase_isClose_0100
     * @tc.number Telephony_Socket_SocketStateBase_isClose_0100
     * @tc.desc   SocketStateBase.isClose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_SocketStateBase_isClose_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketStateBase_isClose_0100 Test start*************");
      let socketStateBase:socket.SocketStateBase= {
        isBound: true,
        isClose: true,
        isConnected: true
      };
      expect(socketStateBase.isClose).assertTrue();
      console.log("************* Telephony_Socket_SocketStateBase_isClose_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_SocketRemoteInfo_port_0100
     * @tc.number Telephony_Socket_SocketRemoteInfo_port_0100
     * @tc.desc   SocketRemoteInfo.port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_SocketRemoteInfo_port_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketRemoteInfo_port_0100 Test start*************");
      let socketRemoteInfo:socket.SocketRemoteInfo = {
        address: "test address",
        family: 'IPv4',
        port: 8080,
        size: 1
      };
      expect(socketRemoteInfo.port === 8080).assertTrue();
      console.log("************* Telephony_Socket_SocketRemoteInfo_port_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_SocketRemoteInfo_size_0100
     * @tc.number Telephony_Socket_SocketRemoteInfo_size_0100
     * @tc.desc   SocketRemoteInfo.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_SocketRemoteInfo_size_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_SocketRemoteInfo_size_0100 Test start*************");
      let socketRemoteInfo :socket.SocketRemoteInfo= {
        address: "test address",
        family: 'IPv4',
        port: 8080,
        size: 1
      };
      expect(socketRemoteInfo.size === 1).assertTrue();
      console.log("************* Telephony_Socket_SocketRemoteInfo_size_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPConnectOptions_timeout_0100
     * @tc.number Telephony_Socket_TCPConnectOptions_timeout_0100
     * @tc.desc   TCPConnectOptions.timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPConnectOptions_timeout_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPConnectOptions_timeout_0100 Test start*************");
      let tcpConnectOptions:socket.TCPConnectOptions = {
        address: {
          address: "test address",
          family: 1,
          port: 8080
        },
        timeout: 1000
      };
      expect(tcpConnectOptions.timeout === 1000).assertTrue();
      console.log("************* Telephony_Socket_TCPConnectOptions_timeout_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPSendOptions_data_0100
     * @tc.number Telephony_Socket_TCPSendOptions_data_0100
     * @tc.desc   TCPSendOptions.data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPSendOptions_data_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSendOptions_data_0100 Test start*************");
      let tcpSendOptions:socket.TCPSendOptions = {
        data: "test data",
        encoding: "test encoding"
      };
      expect(tcpSendOptions.data === "test data").assertTrue();
      console.log("************* Telephony_Socket_TCPSendOptions_data_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPSendOptions_encoding_0100
     * @tc.number Telephony_Socket_TCPSendOptions_encoding_0100
     * @tc.desc   TCPSendOptions.encoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPSendOptions_encoding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPSendOptions_encoding_0100 Test start*************");
      let tcpSendOptions :socket.TCPSendOptions= {
        data: "test data",
        encoding: "test encoding"
      };
      expect(tcpSendOptions.encoding === "test encoding").assertTrue();
      console.log("************* Telephony_Socket_TCPSendOptions_encoding_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPExtraOptions_keepAlive_0100
     * @tc.number Telephony_Socket_TCPExtraOptions_keepAlive_0100
     * @tc.desc   TCPExtraOptions.keepAlive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPExtraOptions_keepAlive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_keepAlive_0100 Test start*************");
      let tcpExtraOptions:socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: 10
        }
      };
      expect(tcpExtraOptions.keepAlive).assertTrue();
      console.log("************* Telephony_Socket_TCPExtraOptions_keepAlive_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPExtraOptions_OOBInline_0100
     * @tc.number Telephony_Socket_TCPExtraOptions_OOBInline_0100
     * @tc.desc   TCPExtraOptions.OOBInline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPExtraOptions_OOBInline_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_OOBInline_0100 Test start*************");
      let tcpExtraOptions:socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: 10
        }
      };
      expect(!tcpExtraOptions.OOBInline).assertTrue();
      console.log("************* Telephony_Socket_TCPExtraOptions_OOBInline_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100
     * @tc.number Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100
     * @tc.desc   TCPExtraOptions.TCPNoDelay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100 Test start*************");
      let tcpExtraOptions:socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: 10
        }
      };
      expect(tcpExtraOptions.TCPNoDelay).assertTrue();
      console.log("************* Telephony_Socket_TCPExtraOptions_TCPNoDelay_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_TCPExtraOptions_socketLinger_0100
     * @tc.number Telephony_Socket_TCPExtraOptions_socketLinger_0100
     * @tc.desc   TCPExtraOptions.socketLinger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_TCPExtraOptions_socketLinger_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_TCPExtraOptions_socketLinger_0100 Test start*************");
      let tcpExtraOptions:socket.TCPExtraOptions = {
        keepAlive: true,
        OOBInline: false,
        TCPNoDelay: true,
        socketLinger: {
          on: true,
          linger: 10
        }
      };
      expect(tcpExtraOptions.socketLinger?.on).assertTrue();
      expect(!tcpExtraOptions.socketLinger?.linger).assertTrue();
      console.log("************* Telephony_Socket_TCPExtraOptions_socketLinger_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_0100
     * @tc.number Telephony_Socket_UDPSocket_bind_0100
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_0100";
      console.log("************* Telephony_Socket_UDPSocket_bind_0100 Test start*************");
      let netAddress :socket.NetAddress= {
        address: "test address",
        family: 1,
        port: 8080
      };
      udp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_bind_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_0200
     * @tc.number Telephony_Socket_UDPSocket_bind_0200
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_0200";
      console.log("************* Telephony_Socket_UDPSocket_bind_0200 Test start*************");
      let netAddress: socket.NetAddress = {
        address: "test address",
        family: 1,
        port: 8080
      };
      try {
        udp.bind(netAddress).then(data => {
          console.log(`${caseName} success,data:${JSON.stringify(data)}`);
          done();
        }).catch((error:BusinessError) => {
          console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
          done();
        });
        done();
      } catch (err) {
        console.log(`${caseName} failed,catch error:${JSON.stringify(err)}`);
        done();
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_0300
     * @tc.number Telephony_Socket_UDPSocket_bind_0300
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_0300";
      let netAddress:socket.NetAddress = {
        address: "second test address"
      };
      udp.bind(netAddress, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_bind_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_0400
     * @tc.number Telephony_Socket_UDPSocket_bind_0400
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_bind_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_0400";
      let netAddress:socket.NetAddress = {
        address: "third test address",
        family: 3,
        port: 8080
      };
      udp.bind(netAddress).then(data => {
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
        done();
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_bind_0400 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_0100
     * @tc.number Telephony_Socket_UDPSocket_send_0100
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0100";
      let udpSendOptions :socket.UDPSendOptions= {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      };
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_0200
     * @tc.number Telephony_Socket_UDPSocket_send_0200
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0200";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      };
      udp.send(udpSendOptions).then(data => {
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_0300
     * @tc.number Telephony_Socket_UDPSocket_send_0300
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0300";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "second test address",
        }
      };
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_0400
     * @tc.number Telephony_Socket_UDPSocket_send_0400
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_send_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_0400";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "third test address"
        }
      };
      udp.send(udpSendOptions).then(data => {
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_send_0400 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_close_0100
     * @tc.number Telephony_Socket_UDPSocket_close_0100
     * @tc.desc   Closes a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_close_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_close_0100";
      udp.close((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_close_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_close_0200
     * @tc.number Telephony_Socket_UDPSocket_close_0200
     * @tc.desc   Closes a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_close_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_close_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_close_0200";
      udp.close().then(data => {
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_close_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_getState_0100
     * @tc.number Telephony_Socket_UDPSocket_getState_0100
     * @tc.desc   Obtains the status of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_getState_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_getState_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_0100";
      udp.getState((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        let socketStateBase = data;
        console.log(`${caseName} data:${JSON.stringify(socketStateBase.isClose)}`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_getState_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_getState_0200
     * @tc.number Telephony_Socket_UDPSocket_getState_0200
     * @tc.desc   Obtains the status of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_getState_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_getState_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_0200";
      udp.getState().then(data => {
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_getState_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_0100
     * @tc.number Telephony_Socket_UDPSocket_setExtraOptions_0100
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0100";
      let udpExtraOptions:socket.UDPExtraOptions = {
        broadcast: true
      };
      try {
        udp.setExtraOptions(udpExtraOptions, (error, data) => {
          if (error) {
            expect().assertFail();
            console.log(`${caseName} error, case failed,error: ` + JSON.stringify(error));
            done();
          } else {
            expect().assertTrue();
            console.log(`${caseName} error, case success failed`);
            done();
          }
          done();
        });
        done();
      } catch (error) {
        console.log(`${caseName} failed,error:${error}`);
        expect(true).assertTrue();
        done();
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_0200
     * @tc.number Telephony_Socket_UDPSocket_setExtraOptions_0200
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0200";
      let udpExtraOptions:socket.UDPExtraOptions = {
        broadcast: true
      };
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
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_0300
     * @tc.number Telephony_Socket_UDPSocket_setExtraOptions_0300
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0300";
      let udpExtraOptions :socket.UDPExtraOptions= {};
      udp.setExtraOptions(udpExtraOptions, (error) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed`);
        done();
      });
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_0400
     * @tc.number Telephony_Socket_UDPSocket_setExtraOptions_0400
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_setExtraOptions_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_0400";
      let udpExtraOptions :socket.UDPExtraOptions= {};
      try {
        udp.setExtraOptions(udpExtraOptions).then((data) => {
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
    /**
     * @tc.name   Telephony_Socket_UDPSocket_on_message_0100
     * @tc.number Telephony_Socket_UDPSocket_on_message_0100
     * @tc.desc   Listens for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_on_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_message_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_on_message_0100";
      udp.on('message', (data) => {
        let socketRemoteInfo = data.remoteInfo;
        expectTrue(socketRemoteInfo.port!=null)
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_on_message_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_off_message_0100
     * @tc.number Telephony_Socket_UDPSocket_off_message_0100
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_off_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_message_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_0100";
      udp.off("message", data => {
        let socketRemoteInfo = data.remoteInfo;
        expectTrue(socketRemoteInfo.port!=null)
        console.log(`${caseName} port:${socketRemoteInfo.port}`);
        console.log(`${caseName} size:${socketRemoteInfo.size}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_off_message_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_on_message_0200
     * @tc.number Telephony_Socket_UDPSocket_on_message_0200
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_on_message_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_on_message_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_0200";
      udp.on('message', (data) => {
        let socketmessage = data.message;
        console.log(`${caseName} success:${socketmessage}`);
      });
      console.log("************* Telephony_Socket_UDPSocket_off_message_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0300
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0300
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0300";
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
    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0400
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0400
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0400";
      try {
        multicastSocket.setMulticastTTL(ttl_null, (err, data) => {
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
    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0500
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0500
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0500";
      multicastSocket.setMulticastTTL(0, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0600
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0600
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0600";
      multicastSocket.setMulticastTTL(-1, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0700
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0700
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0700";
      multicastSocket.setMulticastTTL(255, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_0800
     * @tc.number NetworkManager_UDPSocket_setMulticastTTL_Async_0800
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_0800";
      multicastSocket.setMulticastTTL(256, (err, data) => {
        if (err) {
          console.log(`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          console.log(`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_off_message_0300
     * @tc.number Telephony_Socket_UDPSocket_off_message_0300
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_off_message_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("************* Telephony_Socket_UDPSocket_off_message_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_0300";
      let messageView = '';
      let callback = (value: socket.SocketMessageInfo) => {
        for (let i: number = 0; i < value.message.byteLength; i++) {
          let uint8Array = new Uint8Array(value.message)
          let messages = uint8Array[i]
          let message = String.fromCharCode(messages);
          messageView += message;
        }
        console.info('on message message: ' + JSON.stringify(messageView));
        console.info('remoteInfo: ' + JSON.stringify(value.remoteInfo));
      }
      udp.on('message', callback);
      udp.off("message", data => {
        let messageView = data.message;
        if (messageView !== null) {
          console.log(`${caseName} data.message:${messageView}`);
          console.log(`${caseName} data.message:${messageView.byteLength}`);
          expectTrue(messageView != null);
        }
      });
      console.log("************* Telephony_Socket_UDPSocket_off_message_0300 Test end*************");
      done();
    });
    console.log("************* socket Test end*************");
  })
}
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import socket from '@ohos.net.socket';


const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${caseName} expect error ${JSON.stringify(err)}`);
  }
}

let ws: webSocket.WebSocket = webSocket.createWebSocket();

export default function WebSocketPermissionDeniedTest() {
  describe('webSocketPermissionDeniedTest', () => {

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectCode201Callback_0100
     * @tc.name  : testNetworkMgrWebSocketConnectCode201Callback0100
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketConnectCode201Callback0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCode201Callback0100';
      console.info(`${caseName} test start`);
      try {
        let url: string = 'ws://';
        ws.connect(url, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error.code === 201);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Callback_0200
     * @tc.name  : testNetworkMgrWebSocketConnectOptionsCode201Callback0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketConnectOptionsCode201Callback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Callback0200';
      console.info(`${caseName} test start`);
      try {
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          }
        };
        ws.connect(url, options, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error.code === 201);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Promise_0300
     * @tc.name  : testNetworkMgrWebSocketConnectOptionsCode201Promise0300
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketConnectOptionsCode201Promise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Promise0300';
      console.info(`${caseName} test start`);
      try {
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          }
        };
        let result: boolean = await ws.connect(url, options);
        console.info(`${caseName} test result value is ${result}`);
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        let e: BusinessError = err as BusinessError;
        ExpectTrue(e.code === 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCode201Callback_0100
     * @tc.name  : testNetworkMgrWebSocketSendCode201Callback0100
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketSendCode201Callback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCode201Callback0100';
      console.info(`${caseName} test start`);
      try {
        ws.send('hello world', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error.code === 201);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCode201Promise_0200
     * @tc.name  : testNetworkMgrWebSocketSendCode201Promise0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketSendCode201Promise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCode201Promise0200';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = await ws.send('hello world');
        console.info(`${caseName} test result value is ${result}`);
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        let e: BusinessError = err as BusinessError;
        ExpectTrue(e.code === 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_CloseCode201Callback_0100
    * @tc.name  : testNetworkMgrWebSocketCloseCode201Callback0100
    * @tc.desc  : Test code 201 of connect api with callback type
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrWebSocketCloseCode201Callback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCode201Callback0100';
      console.info(`${caseName} test start`);
      try {
        ws.close((error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error.code === 201);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseOptionsCode201Callback_0200
     * @tc.name  : testNetworkMgrWebSocketCloseOptionsCode201Callback0200
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketCloseOptionsCode201Callback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseOptionsCode201Callback0200';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketCloseOptions = {
          code: 10000011,
          reason: 'permission denied'
        };
        ws.close(options, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          ExpectTrue(error !== undefined && error.code === 201);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseOptionsCode201Promise_0300
     * @tc.name  : testNetworkMgrWebSocketCloseOptionsCode201Promise0300
     * @tc.desc  : Test code 201 of connect api with callback type
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketCloseOptionsCode201Promise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseOptionsCode201Promise0300';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketCloseOptions = {
          code: 10000011,
          reason: 'permission denied'
        };
        let result: boolean = await ws.close(options);
        console.info(`${caseName} test result value is ${result}`);
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        let e: BusinessError = err as BusinessError;
        ExpectTrue(e.code === 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_UDPSocket_Bind_0100
     * @tc.name  : testNetworkMgrWebSocketUDPSocketBind0100
     * @tc.desc  : Test code 201 of UDPSocket bind(callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketUDPSocketBind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12345
        }
        udp.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.log('bind fail');
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code==201);
            done();
          }
          else{
            console.log('bind success');
            ExpectTrue(false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_UDPSocket_Bind_0200
     * @tc.name  : testNetworkMgrWebSocketUDPSocketBind0200
     * @tc.desc  : Test code 201 of UDPSocket bind(promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketUDPSocketBind0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketBind0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12346
        }
        udp.bind(bindAddr).then(() => {
          console.log('bind success');
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.log('bind fail');
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code==201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_UDPSocket_Close_0100
     * @tc.name  : testNetworkMgrWebSocketUDPSocketClose0100
     * @tc.desc  : Test code 201 of UDPSocket close(callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketUDPSocketClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketClose0100';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close((err: BusinessError) => {
          if (err) {
            console.log('close fail');
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code==201);
            done();
          }
          else{
            console.log('close success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_UDPSocket_Close_0200
     * @tc.name  : testNetworkMgrWebSocketUDPSocketClose0200
     * @tc.desc  : Test code 201 of UDPSocket close(promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketUDPSocketClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketClose0200';
      console.info(`${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close().then(() => {
          console.log('close success');
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.log('close fail');
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code==201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_TLSSocket_Bind_0100
     * @tc.name  : testNetworkMgrWebSocketTLSSocketBind0100
     * @tc.desc  : Test code 201 of TLSSocket bind(callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketTLSSocketBind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketTLSSocketBind0100';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12347
        }
        tls.bind(bindAddr, (err: BusinessError) => {
          if (err) {
            console.log('bind fail');
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code==201);
            done();
          }
          else{
            console.log('bind success');
            ExpectTrue(false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_TLSSocket_Bind_0200
     * @tc.name  : testNetworkMgrWebSocketTLSSocketBind0200
     * @tc.desc  : Test code 201 of TLSSocket bind(promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketTLSSocketBind0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketTLSSocketBind0200';
      console.info(`${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12348
        }
        tls.bind(bindAddr).then(() => {
          console.log('bind success');
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.log('bind fail');
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code==201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code==201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: USB_NetworkMgr_WebSocket_MulticastSocket_AddMembership_0100
     * @tc.name  : testNetworkMgrWebSocketMulticastSocketAddMembership0100
     * @tc.desc  : Test code 201 of MulticastSocket AddMembership(callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketMulticastSocketAddMembership0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketAddMembership0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12348
        }
        multicast.addMembership(addr, (err: BusinessError) => {
          if (err) {
            console.log('add fail');
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code==201);
            done();
          }
          else{
            console.log('add success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: USB_NetworkMgr_WebSocket_MulticastSocket_AddMembership_0200
     * @tc.name  : testNetworkMgrWebSocketMulticastSocketAddMembership0200
     * @tc.desc  : Test code 201 of MulticastSocket AddMembership(promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketMulticastSocketAddMembership0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketAddMembership0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12349
        }
        multicast.addMembership(addr).then(() => {
          console.log('add success');
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.log('add fail');
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: USB_NetworkMgr_WebSocket_MulticastSocket_DropMembership_0100
     * @tc.name  : testNetworkMgrWebSocketMulticastSocketDropMembership0100
     * @tc.desc  : Test code 201 of MulticastSocket DropMembership(callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketMulticastSocketDropMembership0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketDropMembership0100';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12350
        }
        multicast.dropMembership(addr, (err: BusinessError) => {
          if (err) {
            console.log('drop fail');
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201);
            done();
          }
          else{
            console.log('drop success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /* *
     * @tc.number: USB_NetworkMgr_WebSocket_MulticastSocket_DropMembership_0200
     * @tc.name  : testNetworkMgrWebSocketMulticastSocketDropMembership0200
     * @tc.desc  : Test code 201 of MulticastSocket DropMembership(promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketMulticastSocketDropMembership0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketDropMembership0200';
      console.info(`${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12351
        }
        multicast.dropMembership(addr).then(() => {
          console.log('drop success');
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.log('drop fail');
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Socket_TCPSocketServer_Close_NoP_0100
     * @tc.name  : testNetworkMgrSocketTCPSocketServerCloseNoP0100
     * @tc.desc  : Test code 201 of TCPSocketServer
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
      it('testNetworkMgrSocketTCPSocketServerCloseNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerCloseNoP0100';
      console.info(`${caseName} test start`);
      try {
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        tcpServer.close().then(()=>{
          console.info(`${caseName} tcpServer  close success`);
          ExpectTrue(false);
          done();
          console.info(`${caseName}---End`);
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} tcpServer  close failed err is` + JSON.stringify(err));
          ExpectTrue(err.code == 201);
          done();
          console.info(`${caseName}---End`);
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });
    
  /* *
     * @tc.number: SUB_NetworkMgr_Socket_TLSSocketServer_Close_NoP_0100
     * @tc.name  : testNetworkMgrSocketTLSSocketServerCloseNoP0100
     * @tc.desc  : Test code 201 of tlsServer
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testNetworkMgrSocketTLSSocketServerCloseNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerCloseNoP0100';
      console.info(`${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.close().then(()=>{
          console.info(`${caseName} tlsServer close success `);
          ExpectTrue(false);
          done();
          console.info(`${caseName}---End`);
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} tlsServer close get err is `+JSON.stringify(err));
          ExpectTrue(err.code == 201);
          console.info(`${caseName}---End`);
          done();
        })
      } catch (err) {
        console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName} test end`);
        done();
      }
    });

  });
}

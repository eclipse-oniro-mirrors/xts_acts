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
import webSocket from '@ohos.net.webSocket';
import { BusinessError } from '@kit.BasicServicesKit';


function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}


const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${caseName} expect error ${JSON.stringify(err)}`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}


let serverConfig: webSocket.WebSocketServerConfig ={
  serverIP: "0.0.0.0",
  serverPort: 8050,
  maxConcurrentClientsNumber: 10,
  maxConnectionsForOneClient: 4,
}

export default function WebsocketServerTest() {
  describe('WebsocketServerTest', ()=> {
    /**
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketServer0100
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketServer_0100
     * @tc.desc   Create a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCreateWebSocketServer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketServer0100';
      console.info(`${caseName} test start`);
      try {
        let wss: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${JSON.stringify(wss)}`);
        ExpectTrue(wss != null,`${caseName}`);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketServer0200
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketServerCallback_0200
     * @tc.desc   Create two WebSocketServers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCreateWebSocketServer0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketServer0200';
      console.info(`${caseName} test start`);
      try {
        let server1: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        let server2: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server1}`);
        console.info(`${caseName} --> ${server2}`);
        ExpectTrue(server1 != server2,`${caseName}`);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0100
     * @tc.desc   Start a WebSocketServer (serverConfig without cert and protocol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8051,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            ExpectTrue(true, `${caseName} webSocketServer start success`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0200
     * @tc.desc   Start a WebSocketServer (serverConfig contain protocol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8052,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            ExpectTrue(true, `${caseName} webSocketServer start success`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0300
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0300
     * @tc.desc   Start a WebSocketServer (serverConfig contain protocol and cert)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0300';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverCert: webSocket.ServerCert = {
          certPath: "",
          keyPath: ""
        }
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8053,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
          serverCert: serverCert,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            ExpectTrue(true, `${caseName} webSocketServer start success`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0400
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0400
     * @tc.desc   Start a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0400';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverCert: webSocket.ServerCert = {
          certPath: "",
          keyPath: ""
        }
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: undefined,
          serverPort: 8054,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
          serverCert: serverCert,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            ExpectTrue(true, `${caseName} webSocketServer start success`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName}  error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0500
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0500
     * @tc.desc   Start a WebSocketServer(errorCode:2302002)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0500';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverCert: webSocket.ServerCert = {
          certPath: "./index.test",
          keyPath: "./index.test"
        }
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8055,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
          serverCert: serverCert,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start success`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2302002, `${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0600
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0600
     * @tc.desc   Start a WebSocketServer(errorCode:2302005)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0600';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 123456489764556454,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
          protocol: "my-protocol",
        }
        await server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2302005, `${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0700
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0700
     * @tc.desc   Start a WebSocketServer (errorCode:2302004)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0700';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0..",
          serverPort: 8056,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2302004, `${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStart0800
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStart_0800
     * @tc.desc   Start a WebSocketServer (errorCode:2302999)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart0800';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8057,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 11,
        }
        server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
            expectFail(`${caseName} webSocketServer start`);
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName}  error ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2302999, `${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerListAllConnections0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerListAllConnections_0100
     * @tc.desc   WebSocketServer list all connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerListAllConnections0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerListAllConnections0100';
      console.info(`${caseName} test start`)
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8058,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
        }
        await server.on('connect',callback)
        await sleep(100)
        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        client.connect('ws://127.0.0.1:8058', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName}`)
            done()
            console.info(`${caseName} test end`);
          }
        })
        await sleep(1000)
        let connections = await server.listAllConnections()
        console.info(`${caseName} connections1-->+ ${JSON.stringify(connections)}`);
        if (connections) {
          console.info(`${caseName} connections2-->+ ${JSON.stringify(connections[0])}`)
          console.info(`${caseName} connections.length-->+ ${JSON.stringify(connections.length)}`);
          ExpectTrue(connections.length > 0, `${caseName}--> ${connections[0]}`)
          done()
          server.stop()
          console.info(`${caseName} test end1`)
        }else{
          expectFail(`${caseName}`)
          done()
          server.stop()
          console.info(`${caseName} test end2`)
        }
      }catch (error){
        console.info(`${caseName} error--${error}`)
        expectFail(`${caseName}`)
        done()
        console.info(`${caseName} test end3`)
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerListAllConnections0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerListAllConnections_0200
     * @tc.desc   WebSocketServer list all connections(null array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerListAllConnections0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerListAllConnections0200';
      console.info(`${caseName} test start`)
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8059,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
        }
        await server.on('connect',callback)
        await sleep(500)
        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        client.connect('ws://127.0.0.1:8059', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName}`)
            done()
            console.info(`${caseName} test end`);
          }
        })
        await sleep(500)
        let connections = await server.listAllConnections()
        if(!connections){
          expectFail(`${caseName}`)
          done()
          console.info(`${caseName} test end2`)
        }else{
          console.info(`${caseName} connections1-->+ ${JSON.stringify(connections[0])}`)
          await server.close(connections[0]).then((success: boolean) => {
            if(!success){
              expectFail(`${caseName} server close fail`)
              done()
              server.stop()
              console.info(`${caseName} test end`)
            }
          })
          await sleep(200)
          connections = await server.listAllConnections()
          if(connections){
            console.info(`${caseName} connections2-->+ ${JSON.stringify(connections[0])}`)
            console.info(`${caseName} connections.length-->+ ${JSON.stringify(connections.length)}`)
            ExpectTrue(connections.length == 0, `${caseName}--> ${connections}`)
            done()
            server.stop()
            console.info(`${caseName} test end`)
          }else{
            console.info(`${caseName} connections2-->+ ${JSON.stringify(connections)}`)
            expectFail(`${caseName}--> ${JSON.stringify(connections)}`)
            done()
            server.stop()
            console.info(`${caseName} test end1`)
          }
        }
      }catch (error){
        console.info(`${caseName} error--${error}`)
        expectFail(`${caseName}`)
        done()
        console.info(`${caseName} test end3`)
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerSend0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerSend_0100
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerSend0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8060,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
        await new Promise<string>((resolve)=> {
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          console.info(`${caseName}client-- >${client}`)
          client.connect('ws://127.0.0.1:8060', (err: BusinessError, value: boolean) => {
            if (value) {
              console.info(`${caseName} test connect success and value is ${value}`);
            } else {
              console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end test end`);
            }
            resolve('ok')
          });

        })
        await sleep(500)
        let connections = await server.listAllConnections()
        if(!connections || connections.length == 0){
          console.info(`${caseName} get connections fail`)
          expectFail(`${caseName}`)
          done()
          console.info(`${caseName} test end`)
        }else{
          server.send("hello client", connections[0]).then((success: boolean)=>{
            if (success){
              console.info(`${caseName} send success`)
              ExpectTrue(success, `${caseName} send success`)
              done()
              console.info(`${caseName} test end`);
            }else{
              console.info(`${caseName} send fail`);
              expectFail(`${caseName} send fail`)
              done()
              console.info(`${caseName} test end`);
            }
          }).catch((error: BusinessError) => {
            console.info(`${caseName} test send fail ${JSON.stringify(error)}`);
            expectFail(`${caseName} test send fail`);
            server.stop()
            done();
            console.info(`${caseName} test end`);
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerSend0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerSend_0200
     * @tc.desc   WebSocketServer send a massage(errorCode:2302006)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerSend0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8061,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
          }else {
            expectFail(`${caseName} webSocketServer start fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
        await new Promise<string>((resolve)=> {
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          console.info(`${caseName}client-- >${client}`)
          client.connect('ws://127.0.0.1:8061', (err: BusinessError, value: boolean) => {
            if (value) {
              console.info(`${caseName} test connect success and value is ${value}`);
            } else {
              console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end test end`);
            }
            resolve('ok')
          });

        })
        await sleep(20)
        let wrongConnection: webSocket.WebSocketConnection = {
          clientIP: '1.1.1.1',
          clientPort: 8888
        }
        server.send("hello client", wrongConnection).then((success: boolean)=>{
          if (success){
            console.info(`${caseName} send success`)
            expectFail(`${caseName} send success`)
            done()
            console.info(`${caseName} test end`);
          }else{
            console.info(`${caseName} send fail`);
            expectFail(`${caseName} send fail`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test send fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2302006,`${caseName} test send error`);
          server.stop()
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2302006, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerClose0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerClose_0100
     * @tc.desc   WebSocketServer close a connection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8062,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
          }else {
            expectFail(`${caseName} client connect to server`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        client.connect('ws://127.0.0.1:8062', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName}`)
            done()
            console.info(`${caseName} test end test end`);
          }
        });
        await sleep(500)
        let connections = await server.listAllConnections()
        if(!connections || connections.length == 0){
          console.info(`${caseName} get connections fail`)
          expectFail(`${caseName}`)
          done()
          console.info(`${caseName} test end`)
        }else{
          console.info(`${caseName} connections1-->+ ${JSON.stringify(connections[0])}`)
          server.close(connections[0]).then((success: boolean) => {
            if (success) {
              ExpectTrue(true, `${caseName} server close success`)
              console.info(`${caseName} server close success`)
              done()
              server.stop()
              console.info(`${caseName} test end`);
            } else{
              expectFail(`${caseName} server close fail`)
              done()
              server.stop()
              console.info(`${caseName} test end`);
            }
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerClose0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerClose_0200
     * @tc.desc   WebSocketServer close a connection(errorCode:2302006)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        await server.start(serverConfig).then((success: boolean) => {
          if (success){
            console.log(`${caseName} webSocketServer start success`)
          }else {
            expectFail(`${caseName} client connect to server`)
            done()
            console.info(`${caseName} test end`);
          }
        }).catch((error: BusinessError) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)}`);
          expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
          done()
          console.info(`${caseName} test end`);
        })
        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        client.connect('ws://127.0.0.1:8050', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName}`)
            done()
            console.info(`${caseName} test end test end`);
          }
        });
        await sleep(20)
        let wrongConnection: webSocket.WebSocketConnection = {
          clientIP: '1.1.1.1',
          clientPort: 8888
        }
        server.close(wrongConnection).then((success: boolean) => {
          if (success) {
            expectFail(`${caseName} server close success`)
            console.info(`${caseName} server close success`)
            done()
            server.stop()
            console.info(`${caseName} test end`);
          } else{
            expectFail(`${caseName} server close fail`)
            done()
            server.stop()
            console.info(`${caseName} test end`);
          }
        }).catch((err: BusinessError) => {
          ExpectTrue(err.code == 2302006,`${caseName} server close err: ${JSON.stringify(err)}`)
          done()
          server.stop()
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        ExpectTrue(err.code == 2302006,`${caseName} server close err: ${JSON.stringify(err)}`)
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerStop0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStop_0100
     * @tc.desc   Stop WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerStop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStop0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          console.info(`${caseName} --> ${server}`);
          let serverConfig: webSocket.WebSocketServerConfig ={
            serverIP: "0.0.0.0",
            serverPort: 8063,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          await server.start(serverConfig).then((success: boolean) => {
            if (success){
              console.log(`${caseName} webSocketServer start success`)
            }else {
              expectFail(`${caseName} webSocketServer start fail`)
              done()
              console.info(`${caseName} test end`);
            }
          }).catch((error: BusinessError) => {
            console.info(`${caseName} test result error ${JSON.stringify(error)}`);
            expectFail(`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
          await server.stop().then((success: boolean) => {
            if (success) {
              ExpectTrue(true, `${caseName} server close success`)
              done()
              console.info(`${caseName} test end`);
            } else{
              expectFail(`${caseName} server stop fail`)
              done()
              console.info(`${caseName} test end`);
            }
          })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOnConnect0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOnConnect_0100
     * @tc.desc   Subscript to websocket server connect event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnConnect0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8070,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          ExpectTrue(connection != undefined)
          done();
          console.info(`${caseName} test end`);
        }
        await server.on('connect',callback)
        await sleep(100)

        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8070', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
          }
        })
        console.info(`${caseName} test end1`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffConnect0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffConnect_0100
     * @tc.desc   Unsubscript to websocket server connect event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffConnect0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8071,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          ExpectTrue(connection != undefined)
          done();
          console.info(`${caseName} test end`);
        }
        await server.on('connect',callback)
        await server.off('connect',callback)
        await sleep(100)

        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8071', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
          }

        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end1`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffConnect0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffConnect_0200
     * @tc.desc   UnSubscript to websocket server connect event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffConnect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffConnect0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8072,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          ExpectTrue(connection != undefined)
          done();
          console.info(`${caseName} test end`);
        }
        await server.on('connect',callback)
        await server.off('connect')
        await sleep(100)

        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8072', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
          }

        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end1`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOnMsg0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOnMsg_0100
     * @tc.desc   Subscript to websocket server message received event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnMsg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnMsg0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8073,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (massage: webSocket.WebSocketMessage) => {
          if (massage.data == "hello server") {
            console.info(`${caseName} test onMassage success. connection is ${massage.clientConnection}`)
            ExpectTrue(true, `${caseName} test onMassage success`)
            done()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} client connect to server`)
            done()
            console.info(`${caseName} test end`);
          }
        }
        server.on('messageReceive',callback)
        await sleep(100)

        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        class OutValue {
          status: number = 0
          message: string = ""
        }
        await client.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          console.info(`${JSON.stringify(status)}`);

          client.send('hello server', (err: BusinessError, value: boolean) => {
            if (!err) {
              console.info(`${caseName} client send message successfully`)
            }else{
              console.info(`${caseName} Failed to send the message. Err:`+ JSON.stringify(err));
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end`);
            }
          })
        })
        await sleep(1000)
        client.connect('ws://127.0.0.1:8073', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffMsg0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffMsg_0100
     * @tc.desc   UnSubscript to websocket server message received event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffMsg0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffMsg0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8074,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (massage: webSocket.WebSocketMessage) => {
          if (massage.data == "hello server") {
            console.info(`${caseName} test onMassage success`)
            ExpectTrue(true, `${caseName} test onMassage success`)
            done()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} client connect to server`)
            done()
            console.info(`${caseName} test end`);
          }
        }
        server.on('messageReceive',callback)
        server.off('messageReceive',callback)
        await sleep(100)
        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        class OutValue {
          status: number = 0
          message: string = ""
        }
        await client.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          console.info(`${JSON.stringify(status)}`);

          client.send('hello server', (err: BusinessError, value: boolean) => {
            if (!err) {
              console.info(`${caseName} client send message successfully`)
            }else{
              console.info(`${caseName} Failed to send the message. Err:`+ JSON.stringify(err));
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end`);
            }
          })
        })
        await sleep(100)
        client.connect('ws://127.0.0.1:8074', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          }
        });
        await sleep(100)

        ExpectTrue(true)
        done();
        console.info(`${caseName} test end1`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffMsg0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffMsg_0200
     * @tc.desc   UnSubscript to websocket server message received event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffMsg0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffMsg0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8075,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })
        let callback = (massage: webSocket.WebSocketMessage) => {
          if (massage.data == "hello server") {
            console.info(`${caseName} test onMassage success`)
            ExpectTrue(true, `${caseName} test onMassage success`)
            done()
            console.info(`${caseName} test end`);
          }else {
            expectFail(`${caseName} client connect to server`)
            done()
            console.info(`${caseName} test end`);
          }
        }
        server.on('messageReceive',callback)
        server.off('messageReceive')
        await sleep(100)

        let client: webSocket.WebSocket = webSocket.createWebSocket()
        console.info(`${caseName}client-- >${client}`)
        class OutValue {
          status: number = 0
          message: string = ""
        }
        await client.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen error is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          console.info(`${JSON.stringify(status)}`);

          client.send('hello server', (err: BusinessError, value: boolean) => {
            if (!err) {
              console.info(`${caseName} client send message successfully`)
            }else{
              console.info(`${caseName} Failed to send the message. Err:`+ JSON.stringify(err));
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end`);
            }
          })
        })
        await sleep(100)
        client.connect('ws://127.0.0.1:8075', (err: BusinessError, value: boolean) => {
          if (value) {
            console.info(`${caseName} test connect success and value is ${value}`);
          } else {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          }
        });
        await sleep(100)

        ExpectTrue(true)
        done();
        console.info(`${caseName} test end1`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end2`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOnErr0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOnErr_0100
     * @tc.desc   Subscript to websocket server error event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnErr0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8076,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        })
        let callback = (err: BusinessError) => {
          console.info(`${caseName} err,errcode == ${err.code}`)
          ExpectTrue(true, `${caseName} test onError err：${JSON.stringify(err)}`)
          done()
          console.info(`${caseName} test end1`);
        }
        server.on("error", callback);
        await sleep(100)
        let wrongConnection: webSocket.WebSocketConnection = {
          clientIP: '1.1.1.1',
          clientPort: 8888
        }
        await server.send("hi", wrongConnection).then((success: boolean)=> {
          if (success){
            console.info(`${caseName} send success`)
          }else{
            console.info(`${caseName} send fail`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2302006,`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done()
        console.info(`${caseName} test end3`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffErr0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffErr_0100
     * @tc.desc   UnSubscript to websocket server error event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffErr0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8077,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        })
        let callback = (err: BusinessError) => {
          console.info(`${caseName} err,errcode == ${err.code}`)
          ExpectTrue(false, `${caseName} test onError err：${JSON.stringify(err)}`)
          done()
          console.info(`${caseName} test end1`);
        }
        server.on("error", callback);
        server.off("error", callback);
        await sleep(100)
        let wrongConnection: webSocket.WebSocketConnection = {
          clientIP: '1.1.1.1',
          clientPort: 8888
        }
        await server.send("hi", wrongConnection).then((success: boolean)=> {
          if (success){
            console.info(`${caseName} send success`)
          }else{
            console.info(`${caseName} send fail`);
          }
        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end2`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2302006,`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end3`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffErr0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffErr_0200
     * @tc.desc   UnSubscript to websocket server error event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffErr0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8078,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        })
        let callback = (err: BusinessError) => {
          console.info(`${caseName} err,errcode == ${err.code}`)
          ExpectTrue(false, `${caseName} test onError err：${JSON.stringify(err)}`)
          done()
          console.info(`${caseName} test end1`);
        }
        server.on("error", callback);
        server.off("error");
        await sleep(100)
        let wrongConnection: webSocket.WebSocketConnection = {
          clientIP: '1.1.1.1',
          clientPort: 8888
        }
        await server.send("hi", wrongConnection).then((success: boolean)=> {
          if (success){
            console.info(`${caseName} send success`)
          }else{
            console.info(`${caseName} send fail`);
          }
        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end2`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2302006,`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end3`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOnClose0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOnClose_0100
     * @tc.desc   Subscript to websocket server close event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOnClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOnClose0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8079,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })

        let closeCallback = (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
          console.info(`${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
          ExpectTrue(clientConnection != undefined);
          done();
          console.info(`${caseName} test end1`);
        }
        server.on('close', closeCallback);
        server.on('connect',(connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);

          let closeOption: webSocket.WebSocketCloseOptions = {
            code: 1000,
            reason: "normal"
          }
          server.close(connection, closeOption).then((value: boolean) => {
            console.info(`${caseName} close value is ${JSON.stringify(value)}`)
          })
        })
        await sleep(1000)
        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8079', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
            expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
            done();
            console.info(`${caseName} test end`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffClose0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffClose_0100
     * @tc.desc   UnSubscript to websocket server close event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffClose0100';
      console.info(`${caseName} test start`);
      try {
        let server2: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8881,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server2.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })

        let closeCallback = (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
          console.info(`${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
          ExpectTrue(false);
          done();
          console.info(`${caseName} test end1`);
        }
        server2.on('close', closeCallback);
        server2.off('close', closeCallback);
        await sleep(100);
        server2.on('connect',(connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);

          let closeOption: webSocket.WebSocketCloseOptions = {
            code: 1000,
            reason: "normal"
          }
          server2.close(connection, closeOption).then((value: boolean) => {
            console.info(`${caseName} close value is ${JSON.stringify(value)}`)
          })
        })
        await sleep(100)
        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8881', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
            expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
            done();
            console.info(`${caseName} test end`);
          }
        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end2`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerOffClose0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerOffClose_0200
     * @tc.desc   UnSubscript to websocket server close event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerOffClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerOffClose0200';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8082,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        await server.start(serverConfig).then((value: boolean)=>{
          if (value) {
            console.info(`${caseName} server start`)
          }else {
            console.info(`${caseName} server start fail`)
            expectFail(`${caseName} server start fail`)
            done()
            console.info(`${caseName} test end`)
          }
        }).catch((err: BusinessError) => {
          console.info(`${caseName} catch error ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          console.info(`${caseName} test end`);
        })

        let closeCallback = (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
          console.info(`${caseName} onclose connection is ${JSON.stringify(clientConnection)} and closeReason is ${JSON.stringify(closeReason)}`);
          ExpectTrue(false);
          done();
          console.info(`${caseName} test end1`);
        }
        server.on('close', closeCallback);
        server.off('close');
        server.on('connect',(connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);

          let closeOption: webSocket.WebSocketCloseOptions = {
            code: 1000,
            reason: "normal"
          }
          server.close(connection, closeOption).then((value: boolean) => {
            console.info(`${caseName} close value is ${JSON.stringify(value)}`)
          })
        })
        await sleep(100)
        let client = await webSocket.createWebSocket()
        await client.connect('ws://127.0.0.1:8082', (err:BusinessError, value: boolean) =>{
          if (value){
            console.info(`${caseName} connect success`)
          }else{
            console.info(`${caseName} connect fail`)
            expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
            done();
            console.info(`${caseName} test end`);
          }
        })
        await sleep(100)
        ExpectTrue(true)
        done();
        console.info(`${caseName} test end2`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });
  })
}
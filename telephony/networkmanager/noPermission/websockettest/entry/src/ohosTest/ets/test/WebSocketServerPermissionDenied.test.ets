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

let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
let serverConfig: webSocket.WebSocketServerConfig ={
  serverIP: "0.0.0.0",
  serverPort: 8088,
  maxConcurrentClientsNumber: 10,
  maxConnectionsForOneClient: 4,
}


export default function WebSocketServerPermissionDeniedTest() {
  describe('WebSocketServerPermissionDeniedTest', ()=> {

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStart201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerStart201Error0100
     * @tc.desc  : Start a WebSocketServer (201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerStart201Error0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStart201Error0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        console.info(`${caseName} --> ${server}`);
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8088,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        if(!server) {
          console.info(`${caseName} Server is nullptr`);
          ExpectTrue(true,`${caseName}`);
          done();
          console.info(`${caseName} test end`);
        }else {
          server.start(serverConfig).then((success: boolean) => {
            if (success){
              console.log(`${caseName} webSocketServer start success`)
              ExpectTrue(server != null);
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
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201,`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerListAllConnections201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerListAllConnections201Error0100
     * @tc.desc  : WebSocketServer list all connections(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerListAllConnections201Error0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerListAllConnections201Error0100';
      console.info(`${caseName} test start`)
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig ={
          serverIP: "0.0.0.0",
          serverPort: 8088,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        if(!server) {
          console.info(`${caseName} Server is nullptr`);
          ExpectTrue(true,`${caseName}`);
          done();
          console.info(`${caseName} test end`);
        }else {
          await server.start(serverConfig).then((success: boolean) => {
            if (success) {
              console.info(`${caseName}start success`)
            }else{
              console.info(`${caseName}start fail`)
              done()
              console.info(`${caseName} test end`);
            }
          }).catch((error: BusinessError) => {
            console.info(`${caseName} test result error ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
          let callback = (connection: webSocket.WebSocketConnection) => {
            console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);

          }
          await server.on('connect',callback)
          await sleep(100)
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          console.info(`${caseName}client-- >${client}`)
          client.connect('ws://127.0.0.1:8088', (err: BusinessError, value: boolean) => {
            if (value) {
              console.info(`${caseName} test connect success and value is ${value}`);
            } else {
              console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
              expectFail(`${caseName}`)
              done()
              console.info(`${caseName} test end`);
            }
          })
          await sleep(100)
          let connections = server.listAllConnections()
          console.info(`${caseName} connections-->+ ${JSON.stringify(connections[0])}`);
          if (connections.length != 0) {
            console.info(`${connections}`)
            ExpectTrue(true, `${caseName}--> ${connections[0]}`)
            done()
            console.info(`${caseName} test end1`)
          }else{
            expectFail(`${caseName}`)
            done()
            console.info(`${caseName} test end2`)
          }
        }
      }catch (error){
        console.info(`${caseName} error--${error}`)
        ExpectTrue(error.code == 201,`${caseName} catch error ${JSON.stringify(error)}`)
        console.info(`${caseName} test end3`)
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerSend201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerSend201Error0100
     * @tc.desc  : WebSocketServer send a massage(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerSend201Error0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerSend201Error0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer= webSocket.createWebSocketServer()
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8088,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        }
        if(!server) {
          console.info(`${caseName} Server is nullptr`);
          ExpectTrue(true,`${caseName}`);
          done();
          console.info(`${caseName} test end`);
        }else {
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
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          console.info(`${caseName}client-- >${client}`)
          await sleep(20)
          let connections = await server.listAllConnections()
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
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            server.stop()
            done();
            console.info(`${caseName} test end`);
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201,`${caseName} catch error ${JSON.stringify(err)}`)
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerClose201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerClose201Error0100
     * @tc.desc  : WebSocketServer close a connection(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerClose201Error0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerClose201Error0100';
      console.info(`${caseName} test start`);
      try {
        if(!server) {
          console.info(`${caseName} Server is nullptr`);
          ExpectTrue(true,`${caseName}`);
          done();
          console.info(`${caseName} test end`);
        }else {
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
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket()
          console.info(`${caseName}client-- >${client}`)

          await sleep(20)
          let connections = await server.listAllConnections()
          console.info(`${caseName} connections-->+ ${JSON.stringify(connections[0])}`)
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
          }).catch((err: BusinessError) => {
            console.info(`${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 201,`${caseName} test result error ${JSON.stringify(err)}`)
            done();
            console.info(`${caseName} test end`);
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201,`${caseName} catch error ${JSON.stringify(err)}`)
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_WebSocketServerStop201Error_0100
     * @tc.name  : testNetworkMgrWebSocketWebSocketServerStop201Error0100
     * @tc.desc  : Stop WebSocketServer(201)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketWebSocketServerStop201Error0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketServerStop201Error0100';
      console.info(`${caseName} test start`);
      try {
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        if(!server) {
          console.info(`${caseName} Server is nullptr`);
          ExpectTrue(true,`${caseName}`);
          done();
          console.info(`${caseName} test end`);
        }else {
          console.info(`${caseName} --> ${server}`);
          let serverConfig: webSocket.WebSocketServerConfig ={
            serverIP: "0.0.0.0",
            serverPort: 8088,
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
            ExpectTrue(error.code == 201,`${caseName} test result error ${JSON.stringify(error)}`)
            done()
            console.info(`${caseName} test end`);
          })
          await server.stop().then((success: boolean) => {
            if (success) {
              expectFail(`${caseName} server close success`)
              done()
              console.info(`${caseName} test end`);
            } else{
              expectFail(`${caseName} server stop fail`)
              done()
              console.info(`${caseName} test end`);
            }
          })
        }
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201,`${caseName} catch error ${JSON.stringify(err)}`)
        done();
        console.info(`${caseName} test end`);
      }
    });
  })
}
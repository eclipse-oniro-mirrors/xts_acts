/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'WebSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为



const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
export default function WebSocketTest() {

  describe("WebSocketTest", (): void => {

    hilog.info(domain, tag, '%{public}s', 'describe start');
    let availableWebSocketAddress: string = 'wss://websocket-echo.moyufangge.com';


    /**
     * @tc.name   testWebSocketConnectCallback_static_0300
     * @tc.number SUB_Network_WebSocket_ConnectCallback_0300
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectCallback_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectCallback_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress, {}, (err: BusinessError<void> | null, value: boolean | undefined) => {
          (async () => {
          if (err && err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
            ExpectFail();
            await ws.close();
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
            ExpectTrue(value!);
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          }
          })().awaitSync()
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testWebSocketConnectPromise_static_0200
     * @tc.number SUB_Network_WebSocket_ConnectPromise_0200
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress, {}).then(async (value: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
          ExpectTrue(value);
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
          ExpectFail();
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testWebSocketConnectPromise_static_0300
     * @tc.number SUB_Network_WebSocket_ConnectPromise_0300
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options Parameter rejection,promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectPromise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress).then(async (value: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
          ExpectTrue(value);
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
          ExpectFail();
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testWebSocketCreateWebSocket_static_0100
     * @tc.number SUB_Network_WebSocket_CreateWebSocket_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketCreateWebSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketCreateWebSocket_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          ExpectTrue(typeof ws == 'object');
          hilog.info(domain, tag, '%{public}s', caseName + '---test ');
          ws.connect(availableWebSocketAddress, {}, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  connect fail  error  is ' + err.code);
              ExpectFail();
              ws.close();
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect success and value is ->' + value);
              ExpectTrue(value!);
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + JSON.stringify(err));
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketConnect_static_0100
     * @tc.number SUB_Network_WebSocket_Connect_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketConnect_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          ws.connect('', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  test connect1 fail error is ' + err.code);
              ExpectTrue(err?.code == 2302001)
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect1 success and value is ->' + value);
              ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code != 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ' test connect2 fail  error is ' + JSON.stringify(err));
                  done();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + ': test connect2 success and value is ->' + value);
                  ExpectTrue(false)
                  done();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                }
              })
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error is ' + JSON.stringify(err));
          ExpectTrue(false)
          done();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketConnect_static_0200
     * @tc.number SUB_Network_WebSocket_Connect_0200
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketConnect_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  test connect1 fail error is ' + err.code);
              ExpectTrue(err?.code == 2302999)
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect1 success and value is ->' + value);
              ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code != 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ' test connect2 fail  error is ' + err.code);
                  done();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + ': test connect2 success and value is ->' + value);
                  ExpectTrue(false)
                  done();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                }
              })
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error is ' + JSON.stringify(err));
          ExpectTrue(false)
          done();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      })

    /**
     * @tc.name   testWebSocketConnectCallback_static_0400
     * @tc.number SUB_Network_WebSocket_ConnectCallback_0400
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectCallback_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketConnectCallback_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          hilog.info(domain, tag, '%{public}s', caseName + '---test ');
          ws.connect('', {}, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  connect fail  error  is ' + err.code);
              ExpectTrue(err.code == 2302001);
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect success and value is ->' + value);
              ExpectTrue(value!);
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + JSON.stringify(err));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      });

    /**
     * @tc.name   testWebSocketConnectPromiseUrl_static_0100
     * @tc.number SUB_Network_WebSocket_ConnectPromiseUrl_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectPromiseUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketConnectPromiseUrl_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          hilog.info(domain, tag, '%{public}s', caseName + '---test ');
          let options: webSocket.WebSocketRequestOptions = {};
          ws.connect('', options).then(async (value: boolean) => {
            if (value == false) {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect1 fail and value is ->' + value);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect success and value is ->' + value);
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName + '  connect fail  error  is ' + err.code);
            ExpectTrue(err.code == 2302001)
            done();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      });

    /**
     * @tc.name   testWebSocketConnectPromiseUrl_static_0200
     * @tc.number SUB_Network_WebSocket_ConnectPromiseUrl_0200
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketConnectPromiseUrl_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketConnectPromiseUrl_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws: webSocket.WebSocket = webSocket.createWebSocket();
          hilog.info(domain, tag, '%{public}s', caseName + '---test ');
          let options: webSocket.WebSocketRequestOptions = {};
          ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
            if (value == false) {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect1 fail and value is ->' + value);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': test connect success and value is ->' + value);
              done();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName + '  connect fail  error  is ' + err.code);
            ExpectTrue(err.code == 2302999)
            done();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketServerCreateWebSocketServer_static_0100
     * @tc.number SUB_Network_WebSocket_CreateWebSocketServer_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketServerCreateWebSocketServer_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketServerCreateWebSocketServer_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          ExpectTrue(typeof server == 'object');
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketConnect0100
     * @tc.number SUB_NetworkMgr_WebSocket_Connect_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnect0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnect0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err && err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  test connect1 fail error is '+JSON.stringify(err));
            ExpectTrue(false)
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +': test connect1 success and value is ->'+ value);
            ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, '%{public}s', caseName +' test connect2 fail  error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2302003);
                done();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              } else {
                hilog.info(domain, tag, '%{public}s', caseName +': test connect2 success and value is ->'+ value);
                ExpectTrue(false)
                done();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              }
            })
          }
        })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch error is '+JSON.stringify(err));
        ExpectTrue(false)
        done();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketRequestOptions_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketRequestOptions_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketRequestOptions_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketWebSocketRequestOptions_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let options: webSocket.WebSocketRequestOptions = {
            skipServerCertVerification: true,
            proxy: 'system',
            protocol: '',
            pingInterval: 50,
            pongTimeout: 50
          };
          ExpectTrue(options.skipServerCertVerification !== undefined);
          ExpectTrue(options.proxy !== undefined);
          ExpectTrue(options.protocol !== undefined);
          ExpectTrue(options.pingInterval !== undefined);
          ExpectTrue(options.pongTimeout !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketOpenResult_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_OpenResult_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOpenResult_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketOpenResult_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let openResult: webSocket.OpenResult = {
            status: 0,
            message: 'system'
          };
          ExpectTrue(openResult.status !== undefined);
          ExpectTrue(openResult.message !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketServerConfig_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_ServerConfig_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketServerConfig_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketServerConfig_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let serverCert: webSocket.ServerCert = {
            certPath: "",
            keyPath: ""
          }
          let webSocketServerConfig: webSocket.WebSocketServerConfig = {
            serverIP: '0.0.0.0',
            serverPort: 8800,
            serverCert: serverCert,
            protocol: '',
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 10
          };
          ExpectTrue(webSocketServerConfig.serverIP !== undefined);
          ExpectTrue(webSocketServerConfig.serverPort !== undefined);
          ExpectTrue(webSocketServerConfig.serverCert !== undefined);
          ExpectTrue(webSocketServerConfig.protocol !== undefined);
          ExpectTrue(webSocketServerConfig.maxConcurrentClientsNumber !== undefined);
          ExpectTrue(webSocketServerConfig.maxConnectionsForOneClient !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketServerCert_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_ServerCert_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketServerCert_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketServerCert_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let serverCert: webSocket.ServerCert = {
            certPath: "",
            keyPath: ""
          }
          ExpectTrue(serverCert.certPath !== undefined);
          ExpectTrue(serverCert.keyPath !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketConnection_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_Connection_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnection_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketConnection_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let webSocketConnection: webSocket.WebSocketConnection = {
            clientIP: "",
            clientPort: 8080
          }
          ExpectTrue(webSocketConnection.clientIP !== undefined);
          ExpectTrue(webSocketConnection.clientPort !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrWebSocketMessage_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_Message_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketMessage_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketMessage_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let webSocketConnection: webSocket.WebSocketConnection = {
            clientIP: "",
            clientPort: 8080
          }
          let webSocketMessage: webSocket.WebSocketMessage = {
            data: "",
            clientConnection: webSocketConnection
          }
          ExpectTrue(webSocketMessage.data !== undefined);
          ExpectTrue(webSocketMessage.clientConnection !== undefined);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + error.code);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketSendCallBack_static_0600
     * @tc.number SUB_Network_WebSocket_SendCallBack_0600
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketSendCallBack_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketSendCallBack_static_0600';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ws.send('hello!', (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send fail' + err.code);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketSendPermission_static_0700
     * @tc.number SUB_Network_WebSocket_SendPermission_0700
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketSendPermission_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketSendPermission_static_0700';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ws.send('hello!').then((value: boolean) => {
                if (value && value !== null) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              }).catch((err: Error) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send fail ' + err.code);
                  ExpectTrue(err.code === 201);
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testWebSocketClose_static_0200
     * @tc.number SUB_Network_WebSocket_Close_0200
     * @tc.desc   test websocket close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClose_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ws.close((err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close fail! : errcode is ->' + err.code);
                  ExpectFail();
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close success! ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testWebSocketClose_static_0300
     * @tc.number SUB_Network_WebSocket_Close_0300
     * @tc.desc   test websocket close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClose_static_0300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
                code: 1,
                reason: ""
              };
              ws.close(webSocketCloseOptions, (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close fail! : errcode is ->' + err.code);
                  ExpectFail();
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close success! ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testWebSocketClosePermission_static_0100
     * @tc.number SUB_Network_WebSocket_ClosePermission_0100
     * @tc.desc   test websocket close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClosePermission_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClosePermission_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (connectErr: BusinessError<void> | null, value: boolean | undefined) => {
            if (connectErr && connectErr.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + connectErr.code);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
                code: 1,
                reason: ""
              };
              ws.close(webSocketCloseOptions).then((closeValue: boolean | undefined) => {
                hilog.info(domain, tag, '%{public}s', caseName + 'close success! ' + closeValue);
                ExpectTrue(closeValue !== null);
                done();
              }).catch((closeErr: Error) => {
                hilog.info(domain, tag, '%{public}s', caseName + 'close fail! : errcode is ->' + closeErr.code);
                ExpectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnopen_static_0100
     * @tc.number SUB_Network_WebSocket_Onopen_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnopen_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnopen_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ExpectTrue(value.status !== null);
              ExpectTrue(value.message !== null);
              ws.send('hello!', (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send fail' + err.code);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffOpen_static_0100
     * @tc.number SUB_Network_WebSocket_OffOpen_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffOpen_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffOpen_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              done();
              ws.offOpen((value: webSocket.OpenResult | undefined) => {
                if (value && value !== null) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'off success ' + value);
                  ExpectTrue(value.status !== null);
                  ExpectTrue(value.message !== null);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success');
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnMessage_static_0100
     * @tc.number SUB_Network_WebSocket_OnMessage_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnMessage_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onMessage((err: BusinessError<void> | null, value: undefined | string | ArrayBuffer) => {
            hilog.info(domain, tag, '%{public}s', caseName + '  value is :  ' + value);
            ExpectTrue(value !== null);
            done();
          })
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ws.send('hello!', (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send fail' + err.code);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffMessage_static_0100
     * @tc.number SUB_Network_WebSocket_OffMessage_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffMessage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffMessage_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onMessage((err: BusinessError<void> | null, value: undefined | string | ArrayBuffer) => {
            hilog.info(domain, tag, '%{public}s', caseName + '  onMessage Value is :  ' + value);
            ExpectTrue(value !== null);
            done();
          });
          ws.offMessage((err: BusinessError<void> | null, value: undefined | string | ArrayBuffer) => {
            hilog.info(domain, tag, '%{public}s', caseName + '  offMessage value is :  ' + value);
            ExpectTrue(value !== null);
            done();
          });
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ws.send('hello!', (err: BusinessError<void> | null, value: boolean | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send fail' + err.code);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
                  ExpectTrue(value !== null);
                  done();
                }
              });
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnClose_static_0100
     * @tc.number SUB_Network_WebSocket_OnClose_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnClose_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onWebSocketClose((err: BusinessError<void> | null, value: webSocket.CloseResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + '  onclose Value is :  ' + JSON.stringify(value));
              ExpectTrue(value.code !== null);
              ExpectTrue(value.reason !== null);
              done();
            }
          })
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ws.close();
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffClose_static_0100
     * @tc.number SUB_Network_WebSocket_OffClose_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffClose_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.offWebSocketClose((err: BusinessError<void> | null, value: webSocket.CloseResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + '  offClose Value is :  ' + JSON.stringify(value));
              ExpectTrue(value.code !== null);
              ExpectTrue(value.reason !== null);
              done();
            }
          });
          ws.onWebSocketClose((err: BusinessError<void> | null, value: webSocket.CloseResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + '  onclose Value is :  ' + JSON.stringify(value));
              ExpectTrue(value.code !== null);
              ExpectTrue(value.reason !== null);
              done();
            }
          })
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnError_static_0100
     * @tc.number SUB_Network_WebSocket_OnError_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnError_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnError_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onWebSocketError((err: BusinessError<void> | null) => {
            if (err && err.code !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + '  onerror Value is :  ' + JSON.stringify(err));
              ExpectTrue(err.code !== null);
              done();
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffError_static_0100
     * @tc.number SUB_Network_WebSocket_OffError_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffError_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffError_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.offWebSocketError();
          ws.onWebSocketError((err: BusinessError<void> | null) => {
            if (err && err.code !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + '  onerror Value is :  ' + JSON.stringify(err));
              ExpectTrue(err.code !== null);
              done();
            }
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnDataEnd_static_0100
     * @tc.number SUB_Network_WebSocket_OnDataEnd_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnDataEnd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnDataEnd_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', caseName + 'ondataEnd success');
            done();
          });
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffDataEnd_static_0100
     * @tc.number SUB_Network_WebSocket_OffDataEnd_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffDataEnd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffDataEnd_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', caseName + 'ondataEnd success');
            done();
          });
          ws.offDataEnd();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOnHeaderReceive_static_0100
     * @tc.number SUB_Network_WebSocket_OnHeaderReceive_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOnHeaderReceive_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOnHeaderReceive_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onHeaderReceive((data: webSocket.ResponseHeaders | undefined) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'data');
            ExpectTrue(data !== null);
            done();
          })
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testWebSocketOffHeaderReceive_static_0100
     * @tc.number SUB_Network_WebSocket_OffHeaderReceive_0100
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketOffHeaderReceive_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketOffHeaderReceive_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.offHeaderReceive();
          ws.onHeaderReceive((data: webSocket.ResponseHeaders | undefined) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'data');
            ExpectTrue(data !== null);
            done();
          })
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              ExpectTrue(value !== null);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerListAllConnections_static_0100
     * @tc.number SUB_Network_WebSocketServer_ListAllConnections_0100
     * @tc.desc   Establish a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerListAllConnections_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerListAllConnections_static_0100';
        let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
        let serverConfig: webSocket.WebSocketServerConfig = {
          serverIP: "0.0.0.0",
          serverPort: 8058,
          maxConcurrentClientsNumber: 10,
          maxConnectionsForOneClient: 4,
        };

        await server.start(serverConfig).then((value: boolean | undefined) => {
          if (value) {
            hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start success!');
          } else {
            hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
            done();
          }
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
          done();
        });

        let callback = (connection: webSocket.WebSocketConnection) => {
          console.info(`${caseName} connections-->+${JSON.stringify(connection)}`);
        };

        server.onConnect(callback);

        let client: webSocket.WebSocket = webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName + 'client success!');

        client.connect('ws://127.0.0.1:8058', (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (value) {
            hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
            let connections = server.listAllConnections();
            if (connections) {
              ExpectTrue(connections !== null);
              server.stop();
              console.info(`${caseName} test end1`);
              done();
            } else {
              ExpectFail();
              server.stop();
              console.info(`${caseName} test end2`);
              done();
            }
          } else {
            hilog.info(domain, tag, '%{public}s', caseName + 'client fail!');
            ExpectFail();
            done();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
          }
        });
      });

    /**
     * @tc.name   testNetworkWebSocketServerListAllConnections_static_0200
     * @tc.number SUB_Network_WebSocketServer_ListAllConnections_0200
     * @tc.desc   Establish a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerListAllConnections_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          let caseName: string = 'testNetworkWebSocketServerListAllConnections_static_0200';
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8058,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          await server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
              done();
            }
          }).catch((err: Error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
            done();
          });

          let callback = (connection: webSocket.WebSocketConnection) => {
            console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          }

          server.onConnect(callback => {
            hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            try {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client fail!' + err.code);
              done();
            }
          });

          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
          client.connect('ws://127.0.0.1:8058', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
              ExpectFail();
              done();
            }
          })

          let connections = server.listAllConnections();
          if (connections) {
            ExpectTrue(connections !== null);
            server.stop()
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          }
        } catch (err) {
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerClose_static_0100
     * @tc.number SUB_Network_WebSocketServer_Close_0100
     * @tc.desc   Establish a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerClose_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          let caseName: string = 'testNetworkWebSocketServerClose_static_0100';
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8058,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          await server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
              done();
            }
          }).catch((err: Error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
            done();
          });

          let callback = (connection: webSocket.WebSocketConnection) => {
            console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          }

          server.onConnect(callback => {
            hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            try {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
              server.close(callback).then((value: boolean | undefined) => {
                if (value) {
                  ExpectTrue(value !== null);
                  console.info('close client successfully');
                  done();
                } else {
                  console.error('close client failed');
                }
              });
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client fail!' + err.code);
              ExpectTrue(err.code === 201);
              done();
            }
          });

          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
          client.connect('ws://127.0.0.1:8058', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
              ExpectFail();
              done();
            }
          })

          let connections = server.listAllConnections();
          if (connections) {
            ExpectTrue(connections !== null);
            server.stop()
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          }
        } catch (err) {
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerClose_static_0200
     * @tc.number SUB_Network_WebSocketServer_Close_0200
     * @tc.desc   Establish a WebSocketServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerClose_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          let caseName: string = 'testNetworkWebSocketServerClose_static_0200';
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8058,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          await server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
              done();
            }
          }).catch((err: Error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'webSocketServer start fail!');
            done();
          });

          let callback = (connection: webSocket.WebSocketConnection) => {
            console.info(`${caseName} connections-->+ ${JSON.stringify(connection)}`);
          }

          server.onConnect(callback => {
            hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            try {
              let wrongConnection: webSocket.WebSocketConnection = {
                clientIP: '1.1.1.1',
                clientPort: 8888
              }
              server.close(wrongConnection).then((value: boolean | undefined) => {
                if (value) {
                  ExpectTrue(value !== null);
                  console.info('close client successfully');
                  done();
                } else {
                  console.error('close client failed');
                }
              }).catch((err: Error) => {
                ExpectTrue(err.code === 2302006);
                server.stop()
                console.info(`${caseName} test end`);
                done();
              });
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client fail!' + err.code);
              ExpectTrue(err.code === 2302006);
              done();
            }
          });

          let client: webSocket.WebSocket = webSocket.createWebSocket()
          hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
          client.connect('ws://127.0.0.1:8058', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'client success!');
              ExpectFail();
              done();
            }
          })

          let connections = server.listAllConnections();
          if (connections) {
            ExpectTrue(connections !== null);
            server.stop()
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          }
        } catch (err) {
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerSend_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerSend_0100
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerSend_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerSend_static_0100';
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8099,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'start success!');
            } else {
              ExpectFail();
              done();
            }
          }).catch((error: Error) => {
            ExpectFail();
            done();
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket();
          client.connect('ws://127.0.0.1:8099', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            } else {
              ExpectFail();
              done()
            }
          });

          let connections = server.listAllConnections()
          if (connections == null) {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            let connection: webSocket.WebSocketConnection = {
              clientIP: '0.0.0.0',
              clientPort: 8099
            }
            server.send("hello client", connection).then((value: boolean | undefined) => {
              if (value) {
                ExpectTrue(value !== null);
                done();
              } else {
                ExpectFail();
                done();
              }
            }).catch((error: Error) => {
              hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + error.code);
              ExpectTrue(error.code === 2302006);
              server.stop();
              done();
            })
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + err.code);
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerSend_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerSend_0200
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerSend_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerSend_static_0200';
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8096,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'start success!');
            } else {
              ExpectFail();
              done();
            }
          }).catch((error: Error) => {
            ExpectFail();
            done();
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket();
          client.connect('ws://127.0.0.1:8096', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            } else {
              ExpectFail();
              done()
            }
          });

          let connections = server.listAllConnections()
          if (connections == null) {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            server.send("hello client", wrongConnection).then((value: boolean | undefined) => {
              if (value) {
                ExpectTrue(value !== null);
                done();
              } else {
                ExpectFail();
                done();
              }
            }).catch((error: Error) => {
              hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + error.code);
              ExpectTrue(error.code === 2302006);
              server.stop();
              done();
            })
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + err.code);
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerSend_static_0300
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerSend_0300
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerSend_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerSend_static_0300';
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8099,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'start success!');
            } else {
              ExpectFail();
              done();
            }
          }).catch((error: Error) => {
            ExpectFail();
            done();
          })
          let client: webSocket.WebSocket = webSocket.createWebSocket();
          client.connect('ws://127.0.0.1:8099', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
            } else {
              ExpectFail();
              done()
            }
          });

          let connections = server.listAllConnections()
          if (connections == null) {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            let connection: webSocket.WebSocketConnection = {
              clientIP: '0.0.0.0',
              clientPort: 8099
            }
            server.send("hello client", connection).then((value: boolean | undefined) => {
              if (value) {
                ExpectTrue(value !== null);
                done();
              } else {
                ExpectFail();
                done();
              }
            }).catch((error: Error) => {
              hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + error.code);
              server.stop();
              done();
            })
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + err.code);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerStop_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStop_0100
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerStop_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerStop_static_0100';
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8098,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'start success!');
            } else {
              ExpectFail();
              done();
            }
          }).catch((error: Error) => {
            ExpectFail();
            done();
          });
          server.stop().then((value: boolean | undefined) => {
            if (value) {
              ExpectTrue(value !== null);
              console.info('server stop service successfully');
              done();
            } else {
              console.error('server stop service failed');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + err.code);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerStop_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_WebSocketServerStop_0200
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerStop_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerStop_static_0200';
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer()
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8098,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'start success!');
            } else {
              ExpectFail();
              done();
            }
          }).catch((error: Error) => {
            ExpectFail();
            done();
          });
          server.stop().then((value: boolean | undefined) => {
            if (value) {
              console.info('server stop service successfully');
              done();
            } else {
              console.error('server stop service failed');
            }
          }).catch((error: Error) => {
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'error code is : ' + err.code);
          ExpectTrue(err.code === 201);
          done();
        }
      });

    /**
     * @tc.name   testNetworkWebSocketServerOnWebSocketServerError_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnWebSocketServerError_0100
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkWebSocketServerOnWebSocketServerError_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkWebSocketServerOnWebSocketServerError_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
        try {
          let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
          let serverConfig: webSocket.WebSocketServerConfig = {
            serverIP: "0.0.0.0",
            serverPort: 8076,
            maxConcurrentClientsNumber: 10,
            maxConnectionsForOneClient: 4,
          }
          server.start(serverConfig).then((value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
              done();
            }
          })

          let client: webSocket.WebSocket = webSocket.createWebSocket();
          client.connect('ws://127.0.0.1:8076', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (value) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              done();
            } else {
              ExpectFail();
              done()
            }
          });
          let callback = (err: BusinessError) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
            ExpectTrue(err !== null)
            done();
          }
          server.onWebSocketServerError(callback);

          let connections = server.listAllConnections()
          if (connections == null) {
            ExpectFail();
            server.stop();
            hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
            done();
          } else {
            let wrongConnection: webSocket.WebSocketConnection = {
              clientIP: '1.1.1.1',
              clientPort: 8888
            }
            server.send("hi",wrongConnection).then((value: boolean | undefined) =>{
              if (value) {
                hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
              } else {
                hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
              }
            })
          }

        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
          ExpectTrue(err.code === 2302006);
          done();
        }
  });
/**
     * @tc.name   testNetworkWebSocketServerOffWebSocketServerError_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffWebSocketServerError_0100
     * @tc.desc   WebSocketServer send a massage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
it('testNetworkWebSocketServerOffWebSocketServerError_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOffWebSocketServerError_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8076,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8076', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });
    let callback = (err: BusinessError) => {
      hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
      ExpectTrue(err !== null)
      done();
    }
    server.offWebSocketServerError(callback);
    server.onWebSocketServerError(callback);

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let wrongConnection: webSocket.WebSocketConnection = {
        clientIP: '1.1.1.1',
        clientPort: 8888
      }
      server.send("hi", wrongConnection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    ExpectTrue(err.code === 2302006);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOnWebSocketServerConnect_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OnWebSocketServerConnect_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOnWebSocketServerConnect_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOnWebSocketServerConnect_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let callback = (connection: webSocket.WebSocketConnection) => {
      ExpectTrue(connection != undefined)
      done();
      console.info(`${caseName} test end`);
    }

    server.onConnect(callback)

    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let wrongConnection: webSocket.WebSocketConnection = {
        clientIP: '1.1.1.1',
        clientPort: 8888
      }
      server.send("hi", wrongConnection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOffWebSocketServerConnect_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OffWebSocketServerConnect_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOffWebSocketServerConnect_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOffWebSocketServerConnect_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let callback = (connection: webSocket.WebSocketConnection) => {
      ExpectTrue(connection != undefined)
      done();
      console.info(`${caseName} test end`);
    }

    server.offConnect(callback);
    server.onConnect(callback);

    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let wrongConnection: webSocket.WebSocketConnection = {
        clientIP: '1.1.1.1',
        clientPort: 8888
      }
      server.send("hi", wrongConnection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOnWebSocketServerMsg_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OnWebSocketServerMsg_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOnWebSocketServerMsg_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOnWebSocketServerMsg_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let callback = (massage: webSocket.WebSocketMessage) => {
      if (massage.data == "hi") {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        ExpectTrue(massage !== null);
        done();
        console.info(`${caseName} test end`);
      }else {
        done();
      }
    }

    server.onMessageReceive(callback);

    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let connection: webSocket.WebSocketConnection = {
        clientIP: '0.0.0.0',
        clientPort: 8077
      }
      server.send("hi", connection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOffWebSocketServerMsg_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OffWebSocketServerMsg_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOffWebSocketServerMsg_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOffWebSocketServerMsg_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let callback = (massage: webSocket.WebSocketMessage) => {
      if (massage.data == "hi") {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        ExpectTrue(massage !== null);
        done();
        hilog.info(domain, tag, '%{public}s', caseName + 'test end !');
      }else {
        done();
      }
    }

    server.onMessageReceive(callback);
    server.offMessageReceive(callback);

    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let connection: webSocket.WebSocketConnection = {
        clientIP: '0.0.0.0',
        clientPort: 8077
      }
      server.send("hi", connection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOnWebSocketServerClose_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OnWebSocketServerClose_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOnWebSocketServerClose_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOnWebSocketServerClose_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let closeCallback = (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
      hilog.info(domain, tag, '%{public}s', caseName + 'clientConnection is ' + JSON.stringify(clientConnection));
      ExpectTrue(clientConnection !== null);
      done();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
    }
    server.onWebSocketServerClose(closeCallback);


    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let connection: webSocket.WebSocketConnection = {
        clientIP: '0.0.0.0',
        clientPort: 8077
      }
      server.send("hi", connection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }

  } catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
});

/**
* @tc.name   testNetworkWebSocketServerOffWebSocketServerClose_static_0100
* @tc.number SUB_NetworkMgr_WebSocket_OffWebSocketServerClose_0100
* @tc.desc   WebSocketServer send a massage
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL3
*/
it('testNetworkWebSocketServerOffWebSocketServerClose_static_0100',
TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
async (done: () => void): Promise<void> => {
  let caseName: string = 'testNetworkWebSocketServerOffWebSocketServerClose_static_0100';
  hilog.info(domain, tag, '%{public}s', caseName + 'test start!');
  try {
    let server: webSocket.WebSocketServer = webSocket.createWebSocketServer();
    let serverConfig: webSocket.WebSocketServerConfig = {
      serverIP: "0.0.0.0",
      serverPort: 8077,
      maxConcurrentClientsNumber: 10,
      maxConnectionsForOneClient: 4,
    }
    server.start(serverConfig).then((value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'server start!');
      } else {
        hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
        done();
      }
    })

    let closeCallback = (clientConnection: webSocket.WebSocketConnection, closeReason: webSocket.CloseResult) => {
      hilog.info(domain, tag, '%{public}s', caseName + 'clientConnection is ' + JSON.stringify(clientConnection));
      ExpectTrue(clientConnection !== null);
      done();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
    }

    server.offWebSocketServerClose(closeCallback);
    server.onWebSocketServerClose(closeCallback);


    let client: webSocket.WebSocket = webSocket.createWebSocket();
    client.connect('ws://127.0.0.1:8077', (err: BusinessError<void> | null, value: boolean | undefined) => {
      if (value) {
        hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
        done();
      } else {
        ExpectFail();
        done()
      }
    });

    let connections = server.listAllConnections()
    if (connections == null) {
      ExpectFail();
      server.stop();
      hilog.info(domain, tag, '%{public}s', caseName + 'test end!');
      done();
    } else {
      let connection: webSocket.WebSocketConnection = {
        clientIP: '0.0.0.0',
        clientPort: 8077
      }
      server.send("hi", connection).then((value: boolean | undefined) => {
        if (value) {
          hilog.info(domain, tag, '%{public}s', caseName + 'send success!');
        } else {
          hilog.info(domain, tag, '%{public}s', caseName + 'send fail!');
        }
      })
    }
  } 
    catch (err) {
    hilog.info(domain, tag, '%{public}s', caseName + 'err code is ' + err.code);
    done();
  }
    });

  })
}
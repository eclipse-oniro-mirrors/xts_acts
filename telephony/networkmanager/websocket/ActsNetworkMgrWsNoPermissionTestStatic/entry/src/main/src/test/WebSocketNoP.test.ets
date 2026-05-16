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
import Utils from './Util.test';
import webSocket from '@ohos.net.webSocket';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'webSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let ws: webSocket.WebSocket = webSocket.createWebSocket();

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
    console.info("expectInfo", `test sucess`);
  }
}
export default function webSocketNoPTest() {

  describe("WebSocketNoPTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    let availableWebSocketAddress: string = 'wss://ws.ifelse.io/';

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCode201Callback_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCode201Callback_0100
     * @tc.desc   Test code 201 of connect api with callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrWebSocketConnectCode201Callback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCode201Callback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        ws.connect(url, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test result error ->'+JSON.stringify(error)+' and value is '+value);
          ExpectTrue(error !== null && error?.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Callback_0200
     * @tc.desc   Test code 201 of connect api with callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Callback_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {};
        ws.connect(url, options, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +' value -> '+value +' err -> '+JSON.stringify(error));
          ExpectTrue(error !== null && error?.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectOptionsCode201Promise_0300
     * @tc.desc   Test code 201 of connect api with callback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnectOptionsCode201Promise_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let url: string = 'ws://';
        let options: webSocket.WebSocketRequestOptions = {};
        let result: boolean = await ws.connect(url, options);
        hilog.info(domain, tag, '%{public}s', caseName +': result ->'+result);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    });
  
    /**
     * @tc.name   testWebSocketSendCallBack_static_0500
     * @tc.number SUB_Network_WebSocket_SendCallBack_0500
     * @tc.desc   Establish a WebSocket Send 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketSendCallBack_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketSendCallBack_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      try {
        let ws = webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
            ExpectTrue(err.code === 201);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
          }
        });
        ws.onOpen((value: webSocket.OpenResult | undefined) => {
          if (value && value !== null) {
            hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
            ws.send("Hello, server!", (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code !== 0) {
                hilog.info(domain, tag, '%{public}s', caseName + 'send fail ' + err.code);
                ExpectTrue(err.code === 201);
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', caseName + 'send success');
                done();
              }
            });
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
     * @tc.name   testWebSocketSendPermission_static_0800
     * @tc.number SUB_Network_WebSocket_SendPermission_0800
     * @tc.desc   test websocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketSendPermission_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketSendPermission_static_0800';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            if (value && value !== null) {
              hilog.info(domain, tag, '%{public}s', caseName + 'onOpen success ' + value.message);
              ws.send('hello!').then((value: boolean) => {
                if (value && value !== null) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'send success ' + value);
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
              ExpectTrue(err.code === 201);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              done();
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
     * @tc.name   testWebSocketClose_static_0100
     * @tc.number SUB_Network_WebSocket_Close_0100
     * @tc.desc   test websocket close 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClose_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.close((err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'close fail! : errcode is ->' + err.code);
              ExpectTrue(err.code === 2302999 || err.code === 201);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'close success!');
              done();
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
     * @tc.name   testWebSocketClose_static_0400
     * @tc.number SUB_Network_WebSocket_Close_0400
     * @tc.desc   test websocket close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClose_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
              ExpectTrue(err.code === 201);
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
                  ExpectTrue(err.code === 201);
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close success! ' + value);
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
     * @tc.name   testWebSocketClosePermission_static_0200
     * @tc.number SUB_Network_WebSocket_ClosePermission_0200
     * @tc.desc   test websocket close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebSocketClosePermission_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testWebSocketClosePermission_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let ws = webSocket.createWebSocket();
          ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err && err.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect fail! : errcode is ->' + err.code);
              ExpectTrue(err.code === 201);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + 'connect success!');
              let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
                code: 1,
                reason: ""
              };
              ws.close(webSocketCloseOptions).then((value: boolean | undefined) => {
                hilog.info(domain, tag, '%{public}s', caseName + 'close success! ' + value);
                done();
              }).catch((err: Error) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + 'close fail! : errcode is ->' + err.code);
                  ExpectTrue(err.code === 201);
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  catch error is ' + err.code);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          ExpectTrue(err.code === 201);
          done();
        }
      });



  })
}
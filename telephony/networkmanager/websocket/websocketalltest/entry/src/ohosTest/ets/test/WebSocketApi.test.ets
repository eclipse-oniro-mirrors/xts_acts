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

import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import getWebsite from './utils/WsWebsite';
import { JSON } from '@kit.ArkTS';

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

let options: webSocket.WebSocketRequestOptions = {
  header: {
    'Content-Type': 'application/json'
  }
};

class OutValue {
  status: number = 0
  message: string = ""
}

let sendLongMessage: string = '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'

let ws: webSocket.WebSocket;
let availableWebSocketAddress: string ;

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function WebSocketApiTest() {
  describe('webSocketApiTest', () => {
  
    beforeAll(async (done: Function)=>{
      console.log("beforeAll start");
      availableWebSocketAddress = await getWebsite();
      console.log("current url is "+ availableWebSocketAddress)
      done()
      console.log("beforeAll end ")
    })

  
    beforeEach(async (done: Function) => {
      ws = webSocket.createWebSocket();
      await sleep(1000);
      done();
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address(url is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrWebSocketConnectCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0100';
      console.info(`${caseName} test start`);
      try {
        ws.connect(null, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === 401);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0200
     * @tc.desc   Establish a WebSocket connection based on the URL address(url is '')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.connect('', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === 2302001); // {"code":2302001,"message":"Websocket url error"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0300
     * @tc.desc   Establish a WebSocket connection based on the URL address(url is 'hello')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0300';
      console.info(`${caseName} test start`);
      try {
        ws.connect('hello', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === 2302001); // {"code":2302001,"message":"Websocket url error"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0400
     * @tc.desc   Establish a WebSocket connection based on the URL address(url is 'ws://')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0400';
      console.info(`${caseName} test start`);
      try {
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0500
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0500
     * @tc.desc   Establish a WebSocket connection based on the URL address(url is availableWebSocketAddress)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrWebSocketConnectCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0500';
      console.info(`${caseName} test start`);
      try {
        let url: string = availableWebSocketAddress;
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        })
        ws.connect(url, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0600
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0600
     * @tc.desc   Establish a WebSocket connection based on the URL address(connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0600';
      console.info(`${caseName} test start`);
      try {
        let url: string = availableWebSocketAddress;
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        })
        ws.connect(url, (error: BusinessError, value: boolean) => { // first
          console.info(`${caseName} test fisrt result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error === undefined && value);
          ws.connect(url, (error: BusinessError, value: boolean) => { // second
            console.info(`${caseName} test second result error ${JSON.stringify(error)} and value is ${value}`);
            expectTrue(error !== undefined && error.code === 2302003); // {"code":2302003,"message":"Websocket connection exist"}
            done();
            console.info(`${caseName} test end`);
          });
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0700
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0700
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(null url,correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0700';
      console.info(`${caseName} test start`);
      try {
        ws.connect(null, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,401);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0800
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0800
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is '',correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0800';
      console.info(`${caseName} test start`);
      try {
        ws.connect('', options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,2302001);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback0900
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_0900
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is '123',correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback0900';
      console.info(`${caseName} test start`);
      try {
        ws.connect('123', options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,2302001);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1000
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1000
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is 'ws://',correct options,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1000';
      console.info(`${caseName} test start`);
      try {
        ws.connect('ws://', options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,-1);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1100
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is null,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1100';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        })
        ws.connect(availableWebSocketAddress, null, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,401);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1200
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1200
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrWebSocketConnectCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1200';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, {}, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1300
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1300
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,wrong options,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1300';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, { header: {'Content-Type': 30} }, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1400
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1400
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(null url,null options,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1400';
      console.info(`${caseName} test start`);
      try {
        ws.connect(null, null, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,401);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1500
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1500
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,correct options,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1500';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        })
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectCallback1600
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectCallback_1600
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectCallback1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectCallback1600';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect1 fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect1 fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect1 success and value is ${value}`);
            ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
              if (err) {
                console.info(`${caseName} test connect2 fail ${JSON.stringify(err)}`);
                expectEqual(err.code,2302003);
                done();
                console.info(`${caseName} test end`);
              } else {
                console.info(`${caseName} test connect2 success and value is ${value}`);
                expectFail(`${caseName} test connect2 success`);
                done();
                console.info(`${caseName} test end`);
              }
            })
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0100
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0100
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(null url,correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0100';
      console.info(`${caseName} test start`);
      try {
        ws.connect(null,options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code,401);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0200
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0200
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is '',correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0200';
      console.info(`${caseName} test start`);
      try {
        ws.connect('',options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code,2302001);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0300
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0300
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is '123',correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0300';
      console.info(`${caseName} test start`);
      try {
        ws.connect('123',options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code,2302001);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0400
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0400
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(url is 'ws://',correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0400';
      console.info(`${caseName} test start`);
      try {
        ws.connect('ws://',options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code,-1);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0500
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0500
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrWebSocketConnectPromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0500';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value == true);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0600
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0600
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,options is empty)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0600';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress,{}).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value == true);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0700
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0700
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,wrong options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0700';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress,{ header: {'Content-Type': 30} }).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value == true);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0800
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0800
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(null url,null options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0800';
      console.info(`${caseName} test start`);
      try {
        ws.connect(null).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectFail(`${caseName} test connect success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectEqual(err.code,401);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise0900
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_0900
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(correct url,correct options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrWebSocketConnectPromise0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise0900';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress,options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          expectTrue(value == true);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketConnectPromise1000
     * @tc.number SUB_NetworkMgr_WebSocket_ConnectPromise_1000
     * @tc.desc   Establish a WebSocket connection based on the URL address and header(Connect twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketConnectPromise1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketConnectPromise1000';
      console.info(`${caseName} test start`);
      try {
        ws.connect(availableWebSocketAddress,options).then((value: boolean) => {
          console.info(`${caseName} test connect success and value is ${value}`);
          ws.connect(availableWebSocketAddress,options).then((value: boolean) => {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectFail(`${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectEqual(err.code,2302003);
            done();
            console.info(`${caseName} test end`);
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail(`${caseName} test connect fail`);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0100
     * @tc.desc   Sending data through WebSocket connection(data is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(null, (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectEqual(err.code,401);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectFail(`${caseName} send success`);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0200
     * @tc.desc   Sending data through WebSocket connection(data is '')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0300
     * @tc.desc   Sending data through WebSocket connection(data is string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0400
     * @tc.desc   Sending data through WebSocket connection(data is ArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        let sendMessage: ArrayBuffer = new ArrayBuffer(96);
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage, (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0500
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0500
     * @tc.desc   Sending data through WebSocket connection(data is Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0500';
      console.info(`${caseName} test start`);
      try {
        let sendMessage: Int8Array = new Int8Array(0);
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage, (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectEqual(err.code,401);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectFail(`${caseName} send success`);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0600
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0600
     * @tc.desc   Sending data through WebSocket connection(no connect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0600';
      console.info(`${caseName} test start`);
      try {
        ws.send('Hello', (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectEqual(err.code,-1);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} send success and value is ${value}`);
            expectFail(`${caseName} send success`);
            done();
            console.info(`${caseName} test end`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0700
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0700
     * @tc.desc   Sending data through WebSocket connection(send twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0700';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send1 fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send1 fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send1 success and value is ${value}`);
              ws.send('Hello', (err: BusinessError, value: boolean) => {
                if (err) {
                  console.info(`${caseName} send2 fail ${JSON.stringify(err)}`);
                  expectFail(`${caseName} send2 fail`);
                  done();
                  console.info(`${caseName} test end`);
                } else {
                  console.info(`${caseName} send2 success and value is ${value}`);
                  expectTrue(value == true);
                  done();
                  console.info(`${caseName} test end`);
                }
              })
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0800
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0800
     * @tc.desc   Sending data through WebSocket connection(send long message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0800';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendLongMessage, (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendCallback0900
     * @tc.number SUB_NetworkMgr_WebSocket_SendCallback_0900
     * @tc.desc   Sending data through WebScoket connection(data is ArrayBuffer(0))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback0900';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        let sendMessage: ArrayBuffer = new ArrayBuffer(0);
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage, (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0100
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0100
     * @tc.desc   Sending data through WebSocket connection(data is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(null).then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectFail(`${caseName} send success`);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectEqual(err.code,401);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0200
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0200
     * @tc.desc   Sending data through WebSocket connection(data is '')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('').then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0300
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0300
     * @tc.desc   Sending data through WebSocket connection(data is string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello').then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0400
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0400
     * @tc.desc   Sending data through WebSocket connection(data is ArrayBuffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0400';
      console.info(`${caseName} test start`);
      try {
        let sendMessage: ArrayBuffer = new ArrayBuffer(96);
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage).then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0500
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0500
     * @tc.desc   Sending data through WebSocket connection(data is Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0500';
      console.info(`${caseName} test start`);
      try {
        let sendMessage: Int8Array = new Int8Array(0);
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage).then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectFail(`${caseName} send success`);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectEqual(err.code,401);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0600
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0600
     * @tc.desc   Sending data through WebSocket connection(no connect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0600';
      console.info(`${caseName} test start`);
      try {
        ws.send('Hello').then((value: boolean) => {
          console.info(`${caseName} send success and value is ${value}`);
          expectFail(`${caseName} send success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} send fail ${JSON.stringify(err)}`);
          expectEqual(err.code,-1);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0700
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0700
     * @tc.desc   Sending data through WebSocket connection(send twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0700';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello').then((value: boolean) => {
            console.info(`${caseName} send1 success and value is ${value}`);
            ws.send('Hello').then((value: boolean) => {
              console.info(`${caseName} send2 success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }).catch((err: BusinessError) => {
              console.info(`${caseName} send2 fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send2 fail`);
              done();
              console.info(`${caseName} test end`);
            })
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send1 fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send1 fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0800
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0800
     * @tc.desc   Sending data through WebSocket connection(send long message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0800';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendLongMessage).then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSendPromise0900
     * @tc.number SUB_NetworkMgr_WebSocket_SendPromise_0900
     * @tc.desc   Sending data through WebSocket connection(data is ArrayBuffer(0))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSendPromise0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise0900';
      console.info(`${caseName} test start`);
      try {
        let sendMessage: ArrayBuffer = new ArrayBuffer(0);
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send(sendMessage).then((value: boolean) => {
            console.info(`${caseName} send success and value is ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0100
     * @tc.desc   Close WebSocket connection(normal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0200
     * @tc.desc   Close WebSocket connection(close twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close1 fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close1 fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close1 success and value is ${value}`);
              setTimeout(() => {
                  ws.close((err: BusinessError,value: boolean) => {
                    if (err) {
                      console.info(`${caseName} close2 fail ${JSON.stringify(err)}`);
                      expect(err.code == 2302999).assertTrue();
                      done();
                      console.info(`${caseName} test end`);
                    } else {
                      console.info(`${caseName} close2 success and value is ${value}`);
                      expectFail(`${caseName} close2 success`);
                      done();
                      console.info(`${caseName} test end`);
                    }
                  })              
              },2000)
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0300
     * @tc.desc   Close WebSocket connection(No connection established)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0300';
      console.info(`${caseName} test start`);
      try {
        ws.close((err: BusinessError,value: boolean) => {
          if (err) {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectEqual(err.code,2302999);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} close success and value is ${value}`);
            expectFail(`${caseName} close success`);
            done();
            console.info(`${caseName} test end`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0400
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(options is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close(null, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectEqual(err.code,401);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectFail(`${caseName} close success`);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0500
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0500
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(options is {})
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0500';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0600
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0600
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:-100,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0600';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: -100,reason: 'error'}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0700
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0700
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:0,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0700';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 0,reason: 'error'}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0800
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0800
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:100,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0800';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 100,reason: 'error'}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback0900
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_0900
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:-100,reason:null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback0900';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: -100,reason: null}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback1000
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_1000
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:100,reason:null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback1000';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 100,reason: null}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback1100
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_1100
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:1000,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback1100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 1000, reason: 'error'}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success ${value}`);
              expectTrue(value == true);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketCloseCallback1200
     * @tc.number SUB_NetworkMgr_WebSocket_CloseCallback_1200
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(No connection established)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseCallback1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback1200';
      console.info(`${caseName} test start`);
      try {
        ws.close({code: 1000, reason: 'error'}, (err: BusinessError,value: boolean) => {
          if (err) {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectEqual(err.code,2302999);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} close success ${value}`);
            expectFail(`${caseName} close success`);
            done();
            console.info(`${caseName} test end`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0100
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0100
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(options is {})
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({}).then((value: boolean) => {
            console.info(`${caseName} close success ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0200
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0200
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:-100,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: -100,reason: 'error'}).then((value: boolean) => {
            console.info(`${caseName} close success ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0300
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0300
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:0,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 0,reason: 'error'}).then((value: boolean) => {
            console.info(`${caseName} close success ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0400
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0400
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:100,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 100,reason: 'error'}).then((value: boolean) => {
            console.info(`${caseName} close success ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0500
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0500
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(code:1000,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0500';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 1000,reason: 'error'}).then((value: boolean) => {
            console.info(`${caseName} close success ${value}`);
            expectTrue(value == true);
            done();
            console.info(`${caseName} test end`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            console.info(`${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketClosePromise0600
     * @tc.number SUB_NetworkMgr_WebSocket_ClosePromise_0600
     * @tc.desc   Close WebSocket connection based on optional parameters code and reason(No connection established,code:1000,reason:'error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketClosePromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise0600';
      console.info(`${caseName} test start`);
      try {
        ws.close({code: 1000,reason: 'error'}).then((value: boolean) => {
          console.info(`${caseName} close success ${value}`);
          expectFail(`${caseName} close success`);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} close fail ${JSON.stringify(err)}`);
          expectEqual(err.code,2302999)
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOpenCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnOpenCallback_0100
     * @tc.desc   Subscription to WebSocket Open Event(connect-->open)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOpenCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value == true);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOpenCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnOpenCallback_0200
     * @tc.desc   Subscription to WebSocket Open Event(connect-->close-->open)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOpenCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen1 err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value == true);
              ws.on('open', (err: BusinessError, value: Object) => {
                console.info(`${caseName} onopen2 err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
                done();
              });
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOpenCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OnOpenCallback_0300
     * @tc.desc   Subscription to WebSocket Open Event(open)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOpenCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback0300';
      console.info(`${caseName} test start`);
      try {
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOpenCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OnOpenCallback_0400
     * @tc.desc   Subscription to WebSocket Open Event(on_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOpenCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on(null, (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        })
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffOpenCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffOpenCallback_0100
     * @tc.desc   Unsubscribe from WebSocket's open event(off_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffOpenCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.off(null);
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffOpenCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffOpenCallback_0200
     * @tc.desc   Unsubscribe from WebSocket's open event(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffOpenCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.off('open');
        ws.off('open');
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffOpenCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffOpenCallback_0300
     * @tc.desc   Unsubscribe from WebSocket's open event(off-->open-->connect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffOpenCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.off('open');
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffOpenCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OffOpenCallback_0400
     * @tc.desc   Unsubscribe from WebSocket's open event(open-->off-->connect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffOpenCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.off('open');
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          done();
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnMessageCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnMessageCallback_0100
     * @tc.desc   Subscription to WebSocket receiving server message events(on_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnMessageCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnMessageCallback0100';
      console.info(`${caseName} test start`);
      try {
        ws.on(null, (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          done();
        });
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnMessageCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnMessageCallback_0200
     * @tc.desc   Subscription to WebSocket receiving server message events(message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnMessageCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnMessageCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnMessageCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OnMessageCallback_0300
     * @tc.desc   Subscription to WebSocket receiving server message events(send-->message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnMessageCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnMessageCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffMessageCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffMessageCallback_0100
     * @tc.desc   Unsubscribe from WebSocket receiving server message events(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffMessageCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.off('message');
        ws.off('message');
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffMessageCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffMessageCallback_0200
     * @tc.desc   Unsubscribe from WebSocket receiving server message events(off--on--send)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffMessageCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.off('message');
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffMessageCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffMessageCallback_0300
     * @tc.desc   Unsubscribe from WebSocket receiving server message events(on--off--send)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffMessageCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.off('message');
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnCloseCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnCloseCallback_0100
     * @tc.desc   Subscription to WebSocket shutdown event(on_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnCloseCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on(null, (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnCloseCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnCloseCallback_0200
     * @tc.desc   Subscription to WebSocket shutdown event(close)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnCloseCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnCloseCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OnCloseCallback_0300
     * @tc.desc   Subscription to WebSocket shutdown event(connect-->close-->on)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnCloseCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expectEqual(value.code,1000);
          done();
        })
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnCloseCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OnCloseCallback_0400
     * @tc.desc   Subscription to WebSocket shutdown event(connect-->close-->on,options,callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnCloseCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expectEqual(value.code,1000);
          done();
        })
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close({code: 1000,reason: ''}, (err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffCloseCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffCloseCallback_0100
     * @tc.desc   Unsubscribe from WebSocket's shutdown event(off_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffCloseCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        ws.off(null);
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffCloseCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffCloseCallback_0200
     * @tc.desc   Unsubscribe from WebSocket's shutdown event(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffCloseCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        ws.off('close');
        ws.off('close');
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffCloseCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffCloseCallback_0300
     * @tc.desc   Unsubscribe from WebSocket's shutdown event(off--on--close)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffCloseCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.off('close');
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expectEqual(value.code,1000);
          done();
        });
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffCloseCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OffCloseCallback_0400
     * @tc.desc   Unsubscribe from WebSocket's shutdown event(on--off--close)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffCloseCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
          console.info(`${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expectEqual(value.code,1000);
          done();
        });
        ws.off('close');
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.close((err: BusinessError,value: boolean) => {
            if (err) {
              console.info(`${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} close success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnErrorCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnErrorCallback_0100
     * @tc.desc   Subscription to WebSocket's Error Event(on_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnErrorCallback0100';
      console.info(`${caseName} test start`);
      try {
        ws.on(null, (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnErrorCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnErrorCallback_0200
     * @tc.desc   Subscription to WebSocket's Error Event(connect_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnErrorCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnErrorCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          expectEqual(err.code,200);
          done();
        });
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffErrorCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffErrorCallback_0100
     * @tc.desc   Unsubscribe from WebSocket's Error event(off_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback0100';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.off(null);
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffErrorCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffErrorCallback_0200
     * @tc.desc   Unsubscribe from WebSocket's Error event(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffErrorCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback0200';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.off('error');
        ws.off('error');
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffErrorCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffErrorCallback_0300
     * @tc.desc   Unsubscribe from WebSocket's Error event(off--on--connect_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffErrorCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback0300';
      console.info(`${caseName} test start`);
      try {
        ws.off('error');
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          expectEqual(err.code,200);
          done();
        });
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffErrorCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OffErrorCallback_0400
     * @tc.desc   Unsubscribe from WebSocket's Error event(on--off--connect_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffErrorCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback0400';
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.off('error');
        ws.connect('ws://', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnDataEndCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnDataEndCallback_0100
     * @tc.desc   Subscription to WebSocket data receiving end event(on_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnDataEndCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnDataEndCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on(null, () => {
          console.info(`${caseName} ondataEnd success`);
          done();
        })
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnDataEndCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnDataEndCallback_0200
     * @tc.desc   Subscription to WebSocket data receiving end event(onDataEnd)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnDataEndCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnDataEndCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('dataEnd', () => {
          console.info(`${caseName} ondataEnd success`);
          
        })
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffDataEndCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffDataEndCallback_0100
     * @tc.desc   Unsubscribe from WebSocket data receiving end event(off_null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffDataEndCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('dataEnd', () => {
          console.info(`${caseName} ondataEnd success`);
          
        });
        ws.off(null);
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectTrue(err.code == 401);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffDataEndCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffDataEndCallback_0200
     * @tc.desc   Unsubscribe from WebSocket data receiving end event(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffDataEndCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('dataEnd', () => {
          console.info(`${caseName} ondataEnd success`);
          
        });
        ws.off('dataEnd');
        ws.off('dataEnd');
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffDataEndCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffDataEndCallback_0300
     * @tc.desc   Unsubscribe from WebSocket data receiving end event(off--on)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffDataEndCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.off('dataEnd');
        ws.on('dataEnd', () => {
          console.info(`${caseName} ondataEnd success`);
          
        });
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffDataEndCallback0400
     * @tc.number SUB_NetworkMgr_WebSocket_OffDataEndCallback_0400
     * @tc.desc   Unsubscribe from WebSocket data receiving end event(on--off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffDataEndCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback0400';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('dataEnd', () => {
          console.info(`${caseName} ondataEnd success`);
          
        });
        ws.off('dataEnd');
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
        
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          ws.send('Hello', (err: BusinessError, value: boolean) => {
            if (err) {
              console.info(`${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              console.info(`${caseName} test end`);
            } else {
              console.info(`${caseName} send success and value is ${value}`);
              expectTrue(value);
              done();
              console.info(`${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnHeaderReceiveCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnHeaderReceiveCallback_0100
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on_HeaderReceive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnHeaderReceiveCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnHeaderReceiveCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive" + ${JSON.stringify(data)}`);
          expectTrue(data != null);
          done();
        })
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffHeaderReceiveCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0100
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(off twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffHeaderReceiveCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback0100';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive" + ${JSON.stringify(data)}`);
          expectTrue(data != null);
          done();
        });
        ws.off('headerReceive');
        ws.off('headerReceive');
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffHeaderReceiveCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0200
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(off-->on)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffHeaderReceiveCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback0200';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.off('headerReceive');
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive" + ${JSON.stringify(data)}`);
          expectTrue(data != null);
          done();
        });
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOffHeaderReceiveCallback0300
     * @tc.number SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0300
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOffHeaderReceiveCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback0300';
      console.info(`${caseName} test start`);
      try {
        class OutValue {
          status: number = 0
          message: string = ""
        }
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.on('headerReceive', (data) => {
          console.info(`${caseName} on headerReceive" + ${JSON.stringify(data)}`);
          expectTrue(data != null);
          done();
        });
        ws.off('headerReceive');
        ws.on('open', (err: BusinessError, value: Object) => {
          console.info(`${caseName} onopen err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          const status: number = (value as OutValue).status;
          expectEqual(status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value);
          console.info(`${caseName} test end`);
        })
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOffCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_OnOffCallback_0100
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOffCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOffCallback0100';
      let isOnEvent = 0;
      console.info(`${caseName} test start`);
      try {
        ws.on('error', (err: BusinessError) => {
          console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
        });
        let onOpenCallback01 = (err: BusinessError, data: Object) => {
          console.info(`${caseName} onOpenCallback01 data is: `+ JSON.stringify(data));
          expectFail()
          console.info(`${caseName}---end`);
        }
        let onOpenCallback02 = (err: BusinessError, data: Object) => {
          isOnEvent+=1;
          console.info(`${caseName} onOpenCallback01 data is: `+ JSON.stringify(data));
          const status: number = (data as OutValue).status;
          expectTrue(status == 101);
          ws.send('haha', (err: BusinessError, value: boolean) => {
            if (err) {
              console.error(`${caseName} get err is `+JSON.stringify(err));
              expectFail();
              done();
              console.info(`${caseName}---end`);
            }else{
              console.info(`${caseName} send success and calue is: `+value)
            }
          })
        }
        let onMessageCallback01 = (err: BusinessError, value: string | ArrayBuffer) => {
          console.info(`${caseName} onMessageCallback01 err is ${JSON.stringify(err)} and value is ${value}`);
          expectFail();
          console.info(`${caseName}---end`);
          done();
        }
        let onMessageCallback02 = (err: BusinessError, value: string | ArrayBuffer) => {
          isOnEvent+=1;
          console.info(`${caseName} onMessageCallback02 err is ${JSON.stringify(err)} and value is ${value}`);
        }
        let onHeaderReceiveCallback01 = (data: object) => {
          console.info(`${caseName} onHeaderReceiveCallback01 `+JSON.stringify(data));
          expectFail()
          console.info(`${caseName}---end`);
          done();
        }
        let onHeaderReceiveCallback02 = (data: object) => {
          isOnEvent += 1;
          console.info(`${caseName} onHeaderReceiveCallback02 `+JSON.stringify(data));
        }
        let onDataEndCallback01 = () => {
          console.info(`${caseName} onDataEndCallback01 dataEnd `);
          expectFail();
          console.info(`${caseName}---end`);
          done();
        }
        let onDataEndCallback02 = () => {
          isOnEvent +=1;
          console.info(`${caseName} onDataEndCallback02 dataEnd `);
          ws.close()
        }
        let onCloseCallback01 = (err: BusinessError, data: webSocket.CloseResult) => {
          console.info(`${caseName} onCloseCallback01 close ,closeResult is `+JSON.stringify(data));
          expectFail();
          console.info(`${caseName}---end`);
          done();
        }
        let onCloseCallback02 = (err: BusinessError, data: webSocket.CloseResult) => {
          isOnEvent += 1;
          console.info(`${caseName} onCloseCallback02 close ,closeResult is `+JSON.stringify(data));
          console.info(`${caseName}  isOnEvent is `+ isOnEvent);
          expectTrue(isOnEvent >=5);
          console.info(`${caseName}---end`);
          done();
        }
        ws.on('open', onOpenCallback01);
        ws.on('open', onOpenCallback02);
        ws.off('open', onOpenCallback01);
        ws.on('message', onMessageCallback01);
        ws.on('message', onMessageCallback02);
        ws.off('message', onMessageCallback01);
        ws.on('dataEnd', onDataEndCallback01);
        ws.on('dataEnd', onDataEndCallback02);
        ws.off('dataEnd', onDataEndCallback01);
        ws.on('headerReceive', onHeaderReceiveCallback01);
        ws.on('headerReceive', onHeaderReceiveCallback02);
        ws.off('headerReceive', onHeaderReceiveCallback01);
        ws.on('close', onCloseCallback01);
        ws.on('close', onCloseCallback02);
        ws.off('close', onCloseCallback01);
        ws.connect(availableWebSocketAddress, (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
        })
      } catch (err) {
        console.info(`${caseName} catch Error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketOnOffCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_OnOffCallback_0200
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketOnOffCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketOnOffCallback0200';
      console.info(`${caseName} test start`);
      try {
        let onErrorCallback01 = (err: BusinessError) => {
          console.info(`${caseName} onErrorCallback01 get err is `+JSON.stringify(err))
          expectFail();
          done();
          console.info(`${caseName}---end`);
        }
        let onErrorCallback02 = (err: BusinessError) => {
          console.info(`${caseName} onErrorCallback02 get err is `+JSON.stringify(err))
          expectTrue(true)
          done();
          console.info(`${caseName}---end`);
        }
        ws.on('error', onErrorCallback01);
        ws.on('error', onErrorCallback02);
        ws.off('error', onErrorCallback01);
        ws.connect('ws://124.222.6.66:12423', (error: BusinessError, value: boolean) => {
          console.info(`${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
        })
      } catch (err) {
        console.info(`${caseName} catch Error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSkipServerCertVerify0100
     * @tc.number SUB_NetworkMgr_WebSocket_SkipServerCertVerify_0100
     * @tc.desc   Connect server with option of SkipServerCertVerify(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSkipServerCertVerify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSkipServerCertVerify0100';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          skipServerCertVerification: true,
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketSkipServerCertVerify0200
     * @tc.number SUB_NetworkMgr_WebSocket_SkipServerCertVerify_0200
     * @tc.desc   Connect server with option of SkipServerCertVerify(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSkipServerCertVerify0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketSkipServerCertVerify0200';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          skipServerCertVerification: false,
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test connect success`);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })

    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0100
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0100
     * @tc.desc   Connect server with option of pingInterval is not defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0100';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
  });

    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0200
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0200
     * @tc.desc   Connect server with option of pingInterval is 10000, pongTimeout is 5000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0200';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: 10000,
          pongTimeout: 5000
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
  });

    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0300
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0300
     * @tc.desc   Connect server with option of pingInterval is 5000, pongTimeout is 10000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0300';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: 5000,
          pongTimeout: 10000
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0400
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0400
     * @tc.desc   Connect server with option of pingInterval is 30001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0400';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: 30001
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0500
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0500
     * @tc.desc   Connect server with option of pingInterval is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0500';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: -1
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0600
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0600
     * @tc.desc   Connect server with option of pingInterval is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0600';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: 0
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


    /**
     * @tc.name   testNetworkMgrWebSocketPingInterval0700
     * @tc.number SUB_NetworkMgr_WebSocket_PingInterval_0700
     * @tc.desc   Connect server with option of pingInterval is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketPingInterval0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketPingInterval0700';
      console.info(`${caseName} test start`);
      try {
        let option: webSocket.WebSocketRequestOptions = {
          pingInterval: undefined
        }
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, option, (err:BusinessError, value: boolean) => {
          if(err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
          } else {
            console.info(`${caseName} test connect success and value is ${value}`);
            expectTrue(true, `${caseName} test success`);
            done();
            console.info(`${caseName} test end`);
          };
        });
      } catch (err) {
        console.info(`${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail, errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    })
  });
}
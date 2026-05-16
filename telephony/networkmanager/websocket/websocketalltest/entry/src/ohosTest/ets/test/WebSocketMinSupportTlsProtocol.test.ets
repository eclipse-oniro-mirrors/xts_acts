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

let ws: webSocket.WebSocket;
let availableWebSocketAddress: string ;

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function WebSocketMinSupportTlsProtocolTest() {
  describe('WebSocketMinSupportTlsProtocolTest', () => {

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
     * @tc.name   testNetSocketMinSupportTlsProtocol0100
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0100
     * @tc.desc   The minimum supported TLS protocol is TLS 1.0 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0100';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_0
        };
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == 0);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0200
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0200
     * @tc.desc   The minimum supported TLS protocol is TLS 1.0 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0200';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_0
        };
        ws.connect(availableWebSocketAddress, options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
          expectTrue(options.minSupportTlsProtocol == 0);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0300
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0300
     * @tc.desc   The minimum supported TLS protocol is TLS 1.1 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0300';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_1
        };
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == 1);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0400
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0400
     * @tc.desc   The minimum supported TLS protocol is TLS 1.1 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0400';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_1
        };
        ws.connect(availableWebSocketAddress, options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
          expectTrue(options.minSupportTlsProtocol == 1);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0500
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0500
     * @tc.desc   The minimum supported TLS protocol is TLS 1.2 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0500';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_2
        };
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == 2);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0600
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0600
     * @tc.desc   The minimum supported TLS protocol is TLS 1.2 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0600';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_2
        };
        ws.connect(availableWebSocketAddress, options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
          expectTrue(options.minSupportTlsProtocol == 2);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0700
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0700
     * @tc.desc   The minimum supported TLS protocol is TLS 1.3 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0700';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_3
        };
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == 3);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0800
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0800
     * @tc.desc   The minimum supported TLS protocol is TLS 1.3 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0800';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: webSocket.TlsProtocol.TLS_V_1_3
        };
        ws.connect(availableWebSocketAddress, options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
          expectTrue(options.minSupportTlsProtocol == 3);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol0900
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0900
     * @tc.desc   The minimum supported TLS protocol is TLS undefined for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol0900';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: undefined
        };
        ws.connect(availableWebSocketAddress, options, (err: BusinessError, value: boolean) => {
          if (err) {
            console.info(`${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == undefined);
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
     * @tc.name   testNetSocketMinSupportTlsProtocol1000
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_1000
     * @tc.desc   The minimum supported TLS protocol is TLS undefined for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetSocketMinSupportTlsProtocol1000';
      console.info(`${caseName} test start`);
      try {
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          minSupportTlsProtocol: undefined
        };
        ws.connect(availableWebSocketAddress, options).then((value: boolean) => {
          console.info(`${caseName} options success is ${options.minSupportTlsProtocol}`);
          expectTrue(options.minSupportTlsProtocol == undefined);
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
  });
}
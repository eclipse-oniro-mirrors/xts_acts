/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, Level, TestType, Size,beforeEach } from '../../../hypium';
import { AsyncCallback, BusinessError, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';
import webSocket from '@ohos.net.webSocket';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = ' WebsocketTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let PERMISSION_DENIED_CODE:number =201;
let PARAMETER_ERROR_CODE:number =401;
let url1 = 'wss://192.168.1.111:5555/string';
let url_ERROR = '192.168.1.111';
let availableWebSocketAddress: string = 'wss://whale.tooly.top/ws';

let header:Record<string,string> = {
  "Content-Type": "application/json"
}
const ws1 : webSocket.WebSocket = webSocket.createWebSocket();

let webSocketRequestOptions_caPath1:webSocket.WebSocketRequestOptions = {
  header: header,
  caPath: '/etc/ssl/certs/ca.crt'
};

let webSocketRequestOptions_caPath2:webSocket.WebSocketRequestOptions = {
  header: header,
  caPath: ''
}

let WebSocketRequestOptions_clientCert1:webSocket.WebSocketRequestOptions =  {
  header: header,
  caPath: '/etc/ssl/certs/ca.crt',
  clientCert: {
    certPath: '/etc/ssl/certs/client.crt',
    keyPath: '/etc/ssl/certs/client_test1234.key',
    keyPassword: 'test1234'
  }
}

let WebSocketRequestOptions_clientCert2 :webSocket.WebSocketRequestOptions = {
  header: header,
  caPath: '',
  clientCert: {
    certPath: '',
    keyPath: '',
    keyPassword: ''
  }
}

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function expectTrue(exp: boolean | undefined, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean | int | undefined,
  assert: string | number | boolean | int, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    err = err as BusinessError;
    console.info("expectInfo", `test failed`);
  }
}

export default function NetworkManagerWebsocketTestStatic() {
  describe('NetworkManagerWebsocketTestStatic', () => {

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0100
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0100
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.connect(url1, webSocketRequestOptions_caPath1, (error: BusinessError<void> | null, data: boolean | undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${data}`);
          if (error?.code) {
            hilog.info(domain, tag, `${caseName} connect failed, err ${JSON.stringify(error)}`);
            expectEqual(error?.code, 2302002);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        hilog.error(domain, tag, `${caseName} test end`);
      }
    })

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0200
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0200
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0200";
      const ws : webSocket.WebSocket = webSocket.createWebSocket();
      ws.connect(url1, WebSocketRequestOptions_clientCert1, (err: BusinessError<void> | null, data: boolean | undefined) => {
        if (err?.code) {
          hilog.error(domain, tag, `${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err?.code == 2302002).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0300
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0300
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0300";
      hilog.info(domain, tag, `${caseName} test start`);
      const ws : webSocket.WebSocket = webSocket.createWebSocket();
      ws.connect(url_ERROR, webSocketRequestOptions_caPath2, (err: BusinessError<void> | null, data: boolean | undefined) => {
        hilog.info(domain, tag, `${caseName} test result: ${JSON.stringify(err)} and code is ${err?.code}`);
        if (err?.code) {
          hilog.info(domain, tag, `${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err?.code == 2302001).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0400
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0400
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0400";
      const ws : webSocket.WebSocket = webSocket.createWebSocket();
      ws.connect(url_ERROR, WebSocketRequestOptions_clientCert2, (err: BusinessError<void> | null, data: boolean | undefined) => {
        if (err?.code) {
          hilog.info(domain, tag, `${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err?.code == 2302001).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0500
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0500
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0500";
      const ws : webSocket.WebSocket = webSocket.createWebSocket();
      ws1.connect(url1, webSocketRequestOptions_caPath2, (err: BusinessError<void> | null, data: boolean | undefined) => {
        if (err?.code) {
          hilog.info(domain, tag, `${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        } else {
          hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect(data == true).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.number  SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0600
     * @tc.name    testTelephonyNetstackWebSocketCertVerifyXts_static_0600
     * @tc.desc    Test connect property
     * @tc.level   3
     * @tc.type    Function
     * @tc.size    SmallTest
     */
    it("testTelephonyNetstackWebSocketCertVerifyXts_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = "testTelephonyNetstackWebSocketCertVerifyXts_static_0600";
      ws1.connect(url1, WebSocketRequestOptions_clientCert2, (err: BusinessError<void> | null, data: boolean | undefined) => {
        if (err?.code) {
          hilog.info(domain, tag, `${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err?.code == 2302003).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, `${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
    })
  })
}
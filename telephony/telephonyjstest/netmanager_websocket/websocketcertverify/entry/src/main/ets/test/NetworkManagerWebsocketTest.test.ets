/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, afterAll, beforeAll } from '@ohos/hypium';
import WebSocket from '@ohos.net.webSocket';

let webSocket = WebSocket.createWebSocket();
let url1 = 'wss://192.168.1.111:5555/string';
let url_ERROR = '192.168.1.111';

let webSocketRequestOptions_caPath1 = {
  header: { 'Content-Type': 'application/json' },
  caPath: '/etc/ssl/certs/ca.crt'
}

let webSocketRequestOptions_caPath2 = {
  header: { 'Content-Type': 'application/json' },
  caPath: ''
}

let WebSocketRequestOptions_clientCert1 = {
  header: { 'Content-Type': 'application/json' },
  caPath: '/etc/ssl/certs/ca.crt',
  clientCert: {
    certPath: '/etc/ssl/certs/client.crt',
    keyPath: '/etc/ssl/certs/client_test1234.key',
    keyPassword: 'test1234'
  }
}

let WebSocketRequestOptions_clientCert2 = {
  header: { 'Content-Type': 'application/json' },
  caPath: '',
  clientCert: {
    certPath: '',
    keyPath: '',
    keyPassword: ''
  }
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
}

export default function NetworkManagerWebsocketTest() {

  beforeAll(async function () {
    console.log('NetworkManagerWebsocketTest beforeAll start');
    console.log('NetworkManagerWebsocketTest beforeAll end');
  })

  describe("NetworkManagerWebsocketTest", function () {
  
    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0100
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0100", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0100";
      webSocket.connect(url1, webSocketRequestOptions_caPath1, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err.code == 2302002).assertTrue();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0200
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0200", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0200";
      webSocket.connect(url1, WebSocketRequestOptions_clientCert1, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err.code == 2302002).assertTrue();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0300
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0300", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0300";
      webSocket.connect(url_ERROR, webSocketRequestOptions_caPath2, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err.code == 2302001).assertTrue();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0400
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0400", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0400";
      webSocket.connect(url_ERROR, WebSocketRequestOptions_clientCert2, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err.code == 2302001).assertTrue();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0500
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0500", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0500";
      webSocket.connect(url1, webSocketRequestOptions_caPath2, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expect(data == true).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0600
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0600", 0, async function (done) {
      let caseName = "SUB_Telephony_Netstack_WebSocket_CertVerify_Xts_0600";
      webSocket.connect(url1, WebSocketRequestOptions_clientCert2, (err, data) => {
        if (err) {
          console.log(`${caseName} connect failed, err: ${JSON.stringify(err)}`);
          expect(err.code == 2302003).assertTrue();
          done();
        } else {
          console.log(`${caseName} connect success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      })
    })
  })
}


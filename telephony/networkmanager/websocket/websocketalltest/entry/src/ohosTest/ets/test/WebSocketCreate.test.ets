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


export default function WebSocketCreateTest() {
  describe('webSocketCreateTest', () => {
    /**
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketCallback0100
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketCallback_0100
     * @tc.desc   Create a WebSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCreateWebSocketCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketCallback0100';
      console.info(`${caseName} test start`);
      try {
        let ws: webSocket.WebSocket = webSocket.createWebSocket();
        console.info(`${caseName} --> ${ws}`);
        ExpectTrue(ws != null);
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
     * @tc.name   testNetworkMgrWebSocketCreateWebSocketCallback0200
     * @tc.number SUB_NetworkMgr_WebSocket_CreateWebSocketCallback_0200
     * @tc.desc   Create a WebSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCreateWebSocketCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrWebSocketCreateWebSocketCallback0200';
      console.info(`${caseName} test start`);
      try {
        let wsOne: webSocket.WebSocket = webSocket.createWebSocket();
        let wsTwo: webSocket.WebSocket = webSocket.createWebSocket();
        console.info(`${caseName} --> ${wsOne}`);
        console.info(`${caseName} --> ${wsTwo}`);
        ExpectTrue(wsOne != wsTwo);
        done();
        console.info(`${caseName} test end`);
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });
  });
}
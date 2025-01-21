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

import { describe, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';


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
    it('testNetworkMgrWebSocketConnectCode201Callback0100', 0, async (done: Function) => {
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
        ExpectTrue(false);
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
    it('testNetworkMgrWebSocketConnectOptionsCode201Callback0200', 0, async (done: Function) => {
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
        ExpectTrue(false);
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
    it('testNetworkMgrWebSocketConnectOptionsCode201Promise0300', 0, async (done: Function) => {
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
    it('testNetworkMgrWebSocketSendCode201Callback0100', 0, async (done: Function) => {
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
        ExpectTrue(false);
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
    it('testNetworkMgrWebSocketSendCode201Promise0200', 0, async (done: Function) => {
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
    it('testNetworkMgrWebSocketCloseCode201Callback0100', 0, async (done: Function) => {
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
        ExpectTrue(false);
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
    it('testNetworkMgrWebSocketCloseOptionsCode201Callback0200', 0, async (done: Function) => {
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
        ExpectTrue(false);
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
    it('testNetworkMgrWebSocketCloseOptionsCode201Promise0300', 0, async (done: Function) => {
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

  });
}
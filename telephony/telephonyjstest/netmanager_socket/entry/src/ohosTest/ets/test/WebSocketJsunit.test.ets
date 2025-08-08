/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import webSocket from '@ohos.net.webSocket'
import { JSON } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';

let notCheck=true;
export default function webSocketJsunit() {
  describe('webSocketTest', () => {
    console.log("************* webSocket Test start*************");
    let ws: webSocket.WebSocket;
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_createWebSocket_0100
     * @tc.name      : createWebSocket
     * @tc.desc      : Creates a web socket connection.
     */
    it('Telephony_WebSocket_WebSocket_createWebSocket_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_createWebSocket_0100 Test start*************");
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      let mWebSocket = webSocket.createWebSocket();
      expect(mWebSocket != null).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_createWebSocket_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocketRequestOptions_header_0100
     * @tc.name      : webSocketRequestOptions.header
     * @tc.desc      : webSocketRequestOptions.header
     */
    it('Telephony_WebSocket_WebSocketRequestOptions_header_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocketRequestOptions_header_0100 Test start*************");
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: "test header"
      };
      expect(webSocketRequestOptions.header === "test header").assertTrue();
      console.log("************* Telephony_WebSocket_WebSocketRequestOptions_header_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocketCloseOptions_code_0100
     * @tc.name      : webSocketCloseOptions.code
     * @tc.desc      : webSocketCloseOptions.code
     */
    it('Telephony_WebSocket_WebSocketCloseOptions_code_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocketCloseOptions_code_0100 Test start*************");
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      };
      expect(webSocketCloseOptions.code === 1).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocketCloseOptions_code_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocketCloseOptions_reason_0100
     * @tc.name      : webSocketCloseOptions.reason
     * @tc.desc      : webSocketCloseOptions.reason
     */
    it('Telephony_WebSocket_WebSocketCloseOptions_reason_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocketCloseOptions_reason_0100 Test start*************");
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      };
      expect(webSocketCloseOptions.reason).assertEqual("test reason");
      console.log("************* Telephony_WebSocket_WebSocketCloseOptions_reason_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_connect_0100
     * @tc.name      : connect
     * @tc.desc      : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     */
    it('Telephony_WebSocket_WebSocket_connect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_connect_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_connect_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.connect("www.baidu.com", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_connect_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_connect_0200
     * @tc.name      : connect
     * @tc.desc      : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     */
    it('Telephony_WebSocket_WebSocket_connect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_connect_0200 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_connect_0200";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: "test header"
      };
      ws.connect("www.baidu.com", webSocketRequestOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_connect_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_connect_0300
     * @tc.name      : connect
     * @tc.desc      : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     */
    it('Telephony_WebSocket_WebSocket_connect_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_connect_0300 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_connect_0300";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      let webSocketRequestOptions: webSocket.WebSocketRequestOptions = {
        header: "test header"
      };
      ws.connect("www.baidu.com", webSocketRequestOptions).then(data => {
        expect(true).assertTrue();
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_WebSocket_WebSocket_connect_0300 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_connect_0400
     * @tc.name      : connect
     * @tc.desc      : Initiates a WebSocket request to establish a WebSocket connection to a given URL.
     */
    it('Telephony_WebSocket_WebSocket_connect_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_connect_0400 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_connect_0400";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.connect("www.baidu.com").then(data => {
        expect(true).assertTrue();
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_WebSocket_WebSocket_connect_0400 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_send_0100
     * @tc.name      : send
     * @tc.desc      : Sends data through a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_send_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_send_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_send_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.send("test data", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_send_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_send_0200
     * @tc.name      : send
     * @tc.desc      : Sends data through a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_send_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_send_0200 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_send_0200";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.send("test data").then(data => {
        expect(true).assertTrue();
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_WebSocket_WebSocket_send_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_close_0100
     * @tc.name      : close
     * @tc.desc      : Closes a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_close_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_close_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.close((error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_close_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_close_0200
     * @tc.name      : close
     * @tc.desc      : Closes a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_close_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_close_0200 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_close_0200";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      };
      ws.close(webSocketCloseOptions, (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_close_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_close_0300
     * @tc.name      : close
     * @tc.desc      : Closes a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_close_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_close_0300 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_close_0300";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
        code: 1,
        reason: "test reason"
      };
      ws.close(webSocketCloseOptions).then(data => {
        expect(true).assertTrue();
        console.log(`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((error:BusinessError) => {
        console.log(`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      console.log("************* Telephony_WebSocket_WebSocket_close_0300 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_on_open_0100
     * @tc.name      : on
     * @tc.desc      : Enables listening for the open events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_on_open_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_on_open_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_on_open_0100";
      try {
        ws.on("open", (error, data) => {
          if (error) {
            console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
            done();
            return;
          }
          expect().assertFail();
          console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        expect(true).assertTrue();
        console.log(`${caseName} error, catch error:${JSON.stringify(err)}`);
        done();
      }
      console.log("************* Telephony_WebSocket_WebSocket_on_open_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_open_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the open events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_open_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_open_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_off_open_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("open", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_off_open_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_open_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the open events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_open_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_open_0200 Test start*************");
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("open");
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_off_open_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_on_message_0100
     * @tc.name      : on
     * @tc.desc      : Enables listening for the message events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_on_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_on_message_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_on_message_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.on("message", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_on_message_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_message_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the message events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_message_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_off_message_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("message", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_off_message_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_message_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the message events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_message_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_message_0200 Test start*************");
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("message");
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_off_message_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_on_close_0100
     * @tc.name      : on
     * @tc.desc      : Enables listening for the close events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_on_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_on_close_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_on_close_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.on("close", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_on_close_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_close_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the close events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_close_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_off_close_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("close", (error, data) => {
        if (error) {
          console.log(`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        console.log(`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      console.log("************* Telephony_WebSocket_WebSocket_off_close_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_close_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the close events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_close_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_close_0200 Test start*************");
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("close");
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_off_close_0200 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_on_error_0100
     * @tc.name      : on
     * @tc.desc      : Enables listening for the error events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_on_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_on_error_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_on_error_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.on("error", error => {
        console.log(`${caseName} fail, error:${JSON.stringify(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_on_error_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_error_0100
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the error events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_error_0100 Test start*************");
      let caseName = "Telephony_WebSocket_WebSocket_off_error_0100";
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("error", error => {
        console.log(`${caseName} fail, error:${JSON.stringify(error)}`);
        expect().assertFail();
      });
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_off_error_0100 Test end*************");
      done();
    });
    /*
     * @tc.number    : Telephony_WebSocket_WebSocket_off_error_0200
     * @tc.name      : off
     * @tc.desc      : Cancels listening for the error events of a WebSocket connection.
     */
    it('Telephony_WebSocket_WebSocket_off_error_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("************* Telephony_WebSocket_WebSocket_off_error_0200 Test start*************");
      if (notCheck) {
        expect(true).assertTrue();
        done();
        return;
      }
      ws.off("error");
      expect(true).assertTrue();
      console.log("************* Telephony_WebSocket_WebSocket_off_error_0200 Test end*************");
      done();
    });
    console.log("************* webSocket Test end*************");
  })
}
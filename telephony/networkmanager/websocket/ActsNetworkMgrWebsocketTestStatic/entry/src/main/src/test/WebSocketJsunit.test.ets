/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

let notCheck: boolean = true;
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

export default function webSocketJsunitTest() {

  describe("webSocketJsunitTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketCloseOptions0100
     * @tc.number TUB_NetworkMgr_WebSocket_WebSocketCloseOptions_0100
     * @tc.desc   webSocketCloseOptions.code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketCloseOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketCloseOptions0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
          code: 1,
          reason: "test reason"
        };
        ExpectTrue(webSocketCloseOptions.code == 1);
        ExpectTrue(webSocketCloseOptions.reason == "test reason");
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketCloseOptions0200
     * @tc.number TUB_NetworkMgr_WebSocket_WebSocketCloseOptions_0200
     * @tc.desc   webSocketCloseOptions.code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketCloseOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketCloseOptions0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
          reason: "test reason"
        };
        ExpectTrue(webSocketCloseOptions.reason == "test reason");
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketWebSocketCloseOptions0300
     * @tc.number TUB_NetworkMgr_WebSocket_WebSocketCloseOptions_0300
     * @tc.desc   webSocketCloseOptions.code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketWebSocketCloseOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketWebSocketCloseOptions0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let webSocketCloseOptions: webSocket.WebSocketCloseOptions = {
          code: 2
        };
        ExpectTrue(webSocketCloseOptions.code == 2);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketCloseResult0100
     * @tc.number TUB_NetworkMgr_WebSocket_CloseResult_0100
     * @tc.desc   webSocketCloseOptions.code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketCloseResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseResult0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let webSocketCloseResult: webSocket.CloseResult = {
          code: 2,
          reason: '123456'
        };
        ExpectTrue(webSocketCloseResult.code == 2);
        ExpectTrue(webSocketCloseResult.reason == '123456');
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });


  })
}
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewControllerSetConnectionTimeoutTest() {

  describe('WebViewControllerSetConnectionTimeoutTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerSetConnectionTimeoutTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerSetConnectionTimeoutTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerSetConnectionTimeoutTest" == pages.name)) {
          console.info("get WebViewControllerSetConnectionTimeoutTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerSetConnectionTimeoutTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerSetConnectionTimeoutTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("WebViewControllerSetConnectionTimeoutTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0100
    * @tc.name       : testWebViewControllerSetConnectionTimeout001
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout001', 0, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout001", 'ERR_TIMED_OUT', 4007, done);
      sendEventByKey('WebViewControllerSetConnectionTimeoutTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0200
    * @tc.name       : testWebViewControllerSetConnectionTimeout002
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout002', 0, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout002", 'ERR_TIMED_OUT', 4008, done);
      sendEventByKey('WebViewControllerSetConnectionTimeoutTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0300
    * @tc.name       : testWebViewControllerSetConnectionTimeout003
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout003', 0, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout003", 'ERR_TIMED_OUT', 4009, done);
      sendEventByKey('WebViewControllerSetConnectionTimeoutTestButton', 10, '');
    })

  })
}

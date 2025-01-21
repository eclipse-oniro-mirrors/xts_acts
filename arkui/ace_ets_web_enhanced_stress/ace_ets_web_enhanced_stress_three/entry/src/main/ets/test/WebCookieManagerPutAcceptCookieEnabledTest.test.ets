/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import router from '@ohos.router';
import Utils from './Utils';

export default function webCookieManagerPutAcceptCookieEnabledTest() {

  describe('WebCookieManagerPutAcceptCookieEnabledTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebCookieManagerPutAcceptCookieEnabledTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebCookieManagerPutAcceptCookieEnabledTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCookieManagerPutAcceptCookieEnabledTest state success " + JSON.stringify(pages));
        if (!("WebCookieManagerPutAcceptCookieEnabledTest" == pages.name)) {
          console.info("get WebCookieManagerPutAcceptCookieEnabledTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCookieManagerPutAcceptCookieEnabledTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCookieManagerPutAcceptCookieEnabledTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebCookieManagerPutAcceptCookieEnabledTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebCookieManagerPutAcceptCookieEnabledTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCOOKIEMANAGER_PUTACCEPTCOOKIEENABLED_0100
    * @tc.name        : testWebCookieManagerPutAcceptCookieEnabled001
    * @tc.desc        : stress testing PutAcceptCookieEnabled with true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebCookieManagerPutAcceptCookieEnabled001', 0, async (done: Function) => {
      Utils.doIt("testWebCookieManagerPutAcceptCookieEnabled001", 83252, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_COOKIE_MANAGER_PUT_ACCEPT_COOKIE_ENABLED_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCOOKIEMANAGER_PUTACCEPTCOOKIEENABLED_0200
    * @tc.name        : testWebCookieManagerPutAcceptCookieEnabled002
    * @tc.desc        : stress testing isThirdPartyCookieAllowed with false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebCookieManagerPutAcceptCookieEnabled002', 0, async (done: Function) => {
      Utils.doIt("testWebCookieManagerPutAcceptCookieEnabled002", 83253, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_COOKIE_MANAGER_PUT_ACCEPT_COOKIE_ENABLED_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}

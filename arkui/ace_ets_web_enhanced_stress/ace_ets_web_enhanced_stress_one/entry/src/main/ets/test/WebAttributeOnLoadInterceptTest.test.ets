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
import router from '@ohos.router';
import { Constants } from './Constants';
import Utils from './Utils';

export default function webAttributeOnLoadInterceptTest() {

  describe('WebAttributeOnLoadInterceptTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebAttributeOnLoadInterceptTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeOnLoadInterceptTest state success " + JSON.stringify(pages));
        if (!("WebAttributeOnLoadInterceptTest" == pages.name)) {
          console.info("get WebAttributeOnLoadInterceptTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeOnLoadInterceptTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeOnLoadInterceptTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebAttributeOnLoadInterceptTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeOnLoadInterceptTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebAttributeOnLoadInterceptTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBATTRIBUTE_ONLOADINTERCEPT_0100
    * @tc.name        : testWebAttributeOnLoadIntercept001
    * @tc.desc        : stress testing onInterceptRequest
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebAttributeOnLoadIntercept001', 0, async (done: Function) => {
      Utils.doIt("testWebAttributeOnLoadIntercept001", 110037, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_ONLOADINTERCEPT_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBATTRIBUTE_ONLOADINTERCEPT_0200
    * @tc.name        : testWebAttributeOnLoadIntercept002
    * @tc.desc        : stress testing onLoadIntercept
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebAttributeOnLoadIntercept002', 0, async (done: Function) => {
      Utils.doIt("testWebAttributeOnLoadIntercept002", 110040, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ATTRIBUTE_ONLOADINTERCEPT_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}

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

export default function webControllerRequestFocusTest() {

  describe('WebControllerRequestFocusTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebControllerRequestFocusTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerRequestFocusTest state success " + JSON.stringify(pages));
        if (!("WebControllerRequestFocusTest" == pages.name)) {
          console.info("get WebControllerRequestFocusTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebControllerRequestFocusTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerRequestFocusTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebControllerRequestFocusTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebControllerRequestFocusTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebControllerRequestFocusTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCONTROLLER_REQUESTFOCUS_0100
    * @tc.name        : testWebControllerRequestFocus001
    * @tc.desc        : stress testing request
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebControllerRequestFocus001', 0, async (done: Function) => {
      Utils.doIt("testWebControllerRequestFocus001", 110071, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_CONTROLLER_REQUESTFOCUS_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}

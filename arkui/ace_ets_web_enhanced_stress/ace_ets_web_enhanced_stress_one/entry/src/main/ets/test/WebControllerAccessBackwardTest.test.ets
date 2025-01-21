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

export default function webControllerAccessBackwardTest() {

  describe('WebControllerAccessBackwardTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebControllerAccessBackwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerAccessBackwardTest state success " + JSON.stringify(pages));
        if (!("WebControllerAccessBackwardTest" == pages.name)) {
          console.info("get WebControllerAccessBackwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebControllerAccessBackwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerAccessBackwardTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebControllerAccessBackwardTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebControllerAccessBackwardTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebControllerAccessBackwardTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCONTROLLER_ACCESSBACKWARD_0100
    * @tc.name        : testWebControllerAccessBackward001
    * @tc.desc        : stress testing accessBackward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebControllerAccessBackward001', 0, async (done: Function) => {
      Utils.doIt("testWebControllerAccessBackward001", 110095, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_CONTROLLER_ACCESSBACKWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCONTROLLER_ACCESSBACKWARD_0200
    * @tc.name        : testWebControllerAccessBackward002
    * @tc.desc        : stress testing accessBackward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebControllerAccessBackward002', 0, async (done: Function) => {
      Utils.doIt("testWebControllerAccessBackward002", 110100, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_CONTROLLER_ACCESSBACKWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}

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

export default function webControllerBackwardTest() {

  describe('WebControllerBackwardTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebControllerBackwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerBackwardTest state success " + JSON.stringify(pages));
        if (!("WebControllerBackwardTest" == pages.name)) {
          console.info("get WebControllerBackwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebControllerBackwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerBackwardTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebControllerBackwardTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebControllerBackwardTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebControllerBackwardTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBCONTROLLER_BACKWARD_0100
    * @tc.name        : testWebControllerBackward001
    * @tc.desc        : stress testing backward
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebControllerBackward001', 0, async (done: Function) => {
      Utils.doIt("testWebControllerBackward001", 110060, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_CONTROLLER_BACKWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}

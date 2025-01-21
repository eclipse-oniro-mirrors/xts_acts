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

export default function webOnPageBeginTest() {

  describe('WebOnPageBeginTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebOnPageBeginTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnPageBeginTest state success " + JSON.stringify(pages));
        if (!("WebOnPageBeginTest" == pages.name)) {
          console.info("get WebOnPageBeginTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnPageBeginTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnPageBeginTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebOnPageBeginTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebOnPageBeginTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebOnPageBeginTest afterEach Begin");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_ONPAGEBEGIN_0100
    * @tc.name        : testWebOnPageBegin001
    * @tc.desc        : stress testing onPageBegin
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebOnPageBegin001', 0, async (done: Function) => {
      Utils.doIt("testWebOnPageBegin001", 100240, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ON_PAGE_BEGIN_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}

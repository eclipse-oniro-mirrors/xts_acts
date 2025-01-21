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

export default function webZoomTest() {

  describe('WebZoomTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebZoomTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebZoomTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebZoomTest state success " + JSON.stringify(pages));
        if (!("WebZoomTest" == pages.name)) {
          console.info("get WebZoomTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebZoomTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebZoomTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebZoomTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebZoomTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_ZOOM_0100
    * @tc.name        : testWebZoom001
    * @tc.desc        : stress testing zoom when using the parameter 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebZoom001', 0, async (done: Function) => {
      Utils.doIt("testWebZoom001", 81010, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_ZOOM_0200
    * @tc.name        : testWebZoom002
    * @tc.desc        : stress testing zoom when using the parameter -1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebZoom002', 0, async (done: Function) => {
      Utils.doIt("testWebZoom002", 81020, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_ZOOM_0300
    * @tc.name        : testWebZoom003
    * @tc.desc        : stress testing zoom when using the parameter 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebZoom003', 0, async (done: Function) => {
      Utils.doIt("testWebZoom003", 81030, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}

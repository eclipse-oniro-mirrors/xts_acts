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

export default function webRefreshTest() {

  describe('WebRefreshTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebRefreshTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebRefreshTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebRefreshTest state success " + JSON.stringify(pages));
        if (!("WebRefreshTest" == pages.name)) {
          console.info("get WebRefreshTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebRefreshTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebRefreshTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebRefreshTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebRefreshTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_REFRESH_0100
    * @tc.name        : testWebRefresh001
    * @tc.desc        : stress testing Refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebRefresh001', 0, async (done: Function) => {
      Utils.doIt("testWebRefresh001", 80900, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_STRESS_REFRESH_0200
   * @tc.name        : testWebRefresh002
   * @tc.desc        : stress testing Refresh
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 2
   */
    it('testWebRefresh002', 0, async (done: Function) => {
      Utils.doIt("testWebRefresh002", 80901, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_STRESS_REFRESH_0300
   * @tc.name        : testWebRefresh003
   * @tc.desc        : stress testing Refresh
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 2
   */
    it('testWebRefresh003', 0, async (done: Function) => {
      Utils.doIt("testWebRefresh003", 80902, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_STRESS_REFRESH_0400
   * @tc.name        : testWebRefresh004
   * @tc.desc        : stress testing Refresh
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 2
   */
    it('testWebRefresh004', 0, async (done: Function) => {
      Utils.doIt("testWebRefresh004", 80903, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}

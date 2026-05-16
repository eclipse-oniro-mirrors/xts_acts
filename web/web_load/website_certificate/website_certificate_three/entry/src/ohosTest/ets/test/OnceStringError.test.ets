/**
 * Copyright (c) 2026 Huawei Device Co. Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver } from '@kit.TestKit';

let emitKey = "emitOnceStringError";
const driver = Driver.create();

export default function onceStringError() {
  describe('OnceStringErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OnceStringError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnceStringError state success " + JSON.stringify(pages));
        if (!("OnceStringError" == pages.name)) {
          console.info("get OnceStringError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push OnceStringError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnceStringError page error: " + err);
      }
      done();
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start");
      done();
    })

    /**
     * @tc.name   testOnceStringTypeEmpty
     * @tc.number SUB_WEB_WEBVIEW_ONCE_STRING_ERROR_001
     * @tc.desc   Webview once type empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnceStringTypeEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnceStringTypeEmpty", 202700);
      let isReturn = 0;
      Utils.registerEvent("testOnceStringTypeEmpty", "401", 202701, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "onceStringErrorButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnceStringTypeEmpty' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnceStringTypeNull
     * @tc.number SUB_WEB_WEBVIEW_ONCE_STRING_ERROR_002
     * @tc.desc   Webview once type null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnceStringTypeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnceStringTypeNull", 202700);
      Utils.registerEvent("testOnceStringTypeNull", "401", 202702, done);
      sendEventByKey('onceStringErrorButton', 10, '');
    })

    /**
     * @tc.name   testOnceStringTypeUndefined
     * @tc.number SUB_WEB_WEBVIEW_ONCE_STRING_ERROR_003
     * @tc.desc   Webview once type undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnceStringTypeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnceStringTypeUndefined", 202700);
      Utils.registerEvent("testOnceStringTypeUndefined", "401", 202703, done);
      sendEventByKey('onceStringErrorButton', 10, '');
    })
  })
}

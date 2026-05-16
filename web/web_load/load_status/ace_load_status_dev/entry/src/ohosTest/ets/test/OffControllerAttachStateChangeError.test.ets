/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { waitForExist } from './WaitTest.test';

const driver = Driver.create();

export default function offControllerAttachStateChangeError() {
  describe('OffControllerAttachStateChangeErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OffControllerAttachStateChangeError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OffControllerAttachStateChangeError state success " + JSON.stringify(pages));
        if (!("OffControllerAttachStateChangeError" == pages.name)) {
          console.info("get OffControllerAttachStateChangeError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push OffControllerAttachStateChangeError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OffControllerAttachStateChangeError page error: " + err);
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
     * @tc.name   testOffControllerAttachStateChangeTypeNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFF_CONTROLLER_ATTACH_STATE_CHANGE_ERROR_001
     * @tc.desc   WebviewController off type null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffControllerAttachStateChangeTypeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOffControllerAttachStateChangeTypeNull", 141500)
      let isReturn = false;
      Utils.registerEvent("testOffControllerAttachStateChangeTypeNull", "401", 141501, ()=>{isReturn = true});
      Utils.waitAndClickComponent("offControllerAttachStateChangeErrorButton",driver)
      await waitForExist(()=>isReturn, "testOffControllerAttachStateChangeTypeNull", true,1000);
      done();
    })

    /**
     * @tc.name   testOffControllerAttachStateChangeTypeUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFF_CONTROLLER_ATTACH_STATE_CHANGE_ERROR_002
     * @tc.desc   WebviewController off type undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffControllerAttachStateChangeTypeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOffControllerAttachStateChangeTypeUndefined", 141500)
      let isReturn = false;
      Utils.registerEvent("testOffControllerAttachStateChangeTypeUndefined", "401", 141502, ()=>{isReturn = true});
      Utils.waitAndClickComponent("offControllerAttachStateChangeErrorButton",driver)
      await waitForExist(()=>isReturn, "testOffControllerAttachStateChangeTypeUndefined", true,1000);
      done();
    })
  })
}

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

let emitKey = "emitOnControllerAttachStateChangeError";
const driver = Driver.create();

export default function onControllerAttachStateChangeError() {
  describe('OnControllerAttachStateChangeErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/OnControllerAttachStateChangeError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnControllerAttachStateChangeError state success " + JSON.stringify(pages));
        if (!("OnControllerAttachStateChangeError" == pages.name)) {
          console.info("get OnControllerAttachStateChangeError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push OnControllerAttachStateChangeError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnControllerAttachStateChangeError page error: " + err);
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
     * @tc.name   testOnControllerAttachStateChangeTypeNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ON_CONTROLLER_ATTACH_STATE_CHANGE_ERROR_001
     * @tc.desc   WebviewController on type null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnControllerAttachStateChangeTypeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnControllerAttachStateChangeTypeNull", 141400)
      let isReturn = false;
      Utils.registerEvent("testOnControllerAttachStateChangeTypeNull", "401", 141401, ()=>{isReturn = true});
      Utils.waitAndClickComponent("onControllerAttachStateChangeErrorButton",driver)
      await waitForExist(()=>isReturn, "testOnControllerAttachStateChangeTypeNull", true,1000);
      done();
    })

    /**
     * @tc.name   testOnControllerAttachStateChangeTypeUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ON_CONTROLLER_ATTACH_STATE_CHANGE_ERROR_002
     * @tc.desc   WebviewController on type undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnControllerAttachStateChangeTypeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testOnControllerAttachStateChangeTypeUndefined", 141400)
      let isReturn = false;
      Utils.registerEvent("testOnControllerAttachStateChangeTypeUndefined", "401", 141402, ()=>{isReturn = true});
      Utils.waitAndClickComponent("onControllerAttachStateChangeErrorButton",driver)
      await waitForExist(()=>isReturn, "testOnControllerAttachStateChangeTypeUndefined", true,1000);
      done();
    })



  })
}

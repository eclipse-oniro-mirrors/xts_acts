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

let emitKey = "emitWaitForAttachedError";
const driver = Driver.create();

export default function waitForAttachedError() {
  describe('WaitForAttachedErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WaitForAttachedError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waitForAttachedError state success " + JSON.stringify(pages));
        if (!("waitForAttachedError" == pages.name)) {
          console.info("get waitForAttachedError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push waitForAttachedError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waitForAttachedError page error: " + err);
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
     * @tc.name   testWaitForAttachedTimeoutNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WAIT_FOR_ATTACHED_ERROR_001
     * @tc.desc   WebviewController waitForAttached timeout null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWaitForAttachedTimeoutNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWaitForAttachedTimeoutNull", 141600)
      let isReturn = false;
      Utils.registerEvent("testWaitForAttachedTimeoutNull", "401", 141601, ()=>{isReturn = true});
      Utils.waitAndClickComponent("webWaitForAttachedErrorButton",driver)
      await waitForExist(()=>isReturn, "testWaitForAttachedTimeoutNull", true,1000);
      done();
    })

    /**
     * @tc.name   testWaitForAttachedTimeoutUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_WAIT_FOR_ATTACHED_ERROR_002
     * @tc.desc   WebviewController waitForAttached timeout undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWaitForAttachedTimeoutUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWaitForAttachedTimeoutUndefined", 141600);
      Utils.registerEvent("testWaitForAttachedTimeoutUndefined", "401", 141602, done);
      sendEventByKey('webWaitForAttachedErrorButton', 10, '');
    })
  })
}

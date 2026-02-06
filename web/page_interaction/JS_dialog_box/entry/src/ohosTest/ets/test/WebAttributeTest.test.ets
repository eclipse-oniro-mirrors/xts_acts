/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 177101;
let driver = Driver.create();

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebAttributeTestButton"), 10000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONALERT_0100
    * @tc.name        : testOnAlert001
    * @tc.desc        : test onAlert callback
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnAlert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnAlert001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnAlert001", "alert test", 177110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnAlert001");
      await Utils.waitForExist(() => isReturn, "testOnAlert001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONCONFIRM_0100
    * @tc.name        : testOnConfirm001
    * @tc.desc        : test onConfirm normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnConfirm001", "confirm test", 177120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnConfirm001");
      await Utils.waitForExist(() => isReturn, "testOnConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONPROMPT_0100
    * @tc.name        : testOnPrompt001
    * @tc.desc        : test onPrompt normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnPrompt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPrompt001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnPrompt001", "prompt test", 177130, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnPrompt001");
      await Utils.waitForExist(() => isReturn, "testOnPrompt001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECANCEL_0100
    * @tc.name        : testJsResultHandleCancel001
    * @tc.desc        : test JsResultHandle.cancel()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleCancel001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandleCancel001", "false", 177140, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandleCancel001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandleCancel001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECONFIRM_0100
    * @tc.name        : testJsResultHandleConfirm001
    * @tc.desc        : test JsResultHandle.confirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandleConfirm001", "true", 177150, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandleConfirm001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandleConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLEPROMPTCONFIRM_0100
    * @tc.name        : testJsResultHandlePromptConfirm001
    * @tc.desc        : test JsResultHandle.promptConfirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandlePromptConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandlePromptConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandlePromptConfirm001", "\"handlePromptConfirm\"", 177160, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandlePromptConfirm001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandlePromptConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    
  })
}

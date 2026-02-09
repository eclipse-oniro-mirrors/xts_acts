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

const EVENT_ID_SET_SUITE_KEY = 183401;
const driver = Driver.create();

export default function WebViewEnumAndSetWebController() {

  describe('WebViewEnumAndSetWebControllerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndSetWebController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewEnumAndSetWebController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewEnumAndSetWebController page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("buttonEnumAndSetWebController"), 10000);
        }
      } catch (err) {
        console.error("push WebViewEnumAndSetWebController page error: " + err);
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

    /**
     * @tc.name   testFileSelectorMode002
     * @tc.number SUB_WEB_FILESELECTORMODE_0200
     * @tc.desc   test FileSelectorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFileSelectorMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenMultipleMode", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testFileSelectorMode002", 1, 183410, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndSetWebController", "testFileSelectorMode002");
      await Utils.waitForExist(() => isReturn, "emitFileSelectorModeFileOpenMultipleMode" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testFileSelectorMode003
     * @tc.number SUB_WEB_FILESELECTORMODE_0300
     * @tc.desc   test FileSelectorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFileSelectorMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFileSelectorModeFileOpenFolderMode", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testFileSelectorMode003", 2, 183420,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndSetWebController", "testFileSelectorMode003");
      await Utils.waitForExist(() => isReturn, "emitFileSelectorModeFileOpenFolderMode" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testContextMenuMediaType002
     * @tc.number SUB_WEB_CONTEXTMENUMEDIATYPE_0200
     * @tc.desc   test ContextMenuMediaType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeImage", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaType002", 1, 183430,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndSetWebController", "testContextMenuMediaType002");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeImage" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testContextMenuSourceTypeMouse001
     * @tc.number SUB_WEB_CONTEXTMENUSOURCETYPEMOUSE_0100
     * @tc.desc   test ContextMenuSourceTypeMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuSourceTypeMouse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuSourceTypeMouse", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuSourceTypeMouse001", ContextMenuSourceType.Mouse, 183440, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "buttonEnumAndSetWebController", "testContextMenuSourceTypeMouse001");
      await Utils.waitForExist(() => isReturn, "emitContextMenuSourceTypeMouse" + '_returnCheck', true, 500);
      done();
    })


  })
}

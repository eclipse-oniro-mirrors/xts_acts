/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of this License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function presentCustomDialogNullAndUndefinedTest() {
  describe('presentCustomDialogNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("presentCustomDialogNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/PresentCustomDialogNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get presentCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("PresentCustomDialogNullAndUndefined" == pages.name)) {
          console.info("get presentCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push presentCustomDialogNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push presentCustomDialogNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      try {
        let driver: Driver = Driver.create();
        let closeButton = await driver.findComponent(ON.text('Close'));
        if (closeButton) {
          await closeButton.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.info('Close button not found or already closed');
      }
      await CommonFunc.sleep(1000);
      console.info("presentCustomDialogNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   presentCustomDialogWithController001
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_CONTROLLER_001
     * @tc.desc   Test presentCustomDialog with controller.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogWithController001', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogWithController001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnPresentWithController'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogWithController001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('present with controller success');
      console.info('[presentCustomDialogWithController001] END');
    });

    /**
     * @tc.name   presentCustomDialogWithoutController002
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_CONTROLLER_002
     * @tc.desc   Test presentCustomDialog without controller.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogWithoutController002', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogWithoutController002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnPresentWithoutController'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogWithoutController002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('present without controller success');
      console.info('[presentCustomDialogWithoutController002] END');
    });

    /**
     * @tc.name   presentCustomDialogBuilderUndefined004
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_PARAM_004
     * @tc.desc   Test presentCustomDialog with builder undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogBuilderUndefined004', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogBuilderUndefined004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnBuilderUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogBuilderUndefined004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('builder undefined catch');
      console.info('[presentCustomDialogBuilderUndefined004] END');
    });

    /**
     * @tc.name   presentCustomDialogControllerNull005
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_PARAM_005
     * @tc.desc   Test presentCustomDialog with controller null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogControllerNull005', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogControllerNull005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnControllerNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogControllerNull005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('controller null error');
      console.info('[presentCustomDialogControllerNull005] END');
    });

    /**
     * @tc.name   presentCustomDialogControllerUndefined006
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_PARAM_006
     * @tc.desc   Test presentCustomDialog with controller undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogControllerUndefined006', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogControllerUndefined006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnControllerUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogControllerUndefined006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('controller undefined success');
      console.info('[presentCustomDialogControllerUndefined006] END');
    });

    /**
     * @tc.name   presentCustomDialogOptionsUndefined008
     * @tc.number SUB_ARKUI_PROMPTACTION_PRESENTCUSTOMDIALOG_PARAM_008
     * @tc.desc   Test presentCustomDialog with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('presentCustomDialogOptionsUndefined008', Level.LEVEL0, async () => {
      console.info('[presentCustomDialogOptionsUndefined008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextPresent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[presentCustomDialogOptionsUndefined008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined success');
      console.info('[presentCustomDialogOptionsUndefined008] END');
    });
  })
}

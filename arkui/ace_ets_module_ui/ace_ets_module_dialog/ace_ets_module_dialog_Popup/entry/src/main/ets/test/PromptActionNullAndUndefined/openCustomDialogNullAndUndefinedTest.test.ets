/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function openCustomDialogNullAndUndefinedTest() {
  describe('openCustomDialogNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("openCustomDialogNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/OpenCustomDialogNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get openCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("OpenCustomDialogNullAndUndefined" == pages.name)) {
          console.info("get openCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push openCustomDialogNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push openCustomDialogNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
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
      console.info("openCustomDialogNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   openCustomDialogShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENCUSTOMDIALOG_SHOWINSUBWINDOW_001
     * @tc.desc   Test openCustomDialog with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[openCustomDialogShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow true success');
      console.info('[openCustomDialogShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   openCustomDialogShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_SHOWINSUBWINDOW_002
     * @tc.desc   Test openCustomDialog with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false success');
      console.info('[openCustomDialogShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   openCustomDialogIsModalFalse002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_ISMODAL_002
     * @tc.desc   Test openCustomDialog with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogIsModalFalse002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogIsModalFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogIsModalFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('false');
      console.info('[openCustomDialogIsModalFalse002] END');
    });

    /**
     * @tc.name   openCustomDialogLevelModeEmbedded002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_LEVELMODE_002
     * @tc.desc   Test openCustomDialog with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogLevelModeEmbedded002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogLevelModeEmbedded002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogLevelModeEmbedded002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED success');
      console.info('[openCustomDialogLevelModeEmbedded002] END');
    });

    /**
     * @tc.name   openCustomDialogContentNull003
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_PARAM_003
     * @tc.desc   Test openCustomDialog with content null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogContentNull003', Level.LEVEL0, async () => {
      console.info('[openCustomDialogContentNull003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogContentNull003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null catch');
      console.info('[openCustomDialogContentNull003] END');
    });

    /**
     * @tc.name   openCustomDialogContentUndefined004
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_PARAM_004
     * @tc.desc   Test openCustomDialog with content undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogContentUndefined004', Level.LEVEL0, async () => {
      console.info('[openCustomDialogContentUndefined004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogContentUndefined004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined catch');
      console.info('[openCustomDialogContentUndefined004] END');
    });

    /**
     * @tc.name   openCustomDialogOptionsNull005
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOG_PARAM_005
     * @tc.desc   Test openCustomDialog with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogOptionsNull005', Level.LEVEL0, async () => {
      console.info('[openCustomDialogOptionsNull005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogOptionsNull005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options null catch: 401');
      console.info('[openCustomDialogOptionsNull005] END');
    });
  })
}

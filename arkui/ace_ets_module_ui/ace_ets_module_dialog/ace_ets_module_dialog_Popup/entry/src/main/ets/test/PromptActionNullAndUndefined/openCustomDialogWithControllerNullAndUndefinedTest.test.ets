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

export default function openCustomDialogWithControllerNullAndUndefinedTest() {
  describe('openCustomDialogWithControllerNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("openCustomDialogWithControllerNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/OpenCustomDialogWithControllerNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get openCustomDialogWithControllerNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("OpenCustomDialogWithControllerNullAndUndefined" == pages.name)) {
          console.info("get openCustomDialogWithControllerNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push openCustomDialogWithControllerNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push openCustomDialogWithControllerNullAndUndefinedTest page error: " + err);
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
      console.info("openCustomDialogWithControllerNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   openCustomDialogWithControllerShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_SHOWINSUBWINDOW_001
     * @tc.desc   Test openCustomDialogWithController with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow true success');
      console.info('[openCustomDialogWithControllerShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_SHOWINSUBWINDOW_002
     * @tc.desc   Test openCustomDialogWithController with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false success');
      console.info('[openCustomDialogWithControllerShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerContentNull001
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_001
     * @tc.desc   Test openCustomDialogWithController with content null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerContentNull001', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerContentNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerContentNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null catch');
      console.info('[openCustomDialogWithControllerContentNull001] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerContentUndefined002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_002
     * @tc.desc   Test openCustomDialogWithController with content undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerContentUndefined002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerContentUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerContentUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined catch');
      console.info('[openCustomDialogWithControllerContentUndefined002] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerControllerNull001
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_003
     * @tc.desc   Test openCustomDialogWithController with controller null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerControllerNull001', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerControllerNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnControllerNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerControllerNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('controller null error');
      console.info('[openCustomDialogWithControllerControllerNull001] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerControllerUndefined002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_004
     * @tc.desc   Test openCustomDialogWithController with controller undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerControllerUndefined002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerControllerUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnControllerUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerControllerUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('controller undefined error');
      console.info('[openCustomDialogWithControllerControllerUndefined002] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerOptionsNull001
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_005
     * @tc.desc   Test openCustomDialogWithController with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerOptionsNull001', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerOptionsNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerOptionsNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options null catch');
      console.info('[openCustomDialogWithControllerOptionsNull001] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerOptionsUndefined002
     * @tc.number SUB_ARKUI_PROMPACTION_OPENCUSTOMDIALOGWITHCONTROLLER_PARAM_006
     * @tc.desc   Test openCustomDialogWithController with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerOptionsUndefined002', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerOptionsUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerOptionsUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined success');
      console.info('[openCustomDialogWithControllerOptionsUndefined002] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerIsModalTrue003
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENCUSTOMDIALOGWithController_ISMODAL_003
     * @tc.desc   Test openCustomDialogWithController with isModal true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerIsModalTrue003', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerIsModalTrue003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerIsModalTrue003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal true success');
      console.info('[openCustomDialogWithControllerIsModalTrue003] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerIsModalFalse004
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENCUSTOMDIALOGWithController_ISMODAL_004
     * @tc.desc   Test openCustomDialogWithController with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerIsModalFalse004', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerIsModalFalse004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerIsModalFalse004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal false success');
      console.info('[openCustomDialogWithControllerIsModalFalse004] END');
    });

    /**
     * @tc.name   openCustomDialogWithControllerLevelModeEmbedded010
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENCUSTOMdIALOGWithController_LEVELMODE_010
     * @tc.desc   Test openCustomDialogWithController with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('openCustomDialogWithControllerLevelModeEmbedded010', Level.LEVEL0, async () => {
      console.info('[openCustomDialogWithControllerLevelModeEmbedded010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextOpenWithController');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[openCustomDialogWithControllerLevelModeEmbedded010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED success');
      console.info('[openCustomDialogWithControllerLevelModeEmbedded010] END');
    });
  })
}

'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function TextAreaEditMenuOptionsTest() {
  describe('TextAreaEditMenuOptionsTest', () : void => {
    beforeAll(async (): Promise<void> => {
      console.info("TextAreaEditMenuOptionsTest beforeEach start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaEditMenuOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaEditMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaEditMenuOptionsTest state pages:" + "");
        if (!("TextAreaEditMenuOptions" == pages.name)) {
          console.info("get TextAreaEditMenuOptionsTest pages.name:" + "");


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push TextAreaEditMenuOptionsTest page error:" + err);
      }
      console.info("TextAreaEditMenuOptionsTest beforeEach end");
    });

    /**
     * @tc.number   TextAreaEditMenuOptionsTest_static_0001
     * @tc.name     TextAreaEditMenuOptionsTest_static_0001
     * @tc.desc     TextAreaEditMenuOptionsTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaEditMenuOptionsTest_static_0001', Level.LEVEL0, async (done: () =>void) : Promise<void> => {
      console.info('[TextAreaEditMenuOptionsTest_static_0001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('TextArea')) as Component;
      await CommonFunc.sleep(1000);
      await textArea.longClick();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('Text');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(
        '');
      await CommonFunc.sleep(1000);
      let search = await driver.findComponent(ON.id('Search')) as Component;
      await CommonFunc.sleep(1000);
      await search.click();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('button_editMenuOptions')) as Component;
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.longClick();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.text('111111')) as Component;
      await CommonFunc.sleep(1000);
      await text.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Text');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(
        '111111');

      await CommonFunc.sleep(1000);
      await search.click();
      await CommonFunc.sleep(1000);

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);

      await CommonFunc.sleep(1000);
      await textArea.longClick();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('Text');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(
        '');
      done();
    });
  })
}

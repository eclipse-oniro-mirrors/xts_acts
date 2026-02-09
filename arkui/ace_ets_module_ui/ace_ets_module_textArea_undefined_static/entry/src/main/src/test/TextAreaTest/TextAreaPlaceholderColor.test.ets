'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAreaPlaceholderColor() {
  describe('TextAreaPlaceholderColor', () => {
    beforeAll(() => {
      console.info("TextAreaPlaceholderColor beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaPlaceholderColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaPlaceholderColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaPlaceholderColor state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextAreaPlaceholderColor" == pages.name)) {
          console.info("get TextAreaPlaceholderColor state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaPlaceholderColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaPlaceholderColor after each called");
    });

/**
         * @tc.number   TextAreaPlaceholderColor_static_001
         * @tc.name     TextAreaPlaceholderColor_static_001
         * @tc.desc     TextAreaPlaceholderColor_static_001
         * @tc.level    Level.LEVEL0
         */
it('TextAreaPlaceholderColor_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaPlaceholderColor_static001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('TextArea');
      let obj = JSON.parseJsonElement(strJson);
      let button = await driver.findComponent(ON.id('change')) as Component;
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('TextArea');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#FF0000FF"');
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('TextArea');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('placeholderColor'))).assertEqual('"#99182431"');
      done();
    });
  })
}
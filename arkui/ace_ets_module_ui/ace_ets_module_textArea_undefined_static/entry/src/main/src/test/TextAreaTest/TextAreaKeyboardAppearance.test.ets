'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function TextAreaKeyboardAppearanceTest() {
  describe('TextAreaKeyboardAppearanceTest', () => {
    beforeAll(() => {
      console.info("TextAreaKeyboardAppearanceTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaKeyboardAppearance',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaKeyboardAppearanceTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaKeyboardAppearance" == pages.name)) {
          console.info("get TextAreaKeyboardAppearanceTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaKeyboardAppearanceTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextAreaKeyboardAppearanceTest_static_0010
     * @tc.name     TextAreaKeyboardAppearanceTest_static_0010
     * @tc.desc     TextAreaKeyboardAppearanceTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaKeyboardAppearanceTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaKeyboardAppearanceTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_KeyboardAppearance')) as Component;

      let textArea = await driver.findComponent(ON.id('TextAreaTest')) as Component;
      await CommonFunc.sleep(1000);
      await textArea.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(1);

      let search = await driver.findComponent(ON.id('Search')) as Component;
      await CommonFunc.sleep(1000);
      await search.click();
      await CommonFunc.sleep(1000);

      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.click();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(0);

      await search.click();
      await CommonFunc.sleep(1000);

      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.click();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(3);

      await search.click();
      await CommonFunc.sleep(1000);

      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.click();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance');
      expect(resultStr).assertEqual(0);

      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.click();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getInteger('keyboardAppearance')
      expect(resultStr).assertEqual(2);
      console.info('[TextAreaKeyboardAppearanceTest_static_0010] END');
      done();
    });
  })
}
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

export default function TextAreaOnTextSelectionChangeModifierTest() {
  describe('TextAreaOnTextSelectionChangeModifierTest', () => {
    beforeAll(() => {
      console.info("TextAreaOnTextSelectionChangeModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaOnTextSelectionChangeModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaOnTextSelectionChangeModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnTextSelectionChangeModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaOnTextSelectionChangeModifier" == pages.name)) {
          console.info("get TextAreaOnTextSelectionChangeModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnTextSelectionChangeModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextAreaOnTextSelectionChangeModifierTest_static_0010
         * @tc.name     TextAreaOnTextSelectionChangeModifierTest_static_0010
         * @tc.desc     TextAreaOnTextSelectionChangeModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaOnTextSelectionChangeModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaOnTextSelectionChangeModifierTest_static_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('TextArea')) as Component;
      await CommonFunc.sleep(1000);
      await textArea.longClick();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('Text');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(
        '0');
      await CommonFunc.sleep(1000);
      let search = await driver.findComponent(ON.id('Search')) as Component;
      await CommonFunc.sleep(1000);
      search.click();
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('button_onTextSelectionChange')) as Component;
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);

      await textArea.longClick();
      await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Text');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual(
        '86');

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
        '0');
      done();
    });
  })
}
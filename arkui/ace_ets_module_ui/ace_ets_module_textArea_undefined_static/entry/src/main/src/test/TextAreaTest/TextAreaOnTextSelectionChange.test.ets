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
import { Driver, ON, Component, InputTextMode } from '@kit.TestKit';


export default function TextAreaOnTextSelectionChangeTest() {
  describe('TextAreaOnTextSelectionChangeTest', () => {
    beforeAll(() => {
      console.info("TextAreaOnTextSelectionChangeTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaOnTextSelectionChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaOnTextSelectionChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnTextSelectionChangeTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaOnTextSelectionChange" == pages.name)) {
          console.info("get TextAreaOnTextSelectionChangeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnTextSelectionChangeTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextAreaOnTextSelectionChangeTest_static_0010
     * @tc.name     TextAreaOnTextSelectionChangeTest_static_0010
     * @tc.desc     TextAreaOnTextSelectionChangeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaOnTextSelectionChangeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaOnTextSelectionChangeTest_static_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_onTextSelectionChange')) as Component;
      let textArea = await driver.findComponent(ON.id('TextAreaTest')) as Component;

      let strJson = inspector.getInspectorByKey('text_onTextSelectionChange');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('content')
      await CommonFunc.sleep(1000);
      expect(resultStr).assertEqual('undefined');

      await button.click();
      await CommonFunc.sleep(1000);
      await textArea.doubleClick();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('text_onTextSelectionChange');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('content');
      await CommonFunc.sleep(1000);
      expect(resultStr).assertEqual('59');

      await button.click();
      await CommonFunc.sleep(1000);
      await textArea.doubleClick();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('text_onTextSelectionChange');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('content');
      await CommonFunc.sleep(1000);
      expect(resultStr).assertEqual('undefined');

      console.info('[TextAreaOnTextSelectionChangeTest_static_0010] END');
      done();
    });
  })
}
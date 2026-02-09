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


export default function TextInputDecorationModifier() {
  describe('TextInputDecorationModifier', () => {
    beforeAll(() => {
      console.info("TextInputDecorationModifier beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputDecorationModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputDecorationModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputDecorationModifier state pages: " + JSON.stringify(pages));
        if (!("TextInputDecorationModifier" == pages.name)) {
          console.info("get TextInputDecorationModifier state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputDecorationModifier page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputDecorationModifier_static_0010
         * @tc.name     TextInputDecorationModifier_static_0010
         * @tc.desc     TextInputDecorationModifier_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputDecorationModifier_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecorationModifier_static_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextInput');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(
        '{"type":"TextDecorationType.None","color":"#FF000000","style":"TextDecorationStyle.SOLID"}');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_decoration')) as Component;

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(
        '{"type":"TextDecorationType.None","color":"#FF0000FF","style":"TextDecorationStyle.DOUBLE"}');

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(
        '{"type":"TextDecorationType.LineThrough","color":"#FF000000","style":"TextDecorationStyle.DOUBLE"}');

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(
        '{"type":"TextDecorationType.Underline","color":"#FF0000FF","style":"TextDecorationStyle.SOLID"}');

      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('decoration')).assertEqual(
        '{"type":"TextDecorationType.None","color":"#FF000000","style":"TextDecorationStyle.SOLID"}');
      await CommonFunc.sleep(1000);
      console.info('[TextInputDecorationModifier_static_0010] END');
      done();
    });
  })
}
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

export default function TextAreaCaretStyleModifierTest() {
  describe('TextAreaCaretStyleModifierTest', () => {
    beforeAll(() => {
      console.info("TextAreaCaretStyleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaCaretStyleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaCaretStyleModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaCaretStyleModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaCaretStyleModifier" == pages.name)) {
          console.info("get TextAreaCaretStyleModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaCaretStyleModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextAreaCaretStyleModifierTest_static_0010
         * @tc.name     TextAreaCaretStyleModifierTest_static_0010
         * @tc.desc     TextAreaCaretStyleModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaCaretStyleModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaCaretStyleModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJsonUndefined = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Undefined0');
      let objUndefined = JSON.parseJsonElement(strJsonUndefined);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierUndefined: ' + JSON.stringify(objUndefined.getElement('$attrs').getString('caretStyle')));
      expect(objUndefined.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FF007DFF","width":"2.00vp"}');
      let strJson0 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj0 = JSON.parseJsonElement(strJson0);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj0.getElement('$attrs').getString('caretStyle')));
      expect(obj0.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FFFF0000","width":"4.00vp"}');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextArea_CaretStyle_Modifier_Button0')) as Component;

      await button.click();
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj1.getElement('$attrs').getString('caretStyle')));
      expect(obj1.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FFFF0000","width":"2.00vp"}');

      await button.click();
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('caretStyle')));
      expect(obj2.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FF007DFF","width":"4.00vp"}');

      await button.click();
      await CommonFunc.sleep(500);
      let strJson3 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('caretStyle')));
      expect(obj3.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FF007DFF","width":"2.00vp"}');

      await button.click();
      await CommonFunc.sleep(500);
      let strJson4 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj4.getElement('$attrs').getString('caretStyle')));
      expect(obj4.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FFFF0000","width":"4.00vp"}');

      await button.click();
      await CommonFunc.sleep(500);
      let strJson5 = inspector.getInspectorByKey('TextArea_CaretStyle_Modifier_Dynamic0');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info('[TextAreaCaretStyleModifierTest_static_0010] TextAreaCaretStyleModifierDynamic: ' + JSON.stringify(obj5.getElement('$attrs').getString('caretStyle')));
      expect(obj5.getElement('$attrs').getString('caretStyle')).assertEqual('{"color":"#FF007DFF","width":"2.00vp"}');

      console.info('[TextAreaCaretStyleModifierTest_static_0010] END');
      done();
    });

  })
}
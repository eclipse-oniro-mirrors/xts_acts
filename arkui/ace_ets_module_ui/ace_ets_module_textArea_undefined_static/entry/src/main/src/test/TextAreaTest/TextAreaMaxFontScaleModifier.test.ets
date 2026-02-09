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

export default function TextAreaMaxFontScaleModifierTest() {
  describe('TextAreaMaxFontScaleModifierTest', () => {
    beforeAll(() => {
      console.info("TextAreaMaxFontScaleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaMaxFontScaleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaMaxFontScaleModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaMaxFontScaleModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaMaxFontScaleModifier" == pages.name)) {
          console.info("get TextAreaMaxFontScaleModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaMaxFontScaleModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextAreaMaxFontScaleModifierTest_static_0010
         * @tc.name     TextAreaMaxFontScaleModifierTest_static_0010
         * @tc.desc     TextAreaMaxFontScaleModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaMaxFontScaleModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaMaxFontScaleModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextArea_MaxFontScale_Modifier_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextAreaMaxFontScaleModifierTest_static_0010] TextAreaMaxFontScaleModifierUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getString('maxFontScale')));
      expect(obj1.getElement('$attrs').getString('maxFontScale')).assertEqual('3.200000');
      let strJson2 = inspector.getInspectorByKey('TextArea_MaxFontScale_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextAreaMaxFontScaleModifierTest_static_0010] TextAreaMaxFontScaleModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('maxFontScale')));
      expect(obj2.getElement('$attrs').getString('maxFontScale')).assertEqual('1.100000');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextArea_MaxFontScale_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextArea_MaxFontScale_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextAreaMaxFontScaleModifierTest_static_0010] TextAreaMaxFontScaleModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('maxFontScale')));
      expect(obj3.getElement('$attrs').getString('maxFontScale')).assertEqual('3.200000');
      console.info('[TextAreaMaxFontScaleModifierTest_static_0010] END');
      done();
    });

  })
}
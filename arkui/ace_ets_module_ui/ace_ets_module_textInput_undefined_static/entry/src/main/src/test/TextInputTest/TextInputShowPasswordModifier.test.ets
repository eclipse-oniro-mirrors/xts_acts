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


export default function TextInputShowPasswordModifierTest() {
  describe('TextInputShowPasswordModifierTest', () => {
    beforeAll(() => {
      console.info("TextInputShowPasswordModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputShowPasswordModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputShowPasswordModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputShowPasswordModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextInputShowPasswordModifier" == pages.name)) {
          console.info("get TextInputShowPasswordModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputShowPasswordModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputShowPasswordModifierTest_static_0010
         * @tc.name     TextInputShowPasswordModifierTest_static_0010
         * @tc.desc     TextInputShowPasswordModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputShowPasswordModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputShowPasswordModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextInput_ShowPassword_Modifier_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextInputShowPasswordModifierTest_static_0010] TextInputShowPasswordModifierUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getBoolean('showPassword')));
      expect(obj1.getElement('$attrs').getBoolean('showPassword')).assertEqual(false);
      let strJson2 = inspector.getInspectorByKey('TextInput_ShowPassword_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextInputShowPasswordModifierTest_static_0010] TextInputShowPasswordModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getBoolean('showPassword')));
      expect(obj2.getElement('$attrs').getBoolean('showPassword')).assertEqual(true);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextInput_ShowPassword_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextInput_ShowPassword_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextInputShowPasswordModifierTest_static_0010] TextInputShowPasswordModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getBoolean('showPassword')));
      expect(obj3.getElement('$attrs').getBoolean('showPassword')).assertEqual(false);
      console.info('[TextInputShowPasswordModifierTest_static_0010] END');
      done();
    });

  })
}
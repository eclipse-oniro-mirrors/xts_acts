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


export default function TextInputShowPasswordIconModifierTest() {
  describe('TextInputShowPasswordIconModifierTest', () => {
    beforeAll(() => {
      console.info("TextInputShowPasswordIconModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputShowPasswordIconModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputShowPasswordIconModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputShowPasswordIconModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextInputShowPasswordIconModifier" == pages.name)) {
          console.info("get TextInputShowPasswordIconModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputShowPasswordIconModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputShowPasswordIconModifierTest_static_0010
         * @tc.name     TextInputShowPasswordIconModifierTest_static_0010
         * @tc.desc     TextInputShowPasswordIconModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputShowPasswordIconModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputShowPasswordIconModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextInput_ShowPasswordIcon_Modifier_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextInputShowPasswordIconModifierTest_static_0010] TextInputShowPasswordIconModifierUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getBoolean('showPasswordIcon')));
      expect(obj1.getElement('$attrs').getBoolean('showPasswordIcon')).assertEqual(true);
      let strJson2 = inspector.getInspectorByKey('TextInput_ShowPasswordIcon_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextInputShowPasswordIconModifierTest_static_0010] TextInputShowPasswordIconModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getBoolean('showPasswordIcon')));
      expect(obj2.getElement('$attrs').getBoolean('showPasswordIcon')).assertEqual(false);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextInput_ShowPasswordIcon_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextInput_ShowPasswordIcon_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextInputShowPasswordIconModifierTest_static_0010] TextInputShowPasswordIconModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getBoolean('showPasswordIcon')));
      expect(obj3.getElement('$attrs').getBoolean('showPasswordIcon')).assertEqual(true);
      console.info('[TextInputShowPasswordIconModifierTest_static_0010] END');
      done();
    });

  })
}
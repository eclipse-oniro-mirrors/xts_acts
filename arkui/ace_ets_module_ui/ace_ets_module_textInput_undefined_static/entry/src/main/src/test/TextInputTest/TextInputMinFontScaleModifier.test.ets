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


export default function TextInputMinFontScaleModifierTest() {
  describe('TextInputMinFontScaleModifierTest', () => {
    beforeAll(() => {
      console.info("TextInputMinFontScaleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputMinFontScaleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputMinFontScaleModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputMinFontScaleModifierTest state pages: " + JSON.stringify(pages));
        if (!("TextInputMinFontScaleModifier" == pages.name)) {
          console.info("get TextInputMinFontScaleModifierTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputMinFontScaleModifierTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputMinFontScaleModifierTest_static_0010
         * @tc.name     TextInputMinFontScaleModifierTest_static_0010
         * @tc.desc     TextInputMinFontScaleModifierTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputMinFontScaleModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputMinFontScaleModifierTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextInput_MinFontScale_Modifier_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextInputMinFontScaleModifierTest_static_0010] TextInputMinFontScaleModifierUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getString('minFontScale')));
      expect(obj1.getElement('$attrs').getString('minFontScale')).assertEqual('0.850000');
      let strJson2 = inspector.getInspectorByKey('TextInput_MinFontScale_Modifier_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextInputMinFontScaleModifierTest_static_0010] TextInputMinFontScaleModifierDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('minFontScale')));
      expect(obj2.getElement('$attrs').getString('minFontScale')).assertEqual('0.900000');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextInput_MinFontScale_Modifier_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextInput_MinFontScale_Modifier_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextInputMinFontScaleModifierTest_static_0010] TextInputMinFontScaleModifierDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('minFontScale')));
      expect(obj3.getElement('$attrs').getString('minFontScale')).assertEqual('0.850000');
      console.info('[TextInputMinFontScaleModifierTest_static_0010] END');
      done();
    });

  })
}
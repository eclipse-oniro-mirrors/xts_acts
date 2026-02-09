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


export default function TextInputSelectAllTest() {
  describe('TextInputSelectAllTest', () => {
    beforeAll(() => {
      console.info("TextInputSelectAllTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputSelectAllTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputSelectAllModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputSelectAllTest state pages: " + JSON.stringify(pages));
        if (!("TextInputSelectAll" == pages.name)) {
          console.info("get TextInputSelectAllTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputSelectAllTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputSelectAllTestModifier_static_0010
         * @tc.name     TextInputSelectAllTestModifier_static_0010
         * @tc.desc     TextInputSelectAllTestModifier_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputSelectAllTestModifier_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputSelectAllTestModifier_static_0010] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let textInput = await driver.findComponent(ON.id('TextInput')) as Component;
      let button = await driver.findComponent(ON.id('button_selectAll')) as Component;
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextInput');
      let obj = JSON.parseJsonElement(strJson);
      await textInput.click();
      await CommonFunc.sleep(1000);
      let result = obj.getElement('$attrs').getBoolean('selectAll');
      expect(result).assertEqual(false);
      await CommonFunc.sleep(1000);
      driver.pressBack();
      await CommonFunc.sleep(1000);

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      await textInput.click();
      await CommonFunc.sleep(1000);
      result = obj.getElement('$attrs').getBoolean('selectAll');
      expect(result).assertEqual(true);
      await CommonFunc.sleep(1000);
      driver.pressBack();
      await CommonFunc.sleep(1000);

      await button.click();
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('TextInput');
      obj = JSON.parseJsonElement(strJson);
      await textInput.click();
      await CommonFunc.sleep(1000);
      result = obj.getElement('$attrs').getBoolean('selectAll');
      expect(result).assertEqual(false);
      console.info('[TextInputSelectAllTestModifier_static_0010] END');
      done();
    });
  })
}
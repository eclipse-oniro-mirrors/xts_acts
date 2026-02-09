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


export default function TextInputLetterSpacing() {
  describe('TextInputLetterSpacing', () => {
    beforeAll(() => {
      console.info("TextInputLetterSpacing beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputLetterSpacing beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputLetterSpacing',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputLetterSpacing state pages: " + JSON.stringify(pages));
        if (!("TextAreaLetterSpacing" == pages.name)) {
          console.info("get TextInputLetterSpacing state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputLetterSpacing page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextInputLetterSpacing_static_0010
     * @tc.name     TextInputLetterSpacing_static_0010
     * @tc.desc     TextInputLetterSpacing_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextInputLetterSpacing_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputLetterSpacing_static_0010] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_letterSpacing')) as Component;

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('letterSpacing')
      expect(resultStr).assertEqual('2.00fp');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('letterSpacing')
      expect(resultStr).assertEqual('0.00px');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('letterSpacing')
      expect(resultStr).assertEqual('1.00fp');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('letterSpacing')
      expect(resultStr).assertEqual('0.00fp');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      resultStr = obj.getElement('$attrs').getString('letterSpacing')
      expect(resultStr).assertEqual('3.50vp');
      console.info('[TextInputLetterSpacing_static_0010] END');
      done();
    });
  })
}
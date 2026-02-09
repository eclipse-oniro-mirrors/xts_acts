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


export default function TextInputMinFontSizeTest() {
  describe('TextInputMinFontSizeTest', () => {
    beforeAll(() => {
      console.info("TextInputMinFontSizeTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputMinFontSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputMinFontSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputMinFontSizeTest state pages: " + JSON.stringify(pages));
        if (!("TextInputMinFontSize" == pages.name)) {
          console.info("get TextInputMinFontSizeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputMinFontSizeTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputMinFontSizeTest_static_0010
         * @tc.name     TextInputMinFontSizeTest_static_0010
         * @tc.desc     TextInputMinFontSizeTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputMinFontSizeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputMinFontSizeTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextInput_MinFontSize_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextInputMinFontSizeTest_static_0010] TextInputMinFontSizeUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getString('minFontSize')));
      expect(obj1.getElement('$attrs').getString('minFontSize')).assertEqual('0.00px');
      let strJson2 = inspector.getInspectorByKey('TextInput_MinFontSize_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextInputMinFontSizeTest_static_0010] TextInputMinFontSizeDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('minFontSize')));
      expect(obj2.getElement('$attrs').getString('minFontSize')).assertEqual('20.00fp');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextInput_MinFontSize_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextInput_MinFontSize_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextInputMinFontSizeTest_static_0010] TextInputMinFontSizeDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('minFontSize')));
      expect(obj3.getElement('$attrs').getString('minFontSize')).assertEqual('0.00px');
      console.info('[TextInputMinFontSizeTest_static_0010] END');
      done();
    });

  })
}
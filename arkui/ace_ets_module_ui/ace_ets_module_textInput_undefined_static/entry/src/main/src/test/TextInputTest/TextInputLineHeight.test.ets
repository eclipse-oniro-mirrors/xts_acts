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


export default function TextInputLineHeightTest() {
  describe('TextInputLineHeightTest', () => {
    beforeAll(() => {
      console.info("TextInputLineHeightTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputLineHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputLineHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputLineHeightTest state pages: " + JSON.stringify(pages));
        if (!("TextInputLineHeight" == pages.name)) {
          console.info("get TextInputLineHeightTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputLineHeightTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputLineHeightTest_static_0010
         * @tc.name     TextInputLineHeightTest_static_0010
         * @tc.desc     TextInputLineHeightTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputLineHeightTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputLineHeightTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('TextInput_LineHeight_Undefined0');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[TextInputLineHeightTest_static_0010] TextInputLineHeightUndefined: ' + JSON.stringify(obj1.getElement('$attrs').getString('lineHeight')));
      expect(obj1.getElement('$attrs').getString('lineHeight')).assertEqual('0.00vp');
      let strJson2 = inspector.getInspectorByKey('TextInput_LineHeight_Dynamic0');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[TextInputLineHeightTest_static_0010] TextInputLineHeightDynamic: ' + JSON.stringify(obj2.getElement('$attrs').getString('lineHeight')));
      expect(obj2.getElement('$attrs').getString('lineHeight')).assertEqual('40.00fp');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextInput_LineHeight_Button0')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson3 = inspector.getInspectorByKey('TextInput_LineHeight_Dynamic0');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[TextInputLineHeightTest_static_0010] TextInputLineHeightDynamic: ' + JSON.stringify(obj3.getElement('$attrs').getString('lineHeight')));
      expect(obj3.getElement('$attrs').getString('lineHeight')).assertEqual('0.00vp');
      console.info('[TextInputLineHeightTest_static_0010] END');
      done();
    });

  })
}
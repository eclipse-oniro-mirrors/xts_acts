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


export default function TextAreaStyleTest() {
  describe('TextAreaStyleTest', () => {
    beforeAll(() => {
      console.info("TextAreaStyleTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaStyle" == pages.name)) {
          console.info("get TextAreaStyleTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaStyleTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextAreaStyleTest_static_0010
         * @tc.name     TextAreaStyleTest_static_0010
         * @tc.desc     TextAreaStyleTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaStyleTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaStyleTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextContentStyle.DEFAULT');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_style')) as Component;

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextContentStyle.INLINE');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextContentStyle.DEFAULT');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextAreaTest');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('style')).assertEqual('TextContentStyle.INLINE');
      console.info('[TextAreaStyleTest_static_0010] END');
      done();
    });
  })
}
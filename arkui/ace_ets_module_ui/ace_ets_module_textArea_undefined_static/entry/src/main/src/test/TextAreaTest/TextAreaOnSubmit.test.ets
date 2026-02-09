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

export default function TextAreaOnSubmitTest() {
  describe('TextAreaOnSubmitTest', () => {
    beforeAll(() => {
      console.info("TextAreaOnSubmitTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaOnSubmitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaOnSubmit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnSubmitTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaOnSubmit" == pages.name)) {
          console.info("get TextAreaOnSubmitTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnSubmitTest page error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.number   TextAreaOnSubmitTest_static_0010
     * @tc.name     TextAreaOnSubmitTest_static_0010
     * @tc.desc     TextAreaOnSubmitTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('TextAreaOnSubmitTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextAreaOnSubmitTest_0010 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('enterKeyType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('4');
      let TextArea = await driver.findComponent(ON.id('TextAreaTest')) as Component;
      await TextArea.click();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('changeIsOnSubmitValid')) as Component;
      await button1.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('enterKeyType');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('2');

      await TextArea.doubleClick();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('changeIsOnSubmitValid')) as Component;
      await button2.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2054)
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('enterKeyType');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[TextAreaOnSubmitTest_0010] END');
      done();
    });
  })
}
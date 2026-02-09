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

export default function TextAreaHeightAdaptivePolicyTest() {
  describe('TextAreaHeightAdaptivePolicyTest', () => {
    beforeAll(() => {
      console.info("TextAreaHeightAdaptivePolicyTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaHeightAdaptivePolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaHeightAdaptivePolicy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("TextAreaHeightAdaptivePolicy" == pages.name)) {
          console.info("get TextAreaHeightAdaptivePolicyTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaHeightAdaptivePolicyTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0010
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0010
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0020
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0020
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0020] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button1')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0020] END');
      done();
    });


    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0030
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0030
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0030] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button2')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0030] END');
      done();
    });




    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0040
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0040
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0040] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button3')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0040] END');
      done();
    });




    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0050
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0050
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0050] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button4')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0050] TextAreaHeightAdaptivePolicy: ' + JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')));
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0050] END');
      done();
    });

    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0060
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0060
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0060
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0060] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button5')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0060] TextAreaHeightAdaptivePolicy: ' + JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')));
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0060] END');
      done();
    });

    /**
     * @tc.number   TextAreaHeightAdaptivePolicyTest_static_0070
     * @tc.name     TextAreaHeightAdaptivePolicyTest_static_0070
     * @tc.desc     TextAreaHeightAdaptivePolicyTest_static_0070
     * @tc.level    Level.LEVEL0
     */
    it('TextAreaHeightAdaptivePolicyTest_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0070] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button6')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextAreaTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0070] TextAreaHeightAdaptivePolicy: ' + JSON.stringify(obj.getElement('$attrs').getString('heightAdaptivePolicy')));
      let resultStr = obj.getElement('$attrs').getString('heightAdaptivePolicy')
      expect(resultStr).assertEqual(
        'TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info('[TextAreaHeightAdaptivePolicyTest_static_0070] END');
      done();
    });
  })
}
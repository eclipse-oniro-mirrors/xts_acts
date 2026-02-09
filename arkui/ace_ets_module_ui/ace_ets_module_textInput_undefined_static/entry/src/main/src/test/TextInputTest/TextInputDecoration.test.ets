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


export default function TextInputDecoration() {
  describe('TextInputDecoration', () => {
    beforeAll(() => {
      console.info("TextInputDecoration beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputDecoration beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputDecoration',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputDecoration state pages: " + JSON.stringify(pages));
        if (!("TextInputDecoration" == pages.name)) {
          console.info("get TextInputDecoration state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputDecoration page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextInputDecoration_static_0010
     * @tc.name     TextInputDecoration_static_0010
     * @tc.desc     TextInputDecoration_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0010] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.Underline","color":"#FFFF0000","style":"TextDecorationStyle.DOUBLE"}');
      console.info('[TextInputDecoration_static_0010] END');
      done();
    });

    /**
     * @tc.number   TextInputDecoration_static_0020
     * @tc.name     TextInputDecoration_static_0020
     * @tc.desc     TextInputDecoration_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0020] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button1')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0020] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.None","color":"#FF000000","style":"TextDecorationStyle.SOLID"}');
      console.info('[TextInputDecoration_static_0020] END');
      done();
    });


    /**
     * @tc.number   TextInputDecoration_static_0030
     * @tc.name     TextInputDecoration_static_0030
     * @tc.desc     TextInputDecoration_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0030] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button2')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0030] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.Overline","color":"#FF0000FF","style":"TextDecorationStyle.DASHED"}');
      console.info('[TextInputDecoration_static_0030] END');
      done();
    });




    /**
     * @tc.number   TextInputDecoration_static_0040
     * @tc.name     TextInputDecoration_static_0040
     * @tc.desc     TextInputDecoration_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0040] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button3')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0040] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.LineThrough","color":"#FF0000FF","style":"TextDecorationStyle.SOLID"}');
      console.info('[TextInputDecoration_static_0040] END');
      done();
    });




    /**
     * @tc.number   TextInputDecoration_static_0050
     * @tc.name     TextInputDecoration_static_0050
     * @tc.desc     TextInputDecoration_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0050] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button4')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0050] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.None","color":"#FF0000FF","style":"TextDecorationStyle.DOUBLE"}');
      console.info('[TextInputDecoration_static_0050] END');
      done();
    });

    /**
     * @tc.number   TextInputDecoration_static_0060
     * @tc.name     TextInputDecoration_static_0060
     * @tc.desc     TextInputDecoration_static_0060
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0060] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button5')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0060] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.LineThrough","color":"#FF000000","style":"TextDecorationStyle.DOUBLE"}');
      console.info('[TextInputDecoration_static_0060] END');
      done();
    });

    /**
     * @tc.number   TextInputDecoration_static_0070
     * @tc.name     TextInputDecoration_static_0070
     * @tc.desc     TextInputDecoration_static_0070
     * @tc.level    Level.LEVEL0
     */
    it('TextInputDecoration_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputDecoration_static_0070] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button6')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputDecoration_static_0070] TextInputDecoration: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));
      let resultStr = obj.getElement('$attrs').getString('decoration')
      expect(resultStr).assertEqual(
        '{"type":"TextDecorationType.Underline","color":"#FF0000FF","style":"TextDecorationStyle.SOLID"}');
      console.info('[TextInputDecoration_static_0070] END');
      done();
    });
  })
}
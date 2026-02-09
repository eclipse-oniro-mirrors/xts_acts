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


export default function TextInputEllipsisModeTest() {
  describe('TextInputEllipsisModeTest', () => {
    beforeAll(() => {
      console.info("TextInputEllipsisModeTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputEllipsisModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputEllipsisMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputEllipsisModeTest state pages: " + JSON.stringify(pages));
        if (!("TextInputEllipsisModeTest" == pages.name)) {
          console.info("get TextInputBarStateTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputEllipsisModeTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number   TextInputEllipsisModeTest_static_0010
     * @tc.name     TextInputEllipsisModeTest_static_0010
     * @tc.desc     TextInputEllipsisModeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('TextInputEllipsisModeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEllipsisModeTest_static_0010] START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputEllipsisModeTest_static_0010] TextInputEllipsisMode: ' + JSON.stringify(obj.getElement('$attrs').getString('ellipsisMode')));
      let resultStr = obj.getElement('$attrs').getString('ellipsisMode')
      expect(resultStr).assertEqual('EllipsisMode.START');
      console.info('[TextInputEllipsisModeTest_static_0010] END');
      done();
    });

    /**
     * @tc.number   TextInputEllipsisModeTest_static_0020
     * @tc.name     TextInputEllipsisModeTest_static_0020
     * @tc.desc     TextInputEllipsisModeTest_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('TextInputEllipsisModeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEllipsisModeTest_static_0020] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button1')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputEllipsisModeTest_static_0020] TextInputEllipsisMode: ' + JSON.stringify(obj.getElement('$attrs').getString('ellipsisMode')));
      let resultStr = obj.getElement('$attrs').getString('ellipsisMode')
      expect(resultStr).assertEqual('EllipsisMode.END');
      console.info('[TextInputEllipsisModeTest_static_0020] END');
      done();
    });

    /**
     * @tc.number   TextInputEllipsisModeTest_static_0030
     * @tc.name     TextInputEllipsisModeTest_static_0030
     * @tc.desc     TextInputEllipsisModeTest_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('TextInputEllipsisModeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEllipsisModeTest_static_0030] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button2')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputEllipsisModeTest_static_0030] TextInputEllipsisMode: ' + JSON.stringify(obj.getElement('$attrs').getString('ellipsisMode')));
      let resultStr = obj.getElement('$attrs').getString('ellipsisMode')
      expect(resultStr).assertEqual('EllipsisMode.START');
      console.info('[TextInputEllipsisModeTest_static_0030] END');
      done();
    });

    /**
     * @tc.number   TextInputEllipsisModeTest_static_0040
     * @tc.name     TextInputEllipsisModeTest_static_0040
     * @tc.desc     TextInputEllipsisModeTest_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('TextInputEllipsisModeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEllipsisModeTest_static_0040] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button3')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputEllipsisModeTest_static_0040] TextInputEllipsisMode: ' + JSON.stringify(obj.getElement('$attrs').getString('ellipsisMode')));
      let resultStr = obj.getElement('$attrs').getString('ellipsisMode')
      expect(resultStr).assertEqual('EllipsisMode.END');
      console.info('[TextInputEllipsisModeTest_static_0040] END');
      done();
    });

    /**
     * @tc.number   TextInputEllipsisModeTest_static_0050
     * @tc.name     TextInputEllipsisModeTest_static_0050
     * @tc.desc     TextInputEllipsisModeTest_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('TextInputEllipsisModeTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputEllipsisModeTest_static_0050] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button4')) as Component;
      await button.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TextInputEllipsisModeTest_static_0050] TextInputEllipsisMode: ' + JSON.stringify(obj.getElement('$attrs').getString('ellipsisMode')));
      let resultStr = obj.getElement('$attrs').getString('ellipsisMode')
      expect(resultStr).assertEqual('EllipsisMode.CENTER');
      console.info('[TextInputEllipsisModeTest_static_0050] END');
      done();
    });
  })
}
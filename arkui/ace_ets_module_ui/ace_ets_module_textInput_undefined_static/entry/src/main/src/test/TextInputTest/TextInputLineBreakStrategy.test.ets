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


export default function TextInputLineBreakStrategyTest() {
  describe('TextInputLineBreakStrategyTest', () => {
    beforeAll(() => {
      console.info("TextInputLineBreakStrategyTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputLineBreakStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputLineBreakStrategy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputLineBreakStrategyTest state pages: " + JSON.stringify(pages));
        if (!("TextInputLineBreakStrategy" == pages.name)) {
          console.info("get TextInputLineBreakStrategyTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputLineBreakStrategyTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
         * @tc.number   TextInputLineBreakStrategyTest_static_0010
         * @tc.name     TextInputLineBreakStrategyTest_static_0010
         * @tc.desc     TextInputLineBreakStrategyTest_static_0010
         * @tc.level    Level.LEVEL0
         */
    it('TextInputLineBreakStrategyTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputLineBreakStrategyTest_static_0010] START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('TextInputTest');
      let obj = JSON.parseJsonElement(strJson);
      let result = obj.getElement('$attrs').getString('lineBreakStrategy')
      expect(result).assertEqual('LineBreakStrategy.GREEDY');

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_lineBreakStrategy')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      result = obj.getElement('$attrs').getString('lineBreakStrategy')
      expect(result).assertEqual('LineBreakStrategy.HIGH_QUALITY');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      result = obj.getElement('$attrs').getString('lineBreakStrategy')
      expect(result).assertEqual('LineBreakStrategy.GREEDY');

      await button.click();
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('TextInputTest');
      obj = JSON.parseJsonElement(strJson);
      result = obj.getElement('$attrs').getString('lineBreakStrategy')
      expect(result).assertEqual('LineBreakStrategy.BALANCED');
      await CommonFunc.sleep(1000);
      console.info('[TextInputLineBreakStrategyTest_static_0010] END');
      done();
    });
  })
}
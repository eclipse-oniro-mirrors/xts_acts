'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAreaOnEditChange() {
  describe('TextAreaOnEditChange', () => {
    beforeAll(() => {
      console.info("TextAreaOnEditChange beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextAreaOnEditChange beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaOnEditChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnEditChange state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextAreaOnEditChange" == pages.name)) {
          console.info("get TextAreaOnEditChange state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnEditChange page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaOnEditChange after each called");
    });

/**
         * @tc.number   TextAreaOnEditChange_static_001
         * @tc.name     TextAreaOnEditChange_static_001
         * @tc.desc     TextAreaOnEditChange_static_001
         * @tc.level    Level.LEVEL0
         */
it('TextAreaOnEditChange_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAreaOnEditChange_static001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextArea')) as Component;
      let text2 = await driver.findComponent(ON.id('Modifier')) as Component;
      let button = await driver.findComponent(ON.id('change')) as Component;
      await text.inputText('9');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('9');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('TextAreaText')
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(500);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('00');
      await button.click();
      await text.inputText('6');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('6');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey('TextAreaText')
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('22');
      await button.click();
      await text.inputText('6');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(500);
      await text2.inputText('6');
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(200);
      let strJson3 = inspector.getInspectorByKey('TextAreaText')
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('22');
      console.info('[TextAreaOnEditChange_static001] END');
      done();
    });
  })
}
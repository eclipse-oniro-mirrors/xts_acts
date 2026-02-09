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

export default function TextInputMaxFontSize() {
  describe('TextInputMaxFontSize', () => {
    beforeAll(() => {
      console.info("TextInputMaxFontSize beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputMaxFontSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputMaxFontSize state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextInputMaxFontSize" == pages.name)) {
          console.info("get TextInputMaxFontSize state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputMaxFontSize page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputMaxFontSize after each called");
    });

/**
         * @tc.number   TextInputMaxFontSize_static_001
         * @tc.name     TextInputMaxFontSize_static_001
         * @tc.desc     TextInputMaxFontSize_static_001
         * @tc.level    Level.LEVEL0
         */
it('TextInputMaxFontSize_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputMaxFontSize_static001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('TextInput');
      let m_strJson = inspector.getInspectorByKey('Modifier');
      let obj = JSON.parseJsonElement(strJson);
      let m_obj = JSON.parseJsonElement(m_strJson);
      let button = await driver.findComponent(ON.id('change')) as Component;
      expect(obj.getElement('$attrs').getString('maxFontSize')).assertEqual('0.00px');
      expect(m_obj.getElement('$attrs').getString('maxFontSize')).assertEqual('0.00px');
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('TextInput');
      let m_strJson1 = inspector.getInspectorByKey('Modifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      let m_obj1 = JSON.parseJsonElement(m_strJson1);
      expect(obj1.getElement('$attrs').getString('maxFontSize')).assertEqual('10.00fp');
      expect(m_obj1.getElement('$attrs').getString('maxFontSize')).assertEqual('10.00fp');
      await button.click();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('TextInput');
      let m_strJson2 = inspector.getInspectorByKey('Modifier');
      let obj2 = JSON.parseJsonElement(strJson2);
      let m_obj2 = JSON.parseJsonElement(m_strJson2);
      expect(obj2.getElement('$attrs').getString('maxFontSize')).assertEqual('0.00px');
      expect(m_obj2.getElement('$attrs').getString('maxFontSize')).assertEqual('0.00px');
      done();
    });
  })
}
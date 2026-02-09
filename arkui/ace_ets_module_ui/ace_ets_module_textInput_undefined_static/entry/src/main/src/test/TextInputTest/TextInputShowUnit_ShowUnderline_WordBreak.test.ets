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

export default function TextInputShowUnit_ShowUnderline_WordBreak() {
  describe('TextInputShowUnit_ShowUnderline_WordBreak', () => {
    beforeAll(() => {
      console.info("TextInputShowUnit_ShowUnderline_WordBreak beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("TextInputShowUnit_ShowUnderline_WordBreak beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputShowUnit_ShowUnderline_WordBreak',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputShowUnit_ShowUnderline_WordBreak state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("TextInputShowUnit_ShowUnderline_WordBreak" == pages.name)) {
          console.info("get TextInputShowUnit_ShowUnderline_WordBreak state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputShowUnit_ShowUnderline_WordBreak page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputShowUnit_ShowUnderline_WordBreak after each called");
    });

/**
         * @tc.number   TextInputShowUnit_ShowUnderline_WordBreak_static_001
         * @tc.name     TextInputShowUnit_ShowUnderline_WordBreak_static_001
         * @tc.desc     TextInputShowUnit_ShowUnderline_WordBreak_static_001
         * @tc.level    Level.LEVEL0
         */
it('TextInputShowUnit_ShowUnderline_WordBreak_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextInputShowUnit_ShowUnderline_WordBreak_static001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_ShowUnderline_showUnit'));
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_wordBreak'));
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('TextArea_wordBreak'));
      let button1 = await driver.findComponent(ON.id('showUnderline')) as Component;
      let button2 = await driver.findComponent(ON.id('showUnit')) as Component;
      let button3 = await driver.findComponent(ON.id('wordBreak')) as Component;
      expect(JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('showUnderline'))).assertEqual('false');
      expect(JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('wordBreak'))).assertEqual('"break-word"');
      expect(JSON.stringifyJsonElement(obj3.getElement('$attrs').getElement('wordBreak'))).assertEqual('"break-word"');
      await button1.click();
      await button2.click();
      await button3.click();
      await CommonFunc.sleep(1000);
      let obj11 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_ShowUnderline_showUnit'));
      let obj21 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_wordBreak'));
      let obj31 = JSON.parseJsonElement(inspector.getInspectorByKey('TextArea_wordBreak'));
      expect(JSON.stringifyJsonElement(obj11.getElement('$attrs').getElement('showUnderline'))).assertEqual('true');
      expect(JSON.stringifyJsonElement(obj21.getElement('$attrs').getElement('wordBreak'))).assertEqual('"normal"');
      expect(JSON.stringifyJsonElement(obj31.getElement('$attrs').getElement('wordBreak'))).assertEqual('"normal"');
      await button1.click();
      await button2.click();
      await button3.click();
      await CommonFunc.sleep(500);
      await button3.click();
      await CommonFunc.sleep(500);
      let obj12 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_ShowUnderline_showUnit'));
      let obj22 = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput_wordBreak'));
      let obj32 = JSON.parseJsonElement(inspector.getInspectorByKey('TextArea_wordBreak'));
      expect(JSON.stringifyJsonElement(obj12.getElement('$attrs').getElement('showUnderline'))).assertEqual('false');
      expect(JSON.stringifyJsonElement(obj22.getElement('$attrs').getElement('wordBreak'))).assertEqual('"break-word"');
      expect(JSON.stringifyJsonElement(obj32.getElement('$attrs').getElement('wordBreak'))).assertEqual('"break-word"');
      done();
    });
  })
}



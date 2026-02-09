'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextInputFontColor() {
  describe('TextInputFontColor', () => {
    beforeAll(() => {
      console.info("TextInputFontColor beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputFontColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputFontColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputFontColor state pages:" + JSON.stringify(pages));
        if (!("TextInputFontColor" == pages.name)) {
          console.info("get TextInputFontColor pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputFontColor page error:" + err);
      }
      console.info("TextInputFontColor beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputFontColor after each called");
    })

    /**
         * @tc.number   TextInputFontColor_static_0100
         * @tc.name     TextInputFontColor_static_0100
         * @tc.desc     TextInputFontColor_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputFontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputFontColor0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('TextInput_FontColor_001');
      console.info('[' + tagName + '] fontColor is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('fontColor')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFF00');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('button1')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextInput_FontColor_001');
      console.info('[' + tagName + '] fontColor is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('fontColor')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('fontColor')).assertEqual('#FF182431');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

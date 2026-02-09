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

export default function TextInputEnableHapticFeedback() {
  describe('TextInputEnableHapticFeedback', () => {
    beforeAll(() => {
      console.info("TextInputEnableHapticFeedback beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputEnableHapticFeedback beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputEnableHapticFeedback",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputEnableHapticFeedback state pages:" + JSON.stringify(pages));
        if (!("TextInputEnableHapticFeedback" == pages.name)) {
          console.info("get TextInputEnableHapticFeedback pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputEnableHapticFeedback page error:" + err);
      }
      console.info("TextInputEnableHapticFeedback beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputEnableHapticFeedback after each called");
    })

    /**
         * @tc.number   TextInputEnableHapticFeedback_static_0100
         * @tc.name     TextInputEnableHapticFeedback_static_0100
         * @tc.desc     TextInputEnableHapticFeedback_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputEnableHapticFeedback_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputEnableHapticFeedback0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('TextInput_enableHapticFeedback_001');
      console.info('[' + tagName + '] enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('enableHapticFeedbackButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextInput_enableHapticFeedback_001');
      console.info('[' + tagName + '] enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

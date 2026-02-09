'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
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

export default function TextInputPasswordRulesModifier() {
  describe('TextInputPasswordRulesModifier', () => {
    beforeAll(() => {
      console.info("TextInputPasswordRulesModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputPasswordRulesModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputPasswordRulesModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputPasswordRulesModifier state pages:" + JSON.stringify(pages));
        if (!("TextInputPasswordRulesModifier" == pages.name)) {
          console.info("get TextInputPasswordRulesModifier pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputPasswordRulesModifier page error:" + err);
      }
      console.info("TextInputPasswordRulesModifier beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputPasswordRulesModifier after each called");
    })

    /**
         * @tc.number   TextInputPasswordRulesModifier_static_0100
         * @tc.name     TextInputPasswordRulesModifier_static_0100
         * @tc.desc     TextInputPasswordRulesModifier_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputPasswordRulesModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputPasswordRulesModifier0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('TextInput_passwordRules_001');
      console.info('[' + tagName + '] passwordRules is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('passwordRules')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('passwordRules')).assertEqual('begin:[lower],special:[yes],len:[maxlen:32,minlen:12]');

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('passwordRulesButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextInput_passwordRules_001');
      console.info('[' + tagName + '] passwordRules is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('passwordRules')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('passwordRules')).assertEqual('');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

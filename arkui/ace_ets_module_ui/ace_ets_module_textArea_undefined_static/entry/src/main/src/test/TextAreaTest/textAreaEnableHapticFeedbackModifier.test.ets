'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TextAreaEnableHapticFeedbackModifier() {
  describe('TextAreaEnableHapticFeedbackModifier', () => {
    beforeAll(() => {
      console.info("TextAreaEnableHapticFeedbackModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaEnableHapticFeedbackModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaEnableHapticFeedbackModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaEnableHapticFeedbackModifier state pages:" + JSON.stringify(pages));
        if (!("TextAreaEnableHapticFeedbackModifier" == pages.name)) {
          console.info("get TextAreaEnableHapticFeedbackModifier pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaEnableHapticFeedbackModifier page error:" + err);
      }
      console.info("TextAreaEnableHapticFeedbackModifier beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaEnableHapticFeedbackModifier after each called");
    })

    /**
     * @tc.number   TextAreaEnableHapticFeedbackModifier_static_001
     * @tc.name     TextAreaEnableHapticFeedbackModifier_static_001
     * @tc.desc     Test the fontWeight interface to switch normal values to undefined
     * @tc.level    Level.LEVEL1
     */
    it('TextAreaEnableHapticFeedbackModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TextAreaEnableHapticFeedbackModifier_static_001';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextAreaEnableHapticFeedbackModifierButton'))
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('TextAreaEnableHapticFeedbackModifier');
      console.info('[' + tagName + '] Search enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');

      let button1 = await driver.findComponent(ON.id('TextAreaEnableHapticFeedbackModifierButton'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('TextAreaEnableHapticFeedbackModifier');
      console.info('[' + tagName + '] Search enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
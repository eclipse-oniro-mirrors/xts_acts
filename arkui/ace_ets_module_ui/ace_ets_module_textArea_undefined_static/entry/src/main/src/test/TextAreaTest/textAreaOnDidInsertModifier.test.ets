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

export default function TextAreaOnDidInsertModifier() {
  describe('TextAreaOnDidInsertModifier', () => {
    beforeAll(() => {
      console.info("TextAreaOnDidInsertModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaOnDidInsertModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaOnDidInsertModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnDidInsertModifier state pages:" + JSON.stringify(pages));
        if (!("TextAreaOnDidInsertModifier" == pages.name)) {
          console.info("get TextAreaOnDidInsertModifier pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnDidInsertModifier page error:" + err);
      }
      console.info("TextAreaOnDidInsertModifier beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaOnDidInsertModifier after each called");
    })

    /**
         * @tc.number   TextAreaOnDidInsertModifier_static_0100
         * @tc.name     TextAreaOnDidInsertModifier_static_0100
         * @tc.desc     TextAreaOnDidInsertModifier_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaOnDidInsertModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextAreaOnDidInsertModifier_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextAreaOnDidInsertModifierText')) as Component;
      let textArea = await driver.findComponent(ON.id('TextAreaOnDidInsertModifier')) as Component;
      let btn_true = await driver.findComponent(ON.id('TextAreaOnDidInsertModifierButton')) as Component;
      await textArea.inputText('1');
      await CommonFunc.sleep(1000);

      let strJsonNew = inspector.getInspectorByKey('TextAreaOnDidInsertModifierText');
      console.info('[' + tagName + '] insertValue is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('');

      await CommonFunc.sleep(1000);
      await btn_true.click();
      await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      await textArea.inputText('6');

      let strJsonNew1 = inspector.getInspectorByKey('TextAreaOnDidInsertModifierText');
      console.info('[' + tagName + '] insertValue is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}



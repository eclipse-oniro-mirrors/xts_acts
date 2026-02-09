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

export default function TextAreaShowCounterModifier() {
  describe('TextAreaShowCounterModifier', () => {
    beforeAll(() => {
      console.info("TextAreaShowCounterModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaShowCounterModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaShowCounterModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaShowCounterModifier state pages:" + JSON.stringify(pages));
        if (!("TextAreaShowCounterModifier" == pages.name)) {
          console.info("get TextAreaShowCounterModifier pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaShowCounterModifier page error:" + err);
      }
      console.info("TextAreaShowCounterModifier beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputShowCounter after each called");
    })

    /**
         * @tc.number   TextAreaShowCounterModifier_static_0100
         * @tc.name     TextAreaShowCounterModifier_static_0100
         * @tc.desc     TextAreaShowCounterModifier_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaShowCounterModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextAreaShowCounterModifier0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew1 = inspector.getInspectorByKey('TextAreaShowCounterModifier_001');
      console.info('[' + tagName + '] showCounter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getElement('showCounter')
        .getBoolean('value')));
      expect(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getElement('showCounter')
        .getBoolean('value')).assertEqual(false);

      let strJsonNew2 = inspector.getInspectorByKey('TextAreaShowCounterModifier_002');
      console.info('[' + tagName + '] thresholdPercentage is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew2)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getDouble('thresholdPercentage')));
      expect(JSON.parseJsonElement(strJsonNew2)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getDouble('thresholdPercentage')).assertEqual(50);

      let strJsonNew3 = inspector.getInspectorByKey('TextAreaShowCounterModifier_003');
      console.info('[' + tagName + '] highlightBorder is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew3)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getBoolean('highlightBorder')));
      expect(JSON.parseJsonElement(strJsonNew3)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getBoolean('highlightBorder')).assertEqual(false);

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('TextAreaShowCounterModifierButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJsonNew4 = inspector.getInspectorByKey('TextAreaShowCounterModifier_001');
      console.info('[' + tagName + '] showCounter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew4)
        .getElement('$attrs')
        .getElement('showCounter')
        .getBoolean('value')));
      expect(JSON.parseJsonElement(strJsonNew4)
        .getElement('$attrs')
        .getElement('showCounter')
        .getBoolean('value')).assertEqual(true);

      let strJsonNew5 = inspector.getInspectorByKey('TextAreaShowCounterModifier_002');
      console.info('[' + tagName + '] thresholdPercentage is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew5)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getDouble('thresholdPercentage')));
      expect(JSON.parseJsonElement(strJsonNew5)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getDouble('thresholdPercentage')).assertEqual(-1);

      let strJsonNew6 = inspector.getInspectorByKey('TextAreaShowCounterModifier_003');
      console.info('[' + tagName + '] highlightBorder is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew6)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getBoolean('highlightBorder')));
      expect(JSON.parseJsonElement(strJsonNew6)
        .getElement('$attrs')
        .getElement('showCounter')
        .getElement('options')
        .getBoolean('highlightBorder')).assertEqual(true);

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

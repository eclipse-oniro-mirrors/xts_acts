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

export default function TextInputTextOverFlowModifier() {
  describe('TextInputTextOverFlowModifier', () => {
    beforeAll(() => {
      console.info("TextInputTextOverFlowModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputTextOverFlowModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputTextOverFlowModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputTextOverFlowModifier state pages:" + JSON.stringify(pages));
        if (!("TextInputTextOverFlowModifier" == pages.name)) {
          console.info("get TextInputTextOverFlowModifier pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputTextOverFlowModifier page error:" + err);
      }
      console.info("TextInputTextOverFlowModifier beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputTextOverFlowModifier after each called");
    })

    /**
         * @tc.number   TextInputTextOverFlowModifier_static_0100
         * @tc.name     TextInputTextOverFlowModifier_static_0100
         * @tc.desc     TextInputTextOverFlowModifier_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputTextOverFlowModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputTextOverFlowModifier0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('TextInput_textOverflow_001');
      console.info('[' + tagName + '] textOverflow is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('textOverflow')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Clip');

      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput_textOverflow_001')) as Component;
      let btn_true = await driver.findComponent(ON.id('textOverflowButton')) as Component;
      await btn_true.click();
      await text.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextInput_textOverflow_001');
      console.info('[' + tagName + '] textOverflow is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('textOverflow')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Ellipsis');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

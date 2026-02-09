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

export default function TextInputOnDidDelete() {
  describe('TextInputOnDidDelete', () => {
    beforeAll(() => {
      console.info("TextInputOnDidDelete beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputOnDidDelete beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputOnDidDelete",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputOnDidDelete state pages:" + JSON.stringify(pages));
        if (!("TextInputOnDidDelete" == pages.name)) {
          console.info("get TextInputOnDidDelete pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputOnDidDelete page error:" + err);
      }
      console.info("TextInputOnDidDelete beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputOnDidDelete after each called");
    })

    /**
         * @tc.number   TextInputOnDidDelete_static_0100
         * @tc.name     TextInputOnDidDelete_static_0100
         * @tc.desc     TextInputOnDidDelete_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputOnDidDelete_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputOnDidDelete0100';
      console.info('[' + tagName + '] START============================');

      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput_onDidDelete_001')) as Component;
      let btn_true = await driver.findComponent(ON.id('onDidDeleteButton')) as Component;
      await text.inputText('1');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);

      let strJsonNew = inspector.getInspectorByKey('DeleteValue');
      console.info('[' + tagName + '] onDidDelete is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('');

      await btn_true.click();
      await CommonFunc.sleep(1000);
      await text.inputText('6');
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('DeleteValue');
      console.info('[' + tagName + '] onDidDelete is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
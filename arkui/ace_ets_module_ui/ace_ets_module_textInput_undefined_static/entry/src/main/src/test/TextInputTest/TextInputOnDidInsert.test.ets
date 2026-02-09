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

export default function TextInputOnDidInsert() {
  describe('TextInputOnDidInsert', () => {
    beforeAll(() => {
      console.info("TextInputOnDidInsert beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputOnDidInsert beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputOnDidInsert",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputOnDidInsert state pages:" + JSON.stringify(pages));
        if (!("TextInputOnDidInsert" == pages.name)) {
          console.info("get TextInputOnDidInsert pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputOnDidInsert page error:" + err);
      }
      console.info("TextInputOnDidInsert beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputOnDidInsert after each called");
    })

    /**
         * @tc.number   TextInputOnDidInsert_static_0100
         * @tc.name     TextInputOnDidInsert_static_0100
         * @tc.desc     TextInputOnDidInsert_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputOnDidInsert_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputOnDidInsert0100';
      console.info('[' + tagName + '] START============================');

      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextInput_onDidInsert_001')) as Component;
      let btn_true = await driver.findComponent(ON.id('onDidInsertButton')) as Component;
      await text.inputText('1');
      await CommonFunc.sleep(1000);

      let strJsonNew = inspector.getInspectorByKey('InsertValue');
      console.info('[' + tagName + '] insertValue is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('');

      await CommonFunc.sleep(1000);
      await btn_true.click();
      await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      await text.inputText('6');
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('InsertValue');
      console.info('[' + tagName + '] insertValue is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('6');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}



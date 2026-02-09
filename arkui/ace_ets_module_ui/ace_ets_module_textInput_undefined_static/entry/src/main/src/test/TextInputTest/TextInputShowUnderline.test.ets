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

export default function TextInputShowUnderline() {
  describe('TextInputShowUnderline', () => {
    beforeAll(() => {
      console.info("TextInputShowUnderline beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textInput.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputShowUnderline beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputShowUnderline",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputShowUnderline state pages:" + JSON.stringify(pages));
        if (!("TextInputShowUnderline" == pages.name)) {
          console.info("get TextInputShowUnderline pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputShowUnderline page error:" + err);
      }
      console.info("TextInputShowUnderline beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInputShowUnderline after each called");
    })

    /**
         * @tc.number   TextInputShowUnderline_static_0100
         * @tc.name     TextInputShowUnderline_static_0100
         * @tc.desc     TextInputShowUnderline_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextInputShowUnderline_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextInputShowUnderline0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = inspector.getInspectorByKey('TextInput_showUnderline_001');
      console.info('[' + tagName + '] showUnderline is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getBoolean('showUnderline')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('showUnderline')).assertEqual(true);

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('showUnderlineButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextInput_showUnderline_001');
      console.info('[' + tagName + '] showUnderline is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getBoolean('showUnderline')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getBoolean('showUnderline')).assertEqual(false);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

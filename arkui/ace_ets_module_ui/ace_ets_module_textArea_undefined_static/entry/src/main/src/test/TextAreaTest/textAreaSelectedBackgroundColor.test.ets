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

export default function TextAreaSelectedBackgroundColor() {
  describe('TextAreaSelectedBackgroundColor', () => {
    beforeAll(() => {
      console.info("TextAreaSelectedBackgroundColor beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaSelectedBackgroundColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaSelectedBackgroundColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaSelectedBackgroundColor state pages:" + JSON.stringify(pages));
        if (!("TextAreaSelectedBackgroundColor" == pages.name)) {
          console.info("get TextAreaSelectedBackgroundColor pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaSelectedBackgroundColor page error:" + err);
      }
      console.info("TextAreaSelectedBackgroundColor beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaSelectedBackgroundColor after each called");
    })

    /**
     * @tc.number   TextAreaSelectedBackgroundColor_static_001
     * @tc.name     TextAreaSelectedBackgroundColor_static_001
     * @tc.desc     Test the fontWeight interface to switch normal values to undefined
     * @tc.level    Level.LEVEL1
     */
    it('TextAreaSelectedBackgroundColor_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'TextAreaSelectedBackgroundColor_static_001';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('TextAreaSelectedBackgroundColorButton'))
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('TextAreaSelectedBackgroundColor');
      console.info('[' + tagName + '] Search selectedBackgroundColor is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('selectedBackgroundColor')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('selectedBackgroundColor')).assertEqual('#33007DFF');

      let button1 = await driver.findComponent(ON.id('TextAreaSelectedBackgroundColorButton'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('TextAreaSelectedBackgroundColor');
      console.info('[' + tagName + '] Search selectedBackgroundColor is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('selectedBackgroundColor')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('selectedBackgroundColor')).assertEqual('#33FF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
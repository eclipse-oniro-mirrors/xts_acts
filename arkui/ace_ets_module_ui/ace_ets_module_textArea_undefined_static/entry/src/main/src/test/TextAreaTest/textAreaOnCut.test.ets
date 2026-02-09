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

function doCopy(driver: Driver, componentId: string){
  let text = await driver.findComponent(ON.id(componentId)) as Component;
  await text.longClick();
  await CommonFunc.sleep(500);
  let textInput = await driver.findComponent(ON.text('剪切')) as Component;
  await textInput.click();
  await CommonFunc.sleep(500);
}

export default function TextAreaOnCut() {
  describe('TextAreaOnCut', () => {
    beforeAll(() => {
      console.info("TextAreaOnCut beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaOnCut beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textAreaOnCut",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaOnCut state pages:" + JSON.stringify(pages));
        if (!("TextAreaOnCut" == pages.name)) {
          console.info("get TextAreaOnCut pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAreaOnCut page error:" + err);
      }
      console.info("TextAreaOnCut beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAreaOnCut after each called");
    })

    /**
         * @tc.number   TextAreaOnCut_static_0100
         * @tc.name     TextAreaOnCut_static_0100
         * @tc.desc     TextAreaOnCut_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('TextAreaOnCut_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'TextAreaOnCut_0100';
      console.info('[' + tagName + '] START============================');

      let driver = Driver.create();
      let text = await driver.findComponent(ON.id('TextAreaOnCut')) as Component;
      let btn_true = await driver.findComponent(ON.id('TextAreaOnCutButton')) as Component;
      await text.inputText('1');
      await CommonFunc.sleep(1000);
      await text.longClick();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.text('全选')) as Component;
      await CommonFunc.sleep(1000);
      button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.text('剪切')) as Component;
      await CommonFunc.sleep(1000);
      button1.click();
      await CommonFunc.sleep(1000);

      let strJsonNew = inspector.getInspectorByKey('TextAreaOnCut');
      console.info('[' + tagName + '] onCut is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('');

      await CommonFunc.sleep(1000);
      btn_true.click();
      await CommonFunc.sleep(1000);
      await text.inputText('3');
      await CommonFunc.sleep(1000);
      await text.longClick();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.text('全选')) as Component;
      await CommonFunc.sleep(1000);
      button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.text('剪切')) as Component;
      await CommonFunc.sleep(1000);
      button3.click();
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('TextAreaOnCut');
      console.info('[' + tagName + '] onCut is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('3');
      done();
    });
  })
}
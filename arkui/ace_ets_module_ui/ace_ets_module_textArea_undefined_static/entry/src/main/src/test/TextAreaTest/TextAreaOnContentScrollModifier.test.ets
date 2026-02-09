'use static'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textAreaOnContentScrollModifier() {
  describe('textAreaOnContentScrollModifier', () => {
    beforeAll(() => {
      console.info("textAreaOnContentScrollModifier beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaOnContentScrollModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaOnContentScrollModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaOnContentScrollModifier state pages:" + JSON.stringify(pages));
        if (!("textAreaOnContentScrollModifier" == pages.name)) {
          console.info("get textAreaOnContentScrollModifier pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaOnContentScrollModifier page error:" + err);
      }
      console.info("textAreaOnContentScrollModifier beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnContentScrollModifier after each called");
    })


    /**
     * @tc.number   textAreaOnContentScrollModifier_static_0100
     * @tc.name     textAreaOnContentScrollModifier_static_0100
     * @tc.desc     textAreaOnContentScrollModifier_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textAreaOnContentScrollModifier_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaOnContentScrollModifier0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      //正常值
      let text = await driver.findComponent(ON.id('key_textArea_onContentScroll_002'))
      await (text?.inputText('这是测试文本1') as Promise<void>)
      await CommonFunc.sleep(500);
      driver.triggerKey(2054);
      await CommonFunc.sleep(500);
      driver.triggerKey(2054);
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('test_text_onContentScroll1');
      console.info('[' + tagName + '] Search onContentScroll is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      //expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
      //undefined
      let text1 = await driver.findComponent(ON.id('key_textArea_onContentScroll_002'))
      await (text1?.inputText('placeholder(TextArea)') as Promise<void>)
      await CommonFunc.sleep(2000);
      let button1 = await driver.findComponent(ON.id('button_onContentScroll1'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(1000);
      driver.triggerKey(2054);
      await CommonFunc.sleep(500);
      driver.triggerKey(2054);
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('test_text_onContentScroll1');
      console.info('[' + tagName + '] Search onContentScroll is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      //expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

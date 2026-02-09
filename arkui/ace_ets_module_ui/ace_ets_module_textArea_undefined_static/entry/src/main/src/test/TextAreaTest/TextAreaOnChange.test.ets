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

export default function textAreaOnChange() {
  describe('textAreaOnChange', () => {
    beforeAll(() => {
      console.info("textAreaOnChange beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaOnChange beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaOnChange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaOnChange state pages:" + JSON.stringify(pages));
        if (!("textAreaOnChange" == pages.name)) {
          console.info("get textAreaOnChange pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaOnChange page error:" + err);
      }
      console.info("textAreaOnChange beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnChange after each called");
    })


    /**
     * @tc.number   textAreaOnChange_static_0100
     * @tc.name     textAreaOnChange_static_0100
     * @tc.desc     textAreaOnChange_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textAreaOnChange_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaOnChange0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      //undefined
      let text = await driver.findComponent(ON.id('key_textArea_onChange_001'))
      await (text?.inputText('这是测试文本1') as Promise<void>)
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('test_text_onChange');
      console.info('[' + tagName + '] Search onWillChange is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('false');
      //正常值
      let button1 = await driver.findComponent(ON.id('button_onChange'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let text1 = await driver.findComponent(ON.id('key_textArea_onChange_001'))
      await (text1?.inputText('这是测试文本2') as Promise<void>)
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('test_text_onChange');
      console.info('[' + tagName + '] Search onChange is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

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

export default function textAreaInputFilter() {
  describe('textAreaInputFilter', () => {
    beforeAll(() => {
      console.info("textAreaInputFilter beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.textArea.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaInputFilter beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaInputFilter",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaInputFilter state pages:" + JSON.stringify(pages));
        if (!("textAreaOnChange" == pages.name)) {
          console.info("get textAreaInputFilter pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaInputFilter page error:" + err);
      }
      console.info("textAreaInputFilter beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputFilter after each called");
    })


    /**
     * @tc.number   textAreaInputFilter_static_0100
     * @tc.name     textAreaInputFilter_static_0100
     * @tc.desc     textAreaInputFilter_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textAreaInputFilter_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'textAreaInputFilter';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      //undefined
      let text = await driver.findComponent(ON.id('key_textArea_inputFilter_001'))
      await (text?.inputText('这是测试文本1') as Promise<void>)
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('key_textArea_inputFilter_001');
      console.info('[' + tagName + '] Search inputFilter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('inputFilter')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('inputFilter')).assertEqual('');
      //正常值
      let button1 = await driver.findComponent(ON.id('button_inputFilter'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let text1 = await driver.findComponent(ON.id('key_textArea_inputFilter_001'))
      await (text1?.inputText('这是测试文本2') as Promise<void>)
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('key_textArea_inputFilter_001');
      console.info('[' + tagName + '] Search inputFilter is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('inputFilter')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('inputFilter')).assertEqual('[a-zA-Z]+');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

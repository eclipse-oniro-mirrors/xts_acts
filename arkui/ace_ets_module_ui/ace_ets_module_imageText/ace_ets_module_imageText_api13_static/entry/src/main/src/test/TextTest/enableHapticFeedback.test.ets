'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll  } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
let domain: Int = 0x0000;

let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function EnableHapticFeedbackTest() {
  describe('EnableHapticFeedbackTest', () => {
    beforeAll(() => {
      console.info("EnableHapticFeedbackTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api13.static", "EntryAbility")
    });


    beforeEach(async (): Promise<void> => {
      console.info("EnableHapticFeedbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/enableHapticFeedback',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get EnableHapticFeedbackTest state pages: " + JSON.stringify(pages));
        if (!("enableHapticFeedback" == pages.name)) {
          console.info("get EnableHapticFeedbackTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push EnableHapticFeedbackTest page error: " + err);
        expect().assertFail();
      }
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0010
     * @tc.name     EnableHapticFeedbackTest_static_0010
     * @tc.desc     EnableHapticFeedbackTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('Text_enableHapticFeedback_default');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0010] Text: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0010] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0020
     * @tc.name     EnableHapticFeedbackTest_static_0020
     * @tc.desc     EnableHapticFeedbackTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0020] START');
      let strJson =inspector.getInspectorByKey('Text_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0020] Text: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0020] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0030
     * @tc.name     EnableHapticFeedbackTest_static_0030
     * @tc.desc     EnableHapticFeedbackTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0030] click succ');
      let strJson = inspector.getInspectorByKey('Text_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0030] Text: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_static_0030] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0040
     * @tc.name     EnableHapticFeedbackTest_static_0040
     * @tc.desc     EnableHapticFeedbackTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0040] click succ');
      let strJson = inspector.getInspectorByKey('Text_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0040] Text: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0040] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0050
     * @tc.name     EnableHapticFeedbackTest_static_0050
     * @tc.desc     EnableHapticFeedbackTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0050] START');
      let strJson = inspector.getInspectorByKey('TextInput_enableHapticFeedback_default');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0050] TextInput: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0050] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0060
     * @tc.name     EnableHapticFeedbackTest_static_0060
     * @tc.desc     EnableHapticFeedbackTest_static_0060
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0060] START');
      let strJson = inspector.getInspectorByKey('TextInput_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0060] TextInput : ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0060] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0070
     * @tc.name     EnableHapticFeedbackTest_static_0070
     * @tc.desc     EnableHapticFeedbackTest_static_0070
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0070] click succ');
      let strJson = inspector.getInspectorByKey('TextInput_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0070] TextInput: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_static_0070] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0080
     * @tc.name     EnableHapticFeedbackTest_static_0080
     * @tc.desc     EnableHapticFeedbackTest_static_0080
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0080] click succ');
      let strJson = inspector.getInspectorByKey('TextInput_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0080] TextInput: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0080] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0090
     * @tc.name     EnableHapticFeedbackTest_static_0090
     * @tc.desc     EnableHapticFeedbackTest_static_0090
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0090] START');
      let strJson = inspector.getInspectorByKey('TextArea_enableHapticFeedback_default');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0090] TextArea : ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0090] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0100
     * @tc.name     EnableHapticFeedbackTest_static_0100
     * @tc.desc     EnableHapticFeedbackTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0100] START');
      let strJson = inspector.getInspectorByKey('TextArea_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0100] TextArea: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0100] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0110
     * @tc.name     EnableHapticFeedbackTest_static_0110
     * @tc.desc     EnableHapticFeedbackTest_static_0110
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0110] click succ');
      let strJson = inspector.getInspectorByKey('TextArea_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0110] TextArea: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_static_0110] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0120
     * @tc.name     EnableHapticFeedbackTest_static_0120
     * @tc.desc     EnableHapticFeedbackTest_static_0120
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0120] click succ');
      let strJson = inspector.getInspectorByKey('TextArea_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0120] TextArea: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0120] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0130
     * @tc.name     EnableHapticFeedbackTest_static_0130
     * @tc.desc     EnableHapticFeedbackTest_static_0130
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0130] START');
      let strJson = inspector.getInspectorByKey('Search_enableHapticFeedback_default');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0130] Search: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0130] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0140
     * @tc.name     EnableHapticFeedbackTest_static_0140
     * @tc.desc     EnableHapticFeedbackTest_static_0140
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0140', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0140] START');
      let strJson = inspector.getInspectorByKey('Search_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0140] Search: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0140] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0150
     * @tc.name     EnableHapticFeedbackTest_static_0150
     * @tc.desc     EnableHapticFeedbackTest_static_0150
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0150] click succ');
      let strJson = inspector.getInspectorByKey('Search_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0150] Search: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_static_0150] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0160
     * @tc.name     EnableHapticFeedbackTest_static_0160
     * @tc.desc     EnableHapticFeedbackTest_static_0160
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0160] click succ');
      let strJson = inspector.getInspectorByKey('Search_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0160] Search: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0160] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0170
     * @tc.name     EnableHapticFeedbackTest_static_0170
     * @tc.desc     EnableHapticFeedbackTest_static_0170
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0170] START');
      let strJson = inspector.getInspectorByKey('RichEditor_enableHapticFeedback_default');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0170] RichEditor: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0170] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0180
     * @tc.name     EnableHapticFeedbackTest_static_0180
     * @tc.desc     EnableHapticFeedbackTest_static_0180
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0180] START');
      let strJson = inspector.getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0180] RichEditor: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0180] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0190
     * @tc.name     EnableHapticFeedbackTest_static_0190
     * @tc.desc     EnableHapticFeedbackTest_static_0190
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0190] click succ');
      let strJson = inspector.getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj= JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0190] RichEditor: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_static_0190] END');
      done();
    });


    

    
/**
     * @tc.number   EnableHapticFeedbackTest_static_0200
     * @tc.name     EnableHapticFeedbackTest_static_0200
     * @tc.desc     EnableHapticFeedbackTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('EnableHapticFeedbackTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[EnableHapticFeedbackTest_static_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_static_0200] click succ');
      let strJson = inspector.getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[EnableHapticFeedbackTest_static_0200] RichEditor: ' + JSON.stringify(obj.getElement('$attrs').getString('enableHapticFeedback')));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_static_0200] END');
      done();
    });
  })
}
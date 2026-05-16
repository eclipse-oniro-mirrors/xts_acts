'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function EnableHapticFeedbackModifierTest() {
  describe('EnableHapticFeedbackModifierTest', () => {

    beforeAll(() => {
      console.info("datePickerEnableHapticFeedbackModifier beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api18.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info('datePickerEnableHapticFeedbackModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/datePickerEnableHapticFeedbackModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get datePickerEnableHapticFeedbackModifier state pages:' + JSON.stringify(pages));
        if (!('datePickerEnableHapticFeedbackModifier' == pages.name)) {
          console.info('get datePickerEnableHapticFeedbackModifier pages.name:' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info('push datePickerEnableHapticFeedbackModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push datePickerEnableHapticFeedbackModifier page error:' + err);
      }
      console.info('datePickerEnableHapticFeedbackModifier beforeEach end');
    });

    
    
    
    
    
/**
     * @tc.number   DatePickerEnableHapticFeedbackModifier_static_001
     * @tc.name     DatePickerEnableHapticFeedbackModifier_static_001
     * @tc.desc     DatePickerEnableHapticFeedbackModifier_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DatePickerEnableHapticFeedbackModifier_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('datePicker5');
      console.log('DatePickerEnableHapticFeedbackModifier_static_001')
      await Utils.sleep(1000)
      let obj= JSON.parseJsonElement(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_static_001 ' + obj.getElement('$attrs').getBoolean('enableHapticFeedback'))
      expect(obj.getElement('$attrs').getBoolean('enableHapticFeedback')).assertEqual(true);
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePickerEnableHapticFeedbackModifier_static_002
     * @tc.name     DatePickerEnableHapticFeedbackModifier_static_002
     * @tc.desc     DatePickerEnableHapticFeedbackModifier_static_002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DatePickerEnableHapticFeedbackModifier_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('datePicker6');
      console.log('DatePickerEnableHapticFeedbackModifier_static_002')
      await Utils.sleep(1000)
      let obj= JSON.parseJsonElement(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_static_002 ' + obj.getElement('$attrs').getBoolean('enableHapticFeedback'))
      expect(obj.getElement('$attrs').getBoolean('enableHapticFeedback')).assertEqual(false);
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePickerEnableHapticFeedbackModifier_static_003
     * @tc.name     DatePickerEnableHapticFeedbackModifier_static_003
     * @tc.desc     DatePickerEnableHapticFeedbackModifier_static_003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DatePickerEnableHapticFeedbackModifier_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('datePicker7');
      console.log('DatePickerEnableHapticFeedbackModifier_static_003')
      await Utils.sleep(1000)
      let obj= JSON.parseJsonElement(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_static_003 ' + obj.getElement('$attrs').getBoolean('enableHapticFeedback'))
      expect(obj.getElement('$attrs').getBoolean('enableHapticFeedback')).assertEqual(true);
      done();
    });
    
    
    
    
    
    
/**
     * @tc.number   DatePickerEnableHapticFeedbackModifier_static_004
     * @tc.name     DatePickerEnableHapticFeedbackModifier_static_004
     * @tc.desc     DatePickerEnableHapticFeedbackModifier_static_004
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('DatePickerEnableHapticFeedbackModifier_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('datePicker8');
      console.log('DatePickerEnableHapticFeedbackModifier_static_004')
      await Utils.sleep(1000)
      let obj= JSON.parseJsonElement(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_static_004 ' + obj.getElement('$attrs').getBoolean('enableHapticFeedback'))
      expect(obj.getElement('$attrs').getBoolean('enableHapticFeedback')).assertEqual(true);
      done();
    });
  })
}

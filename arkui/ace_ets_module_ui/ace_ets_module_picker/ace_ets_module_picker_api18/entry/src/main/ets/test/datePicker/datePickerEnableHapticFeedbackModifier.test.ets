/**
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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function EnableHapticFeedbackModifierTest() {
  describe('EnableHapticFeedbackModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('datePickerEnableHapticFeedbackModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/datePickerEnableHapticFeedbackModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get datePickerEnableHapticFeedbackModifier state pages:' + JSON.stringify(pages));
        if (!('datePickerEnableHapticFeedbackModifier' == pages.name)) {
          console.info('get datePickerEnableHapticFeedbackModifier pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push datePickerEnableHapticFeedbackModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push datePickerEnableHapticFeedbackModifier page error:' + err);
      }
      console.info('datePickerEnableHapticFeedbackModifier beforeEach end');
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedbackModifier_001
     * @tc.name  : DatePickerEnableHapticFeedbackModifier_001
     * @tc.desc  : To test the enableHapticFeedback Modifier interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedbackModifier_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker5');
      console.log('DatePickerEnableHapticFeedbackModifier_001')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_001 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedbackModifier_002
     * @tc.name  : DatePickerEnableHapticFeedbackModifier_002
     * @tc.desc  : To test the enableHapticFeedback Modifier interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedbackModifier_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker6');
      console.log('DatePickerEnableHapticFeedbackModifier_002')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_002 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(false);
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedbackModifier_003
     * @tc.name  : DatePickerEnableHapticFeedbackModifier_003
     * @tc.desc  : To test the enableHapticFeedback Modifier interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedbackModifier_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker7');
      console.log('DatePickerEnableHapticFeedbackModifier_003')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_003 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      done();
    });
    
    /* *
     * @tc.number: DatePickerEnableHapticFeedback_004
     * @tc.name  : DatePickerEnableHapticFeedback_004
     * @tc.desc  : To test the enableHapticFeedback interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedbackModifier_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker8');
      console.log('DatePickerEnableHapticFeedbackModifier_004')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedbackModifier_004 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      done();
    });
  })
}

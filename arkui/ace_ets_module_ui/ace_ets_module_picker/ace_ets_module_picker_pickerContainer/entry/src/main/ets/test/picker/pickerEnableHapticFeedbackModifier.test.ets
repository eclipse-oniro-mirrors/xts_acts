/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
      console.info('PickerAddApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerEnableHapticFeedbackModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PickerAddApi state pages:' + JSON.stringify(pages));
        if (!('pickerEnableHapticFeedbackModifier' == pages.name)) {
          console.info('get PickerAddApi pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push PickerAddApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PickerAddApi page error:' + err);
      }
      console.info('PickerAddApi beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedbackModifier_001
     * @tc.name  : PickerEnableHapticFeedbackModifier_001
     * @tc.desc  : To test the enableHapticFeedback modifier interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedbackModifier_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('picker1');
        console.log('PickerEnableHapticFeedbackModifier_001')
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('PickerEnableHapticFeedbackModifier_001 ' + obj.$attrs.enableHapticFeedback)
        expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
        done();
      });

    /* *
     * @tc.number: PickerEnableHapticFeedbackModifier_002
     * @tc.name  : PickerEnableHapticFeedbackModifier_002
     * @tc.desc  : To test the enableHapticFeedback modifier interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedbackModifier_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('picker2');
        console.log('PickerEnableHapticFeedbackModifier_002')
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('PickerEnableHapticFeedbackModifier_002 ' + obj.$attrs.enableHapticFeedback)
        expect(obj.$attrs.enableHapticFeedback).assertEqual("false");
        done();
      });

    /* *
     * @tc.number: PickerEnableHapticFeedbackModifier_003
     * @tc.name  : PickerEnableHapticFeedbackModifier_003
     * @tc.desc  : To test the enableHapticFeedback modifier interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedbackModifier_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('picker3');
        console.log('PickerEnableHapticFeedbackModifier_003')
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('PickerEnableHapticFeedbackModifier_003 ' + obj.$attrs.enableHapticFeedback)
        expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
        done();
      });

    /* *
     * @tc.number: PickerEnableHapticFeedbackModifier_004
     * @tc.name  : PickerEnableHapticFeedbackModifier_004
     * @tc.desc  : To test the enableHapticFeedback modifier interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedbackModifier_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('picker4');
        console.log('PickerEnableHapticFeedbackModifier_004')
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('PickerEnableHapticFeedbackModifier_004 ' + obj.$attrs.enableHapticFeedback)
        expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
        done();
      });

    /* *
     * @tc.number: PickerEnableHapticFeedbackModifier_005
     * @tc.name  : PickerEnableHapticFeedbackModifier_005
     * @tc.desc  : To test the enableHapticFeedback modifier interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedbackModifier_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await Utils.sleep(1000)
        let strJson = getInspectorByKey('picker5');
        console.log('PickerEnableHapticFeedbackModifier_005')
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('PickerEnableHapticFeedbackModifier_005' + obj.$attrs.enableHapticFeedback)
        expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
        done();
      });
  })
}
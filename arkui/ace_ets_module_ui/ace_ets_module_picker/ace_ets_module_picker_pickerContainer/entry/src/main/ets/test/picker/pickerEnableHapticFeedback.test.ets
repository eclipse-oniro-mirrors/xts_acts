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

export default function pickerEnableHapticFeedbackTest() {
  describe('pickerEnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerEnableHapticFeedbackTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerEnableHapticFeedbackTest state pages:' + JSON.stringify(pages));
        if (!('pickerEnableHapticFeedback' == pages.name)) {
          console.info('get pickerEnableHapticFeedbackTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push pickerEnableHapticFeedbackTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerEnableHapticFeedbackTest page error:' + err);
      }
      console.info('pickerEnableHapticFeedbackTest beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedback_001
     * @tc.name  : PickerEnableHapticFeedback_001
     * @tc.desc  : To test the enableHapticFeedback interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker1');
      console.log('PickerEnableHapticFeedback_001')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerEnableHapticFeedback_001 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedback_002
     * @tc.name  : PickerEnableHapticFeedback_002
     * @tc.desc  : To test the enableHapticFeedback interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker2');
      console.log('PickerEnableHapticFeedback_002')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerEnableHapticFeedback_002 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual("false");
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedback_003
     * @tc.name  : PickerEnableHapticFeedback_003
     * @tc.desc  : To test the enableHapticFeedback interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker3');
      console.log('PickerEnableHapticFeedback_003')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerEnableHapticFeedback_003 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedback_004
     * @tc.name  : PickerEnableHapticFeedback_004
     * @tc.desc  : To test the enableHapticFeedback interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker4');
      console.log('PickerEnableHapticFeedback_004')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerEnableHapticFeedback_004 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerEnableHapticFeedback_005
     * @tc.name  : PickerEnableHapticFeedback_005
     * @tc.desc  : To test the enableHapticFeedback interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerEnableHapticFeedback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker5');
      console.log('PickerEnableHapticFeedback_005')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerEnableHapticFeedback_005' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual("true");
      done();
    });
  })
}
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

export default function EnableHapticFeedbackTest() {
  describe('EnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('datePickerEnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/datePickerEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get datePickerEnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('datePickerEnableHapticFeedback' == pages.name)) {
          console.info('get datePickerEnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push datePickerEnableHapticFeedback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push datePickerEnableHapticFeedback page error:' + err);
      }
      console.info('datePickerEnableHapticFeedback beforeEach end');
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedback_001
     * @tc.name  : DatePickerEnableHapticFeedback_001
     * @tc.desc  : To test the enableHapticFeedback interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker1');
      console.log('DatePickerEnableHapticFeedback_001')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedback_001 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedback_002
     * @tc.name  : DatePickerEnableHapticFeedback_002
     * @tc.desc  : To test the enableHapticFeedback interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker2');
      console.log('DatePickerEnableHapticFeedback_002')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedback_002 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(false);
      done();
    });

    /* *
     * @tc.number: DatePickerEnableHapticFeedback_003
     * @tc.name  : DatePickerEnableHapticFeedback_003
     * @tc.desc  : To test the enableHapticFeedback interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('DatePickerEnableHapticFeedback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker3');
      console.log('DatePickerEnableHapticFeedback_003')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedback_003 ' + obj.$attrs.enableHapticFeedback)
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
    it('DatePickerEnableHapticFeedback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker4');
      console.log('DatePickerEnableHapticFeedback_004')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('DatePickerEnableHapticFeedback_004 ' + obj.$attrs.enableHapticFeedback)
      expect(obj.$attrs.enableHapticFeedback).assertEqual(true);
      done();
    });
  })
}

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

export default function pickerCanLoopTest() {
  describe('pickerCanLoopTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerCanLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerCanLoop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerCanLoopTest state pages:' + JSON.stringify(pages));
        if (!('pickerCanLoop' == pages.name)) {
          console.info('get pickerCanLoopTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push pickerCanLoopTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerCanLoopTest page error:' + err);
      }
      console.info('pickerCanLoopTest beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerCanLoop_001
     * @tc.name  : PickerCanLoop_001
     * @tc.desc  : To test the canLoop interface true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker1');
      console.log('PickerCanLoop_001')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoop_001 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoop_002
     * @tc.name  : PickerCanLoop_002
     * @tc.desc  : To test the canLoop interface false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker2');
      console.log('PickerCanLoop_002')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoop_002 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("false");
      done();
    });

    /* *
     * @tc.number: PickerCanLoop_003
     * @tc.name  : PickerCanLoop_003
     * @tc.desc  : To test the canLoop interface undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoop_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker3');
      console.log('PickerCanLoop_003')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoop_003 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoop_004
     * @tc.name  : PickerCanLoop_004
     * @tc.desc  : To test the canLoop interface null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoop_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker4');
      console.log('PickerCanLoop_004')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoop_004 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoop_005
     * @tc.name  : PickerCanLoop_005
     * @tc.desc  : To test the canLoop interface default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoop_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker5');
      console.log('PickerCanLoop_005')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoop_005' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });
  })
}
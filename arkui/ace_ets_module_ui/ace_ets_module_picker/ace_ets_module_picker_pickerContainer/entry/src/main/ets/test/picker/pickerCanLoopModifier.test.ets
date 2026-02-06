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

export default function pickerCanLoopModifierTest() {
  describe('pickerCanLoopModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('pickerCanLoopModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/pickerCanLoopModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get pickerCanLoopModifierTest state pages:' + JSON.stringify(pages));
        if (!('pickerCanLoopModifier' == pages.name)) {
          console.info('get pickerCanLoopModifierTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push pickerCanLoopModifierTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push pickerCanLoopModifierTest page error:' + err);
      }
      console.info('pickerCanLoopModifierTest beforeEach end');
      done();
    });

    /* *
     * @tc.number: PickerCanLoopModifier_001
     * @tc.name  : PickerCanLoopModifier_001
     * @tc.desc  : To test the canLoop modifier interface  true
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoopModifier_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker1');
      console.log('PickerCanLoopModifier_001')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoopModifier_001 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoopModifier_002
     * @tc.name  : PickerCanLoopModifier_002
     * @tc.desc  : To test the canLoop modifier interface  false
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoopModifier_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker2');
      console.log('PickerCanLoopModifier_002')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoopModifier_002 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("false");
      done();
    });

    /* *
     * @tc.number: PickerCanLoopModifier_003
     * @tc.name  : PickerCanLoopModifier_003
     * @tc.desc  : To test the canLoop modifier interface  undefined
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoopModifier_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker3');
      console.log('PickerCanLoopModifier_003')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoopModifier_003 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoopModifier_004
     * @tc.name  : PickerCanLoopModifier_004
     * @tc.desc  : To test the canLoop modifier interface  null
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoopModifier_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker4');
      console.log('PickerCanLoopModifier_004')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoopModifier_004 ' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });

    /* *
     * @tc.number: PickerCanLoopModifier_005
     * @tc.name  : PickerCanLoopModifier_005
     * @tc.desc  : To test the canLoop modifier interface  default value
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('PickerCanLoopModifier_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('picker5');
      console.log('PickerCanLoopModifier_005')
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('PickerCanLoopModifier_005' + obj.$attrs.canLoop)
      expect(obj.$attrs.canLoop).assertEqual("true");
      done();
    });
  })
}
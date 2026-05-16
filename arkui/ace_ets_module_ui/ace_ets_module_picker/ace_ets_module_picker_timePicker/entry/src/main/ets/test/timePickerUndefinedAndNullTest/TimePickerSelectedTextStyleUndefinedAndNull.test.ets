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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function timePickerSelectedTextStyleUndefinedAndNullTest() {
  describe('timePickerSelectedTextStyleUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerSelectedTextStyleUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerUndefinedAndNull/TimePickerSelectedTextStyleUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerSelectedTextStyleUndefinedAndNullTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerSelectedTextStyleUndefinedAndNull' == pages.name)) {
          console.info('get timePickerSelectedTextStyleUndefinedAndNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerSelectedTextStyleUndefinedAndNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerSelectedTextStyleUndefinedAndNullTest page error:' + err);
      }
      console.info('timePickerSelectedTextStyleUndefinedAndNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   timePickerSelectedTextStyleUndefinedAndNullTest_001
     * @tc.number timePickerSelectedTextStyleUndefinedAndNullTest_001
     * @tc.desc   To test the selectedTextStyle undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerSelectedTextStyleUndefinedAndNullTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerSelectedTextStyleUndefinedAndNullTest_001 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('selectedTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('selectedTextStyleUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerSelectedTextStyleUndefinedAndNullTest_001] default selectedTextStyle value is: " + JSON.stringify(objCompare.$attrs.selectedTextStyle));
      console.info("[timePickerSelectedTextStyleUndefinedAndNullTest_001] undefined selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objCompare.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objCompare.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objCompare.$attrs.selectedTextStyle.font.weight);
      console.info('[timePickerSelectedTextStyleUndefinedAndNullTest_001] END');
      done();
    });

    /**
     * @tc.name   timePickerSelectedTextStyleUndefinedAndNullTest_002
     * @tc.number timePickerSelectedTextStyleUndefinedAndNullTest_002
     * @tc.desc   To test the selectedTextStyle null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerSelectedTextStyleUndefinedAndNullTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerSelectedTextStyleUndefinedAndNullTest_002 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('selectedTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('selectedTextStyleNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerSelectedTextStyleUndefinedAndNullTest_001] default selectedTextStyle value is: " + JSON.stringify(objCompare.$attrs.selectedTextStyle));
      console.info("[timePickerSelectedTextStyleUndefinedAndNullTest_001] null selectedTextStyle value is: " + JSON.stringify(obj.$attrs.selectedTextStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objCompare.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objCompare.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual(objCompare.$attrs.selectedTextStyle.font.weight);
      console.info('[timePickerSelectedTextStyleUndefinedAndNullTest_002] END');
      done();
    });
  })
}

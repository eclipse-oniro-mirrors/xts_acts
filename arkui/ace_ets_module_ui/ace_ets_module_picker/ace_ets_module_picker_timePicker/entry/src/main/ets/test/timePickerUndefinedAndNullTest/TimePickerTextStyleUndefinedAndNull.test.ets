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

export default function timePickerTextStyleUndefinedAndNullTest() {
  describe('timePickerTextStyleUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerTextStyleUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerUndefinedAndNull/TimePickerTextStyleUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerTextStyleUndefinedAndNullTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerTextStyleUndefinedAndNull' == pages.name)) {
          console.info('get timePickerTextStyleUndefinedAndNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerTextStyleUndefinedAndNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerTextStyleUndefinedAndNullTest page error:' + err);
      }
      console.info('timePickerTextStyleUndefinedAndNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   timePickerTextStyleUndefinedAndNullTest_001
     * @tc.number timePickerTextStyleUndefinedAndNullTest_001
     * @tc.desc   To test the textStyle undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerTextStyleUndefinedAndNullTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerTextStyleUndefinedAndNullTest_001 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textStyleUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerTextStyleUndefinedAndNullTest_001] default textStyle value is: " + JSON.stringify(objCompare.$attrs.textStyle));
      console.info("[timePickerTextStyleUndefinedAndNullTest_001] undefined textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.textStyle.color).assertEqual(objCompare.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objCompare.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objCompare.$attrs.textStyle.font.weight);
      console.info('[timePickerTextStyleUndefinedAndNullTest_001] END');
      done();
    });

    /**
     * @tc.name   timePickerTextStyleUndefinedAndNullTest_002
     * @tc.number timePickerTextStyleUndefinedAndNullTest_002
     * @tc.desc   To test the textStyle null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerTextStyleUndefinedAndNullTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerTextStyleUndefinedAndNullTest_002 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textStyleNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerTextStyleUndefinedAndNullTest_001] default textStyle value is: " + JSON.stringify(objCompare.$attrs.textStyle));
      console.info("[timePickerTextStyleUndefinedAndNullTest_001] null textStyle value is: " + JSON.stringify(obj.$attrs.textStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.textStyle.color).assertEqual(objCompare.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objCompare.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual(objCompare.$attrs.textStyle.font.weight);
      console.info('[timePickerTextStyleUndefinedAndNullTest_002] END');
      done();
    });
  })
}

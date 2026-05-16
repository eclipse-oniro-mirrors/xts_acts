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

export default function timePickerDisappearTextStyleUndefinedAndNullTest() {
  describe('timePickerDisappearTextStyleUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerDisappearTextStyleUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerUndefinedAndNull/TimePickerDisappearTextStyleUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerDisappearTextStyleUndefinedAndNullTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerDisappearTextStyleUndefinedAndNull' == pages.name)) {
          console.info('get timePickerDisappearTextStyleUndefinedAndNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerDisappearTextStyleUndefinedAndNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerDisappearTextStyleUndefinedAndNullTest page error:' + err);
      }
      console.info('timePickerDisappearTextStyleUndefinedAndNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   timePickerDisappearTextStyleUndefinedAndNullTest_001
     * @tc.number timePickerDisappearTextStyleUndefinedAndNullTest_001
     * @tc.desc   To test the disappearTextStyle undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerDisappearTextStyleUndefinedAndNullTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerDisappearTextStyleUndefinedAndNullTest_001 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('disappearTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('disappearTextStyleUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerDisappearTextStyleUndefinedAndNullTest_001] default disappearTextStyle value is: " + JSON.stringify(objCompare.$attrs.disappearTextStyle));
      console.info("[timePickerDisappearTextStyleUndefinedAndNullTest_001] undefined disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objCompare.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objCompare.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objCompare.$attrs.disappearTextStyle.font.weight);
      console.info('[timePickerDisappearTextStyleUndefinedAndNullTest_001] END');
      done();
    });

    /**
     * @tc.name   timePickerDisappearTextStyleUndefinedAndNullTest_002
     * @tc.number timePickerDisappearTextStyleUndefinedAndNullTest_002
     * @tc.desc   To test the disappearTextStyle null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerDisappearTextStyleUndefinedAndNullTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerDisappearTextStyleUndefinedAndNullTest_002 START');
      await Utils.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('disappearTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('disappearTextStyleNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[timePickerDisappearTextStyleUndefinedAndNullTest_001] default disappearTextStyle value is: " + JSON.stringify(objCompare.$attrs.disappearTextStyle));
      console.info("[timePickerDisappearTextStyleUndefinedAndNullTest_001] null disappearTextStyle value is: " + JSON.stringify(obj.$attrs.disappearTextStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objCompare.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objCompare.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual(objCompare.$attrs.disappearTextStyle.font.weight);
      console.info('[timePickerDisappearTextStyleUndefinedAndNullTest_002] END');
      done();
    });
  })
}

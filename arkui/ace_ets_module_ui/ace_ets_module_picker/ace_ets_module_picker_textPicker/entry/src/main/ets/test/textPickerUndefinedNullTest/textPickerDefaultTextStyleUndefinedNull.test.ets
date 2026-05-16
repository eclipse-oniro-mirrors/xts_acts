/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickeDefaultTextStyleUndefinedNullTest() {
  describe('TextPickeDefaultTextStyleUndefinedNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/textPickerDefaultTextStyleUndefinedNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickeDefaultTextStyleUndefinedNullTest state success ' + JSON.stringify(pages));
        if (!('textPickerDefaultTextStyleUndefinedNull' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickeDefaultTextStyleUndefinedNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickeDefaultTextStyleUndefinedNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TextPickeDefaultTextStyleUndefinedNullTest_0100
     * @tc.number TextPickeDefaultTextStyleUndefinedNullTest_0100
     * @tc.desc   To test the defaultTextStyle is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDefaultTextStyleUndefinedNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDefaultTextStyleUndefinedNullTest_0100 start');
      await CommonFunc.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textPickerDefaultTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPickerDefaultTextStyleUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TextPickeDefaultTextStyleUndefinedNullTest_0100] default defaultTextStyle value is: " + JSON.stringify(objCompare.$attrs.defaultTextStyle));
      console.info("[TextPickeDefaultTextStyleUndefinedNullTest_0100] undefined defaultTextStyle value is: " + JSON.stringify(obj.$attrs.defaultTextStyle));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual(objCompare.$attrs.defaultTextStyle.minFontSize);
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual(objCompare.$attrs.defaultTextStyle.maxFontSize);
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual(objCompare.$attrs.defaultTextStyle.overflow);
      console.info('[TextPickeDefaultTextStyleUndefinedNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickeDefaultTextStyleUndefinedNullTest_0200
     * @tc.number TextPickeDefaultTextStyleUndefinedNullTest_0200
     * @tc.desc   To test the defaultTextStyle is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDefaultTextStyleUndefinedNullTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDefaultTextStyleUndefinedNullTest_0200 start');
      await CommonFunc.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textPickerDefaultTextStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPickerDefaultTextStyleNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TextPickeDefaultTextStyleUndefinedNullTest_0100] default defaultTextStyle value is: " + JSON.stringify(objCompare.$attrs.defaultTextStyle));
      console.info("[TextPickeDefaultTextStyleUndefinedNullTest_0100] null defaultTextStyle value is: " + JSON.stringify(obj.$attrs.defaultTextStyle));

      // null 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.defaultTextStyle.minFontSize).assertEqual(objCompare.$attrs.defaultTextStyle.minFontSize);
      expect(obj.$attrs.defaultTextStyle.maxFontSize).assertEqual(objCompare.$attrs.defaultTextStyle.maxFontSize);
      expect(obj.$attrs.defaultTextStyle.overflow).assertEqual(objCompare.$attrs.defaultTextStyle.overflow);
      console.info('[TextPickeDefaultTextStyleUndefinedNullTest_0200] END');
      done();
    });
  })
}

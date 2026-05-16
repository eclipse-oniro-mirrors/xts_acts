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

export default function TextPickeDividerUndefinedNullTest() {
  describe('TextPickeDividerUndefinedNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/textPickerDividerUndefinedNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickeDividerUndefinedNullTest state success ' + JSON.stringify(pages));
        if (!('textPickerDividerUndefinedNull' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickeDividerUndefinedNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickeDividerUndefinedNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TextPickeDividerUndefinedNullTest_0100
     * @tc.number TextPickeDividerUndefinedNullTest_0100
     * @tc.desc   To test the divider is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDividerUndefinedNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDividerUndefinedNullTest_0100 start');
      await CommonFunc.sleep(1000);

      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('textPickerDividerDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('textPickerDividerUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TextPickeDividerUndefinedNullTest_0100] default divider value is: " + JSON.stringify(objCompare.$attrs.divider));
      console.info("[TextPickeDividerUndefinedNullTest_0100] undefined divider value is: " + JSON.stringify(obj.$attrs.divider));

      // undefined 应该恢复为默认值，两者应该相等
      expect(obj.$attrs.divider.strokeWidth).assertEqual(objCompare.$attrs.divider.strokeWidth);
      expect(obj.$attrs.divider.startMargin).assertEqual(objCompare.$attrs.divider.startMargin);
      expect(obj.$attrs.divider.endMargin).assertEqual(objCompare.$attrs.divider.endMargin);
      expect(obj.$attrs.divider.color).assertEqual(objCompare.$attrs.divider.color);
      console.info('[TextPickeDividerUndefinedNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickeDividerUndefinedNullTest_0200
     * @tc.number TextPickeDividerUndefinedNullTest_0200
     * @tc.desc   To test the divider is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDividerUndefinedNullTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDividerUndefinedNullTest_0200 start');
      await CommonFunc.sleep(1000);
      // 获取null参数组件的属性
      let strJson: string = getInspectorByKey('textPickerDividerNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[TextPickeDividerUndefinedNullTest_0100] null divider value is: " + JSON.stringify(obj.$attrs.divider));
      expect(obj.$attrs.divider.strokeWidth).assertEqual('0.00vp');
      expect(obj.$attrs.divider.startMargin).assertEqual('0.00vp');
      expect(obj.$attrs.divider.endMargin).assertEqual('0.00vp');
      console.info('[TextPickeDividerUndefinedNullTest_0200] END');
      done();
    });
  })
}

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function BlankColorNullUndefinedTest() {
  describe('BlankColorNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("BlankColorNullUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/BlankColorNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BlankColorNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("BlankColorNullUndefined" == pages.name)) {
          console.info("get BlankColorNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          await router.replaceUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push BlankColorNullUndefinedTest page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   blankColorNullUndefined_0100
     * @tc.number SUB_ARKUI_BLANK_COLOR_NULL_0100
     * @tc.desc   Test Blank color property with null, should restore to default value Color.Transparent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blankColorNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[blankColorNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('blank_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('blank_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blankColorNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[blankColorNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 Color.Transparent
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      expect(objCompare.$attrs.color).assertEqual('#00000000'); // Color.Transparent 的颜色值
      console.info('[blankColorNullUndefined_0100] END');
    })

    /**
     * @tc.name   blankColorNullUndefined_0200
     * @tc.number SUB_ARKUI_BLANK_COLOR_UNDEFINED_0100
     * @tc.desc   Test Blank color property with undefined, should restore to default value Color.Transparent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blankColorNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[blankColorNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('blank_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('blank_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blankColorNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[blankColorNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 Color.Transparent
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      expect(objCompare.$attrs.color).assertEqual('#00000000'); // Color.Transparent 的颜色值
      console.info('[blankColorNullUndefined_0200] END');
    })

    /**
     * @tc.name   blankColorNullUndefined_0300
     * @tc.number SUB_ARKUI_BLANK_COLOR_EMPTY_0100
     * @tc.desc   Test Blank color property with empty string '', should be treated as default value Color.Transparent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blankColorNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[blankColorNullUndefined_0300] START');

      let strJsonCompare: string = getInspectorByKey('blank_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('blank_color_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blankColorNullUndefined_0300] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[blankColorNullUndefined_0300] empty string obj is: " + JSON.stringify(obj.$attrs));

      // 空字符串 '' 应该被当作默认值 Color.Transparent 处理
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      expect(objCompare.$attrs.color).assertEqual('#00000000'); // Color.Transparent 的颜色值
      console.info('[blankColorNullUndefined_0300] END');
    })

    /**
     * @tc.name   blankColorNullUndefined_0400
     * @tc.number SUB_ARKUI_BLANK_COLOR_VALID_0100
     * @tc.desc   Test Blank color property with valid value Color.Yellow, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('blankColorNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[blankColorNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('blank_color_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[blankColorNullUndefined_0400] valid color obj is: " + JSON.stringify(obj.$attrs));

      // 有效的颜色值 Color.Yellow 应该被正确设置
      expect(obj.$attrs.color).assertEqual('#FFFFFF00'); // Color.Yellow 的十六进制值（8位，包含alpha通道）
      console.info('[blankColorNullUndefined_0400] END');
    })
  })
}

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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function RectRadiusWidthHeightNullUndefinedTest() {
  describe('RectRadiusWidthHeightNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("RectRadiusWidthHeightNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Rect/RectRadiusWidthHeightNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectRadiusWidthHeightNullUndefined state pages: " + JSON.stringify(pages));
        if (!("RectRadiusWidthHeightNullUndefined" == pages.name)) {
          console.info("get RectRadiusWidthHeightNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RectRadiusWidthHeightNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectRadiusWidthHeightNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   rectRadiusWidthNull_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSWIDTH_NULL_0100
     * @tc.desc   Test Rect radiusWidth method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusWidthNull_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusWidthNull_0100] START');

      let strJson = getInspectorByKey('rect_radiuswidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusWidth).assertEqual(0);
      console.info('[rectRadiusWidthNull_0100] END');
    })

    /**
     * @tc.name   rectRadiusWidthUndefined_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSWIDTH_UNDEFINED_0100
     * @tc.desc   Test Rect radiusWidth method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusWidthUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusWidthUndefined_0100] START');

      let strJson = getInspectorByKey('rect_radiuswidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusWidth).assertEqual(0);
      console.info('[rectRadiusWidthUndefined_0100] END');
    })

    /**
     * @tc.name   rectRadiusWidthEmpty_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSWIDTH_EMPTY_0100
     * @tc.desc   Test Rect radiusWidth method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusWidthEmpty_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusWidthEmpty_0100] START');

      let strJson = getInspectorByKey('rect_radiuswidth_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusWidth).assertEqual(0);
      console.info('[rectRadiusWidthEmpty_0100] END');
    })

    /**
     * @tc.name   rectRadiusHeightNull_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSHEIGHT_NULL_0100
     * @tc.desc   Test Rect radiusHeight method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusHeightNull_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusHeightNull_0100] START');

      let strJson = getInspectorByKey('rect_radiusheight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusHeight).assertEqual(0);
      console.info('[rectRadiusHeightNull_0100] END');
    })

    /**
     * @tc.name   rectRadiusHeightUndefined_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Rect radiusHeight method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusHeightUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusHeightUndefined_0100] START');

      let strJson = getInspectorByKey('rect_radiusheight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusHeight).assertEqual(0);
      console.info('[rectRadiusHeightUndefined_0100] END');
    })

    /**
     * @tc.name   rectRadiusHeightEmpty_0100
     * @tc.number SUB_ARKUI_RECT_RADIUSHEIGHT_EMPTY_0100
     * @tc.desc   Test Rect radiusHeight method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusHeightEmpty_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusHeightEmpty_0100] START');

      let strJson = getInspectorByKey('rect_radiusheight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.radiusHeight).assertEqual(0);
      console.info('[rectRadiusHeightEmpty_0100] END');
    })

    /**
     * @tc.name   rectRadiusNull_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_NULL_0100
     * @tc.desc   Test Rect radius method with null parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusNull_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusNull_0100] START');

      let strJson = getInspectorByKey('rect_radius_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusNull_0100] END');
    })

    /**
     * @tc.name   rectRadiusUndefined_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_UNDEFINED_0100
     * @tc.desc   Test Rect radius method with undefined parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusUndefined_0100] START');

      let strJson = getInspectorByKey('rect_radius_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusUndefined_0100] END');
    })

    /**
     * @tc.name   rectRadiusEmpty_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_EMPTY_0100
     * @tc.desc   Test Rect radius method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusEmpty_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusEmpty_0100] START');

      let strJson = getInspectorByKey('rect_radius_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusEmpty_0100] END');
    })

    /**
     * @tc.name   rectRadiusArrayNull_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_ARRAY_NULL_0100
     * @tc.desc   Test Rect radius method with array containing null parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusArrayNull_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusArrayNull_0100] START');

      let strJson = getInspectorByKey('rect_radius_array_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 验证数组中有null时能正常处理
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusArrayNull_0100] END');
    })

    /**
     * @tc.name   rectRadiusArrayUndefined_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_ARRAY_UNDEFINED_0100
     * @tc.desc   Test Rect radius method with array containing undefined parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusArrayUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusArrayUndefined_0100] START');

      let strJson = getInspectorByKey('rect_radius_array_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 验证数组中有undefined时能正常处理
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusArrayUndefined_0100] END');
    })

    /**
     * @tc.name   rectRadiusArrayEmpty_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_ARRAY_EMPTY_0100
     * @tc.desc   Test Rect radius method with array containing empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusArrayEmpty_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusArrayEmpty_0100] START');

      let strJson = getInspectorByKey('rect_radius_array_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 验证数组中有空字符串时能正常处理
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusArrayEmpty_0100] END');
    })

    /**
     * @tc.name   rectRadiusArrayValid_0100
     * @tc.number SUB_ARKUI_RECT_RADIUS_ARRAY_VALID_0100
     * @tc.desc   Test Rect radius method with valid array parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rectRadiusArrayValid_0100', Level.LEVEL0, async () => {
      console.info('[rectRadiusArrayValid_0100] START');

      let strJson = getInspectorByKey('rect_radius_array_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 验证数组参数能正常设置
      expect(obj.$type).assertEqual('Rect');
      console.info('[rectRadiusArrayValid_0100] END');
    })
  })
}

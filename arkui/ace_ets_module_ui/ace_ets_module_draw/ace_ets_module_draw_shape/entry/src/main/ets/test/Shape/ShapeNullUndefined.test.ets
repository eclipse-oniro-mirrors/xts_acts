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

export default function ShapeNullUndefinedTest() {
  describe('ShapeNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ShapeNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeNullUndefined state pages: " + JSON.stringify(pages));
        if (!("ShapeNullUndefined" == pages.name)) {
          console.info("get ShapeNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   shapeFillNull_0100
     * @tc.number SUB_ARKUI_SHAPE_FILL_NULL_0100
     * @tc.desc   Test Shape fill method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillNull_0100] START');

      let strJson = getInspectorByKey('shape_fill_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[shapeFillNull_0100] END');
    })

    /**
     * @tc.name   shapeFillUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_FILL_UNDEFINED_0100
     * @tc.desc   Test Shape fill method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillUndefined_0100] START');

      let strJson = getInspectorByKey('shape_fill_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[shapeFillUndefined_0100] END');
    })

    /**
     * @tc.name   shapeFillEmpty_0100
     * @tc.number SUB_ARKUI_SHAPE_FILL_EMPTY_0100
     * @tc.desc   Test Shape fill method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillEmpty_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillEmpty_0100] START');

      let strJson = getInspectorByKey('shape_fill_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[shapeFillEmpty_0100] END');
    })

    /**
     * @tc.name   shapeFillValid_0100
     * @tc.number SUB_ARKUI_SHAPE_FILL_VALID_0100
     * @tc.desc   Test Shape fill method with valid Color.Red parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillValid_0100] START');

      let strJson = getInspectorByKey('shape_fill_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FFFF0000');
      console.info('[shapeFillValid_0100] END');
    })

    /**
     * @tc.name   shapeStrokeNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKE_NULL_0100
     * @tc.desc   Test Shape stroke method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeNull_0100] START');

      let strJson = getInspectorByKey('shape_stroke_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[shapeStrokeNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKE_UNDEFINED_0100
     * @tc.desc   Test Shape stroke method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeUndefined_0100] START');

      let strJson = getInspectorByKey('shape_stroke_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[shapeStrokeUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeEmpty_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKE_EMPTY_0100
     * @tc.desc   Test Shape stroke method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeEmpty_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeEmpty_0100] START');

      let strJson = getInspectorByKey('shape_stroke_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[shapeStrokeEmpty_0100] END');
    })

    /**
     * @tc.name   shapeStrokeValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKE_VALID_0100
     * @tc.desc   Test Shape stroke method with valid Color.Blue parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeValid_0100] START');

      let strJson = getInspectorByKey('shape_stroke_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#FF0000FF');
      console.info('[shapeStrokeValid_0100] END');
    })

    /**
     * @tc.name   shapeStrokeLineCapNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINECAP_NULL_0100
     * @tc.desc   Test Shape strokeLineCap method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineCapNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineCapNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineCap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      console.info('[shapeStrokeLineCapNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeLineCapUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINECAP_UNDEFINED_0100
     * @tc.desc   Test Shape strokeLineCap method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineCapUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineCapUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineCap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      console.info('[shapeStrokeLineCapUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeLineCapValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINECAP_VALID_0100
     * @tc.desc   Test Shape strokeLineCap method with valid LineCapStyle.Round parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineCapValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineCapValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineCap_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Round');
      console.info('[shapeStrokeLineCapValid_0100] END');
    })
  })
}

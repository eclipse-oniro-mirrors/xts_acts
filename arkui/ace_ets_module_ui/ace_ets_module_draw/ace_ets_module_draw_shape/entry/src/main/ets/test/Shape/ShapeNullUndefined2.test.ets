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

export default function ShapeNullUndefined2Test() {
  describe('ShapeNullUndefined2Test', () => {
    beforeAll(async (done: Function) => {
      console.info("ShapeNullUndefined2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeNullUndefined2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeNullUndefined2 state pages: " + JSON.stringify(pages));
        if (!("ShapeNullUndefined2" == pages.name)) {
          console.info("get ShapeNullUndefined2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeNullUndefined2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeNullUndefined2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   shapeStrokeLineJoinNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINEJOIN_NULL_0100
     * @tc.desc   Test Shape strokeLineJoin method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineJoinNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineJoinNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineJoin_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      console.info('[shapeStrokeLineJoinNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeLineJoinUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINEJOIN_UNDEFINED_0100
     * @tc.desc   Test Shape strokeLineJoin method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineJoinUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineJoinUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineJoin_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      console.info('[shapeStrokeLineJoinUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeLineJoinValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKELINEJOIN_VALID_0100
     * @tc.desc   Test Shape strokeLineJoin method with valid LineJoinStyle.Round parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeLineJoinValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeLineJoinValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeLineJoin_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Round');
      console.info('[shapeStrokeLineJoinValid_0100] END');
    })

    /**
     * @tc.name   shapeStrokeOpacityNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEOPACITY_NULL_0100
     * @tc.desc   Test Shape strokeOpacity method with null parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeOpacityNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeOpacityNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeOpacity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('1.000000');
      console.info('[shapeStrokeOpacityNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeOpacityUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEOPACITY_UNDEFINED_0100
     * @tc.desc   Test Shape strokeOpacity method with undefined parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeOpacityUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeOpacityUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeOpacity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('1.000000');
      console.info('[shapeStrokeOpacityUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeOpacityValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEOPACITY_VALID_0100
     * @tc.desc   Test Shape strokeOpacity method with valid 0.5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeOpacityValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeOpacityValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeOpacity_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('0.500000');
      console.info('[shapeStrokeOpacityValid_0100] END');
    })

    /**
     * @tc.name   shapeFillOpacityNull_0100
     * @tc.number SUB_ARKUI_SHAPE_FILLOPACITY_NULL_0100
     * @tc.desc   Test Shape fillOpacity method with null parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillOpacityNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillOpacityNull_0100] START');

      let strJson = getInspectorByKey('shape_fillOpacity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('1.000000');
      console.info('[shapeFillOpacityNull_0100] END');
    })

    /**
     * @tc.name   shapeFillOpacityUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_FILLOPACITY_UNDEFINED_0100
     * @tc.desc   Test Shape fillOpacity method with undefined parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillOpacityUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillOpacityUndefined_0100] START');

      let strJson = getInspectorByKey('shape_fillOpacity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('1.000000');
      console.info('[shapeFillOpacityUndefined_0100] END');
    })

    /**
     * @tc.name   shapeFillOpacityValid_0100
     * @tc.number SUB_ARKUI_SHAPE_FILLOPACITY_VALID_0100
     * @tc.desc   Test Shape fillOpacity method with valid 0.5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeFillOpacityValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeFillOpacityValid_0100] START');

      let strJson = getInspectorByKey('shape_fillOpacity_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('0.500000');
      console.info('[shapeFillOpacityValid_0100] END');
    })
  })
}

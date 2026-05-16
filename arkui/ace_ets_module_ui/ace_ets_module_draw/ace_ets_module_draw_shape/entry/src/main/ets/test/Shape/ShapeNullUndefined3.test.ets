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

export default function ShapeNullUndefined3Test() {
  describe('ShapeNullUndefined3Test', () => {
    beforeAll(async (done: Function) => {
      console.info("ShapeNullUndefined3Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeNullUndefined3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeNullUndefined3 state pages: " + JSON.stringify(pages));
        if (!("ShapeNullUndefined3" == pages.name)) {
          console.info("get ShapeNullUndefined3 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeNullUndefined3 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeNullUndefined3 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   shapeStrokeWidthNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEWIDTH_NULL_0100
     * @tc.desc   Test Shape strokeWidth method with null parameter, should be treated as default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeWidthNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeWidthNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(1);
      console.info('[shapeStrokeWidthNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeWidthUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test Shape strokeWidth method with undefined parameter, should be treated as default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeWidthUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeWidthUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(1);
      console.info('[shapeStrokeWidthUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeWidthValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEWIDTH_VALID_0100
     * @tc.desc   Test Shape strokeWidth method with valid 4 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeWidthValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeWidthValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeWidth_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(4);
      console.info('[shapeStrokeWidthValid_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashOffsetNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHOFFSET_NULL_0100
     * @tc.desc   Test Shape strokeDashOffset method with null parameter, should be treated as default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashOffsetNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashOffsetNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('0.00px');
      console.info('[shapeStrokeDashOffsetNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashOffsetUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHOFFSET_UNDEFINED_0100
     * @tc.desc   Test Shape strokeDashOffset method with undefined parameter, should be treated as default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashOffsetUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashOffsetUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('0.00px');
      console.info('[shapeStrokeDashOffsetUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashOffsetValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHOFFSET_VALID_0100
     * @tc.desc   Test Shape strokeDashOffset method with valid 5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashOffsetValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashOffsetValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashOffset_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('5.00vp');
      console.info('[shapeStrokeDashOffsetValid_0100] END');
    })

    /**
     * @tc.name   shapeStrokeMiterLimitNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEMITERLIMIT_NULL_0100
     * @tc.desc   Test Shape strokeMiterLimit method with null parameter, should be treated as default value 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeMiterLimitNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeMiterLimitNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeMiterLimit_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('4.000000');
      console.info('[shapeStrokeMiterLimitNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeMiterLimitUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEMITERLIMIT_UNDEFINED_0100
     * @tc.desc   Test Shape strokeMiterLimit method with undefined parameter, should be treated as default value 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeMiterLimitUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeMiterLimitUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeMiterLimit_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('4.000000');
      console.info('[shapeStrokeMiterLimitUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeMiterLimitValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEMITERLIMIT_VALID_0100
     * @tc.desc   Test Shape strokeMiterLimit method with valid 5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeMiterLimitValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeMiterLimitValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeMiterLimit_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('5.000000');
      console.info('[shapeStrokeMiterLimitValid_0100] END');
    })

    /**
     * @tc.name   shapeAntiAliasValid_0100
     * @tc.number SUB_ARKUI_SHAPE_ANTIALIAS_VALID_0100
     * @tc.desc   Test Shape antiAlias method with valid false parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeAntiAliasValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeAntiAliasValid_0100] START');

      let strJson = getInspectorByKey('shape_antiAlias_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.antiAlias).assertEqual('false');
      console.info('[shapeAntiAliasValid_0100] END');
    })
  })
}

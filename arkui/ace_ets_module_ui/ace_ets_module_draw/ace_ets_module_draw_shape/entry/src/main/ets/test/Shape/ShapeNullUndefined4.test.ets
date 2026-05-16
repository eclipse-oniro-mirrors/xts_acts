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

export default function ShapeNullUndefined4Test() {
  describe('ShapeNullUndefined4Test', () => {
    beforeAll(async (done: Function) => {
      console.info("ShapeNullUndefined4Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeNullUndefined4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeNullUndefined4 state pages: " + JSON.stringify(pages));
        if (!("ShapeNullUndefined4" == pages.name)) {
          console.info("get ShapeNullUndefined4 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeNullUndefined4 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeNullUndefined4 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   shapeStrokeDashArrayNull_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHARRAY_NULL_0100
     * @tc.desc   Test Shape strokeDashArray method with null parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashArrayNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashArrayNull_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashArray_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeStrokeDashArrayNull_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[shapeStrokeDashArrayNull_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashArrayUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHARRAY_UNDEFINED_0100
     * @tc.desc   Test Shape strokeDashArray method with undefined parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashArrayUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashArrayUndefined_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashArray_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeStrokeDashArrayUndefined_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[shapeStrokeDashArrayUndefined_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashArrayEmpty_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHARRAY_EMPTY_0100
     * @tc.desc   Test Shape strokeDashArray method with empty array parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashArrayEmpty_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashArrayEmpty_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashArray_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeStrokeDashArrayEmpty_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[shapeStrokeDashArrayEmpty_0100] END');
    })

    /**
     * @tc.name   shapeStrokeDashArrayValid_0100
     * @tc.number SUB_ARKUI_SHAPE_STROKEDASHARRAY_VALID_0100
     * @tc.desc   Test Shape strokeDashArray method with valid [10, 5] parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeStrokeDashArrayValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeStrokeDashArrayValid_0100] START');

      let strJson = getInspectorByKey('shape_strokeDashArray_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeStrokeDashArrayValid_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray[0]).assertEqual('10.00vp');
      expect(obj.$attrs.strokeDashArray[1]).assertEqual('5.00vp');
      console.info('[shapeStrokeDashArrayValid_0100] END');
    })

    /**
     * @tc.name   shapeViewPortValid_0100
     * @tc.number SUB_ARKUI_SHAPE_VIEWPORT_VALID_0100
     * @tc.desc   Test Shape viewPort method with valid parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeViewPortValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeViewPortValid_0100] START');

      let strJson = getInspectorByKey('shape_viewPort_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeViewPortValid_0100] obj.$attrs.viewPort.x: ' + obj.$attrs.viewPort.x);
      console.info('[shapeViewPortValid_0100] obj.$attrs.viewPort.y: ' + obj.$attrs.viewPort.y);
      console.info('[shapeViewPortValid_0100] obj.$attrs.viewPort.width: ' + obj.$attrs.viewPort.width);
      console.info('[shapeViewPortValid_0100] obj.$attrs.viewPort.height: ' + obj.$attrs.viewPort.height);
      expect(obj.$attrs.viewPort.x).assertEqual('0.00vp');
      expect(obj.$attrs.viewPort.y).assertEqual('0.00vp');
      expect(obj.$attrs.viewPort.width).assertEqual('80.00vp');
      expect(obj.$attrs.viewPort.height).assertEqual('80.00vp');
      console.info('[shapeViewPortValid_0100] END');
    })
  })
}

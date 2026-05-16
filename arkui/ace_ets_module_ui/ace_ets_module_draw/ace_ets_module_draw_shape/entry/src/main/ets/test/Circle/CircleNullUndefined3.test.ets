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

export default function CircleNullUndefined3Test() {
  describe('CircleNullUndefined3Test', () => {
    beforeAll(async (done: Function) => {
      console.info("CircleNullUndefined3Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Circle/CircleNullUndefined3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CircleNullUndefined3 state pages: " + JSON.stringify(pages));
        if (!("CircleNullUndefined3" == pages.name)) {
          console.info("get CircleNullUndefined3 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CircleNullUndefined3 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CircleNullUndefined3 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CircleStrokeWidthNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEWIDTH_NULL_0100
     * @tc.desc   Test Circle strokeWidth method with null parameter, should be treated as default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeWidthNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeWidthNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(1);
      console.info('[CircleStrokeWidthNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeWidthUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test Circle strokeWidth method with undefined parameter, should be treated as default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeWidthUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeWidthUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(1);
      console.info('[CircleStrokeWidthUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeWidthValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEWIDTH_VALID_0100
     * @tc.desc   Test Circle strokeWidth method with valid 4 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeWidthValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeWidthValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeWidth_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(px2vp(obj.$attrs.strokeWidth)).assertEqual(4);
      console.info('[CircleStrokeWidthValid_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashOffsetNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHOFFSET_NULL_0100
     * @tc.desc   Test Circle strokeDashOffset method with null parameter, should be treated as default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashOffsetNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashOffsetNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('0.00px');
      console.info('[CircleStrokeDashOffsetNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashOffsetUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHOFFSET_UNDEFINED_0100
     * @tc.desc   Test Circle strokeDashOffset method with undefined parameter, should be treated as default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashOffsetUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashOffsetUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('0.00px');
      console.info('[CircleStrokeDashOffsetUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashOffsetValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHOFFSET_VALID_0100
     * @tc.desc   Test Circle strokeDashOffset method with valid 5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashOffsetValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashOffsetValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashOffset_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeDashOffset).assertEqual('5.00vp');
      console.info('[CircleStrokeDashOffsetValid_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashArrayNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHARRAY_NULL_0100
     * @tc.desc   Test Circle strokeDashArray method with null parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashArrayNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashArrayNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashArray_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[CircleStrokeDashArrayNull_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[CircleStrokeDashArrayNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashArrayUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHARRAY_UNDEFINED_0100
     * @tc.desc   Test Circle strokeDashArray method with undefined parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashArrayUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashArrayUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashArray_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[CircleStrokeDashArrayUndefined_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[CircleStrokeDashArrayUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashArrayEmpty_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHARRAY_EMPTY_0100
     * @tc.desc   Test Circle strokeDashArray method with empty array parameter, should be treated as default value []
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashArrayEmpty_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashArrayEmpty_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashArray_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[CircleStrokeDashArrayEmpty_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray.toString()).assertEqual('');
      console.info('[CircleStrokeDashArrayEmpty_0100] END');
    })

    /**
     * @tc.name   CircleStrokeDashArrayValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEDASHARRAY_VALID_0100
     * @tc.desc   Test Circle strokeDashArray method with valid [10, 5] parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeDashArrayValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeDashArrayValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeDashArray_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[CircleStrokeDashArrayValid_0100] obj.$attrs.strokeDashArray: ' + obj.$attrs.strokeDashArray);
      expect(obj.$attrs.strokeDashArray[0]).assertEqual('10.00vp');
      expect(obj.$attrs.strokeDashArray[1]).assertEqual('5.00vp');
      console.info('[CircleStrokeDashArrayValid_0100] END');
    })

    /**
     * @tc.name   CircleAntiAliasValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_ANTIALIAS_VALID_0100
     * @tc.desc   Test Circle antiAlias method with valid false parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleAntiAliasValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleAntiAliasValid_0100] START');

      let strJson = getInspectorByKey('Circle_antiAlias_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.antiAlias).assertEqual('false');
      console.info('[CircleAntiAliasValid_0100] END');
    })

    /**
     * @tc.name   CircleAntiAliasValid_0200
     * @tc.number SUB_ARKUI_CIRCLE_ANTIALIAS_VALID_0200
     * @tc.desc   Test Circle antiAlias method with valid true parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleAntiAliasValid_0200', Level.LEVEL0, async () => {
      console.info('[CircleAntiAliasValid_0200] START');

      let strJson = getInspectorByKey('Circle_antiAlias_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.antiAlias).assertEqual('true');
      console.info('[CircleAntiAliasValid_0200] END');
    })
  })
}

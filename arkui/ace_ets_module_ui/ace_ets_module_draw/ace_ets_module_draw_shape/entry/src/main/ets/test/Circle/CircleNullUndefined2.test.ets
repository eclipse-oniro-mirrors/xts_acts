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

export default function CircleNullUndefined2Test() {
  describe('CircleNullUndefined2Test', () => {
    beforeAll(async (done: Function) => {
      console.info("CircleResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Circle/CircleNullUndefined2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CircleNullUndefined2 state pages: " + JSON.stringify(pages));
        if (!("CircleNullUndefined2" == pages.name)) {
          console.info("get CircleNullUndefined2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CircleNullUndefined2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CircleNullUndefined2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CircleStrokeLineJoinNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINEJOIN_NULL_0100
     * @tc.desc   Test Circle strokeLineJoin method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineJoinNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineJoinNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineJoin_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      console.info('[CircleStrokeLineJoinNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeLineJoinUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINEJOIN_UNDEFINED_0100
     * @tc.desc   Test Circle strokeLineJoin method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineJoinUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineJoinUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineJoin_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Miter');
      console.info('[CircleStrokeLineJoinUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeLineJoinValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINEJOIN_VALID_0100
     * @tc.desc   Test Circle strokeLineJoin method with valid LineJoinStyle.Round parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineJoinValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineJoinValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineJoin_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineJoin).assertEqual('LineJoinStyle.Round');
      console.info('[CircleStrokeLineJoinValid_0100] END');
    })

    /**
     * @tc.name   CircleStrokeOpacityNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEOPACITY_NULL_0100
     * @tc.desc   Test Circle strokeOpacity method with null parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeOpacityNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeOpacityNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeOpacity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('1.000000');
      console.info('[CircleStrokeOpacityNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeOpacityUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEOPACITY_UNDEFINED_0100
     * @tc.desc   Test Circle strokeOpacity method with undefined parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeOpacityUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeOpacityUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeOpacity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('1.000000');
      console.info('[CircleStrokeOpacityUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeOpacityValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKEOPACITY_VALID_0100
     * @tc.desc   Test Circle strokeOpacity method with valid 0.5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeOpacityValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeOpacityValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeOpacity_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeOpacity).assertEqual('0.500000');
      console.info('[CircleStrokeOpacityValid_0100] END');
    })

    /**
     * @tc.name   CircleFillOpacityNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILLOPACITY_NULL_0100
     * @tc.desc   Test Circle fillOpacity method with null parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillOpacityNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillOpacityNull_0100] START');

      let strJson = getInspectorByKey('Circle_fillOpacity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('1.000000');
      console.info('[CircleFillOpacityNull_0100] END');
    })

    /**
     * @tc.name   CircleFillOpacityUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILLOPACITY_UNDEFINED_0100
     * @tc.desc   Test Circle fillOpacity method with undefined parameter, should be treated as 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillOpacityUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillOpacityUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_fillOpacity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('1.000000');
      console.info('[CircleFillOpacityUndefined_0100] END');
    })

    /**
     * @tc.name   CircleFillOpacityValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILLOPACITY_VALID_0100
     * @tc.desc   Test Circle fillOpacity method with valid 0.5 parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillOpacityValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillOpacityValid_0100] START');

      let strJson = getInspectorByKey('Circle_fillOpacity_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fillOpacity).assertEqual('0.500000');
      console.info('[CircleFillOpacityValid_0100] END');
    })
  })
}

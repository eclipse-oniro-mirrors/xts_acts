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

export default function CircleNullUndefinedTest() {
  describe('CircleNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("CircleResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Circle/CircleNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CircleNullUndefined state pages: " + JSON.stringify(pages));
        if (!("CircleNullUndefined" == pages.name)) {
          console.info("get CircleNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CircleNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CircleNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CircleFillNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILL_NULL_0100
     * @tc.desc   Test Circle fill method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillNull_0100] START');

      let strJson = getInspectorByKey('Circle_fill_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[CircleFillNull_0100] END');
    })

    /**
     * @tc.name   CircleFillUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILL_UNDEFINED_0100
     * @tc.desc   Test Circle fill method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_fill_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[CircleFillUndefined_0100] END');
    })

    /**
     * @tc.name   CircleFillEmpty_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILL_EMPTY_0100
     * @tc.desc   Test Circle fill method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillEmpty_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillEmpty_0100] START');

      let strJson = getInspectorByKey('Circle_fill_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FF000000');
      console.info('[CircleFillEmpty_0100] END');
    })

    /**
     * @tc.name   CircleFillValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_FILL_VALID_0100
     * @tc.desc   Test Circle fill method with valid Color.Red parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleFillValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleFillValid_0100] START');

      let strJson = getInspectorByKey('Circle_fill_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fill).assertEqual('#FFFF0000');
      console.info('[CircleFillValid_0100] END');
    })

    /**
     * @tc.name   CircleStrokeNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKE_NULL_0100
     * @tc.desc   Test Circle stroke method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeNull_0100] START');

      let strJson = getInspectorByKey('Circle_stroke_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[CircleStrokeNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKE_UNDEFINED_0100
     * @tc.desc   Test Circle stroke method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_stroke_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[CircleStrokeUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeEmpty_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKE_EMPTY_0100
     * @tc.desc   Test Circle stroke method with empty string parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeEmpty_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeEmpty_0100] START');

      let strJson = getInspectorByKey('Circle_stroke_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#00000000');
      console.info('[CircleStrokeEmpty_0100] END');
    })

    /**
     * @tc.name   CircleStrokeValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKE_VALID_0100
     * @tc.desc   Test Circle stroke method with valid Color.Blue parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeValid_0100] START');

      let strJson = getInspectorByKey('Circle_stroke_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.stroke).assertEqual('#FF0000FF');
      console.info('[CircleStrokeValid_0100] END');
    })

    /**
     * @tc.name   CircleStrokeLineCapNull_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINECAP_NULL_0100
     * @tc.desc   Test Circle strokeLineCap method with null parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineCapNull_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineCapNull_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineCap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      console.info('[CircleStrokeLineCapNull_0100] END');
    })

    /**
     * @tc.name   CircleStrokeLineCapUndefined_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINECAP_UNDEFINED_0100
     * @tc.desc   Test Circle strokeLineCap method with undefined parameter, should be treated as default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineCapUndefined_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineCapUndefined_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineCap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Butt');
      console.info('[CircleStrokeLineCapUndefined_0100] END');
    })

    /**
     * @tc.name   CircleStrokeLineCapValid_0100
     * @tc.number SUB_ARKUI_CIRCLE_STROKELINECAP_VALID_0100
     * @tc.desc   Test Circle strokeLineCap method with valid LineCapStyle.Round parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('CircleStrokeLineCapValid_0100', Level.LEVEL0, async () => {
      console.info('[CircleStrokeLineCapValid_0100] START');

      let strJson = getInspectorByKey('Circle_strokeLineCap_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.strokeLineCap).assertEqual('LineCapStyle.Round');
      console.info('[CircleStrokeLineCapValid_0100] END');
    })
  })
}

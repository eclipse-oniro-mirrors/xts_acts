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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SpanFontVariationsTest() {
  describe('SpanFontVariationsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SpanFontVariationsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Span/SpanFontVariations',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpanFontVariationsTest state pages: " + JSON.stringify(pages));
        if (!("SpanFontVariations" == pages.name)) {
          console.info("get SpanFontVariationsTest state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SpanFontVariationsTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   spanFontVariations_array_0100
     * @tc.number SUB_ARKUI_SPAN_FONTVARIATIONS_PARAM_0100
     * @tc.desc   Test Span fontVariations property with Array<FontVariation> parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('spanFontVariations_array_0100', Level.LEVEL2, async () => {
      console.info('[spanFontVariations_array_0100] START');

      let strJson: string = getInspectorByKey('span_fontVariations_array');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontVariations_array_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontVariations_array_0100] fontVariations is: " + JSON.stringify(obj.$attrs.fontVariations));
      console.info("[spanFontVariations_array_0100] fontVariations axis is: " + obj.$attrs.fontVariations[0].axis);
      console.info("[spanFontVariations_array_0100] fontVariations value is: " + obj.$attrs.fontVariations[0].value);

      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontVariations[0].axis).assertEqual('weight');
      expect(obj.$attrs.fontVariations[0].value).assertEqual('900.000000');
      console.info('[spanFontVariations_array_0100] END');
    })

    /**
     * @tc.name   spanFontVariations_multi_0100
     * @tc.number SUB_ARKUI_SPAN_FONTVARIATIONS_PARAM_0200
     * @tc.desc   Test Span fontVariations property with multiple FontVariation axes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('spanFontVariations_multi_0100', Level.LEVEL2, async () => {
      console.info('[spanFontVariations_multi_0100] START');

      let strJson: string = getInspectorByKey('span_fontVariations_multi');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontVariations_multi_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontVariations_multi_0100] fontVariations is: " + obj.$attrs.fontVariations);
      console.info("[spanFontVariations_multi_0100] fontVariations[0] axis is: " + obj.$attrs.fontVariations[0].axis);
      console.info("[spanFontVariations_multi_0100] fontVariations[0] value is: " + obj.$attrs.fontVariations[0].value);
      console.info("[spanFontVariations_multi_0100] fontVariations[1] axis is: " + obj.$attrs.fontVariations[1].axis);
      console.info("[spanFontVariations_multi_0100] fontVariations[1] value is: " + obj.$attrs.fontVariations[1].value);

      expect(obj.$type).assertEqual('Span');
      expect(obj.$attrs.fontVariations[0].axis).assertEqual('weight');
      expect(obj.$attrs.fontVariations[0].value).assertEqual('700.000000');
      expect(obj.$attrs.fontVariations[1].axis).assertEqual('ital');
      expect(obj.$attrs.fontVariations[1].value).assertEqual('1.000000');
      console.info('[spanFontVariations_multi_0100] END');
    })

    /**
     * @tc.name   spanFontVariations_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTVARIATIONS_PARAM_0300
     * @tc.desc   Test Span fontVariations property with null parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('spanFontVariations_null_0100', Level.LEVEL2, async () => {
      console.info('[spanFontVariations_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('span_fontVariations_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('span_fontVariations_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontVariations_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontVariations_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontVariations_null_0100] default fontVariations is: " + JSON.stringify(objCompare.$attrs.fontVariations));
      console.info("[spanFontVariations_null_0100] null fontVariations is: " + JSON.stringify(obj.$attrs.fontVariations));

      expect(JSON.stringify(obj.$attrs.fontVariations)).assertEqual(JSON.stringify(objCompare.$attrs.fontVariations));
      console.info('[spanFontVariations_null_0100] END');
    })

    /**
     * @tc.name   spanFontVariations_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTVARIATIONS_PARAM_0400
     * @tc.desc   Test Span fontVariations property with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('spanFontVariations_undefined_0100', Level.LEVEL2, async () => {
      console.info('[spanFontVariations_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('span_fontVariations_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('span_fontVariations_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontVariations_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontVariations_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontVariations_undefined_0100] default fontVariations is: " + JSON.stringify(objCompare.$attrs.fontVariations));
      console.info("[spanFontVariations_undefined_0100] undefined fontVariations is: " + JSON.stringify(obj.$attrs.fontVariations));

      expect(JSON.stringify(obj.$attrs.fontVariations)).assertEqual(JSON.stringify(objCompare.$attrs.fontVariations));
      console.info('[spanFontVariations_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontVariations_empty_0100
     * @tc.number SUB_ARKUI_SPAN_FONTVARIATIONS_PARAM_0500
     * @tc.desc   Test Span fontVariations property with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('spanFontVariations_empty_0100', Level.LEVEL2, async () => {
      console.info('[spanFontVariations_empty_0100] START');
      let strJsonCompare: string = getInspectorByKey('span_fontVariations_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('span_fontVariations_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontVariations_empty_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontVariations_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontVariations_empty_0100] fontVariations is: " + JSON.stringify(obj.$attrs.fontVariations));
      console.info("[spanFontVariations_empty_0100] default fontVariations is: " + JSON.stringify(objCompare.$attrs.fontVariations));

      expect(JSON.stringify(obj.$attrs.fontVariations)).assertEqual(JSON.stringify(objCompare.$attrs.fontVariations));
      console.info('[spanFontVariations_empty_0100] END');
    })

  })
}
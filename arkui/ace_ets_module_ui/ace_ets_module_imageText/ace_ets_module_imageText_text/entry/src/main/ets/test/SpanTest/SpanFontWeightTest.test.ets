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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function SpanFontWeightTest() {
  describe('SpanFontWeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SpanFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Span/SpanFontWeightTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpanFontWeightTest state pages: " + JSON.stringify(pages));
        if (!("SpanFontWeightTest" == pages.name)) {
          console.info("get SpanFontWeightTest state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SpanFontWeightTest page error: " + err);
      }
      done();
    })
    /**
     * @tc.name   SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100
     * @tc.number SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100
     * @tc.desc   test Text Span FontWeightConfigs all set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100] START**********************************');
      let strJson = getInspectorByKey('testFontWeightConfigsAllNull');
      let checkFontWeight: string = JSON.parse(strJson).$attrs.fontWeight
      console.info('====>[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100] checkFontWeight====>: ' + checkFontWeight);
      expect(checkFontWeight).assertEqual('400');
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0100] END**********************************');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200
     * @tc.number SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200
     * @tc.desc   test Text Span FontWeightConfigs all set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200] START**********************************');
      let strJson = getInspectorByKey('testFontWeightConfigsALLUndefined');
      let checkFontWeight: string = JSON.parse(strJson).$attrs.fontWeight
      console.info('====>[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200] checkFontWeight====>: ' + checkFontWeight);
      expect(checkFontWeight).assertEqual('400');
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0200] END**********************************');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300
     * @tc.number SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300
     * @tc.desc   test Text Span FontWeightConfigs all set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300] START**********************************');
      let strJson = getInspectorByKey('testFontWeightConfigsALLTrue');
      let checkFontWeight: string = JSON.parse(strJson).$attrs.fontWeight
      console.info('====>[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300] checkFontWeight====>: ' + checkFontWeight);
      expect(checkFontWeight).assertEqual('600');
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0300] END**********************************');
      done();
    });


    /**
     * @tc.name   SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400
     * @tc.number SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400
     * @tc.desc   test Text Span FontWeightConfigs all set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400',  Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400] START**********************************');
      let strJson = getInspectorByKey('testFontWeightConfigsALLFalse');
      let checkFontWeight: string = JSON.parse(strJson).$attrs.fontWeight
      console.info('====>[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400] checkFontWeight====>: ' + checkFontWeight);
      expect(checkFontWeight).assertEqual('600');
      console.info('[SUB_ARKUI_TEXT_SPAN_FONTWEIGHT_CONFIGS_TEST_0400] END**********************************');
      done();
    });

  });
}

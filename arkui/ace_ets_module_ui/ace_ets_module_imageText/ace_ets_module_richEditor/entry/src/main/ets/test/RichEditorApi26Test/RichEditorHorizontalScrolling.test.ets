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

export default function RichEditorHorizontalScrollingTest() {
  describe('RichEditorHorizontalScrollingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorHorizontalScrollingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorHorizontalScrolling',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorHorizontalScrolling state pages: " + JSON.stringify(pages));
        if (!("RichEditorHorizontalScrolling" == pages.name)) {
          console.info("get RichEditorHorizontalScrolling state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorHorizontalScrolling success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorHorizontalScrolling page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   richEditorHorizontalScrolling_true_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_TRUE_0100
     * @tc.desc   Test RichEditor horizontalScrolling property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorHorizontalScrolling_true_0100', Level.LEVEL0, async () => {
      console.info('[richEditorHorizontalScrolling_true_0100] START');

      let strJson: string = getInspectorByKey('richEditor_horizontalScrolling_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorHorizontalScrolling_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorHorizontalScrolling_true_0100] horizontalScrolling is: " + obj.$attrs.horizontalScrolling);

      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.horizontalScrolling).assertEqual('true');
      console.info('[richEditorHorizontalScrolling_true_0100] END');
    })

    /**
     * @tc.name   richEditorHorizontalScrolling_false_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_FALSE_0100
     * @tc.desc   Test RichEditor horizontalScrolling property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorHorizontalScrolling_false_0100', Level.LEVEL0, async () => {
      console.info('[richEditorHorizontalScrolling_false_0100] START');

      let strJson: string = getInspectorByKey('richEditor_horizontalScrolling_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorHorizontalScrolling_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorHorizontalScrolling_false_0100] horizontalScrolling is: " + obj.$attrs.horizontalScrolling);

      expect(obj.$type).assertEqual('RichEditor');
      expect(obj.$attrs.horizontalScrolling).assertEqual('false');
      console.info('[richEditorHorizontalScrolling_false_0100] END');
    })

    /**
     * @tc.name   richEditorHorizontalScrolling_null_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_NULL_0100
     * @tc.desc   Test RichEditor horizontalScrolling property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorHorizontalScrolling_null_0100', Level.LEVEL0, async () => {
      console.info('[richEditorHorizontalScrolling_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('richEditor_horizontalScrolling_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('richEditor_horizontalScrolling_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorHorizontalScrolling_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[richEditorHorizontalScrolling_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorHorizontalScrolling_null_0100] default horizontalScrolling is: " + objCompare.$attrs.horizontalScrolling);
      console.info("[richEditorHorizontalScrolling_null_0100] null horizontalScrolling is: " + obj.$attrs.horizontalScrolling);

      expect(obj.$attrs.horizontalScrolling).assertEqual(objCompare.$attrs.horizontalScrolling);
      console.info('[richEditorHorizontalScrolling_null_0100] END');
    })

    /**
     * @tc.name   richEditorHorizontalScrolling_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_HORIZONTALSCROLLING_UNDEFINED_0100
     * @tc.desc   Test RichEditor horizontalScrolling property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorHorizontalScrolling_undefined_0100', Level.LEVEL0, async () => {
      console.info('[richEditorHorizontalScrolling_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('richEditor_horizontalScrolling_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('richEditor_horizontalScrolling_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[richEditorHorizontalScrolling_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[richEditorHorizontalScrolling_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[richEditorHorizontalScrolling_undefined_0100] default horizontalScrolling is: " + objCompare.$attrs.horizontalScrolling);
      console.info("[richEditorHorizontalScrolling_undefined_0100] undefined horizontalScrolling is: " + obj.$attrs.horizontalScrolling);

      expect(obj.$attrs.horizontalScrolling).assertEqual(objCompare.$attrs.horizontalScrolling);
      console.info('[richEditorHorizontalScrolling_undefined_0100] END');
    })

  })
}
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

export default function TextOrphanCharOptimizationTest() {
  describe('TextOrphanCharOptimizationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextOrphanCharOptimizationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextOrphanCharOptimization',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextOrphanCharOptimization state pages: " + JSON.stringify(pages));
        if (!("TextOrphanCharOptimization" == pages.name)) {
          console.info("get TextOrphanCharOptimization state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextOrphanCharOptimization success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextOrphanCharOptimization page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textOrphanCharOptimization_true_0100
     * @tc.number SUB_ARKUI_TEXT_ORPHANCHAROPTIMIZATION_TRUE_0100
     * @tc.desc   Test Text orphanCharOptimization property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOrphanCharOptimization_true_0100', Level.LEVEL0, async () => {
      console.info('[textOrphanCharOptimization_true_0100] START');

      let strJson: string = getInspectorByKey('text_orphanCharOptimization_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textOrphanCharOptimization_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textOrphanCharOptimization_true_0100] orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.orphanCharOptimization).assertEqual('true');
      console.info('[textOrphanCharOptimization_true_0100] END');
    })

    /**
     * @tc.name   textOrphanCharOptimization_false_0100
     * @tc.number SUB_ARKUI_TEXT_ORPHANCHAROPTIMIZATION_FALSE_0100
     * @tc.desc   Test Text orphanCharOptimization property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOrphanCharOptimization_false_0100', Level.LEVEL0, async () => {
      console.info('[textOrphanCharOptimization_false_0100] START');

      let strJson: string = getInspectorByKey('text_orphanCharOptimization_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textOrphanCharOptimization_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textOrphanCharOptimization_false_0100] orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[textOrphanCharOptimization_false_0100] END');
    })

    /**
     * @tc.name   textOrphanCharOptimization_null_0100
     * @tc.number SUB_ARKUI_TEXT_ORPHANCHAROPTIMIZATION_NULL_0100
     * @tc.desc   Test Text orphanCharOptimization property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOrphanCharOptimization_null_0100', Level.LEVEL0, async () => {
      console.info('[textOrphanCharOptimization_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_orphanCharOptimization_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_orphanCharOptimization_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textOrphanCharOptimization_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textOrphanCharOptimization_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textOrphanCharOptimization_null_0100] default orphanCharOptimization is: " + objCompare.$attrs.orphanCharOptimization);
      console.info("[textOrphanCharOptimization_null_0100] null orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$attrs.orphanCharOptimization).assertEqual(objCompare.$attrs.orphanCharOptimization);
      console.info('[textOrphanCharOptimization_null_0100] END');
    })

    /**
     * @tc.name   textOrphanCharOptimization_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_ORPHANCHAROPTIMIZATION_UNDEFINED_0100
     * @tc.desc   Test Text orphanCharOptimization property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOrphanCharOptimization_undefined_0100', Level.LEVEL0, async () => {
      console.info('[textOrphanCharOptimization_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_orphanCharOptimization_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_orphanCharOptimization_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textOrphanCharOptimization_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textOrphanCharOptimization_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textOrphanCharOptimization_undefined_0100] default orphanCharOptimization is: " + objCompare.$attrs.orphanCharOptimization);
      console.info("[textOrphanCharOptimization_undefined_0100] undefined orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$attrs.orphanCharOptimization).assertEqual(objCompare.$attrs.orphanCharOptimization);
      console.info('[textOrphanCharOptimization_undefined_0100] END');
    })

  })
}
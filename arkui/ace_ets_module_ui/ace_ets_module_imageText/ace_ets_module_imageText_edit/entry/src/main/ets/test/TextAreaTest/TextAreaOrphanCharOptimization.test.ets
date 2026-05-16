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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function TextAreaOrphanCharOptimizationTest() {
  describe('TextAreaOrphanCharOptimizationTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextArea/TextAreaOrphanCharOptimization',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaOrphanCharOptimization state success " + JSON.stringify(pages));
        if (!("TextAreaOrphanCharOptimization" == pages.name)) {
          console.info("get TextAreaOrphanCharOptimization state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextAreaOrphanCharOptimization page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaOrphanCharOptimization page error: " + err);
      }
    });

    /**
     * @tc.name   textAreaOrphanCharOptimization_true_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ORPHANCHAROPTIMIZATION_TRUE_0100
     * @tc.desc   Test TextArea orphanCharOptimization property with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaOrphanCharOptimization_true_0100', Level.LEVEL0, async () => {
      console.info('[textAreaOrphanCharOptimization_true_0100] START');

      let strJson: string = getInspectorByKey('textArea_orphanCharOptimization_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaOrphanCharOptimization_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaOrphanCharOptimization_true_0100] orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.orphanCharOptimization).assertEqual('true');
      console.info('[textAreaOrphanCharOptimization_true_0100] END');
    })

    /**
     * @tc.name   textAreaOrphanCharOptimization_false_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ORPHANCHAROPTIMIZATION_FALSE_0100
     * @tc.desc   Test TextArea orphanCharOptimization property with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaOrphanCharOptimization_false_0100', Level.LEVEL0, async () => {
      console.info('[textAreaOrphanCharOptimization_false_0100] START');

      let strJson: string = getInspectorByKey('textArea_orphanCharOptimization_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaOrphanCharOptimization_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaOrphanCharOptimization_false_0100] orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[textAreaOrphanCharOptimization_false_0100] END');
    })

    /**
     * @tc.name   textAreaOrphanCharOptimization_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ORPHANCHAROPTIMIZATION_NULL_0100
     * @tc.desc   Test TextArea orphanCharOptimization property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaOrphanCharOptimization_null_0100', Level.LEVEL0, async () => {
      console.info('[textAreaOrphanCharOptimization_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('textArea_orphanCharOptimization_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textArea_orphanCharOptimization_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaOrphanCharOptimization_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaOrphanCharOptimization_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaOrphanCharOptimization_null_0100] default orphanCharOptimization is: " + objCompare.$attrs.orphanCharOptimization);
      console.info("[textAreaOrphanCharOptimization_null_0100] null orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$attrs.orphanCharOptimization).assertEqual(objCompare.$attrs.orphanCharOptimization);
      console.info('[textAreaOrphanCharOptimization_null_0100] END');
    })

    /**
     * @tc.name   textAreaOrphanCharOptimization_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ORPHANCHAROPTIMIZATION_UNDEFINED_0100
     * @tc.desc   Test TextArea orphanCharOptimization property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textAreaOrphanCharOptimization_undefined_0100', Level.LEVEL0, async () => {
      console.info('[textAreaOrphanCharOptimization_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textArea_orphanCharOptimization_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textArea_orphanCharOptimization_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaOrphanCharOptimization_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaOrphanCharOptimization_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaOrphanCharOptimization_undefined_0100] default orphanCharOptimization is: " + objCompare.$attrs.orphanCharOptimization);
      console.info("[textAreaOrphanCharOptimization_undefined_0100] undefined orphanCharOptimization is: " + obj.$attrs.orphanCharOptimization);

      expect(obj.$attrs.orphanCharOptimization).assertEqual(objCompare.$attrs.orphanCharOptimization);
      console.info('[textAreaOrphanCharOptimization_undefined_0100] END');
    })

  })
}
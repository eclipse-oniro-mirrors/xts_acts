/*
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON} from '@ohos.UiTest';

export default function OrphanCharOptimizationTest() {
  describe('OrphanCharOptimizationTest', () => {
    let PAGE_TAG = 'orphanCharOptimizationTest';

    beforeAll(async (done: Function) => {
        await Utils.pushPage(`orphanCharOptimization/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0100
     * @tc.number SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0100
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0100] START');
      let driver: Driver = Driver.create();

      await Utils.sleep(1000);
      let textTrue = getInspectorByKey('textCAPI');
      let ObjTextTrue: ESObject = JSON.parse(textTrue);
      expect(ObjTextTrue.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let textAreaTrue = getInspectorByKey('textAreaCAPI');
      let ObjTextAreaTrue: ESObject = JSON.parse(textAreaTrue);
      expect(ObjTextAreaTrue.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let textInputTrue = getInspectorByKey('textInputCAPI');
      let ObjTextInputTrue: ESObject = JSON.parse(textInputTrue);
      expect(ObjTextInputTrue.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let richEditorTrue = getInspectorByKey('richEditorCAPI');
      let ObjRichEditorTrue: ESObject = JSON.parse(richEditorTrue);
      expect(ObjRichEditorTrue.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0200
     * @tc.number SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0200
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0200] START');
      let driver1: Driver = Driver.create();
      let buttonTrue = await driver1.findComponent(ON.id('trueCAPI'));
      await buttonTrue.click();
      await Utils.sleep(1000);

      let textFalse = getInspectorByKey('textCAPI');
      let ObjTextFalse: ESObject = JSON.parse(textFalse);
      expect(ObjTextFalse.$attrs.orphanCharOptimization).assertEqual('true');

      await Utils.sleep(1000);
      let textAreaFalse = getInspectorByKey('textAreaCAPI');
      let ObjTextAreaFalse: ESObject = JSON.parse(textAreaFalse);
      expect(ObjTextAreaFalse.$attrs.orphanCharOptimization).assertEqual('true');

      await Utils.sleep(1000);
      let textInputFalse = getInspectorByKey('textInputCAPI');
      let ObjTextInputFalse: ESObject = JSON.parse(textInputFalse);
      expect(ObjTextInputFalse.$attrs.orphanCharOptimization).assertEqual('true');

      await Utils.sleep(1000);
      let richEditorFalse = getInspectorByKey('richEditorCAPI');
      let ObjRichEditorFalse: ESObject = JSON.parse(richEditorFalse);
      expect(ObjRichEditorFalse.$attrs.orphanCharOptimization).assertEqual('true');
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0300
     * @tc.number SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0300
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0300] START');
      let driver2: Driver = Driver.create();
      let buttonUn = await driver2.findComponent(ON.id('undefinedCAPI'));
      await buttonUn.click();
      await Utils.sleep(1000);

      let textUn = getInspectorByKey('textCAPI');
      let ObjTextUn: ESObject = JSON.parse(textUn);
      expect(ObjTextUn.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let textAreaUn = getInspectorByKey('textAreaCAPI');
      let ObjTextAreaUn: ESObject = JSON.parse(textAreaUn);
      expect(ObjTextAreaUn.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let textInputUn = getInspectorByKey('textInputCAPI');
      let ObjTextInputUn: ESObject = JSON.parse(textInputUn);
      expect(ObjTextInputUn.$attrs.orphanCharOptimization).assertEqual('false');

      await Utils.sleep(1000);
      let richEditorUn = getInspectorByKey('richEditorCAPI');
      let ObjRichEditorUn: ESObject = JSON.parse(richEditorUn);
      expect(ObjRichEditorUn.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[SUB_ACE_ARKUI_ORPHANCHAROPTIMIZATION_0300] END');
      done();
    });
  })
}
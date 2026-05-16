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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function OrphanCharOptimizationTest() {
  describe('OrphanCharOptimizationTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/OrphanCharOptimization',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get OrphanCharOptimizationTest state pages: ' + JSON.stringify(pages));
        if (!('OrphanCharOptimization' == pages.name)) {
          console.info('get OrphanCharOptimizationTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push OrphanCharOptimizationTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push OrphanCharOptimizationTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('OrphanCharOptimizationTest after each called');
    });


    /**
     * @tc.name   SUB_ACE_ARKUI_OPTIMIZATION_0100
     * @tc.number SUB_ACE_ARKUI_OPTIMIZATION_0100
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_OPTIMIZATION_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] START');
      let driver: Driver = Driver.create();

      await CommonFunc.sleep(1000);
      let textTrue = getInspectorByKey('jsText');
      let ObjTextTrue: ESObject = JSON.parse(textTrue);
      expect(ObjTextTrue.$attrs.orphanCharOptimization).assertEqual('true');

      await CommonFunc.sleep(1000);
      let textAreaTrue = getInspectorByKey('jsTextArea');
      let ObjTextAreaTrue: ESObject = JSON.parse(textAreaTrue);
      expect(ObjTextAreaTrue.$attrs.orphanCharOptimization).assertEqual('true');

      await CommonFunc.sleep(1000);
      let textInputTrue = getInspectorByKey('jsTextInput');
      let ObjTextInputTrue: ESObject = JSON.parse(textInputTrue);
      expect(ObjTextInputTrue.$attrs.orphanCharOptimization).assertEqual('true');

      await CommonFunc.sleep(1000);
      let richEditorTrue = getInspectorByKey('jsRichEditor');
      let ObjRichEditorTrue: ESObject = JSON.parse(richEditorTrue);
      expect(ObjRichEditorTrue.$attrs.orphanCharOptimization).assertEqual('true');
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_OPTIMIZATION_0200
     * @tc.number SUB_ACE_ARKUI_OPTIMIZATION_0200
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_OPTIMIZATION_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0200] START');
      let driver1: Driver = Driver.create();
      let buttonFalse = await driver1.findComponent(ON.id('false'));
      await buttonFalse.click();
      await CommonFunc.sleep(1000);

      let textFalse = getInspectorByKey('jsText');
      let ObjTextFalse: ESObject = JSON.parse(textFalse);
      expect(ObjTextFalse.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let textAreaFalse = getInspectorByKey('jsTextArea');
      let ObjTextAreaFalse: ESObject = JSON.parse(textAreaFalse);
      expect(ObjTextAreaFalse.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let textInputFalse = getInspectorByKey('jsTextInput');
      let ObjTextInputFalse: ESObject = JSON.parse(textInputFalse);
      expect(ObjTextInputFalse.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let richEditorFalse = getInspectorByKey('jsRichEditor');
      let ObjRichEditorFalse: ESObject = JSON.parse(richEditorFalse);
      expect(ObjRichEditorFalse.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_OPTIMIZATION_0300
     * @tc.number SUB_ACE_ARKUI_OPTIMIZATION_0300
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_OPTIMIZATION_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0300] START');
      let driver2: Driver = Driver.create();
      let buttonUn = await driver2.findComponent(ON.id('undefined'));
      await buttonUn.click();
      await CommonFunc.sleep(1000);

      let textUn = getInspectorByKey('jsText');
      let ObjTextUn: ESObject = JSON.parse(textUn);
      expect(ObjTextUn.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let textAreaUn = getInspectorByKey('jsTextArea');
      let ObjTextAreaUn: ESObject = JSON.parse(textAreaUn);
      expect(ObjTextAreaUn.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let textInputUn = getInspectorByKey('jsTextInput');
      let ObjTextInputUn: ESObject = JSON.parse(textInputUn);
      expect(ObjTextInputUn.$attrs.orphanCharOptimization).assertEqual('false');

      await CommonFunc.sleep(1000);
      let richEditorUn = getInspectorByKey('jsRichEditor');
      let ObjRichEditorUn: ESObject = JSON.parse(richEditorUn);
      expect(ObjRichEditorUn.$attrs.orphanCharOptimization).assertEqual('false');
      console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0300] END');
      done();
    });
  })
}
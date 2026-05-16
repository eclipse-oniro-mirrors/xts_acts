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

export default function OrphanCharOptimizationnullTest() {
  describe('OrphanCharOptimizationnullTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/OrphanCharOptimization_null',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get OrphanCharOptimizationnullTest state pages: ' + JSON.stringify(pages));
        if (!('OrphanCharOptimization' == pages.name)) {
          console.info('get OrphanCharOptimizationnullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push OrphanCharOptimizationnullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push OrphanCharOptimizationnullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('OrphanCharOptimizationTest after each called');
    });


    /**
     * @tc.name   SUB_ACE_ARKUI_OPTIMIZATIONNULL_0100
     * @tc.number SUB_ACE_ARKUI_OPTIMIZATIONNULL_0100
     * @tc.desc   Component is Text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_OPTIMIZATIONNULL_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_OPTIMIZATIONNULL_0100] START');
      let driver1: Driver = Driver.create();
      let buttonFalse = await driver1.findComponent(ON.id('null'));
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
      console.info('[SUB_ACE_ARKUI_OPTIMIZATIONNULL_0100] END');
      done();
    });
  })
}
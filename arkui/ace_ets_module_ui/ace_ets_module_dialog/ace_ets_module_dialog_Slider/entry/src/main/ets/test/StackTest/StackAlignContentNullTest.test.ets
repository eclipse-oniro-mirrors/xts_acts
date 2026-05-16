/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function StackAlignContentNullTest() {
  describe('StackAlignContentNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackAlignContentNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackAlignContentNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackAlignContentNullTest state success " + JSON.stringify(pages));
        if (!("StackAlignContentNullTest" == pages.name)) {
          console.info("get StackAlignContentNullTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackAlignContentNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackAlignContentNullTest page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   StackAlignContentNull_001
     * @tc.number SUB_ARKUI_API_StackAlignContent_NULL_001
     * @tc.desc   Test Stack alignContent with null parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StackAlignContentNull_001', Level.LEVEL1, async (done: Function) => {
      console.info('[StackAlignContentNull_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_alignContent_null'));
      await button.click();
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('alignContent_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[StackAlignContentNull_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[StackAlignContentNull_001] END');
      done();
    });

    /**
     * @tc.name   StackAlignContentUndefined_001
     * @tc.number SUB_ARKUI_API_StackAlignContent_UNDEFINED_001
     * @tc.desc   Test Stack alignContent with undefined parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StackAlignContentUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[StackAlignContentUndefined_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_alignContent_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('alignContent_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[StackAlignContentUndefined_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[StackAlignContentUndefined_001] END');
      done();
    });

    /**
     * @tc.name   StackAlignContentMethodNull_001
     * @tc.number SUB_ARKUI_API_StackAlignContentMethod_NULL_001
     * @tc.desc   Test Stack.alignContent() method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StackAlignContentMethodNull_001', Level.LEVEL1, async (done: Function) => {
      console.info('[StackAlignContentMethodNull_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_alignContent_method_null'));
      await button.click();
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('alignContent_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[StackAlignContentMethodNull_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[StackAlignContentMethodNull_001] END');
      done();
    });

    /**
     * @tc.name   StackAlignContentMethodUndefined_001
     * @tc.number SUB_ARKUI_API_StackAlignContentMethod_UNDEFINED_001
     * @tc.desc   Test Stack.alignContent() method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StackAlignContentMethodUndefined_001', Level.LEVEL1, async (done: Function) => {
      console.info('[StackAlignContentMethodUndefined_001] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_alignContent_method_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);

      let strJson = getInspectorByKey('alignContent_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info("[StackAlignContentMethodUndefined_001] result: " + resultText);
      expect(resultText).assertContain('FAILED');
      console.info('[StackAlignContentMethodUndefined_001] END');
      done();
    });
  });
}
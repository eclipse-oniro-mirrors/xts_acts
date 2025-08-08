/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackFixAtIdealSizeTest() {
  describe('StackFixAtIdealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackFixAtIdealSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackFixAtIdealSizePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackFixAtIdealSizeTest state pages:" + JSON.stringify(pages));
        if (!("StackFixAtIdealSizePage" == pages.name)) {
          console.info("get StackFixAtIdealSizeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackFixAtIdealSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackFixAtIdealSizeTest page error:" + err);
      }
      console.info("StackFixAtIdealSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    it('StackFixAtIdealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackFixAtIdealSizeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('StackFixAtIdealSizePage_Stack');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StackFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[StackFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      let stack: RectValue = CommonFunc.getComponentRect('StackFixAtIdealSizePage_Stack');
      let stack_width = stack.right - stack.left;
      let stack_height = stack.bottom - stack.top;
      console.info("[StackFixAtIdealSizeTest_0100] stack_width is: " + stack_width);
      console.info("[StackFixAtIdealSizeTest_0100] stack_height is: " + stack_height);

      expect(obj.$attrs.width).assertEqual('50.00vp');
      expect(obj.$attrs.height).assertEqual('50.00vp');
      expect(Math.floor(Math.abs(stack_width - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(stack_height - vp2px(50))) <= 1).assertTrue();

      let button = await driver.findComponent(ON.id('StackFixAtIdealSizePage_Btn'));
      await button.click();
      console.info("[StackFixAtIdealSizeTest_0100] change width=160，height=120");
      await Utils.sleep(1000)

      strJson = getInspectorByKey('StackFixAtIdealSizePage_Stack');
      obj = JSON.parse(strJson);
      console.info("[StackFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[StackFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      stack = CommonFunc.getComponentRect('StackFixAtIdealSizePage_Stack');
      stack_width = stack.right - stack.left;
      stack_height = stack.bottom - stack.top;
      console.info("[StackFixAtIdealSizeTest_0100] stack_width is: " + stack_width);
      console.info("[StackFixAtIdealSizeTest_0100] stack_height is: " + stack_height);

      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(Math.floor(Math.abs(stack_width - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(stack_height - vp2px(100))) <= 1).assertTrue();

      console.info('[StackFixAtIdealSizeTest_0100] END');
      done();
    });

  })
}
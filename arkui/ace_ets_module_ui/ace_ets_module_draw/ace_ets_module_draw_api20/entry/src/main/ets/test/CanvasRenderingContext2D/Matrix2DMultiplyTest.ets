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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function Matrix2DMultiplyTest() {
  describe('Matrix2DMultiplyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Matrix2DMultiplyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/Matrix2DMultiply",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Matrix2DMultiplyTest state pages: " + JSON.stringify(pages));
        if (!("Matrix2DMultiplyTest" == pages.name)) {
          console.info("get Matrix2DMultiplyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Matrix2DMultiplyTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Matrix2DMultiplyTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
   
    it('Matrix2DMultiplyTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[Matrix2DMultiplyTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('CanvasMatrix2DMultiply1');
      console.info("[Matrix2DMultiplyTest_0100] CanvasEllipseType1 is: " + JSON.stringify(JSON.parse(strJson1).$type));

      expect(JSON.parse(strJson1).$type).assertEqual('Canvas');
      
      console.info('[Matrix2DMultiplyTest_0100] END');
      done();
    });
  })
}


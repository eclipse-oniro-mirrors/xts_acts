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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function CanvasParamsAntialiasTest() {
  describe('CanvasParamsAntialiasTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CanvasParamsAntialiasTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/CanvasParamsAntialiasPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CanvasParamsAntialiasTest state pages: " + JSON.stringify(pages));
        if (!("CanvasParamsAntialiasTest" == pages.name)) {
          console.info("get CanvasParamsAntialiasTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push CanvasParamsAntialiasTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CanvasParamsAntialiasTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CanvasParamsAntialiasTest_0100
     * @tc.number SUB_ARKUI_API_CanvasParamsAntialiasTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CanvasParamsAntialiasTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('CanvasParamsAntialiasTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('CanvasAntialias_canvas_1');
      expect(JSON.parse(strJson1).$type).assertEqual('Canvas');

      let strJson2: string = getInspectorByKey('CanvasAntialias_canvas_2');
      expect(JSON.parse(strJson2).$type).assertEqual('Canvas');

      let strJson3: string = getInspectorByKey('CanvasAntialias_canvas_3');
      expect(JSON.parse(strJson3).$type).assertEqual('Canvas');

      let strJson4: string = getInspectorByKey('CanvasAntialias_canvas_4');
      expect(JSON.parse(strJson4).$type).assertEqual('Canvas');

      console.info('[CanvasParamsAntialiasTest_0100] END');
      done();
    });
  })
}
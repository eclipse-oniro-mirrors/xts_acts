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
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function canvasCreatePatternNullUndefinedTest() {
  describe('canvasCreatePatternNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("canvasCreatePatternNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasNullUndefined/canvasCreatePatternNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canvasCreatePatternNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("canvasCreatePatternNullUndefinedTest" == pages.name)) {
          console.info("get canvasCreatePatternNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push canvasCreatePatternNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canvasCreatePatternNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   canvasCreatePatternNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_canvasCreatePatternNullUndefinedTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('canvasCreatePatternNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[canvasCreatePatternNullUndefinedTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('canvasCreatePatternNull');
      let strJson2 = getInspectorByKey('canvasCreatePatternUndefined');
      
      expect(JSON.parse(strJson1).$type).assertEqual('Canvas');
      expect(JSON.parse(strJson2).$type).assertEqual('Canvas');
      
      console.info('[canvasCreatePatternNullUndefinedTest_0100] END');
      done();
    });
  })
}


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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function RoundRectTest() {
  describe('RoundRectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RoundRectTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/RoundRectPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RoundRectTest state pages: " + JSON.stringify(pages));
        if (!("RoundRectTest" == pages.name)) {
          console.info("get RoundRectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RoundRectTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RoundRectTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   RoundRectTest_0100
     * @tc.number SUB_ARKUI_API_RoundRectTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RoundRectTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RoundRectTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RoundRectPage_Canvas');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RoundRectTest_0100] type is: " + JSON.stringify(obj.$type));
      expect(obj.$type).assertEqual('Canvas');

      console.info('[RoundRectTest_0100] END');
      done();
    });
  })
}


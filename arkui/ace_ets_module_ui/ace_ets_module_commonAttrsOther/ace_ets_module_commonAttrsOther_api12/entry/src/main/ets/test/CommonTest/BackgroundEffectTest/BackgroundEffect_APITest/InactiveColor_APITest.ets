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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function Bgde_InactiveColor_APITest() {
  describe('Bgde_InactiveColor_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("Bgde_InactiveColor_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BackgroundEffect/BackgroundEffectOptions/inactiveColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Bgde_InactiveColor_APITest state pages: " + JSON.stringify(pages));
        if (!("inactiveColor" == pages.name)) {
          console.info("get Bgde_InactiveColor_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Bgde_InactiveColor_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Bgde_InactiveColor_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   Bgde_InactiveColor_APITest_0100
     * @tc.number Bgde_InactiveColor
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Bgde_InactiveColor_APITest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Bgde_InactiveColor_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let bgde_inactiveColor = getInspectorByKey('bgde_inactiveColor');
      console.info("[Bgde_InactiveColor_APITest_0100] Tabs bgde_inactiveColor attrs is: " + JSON.stringify(JSON.parse(bgde_inactiveColor).$attrs));
      expect(JSON.parse(bgde_inactiveColor).$attrs.backgroundEffect.options.inactiveColor).assertEqual('#FF21A1DD');
      console.info('[Bgde_InactiveColor_APITest_0100] END');
      done();
    });
  })
}
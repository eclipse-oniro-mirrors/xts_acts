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
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SubMenuExpandingModeTest_SIDE() {
  describe('SubMenuExpandingModeTest_SIDE', () => {
    beforeEach(async (done: Function) => {
      console.info("SubMenuExpandingModeTest_SIDE beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/MenuApi/SubMenuExpandingMode_SIDE",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SubMenuExpandingModeTest_SIDE state pages:" + JSON.stringify(pages));
        if (!("SubMenuExpandingMode" == pages.name)) {
          console.info("get SubMenuExpandingModeTest_SIDE pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SubMenuExpandingModeTest_SIDE page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SubMenuExpandingModeTest_SIDE page error:" + err);
      }
      console.info("SubMenuExpandingModeTest_SIDE beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SubMenuExpandingModeTest_SIDE after each called");
    });

    /**
     * @tc.number    SubMenuExpandingModeTest_SIDE_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('SubMenuExpandingModeTest_SIDE_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SubMenuExpandingModeTest_SIDE_001] START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        let driver: Driver = Driver.create();
        let btn: Component = await driver.findComponent(ON.id("btn"));
        await btn.click();
        await CommonFunc.sleep(1000);
        let menu = getInspectorByKey('menu');
        console.info("$attrs--" + JSON.stringify(JSON.parse(menu).$attrs));
        await CommonFunc.sleep(1000);
        expect(JSON.parse(menu).$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.SIDE');
      }
      console.info('[SubMenuExpandingModeTest_SIDE_001] END');
      done();
    });
  })
}

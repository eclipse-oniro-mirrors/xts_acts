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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function waterFlowLayoutMode() {
  describe('waterFlowLayoutMode', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowLayoutMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowLayoutMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowLayoutMode state pages:" + JSON.stringify(pages));
        if (!("waterFlowLayoutMode" == pages.name)) {
          console.info("get waterFlowLayoutMode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowLayoutMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowLayoutMode page error:" + err);
      }
      console.info("waterFlowLayoutMode beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowLayoutMode after each called");
    });

    /**
     * @tc.name   waterFlowLayoutMode_001
     * @tc.number waterFlowLayoutMode_001
     * @tc.desc   Describe the default layout mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowLayoutMode_001', Level.LEVEL1, async (done: Function) => {
      console.info('[waterFlowLayoutMode_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('layout_scroll'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('layoutMode_yOffset');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowLayoutMode_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('yOffset: 100');
      console.info('[waterFlowLayoutMode_001] END');
      done();
    });


    /**
     * @tc.name   waterFlowLayoutMode_002
     * @tc.number waterFlowLayoutMode_002
     * @tc.desc   Mobile Window Layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowLayoutMode_002', Level.LEVEL1, async (done: Function) => {
      console.info('[waterFlowLayoutMode_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('layoutMode_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let btnScroll: Component = await driver.findComponent(ON.id('layout_scroll'));
      await btnScroll.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('layoutMode_yOffset');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlowLayoutMode_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('yOffset: 0');
      console.info('[waterFlowLayoutMode_002] END');
      done();
    });
  })
}

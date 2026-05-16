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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function BuilderNodeApiRecycleTest() {
  describe('BuilderNodeApiRecycleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BuilderNodeApiRecycleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/BuilderNodeApiRecycle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BuilderNodeApiRecycleTest state pages: " + JSON.stringify(pages));
        if (!("BuilderNodeApiRecycle" == pages.name)) {
          console.info("get BuilderNodeApiRecycleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BuilderNodeApiRecycleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BuilderNodeApiRecycleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   BuilderNodeApiRecycleTest_0100
     * @tc.number BuilderNodeApiRecycleTest_0100
     * @tc.desc   frameNode: BuilderNodeApiRecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuilderNodeApiRecycleTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('BuilderNodeApiRecycleTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('BuilderNodeApiRecycle_item1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[BuilderNodeApiRecycleTest_0100] component obj is: ",obj, obj.$attrs.fontSize);
      expect(obj.$attrs.fontSize).assertEqual('50.00fp');
      console.info('[BuilderNodeApiRecycleTest_0100] END');
      done();
    });    
  })
}
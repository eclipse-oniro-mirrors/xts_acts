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
export default function ComponentContentAPIRecycleTest() {
  describe('ComponentContentAPIRecycleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComponentContentAPIRecycleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/ComponentContentAPIRecycle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComponentContentAPIRecycleTest state pages: " + JSON.stringify(pages));
        if (!("ComponentContentAPIRecycle" == pages.name)) {
          console.info("get ComponentContentAPIRecycleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ComponentContentAPIRecycleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComponentContentAPIRecycleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ComponentContentAPIRecycleTest_0100
     * @tc.number ComponentContentAPIRecycleTest_0100
     * @tc.desc   frameNode: ComponentContentAPIRecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentContentAPIRecycleTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ComponentContentAPIRecycleTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ComponentContentAPIRecycle_Button'));
      await button.click();
      await CommonFunc.sleep(2500);
      let strJson: string = getInspectorByKey('ComponentContentAPIRecycle_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ComponentContentAPIRecycleTest_0100] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello');
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('ComponentContentAPIRecycle_Button02'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('[ComponentContentAPIRecycleTest_0100] END');
      done();
    });
  })
}
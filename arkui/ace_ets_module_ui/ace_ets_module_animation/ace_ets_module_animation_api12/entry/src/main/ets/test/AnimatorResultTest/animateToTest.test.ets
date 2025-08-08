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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
export default function animateToTest() {
  describe('animateToTest', () => {
    beforeEach(async (done: Function) => {
      console.info("animateToTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animateToTest state pages:" + JSON.stringify(pages));
        if (!("animateToTest" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/AnimatorResult/animateToTest"})
          await CommonFunc.sleep(2000);
          console.info("push animateToTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animateToTest page error:" + err);
      }
      console.info("animateToTest foreEach end");
      done();
    });
    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("animateToTest after each called");
    });
    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_animateToImmediately_0010
     * @tc.name       : animateToTest_001
     * @tc.desc       : animateToImmediately Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('animateToTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[animateToTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('animateToTestBt'));
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('animateToTest');
      await CommonFunc.sleep(200);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[animateToTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('animateToImmediately');
      console.info('[animateToTest_001] END');
      done();
    });
  })
}
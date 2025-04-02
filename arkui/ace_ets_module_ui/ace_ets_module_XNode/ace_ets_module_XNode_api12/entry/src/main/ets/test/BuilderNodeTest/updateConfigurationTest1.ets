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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function updateConfigurationTest1() {
  describe('updateConfigurationTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("updateConfigurationTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/BuilderNode/updateConfiguration1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get updateConfigurationTest1 state pages: " + JSON.stringify(pages));
        if (!("updateConfiguration1" == pages.name)) {
          console.info("get updateConfigurationTest1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push updateConfigurationTest1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push updateConfigurationTest1 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    updateConfigurationTest1_0100
     * @tc.name      updateConfigurationTest1_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('updateConfigurationTest1_0100', 0, async (done: Function) => {
      console.info('updateConfigurationTest1_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let mText1 = getInspectorByKey('updateConfiguration1');
      console.info("[updateConfigurationTest1_0100] attrs is: " + JSON.stringify(JSON.parse(mText1).$attrs));
      expect(JSON.parse(mText1).$attrs.content).assertEqual('Update 1');
      console.info('[updateConfigurationTest1_0100] END');
      done();
    });
  })
}
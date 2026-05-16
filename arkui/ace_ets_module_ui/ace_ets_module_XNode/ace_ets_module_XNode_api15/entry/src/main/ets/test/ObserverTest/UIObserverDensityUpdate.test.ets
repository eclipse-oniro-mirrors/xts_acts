/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function UIObserverDensityUpdateTest() {
  describe('UIObserverDensityUpdateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIObserverDensityUpdateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/UIObserverDensityUpdateTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIObserverDensityUpdateTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIObserverDensityUpdateTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIObserverDensityUpdateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIObserverDensityUpdateTest page error:" + err);
      }
      console.info("UIObserverDensityUpdateTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIObserverDensityUpdateTest after each called");
    });

    /**
     * @tc.name   UIObserverDensityUpdateTest_0100
     * @tc.number UIObserverDensityUpdateTest_0100
     * @tc.desc   UIObserver CallBack Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UIObserverDensityUpdateTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UIObserverDensityUpdateTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('densityUpdate_on_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('densityUpdate_off_id'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson1: string = getInspectorByKey('densityUpdate1_value_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      let strJson2: string = getInspectorByKey('densityUpdate2_value_id');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[UIObserverDensityUpdateTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[UIObserverDensityUpdateTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[UIObserverDensityUpdateTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[UIObserverDensityUpdateTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('DensityInfo succ');
      expect(obj2.$attrs.content).assertEqual('DensityInfo succ');
      done();
    });

  })
}
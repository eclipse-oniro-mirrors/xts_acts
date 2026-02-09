/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function UIContextAnimateToImmediately() {
  describe('UIContextAnimateToImmediately', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextAnimateToImmediately beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextAnimateToImmediately state pages:" + JSON.stringify(pages));
        if (!("UIContextAnimateToImmediately" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url: 'MainAbility/pages/AnimatorResult/UIContextAnimateToImmediately'})
          await CommonFunc.sleep(2000);
          console.info("push UIContextAnimateToImmediately page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextAnimateToImmediately page error:" + err);
      }
      console.info("UIContextAnimateToImmediately foreEach end");
      done();
    });
    afterEach(async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info("UIContextAnimateToImmediately after each called");
    });

    /**
     * @tc.number    UIContextAnimateToImmediately_0100
     * @tc.name      UIContextAnimateToImmediately_0100
     * @tc.desc      test UIContext animateToImmediately
     * @tc.level     Level 3
     * @tc.type
     */
    it('UIContextAnimateToImmediately_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[UIContextAnimateToImmediately_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('animateToTestBtn'));
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('animateToTest');
      await CommonFunc.sleep(200);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[UIContextAnimateToImmediately_0100] component obj is: ' + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('animateToImmediately');
      console.info('[UIContextAnimateToImmediately_0100] END');
      done();
    });
  })
}
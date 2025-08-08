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
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function clickIsSystem() {
  describe('clickIsSystem', () => {
    beforeEach(async (done: Function) => {
      console.info("clickIsSystem beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clickIsSystem state pages:" + JSON.stringify(pages));
        if (!("clickIsSystem" == pages.name)) {
          console.info("get  clickIsSystem pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/clickIsSystem"
          })
          await CommonFunc.sleep(2000);
          console.info("push clickIsSystem page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push clickIsSystem page error:" + err);
      }
      console.info("clickIsSystem foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("clickIsSystem after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_JUDGE_0100_clickIsSystem_001
     * @tc.desc button click is or not systemGesture test
     * @tc.level Level 0
     * @tc.type
     */

    it('clickIsSystem_001', Level.LEVEL0, async (done: Function) => {
      console.info('[clickIsSystem_001] START');
      await CommonFunc.sleep(200);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id("clickButtonIsSystem"));
      console.info('[clickIsSystem_001] 3');
      await button1.click();
      console.info('[clickIsSystem_001] 4');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("clickIsSystemBtn2");
      await CommonFunc.sleep(200);
      console.info("[clickIsSystem_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('isSystem is true');
      await CommonFunc.sleep(1000);
      console.info('[clickIsSystem_001] END');
      done();
    });
  })
}

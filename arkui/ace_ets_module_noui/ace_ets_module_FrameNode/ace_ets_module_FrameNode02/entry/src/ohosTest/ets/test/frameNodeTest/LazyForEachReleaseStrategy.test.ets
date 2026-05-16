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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function LazyForEachReleaseStrategyTest() {
  describe('LazyForEachReleaseStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachReleaseStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/LazyForEachReleaseStrategy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachReleaseStrategy state pages: " + JSON.stringify(pages));
        if (!("LazyForEachReleaseStrategy" == pages.name)) {
          console.info("get LazyForEachReleaseStrategy state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachReleaseStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachReleaseStrategy page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachReleaseStrategy after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100
     * @tc.number SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100
     * @tc.desc   List type FrameNode node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LazyForEach_Item_0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100] component obj is: " + JSON.stringify(obj));
      expect(LazyForEachReleaseStrategy.PROGRESSIVE).assertEqual(1);
      console.info('[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200
     * @tc.number SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200
     * @tc.desc   ListItem type FrameNode node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LazyForEach_Item_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200] component obj is: " + JSON.stringify(obj));
      expect(LazyForEachReleaseStrategy.BATCH).assertEqual(0);
      console.info('[SUB_ARKUI_API_LazyForEachReleaseStrategyTest_0200] END');
      done();
    });
  })
}


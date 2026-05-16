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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function segmentButtonEnableStateAnimation() {
  describe('segmentButtonEnableStateAnimation', () => {
    beforeEach(async (done: Function) => {
      console.info("segmentButtonEnableStateAnimation beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/segmentButtonEnableStateAnimation",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("segmentButtonEnableStateAnimation" == pages.name)) {
          console.info("get segmentButtonEnableStateAnimation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push segmentButtonEnableStateAnimation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push segmentButtonEnableStateAnimation page error:" + err);
      }
      console.info("segmentButtonEnableStateAnimation beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("segmentButtonEnableStateAnimation after each called");
    });

    /**
     * @tc.name   segmentButtonEnableStateAnimation_001
     * @tc.number segmentButtonEnableStateAnimation_001
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('segmentButtonEnableStateAnimation_001', Level.LEVEL0, async (done: Function) => {
      console.log("[segmentButtonEnableStateAnimationt_001] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('true'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('text1');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('true');
      console.log("[segmentButtonEnableStateAnimationt_001] END");
      done();
    })
  })
}
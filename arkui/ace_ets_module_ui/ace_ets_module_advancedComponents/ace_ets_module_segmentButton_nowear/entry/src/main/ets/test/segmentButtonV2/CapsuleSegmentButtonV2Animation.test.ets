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

export default function CapsuleSegmentButtonV2Animation() {
  describe('CapsuleSegmentButtonV2Animation', () => {
    beforeEach(async (done: Function) => {
      console.info("CapsuleSegmentButtonV2Animation beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SegmentButtonV2/CapsuleSegmentButtonV2Animation",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("CapsuleSegmentButtonV2Animation" == pages.name)) {
          console.info("get CapsuleSegmentButtonV2Animation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CapsuleSegmentButtonV2Animation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CapsuleSegmentButtonV2Animation page error:" + err);
      }
      console.info("CapsuleSegmentButtonV2Animation beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CapsuleSegmentButtonV2Animation after each called");
    });

    /**
     * @tc.name   CapsuleSegmentButtonV2Animation_001
     * @tc.number CapsuleSegmentButtonV2Animation_001
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CapsuleSegmentButtonV2Animation_001', Level.LEVEL0, async (done: Function) => {
      console.log("[CapsuleSegmentButtonV2Animation_001] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('true'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('text');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('true');
      console.log("[CapsuleSegmentButtonV2Animation_001] END");
      done();
    })
  })
}
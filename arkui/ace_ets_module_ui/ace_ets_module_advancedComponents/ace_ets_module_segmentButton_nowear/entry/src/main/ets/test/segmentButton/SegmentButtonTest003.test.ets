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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonTest003() {
  describe('SegmentButton003', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButton003 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButton003",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButton003" == pages.name)) {
          console.info("get SegmentButtonTest003 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonTest003 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonTest003 page error:" + err);
      }
      console.info("SegmentButtonTest003 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonTest003 after each called");
    });

    /**
     * @tc.name   SegmentButtonTest003_001
     * @tc.number SegmentButtonTest003_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest003_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest003_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[3]
      console.info("[SegmentButtonTest003_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityLevel).assertEqual('yes');
      console.info('[SegmentButtonTest003_001] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonTest003_002
     * @tc.number SegmentButtonTest003_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest003_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest003_002] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[3]
      console.info("[SegmentButtonTest003_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityDescription).assertEqual('Description');
      console.info('[SegmentButtonTest003_002] END');
      done();
    });
  })
}

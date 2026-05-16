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

export default function SegmentButtonTest004() {
  describe('SegmentButton004', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButton004 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButton004",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButton004" == pages.name)) {
          console.info("get SegmentButton004 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButton004 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButton004 page error:" + err);
      }
      console.info("SegmentButton004 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButton004 after each called");
    });

    /**
     * @tc.name   SegmentButtonTest004_001
     * @tc.number SegmentButtonTest004_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest004_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest004_001] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonTest004_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityText).assertEqual('notSelect');
      console.info('[SegmentButtonTest004_001] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonTest004_002
     * @tc.number SegmentButtonTest004_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest004_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest004_002] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonTest004_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityText).assertEqual('select');
      console.info('[SegmentButtonTest004_002] END');
      done();
    });
    /**
     * @tc.name   SegmentButtonTest004_003
     * @tc.number SegmentButtonTest004_003
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest004_003', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest004_003] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      console.info("[SegmentButtonTest004_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityLevel).assertEqual('yes');
      console.info('[SegmentButtonTest004_003] END');
      done();
    });
    /**
     * @tc.name   SegmentButtonTest004_004
     * @tc.number SegmentButtonTest004_004
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegmentButtonTest004_004', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest004_004] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      console.info("[SegmentButtonTest004_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityDescription).assertEqual('SegmentButtonIconTextItem');
      console.info('[SegmentButtonTest004_004] END');
      done();
    });
  })
}

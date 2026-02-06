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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonBorderTest() {
  describe('SegmentButtonBorderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonBorderTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonBorder",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonBorder" == pages.name)) {
          console.info("get SegmentButtonBorderTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonBorderTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonBorderTest page error:" + err);
      }
      console.info("SegmentButtonBorderTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonBorderTest after each called");
    });

    /**
     * @tc.name   SegmentButtonBorderTest_001
     * @tc.number SegmentButtonBorderTest_001
     * @tc.desc   Default rounded corners take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonBorderTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
      console.info("[SegmentButtonBorderTest_001_1] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.borderRadius).assertEqual('14.00vp');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonBorderTest_001_2]  component obj is: " + JSON.stringify(obj2));
      // expect(obj2.$attrs.borderRadius).assertEqual('12.00vp');
      expect(JSON.stringify(obj2.$attrs.borderRadius)).assertEqual(JSON.stringify({
        topLeft: "12.00vp",
        topRight: "12.00vp",
        bottomLeft: "12.00vp",
        bottomRight: "12.00vp"
      }));
      console.info('[SegmentButtonBorderTest_001] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonBorderTest_002
     * @tc.number SegmentButtonBorderTest_002
     * @tc.desc   Default rounded corners take effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonBorderTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonBorderTest_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[3]
        .$children[0]
      console.info("[SegmentButtonBorderTest_002_1] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.borderRadius).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonBorderTest_002_2] component obj is: " + JSON.stringify(obj4));
      // expect(obj4.$attrs.borderRadius).assertEqual('20.00vp');
      expect(JSON.stringify(obj4.$attrs.borderRadius)).assertEqual(JSON.stringify({
        topLeft: "18.00vp",
        topRight: "18.00vp",
        bottomLeft: "18.00vp",
        bottomRight: "18.00vp"
      }));
      console.info('[SegmentButtonBorderTest_002] END');
      done();
    });
  })
}
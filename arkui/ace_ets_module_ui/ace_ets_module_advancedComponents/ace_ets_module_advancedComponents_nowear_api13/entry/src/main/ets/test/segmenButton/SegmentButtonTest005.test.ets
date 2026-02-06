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

export default function SegmentButtonTest005() {
  describe('SegmentButton005', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonTest005 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButton005",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButton005" == pages.name)) {
          console.info("get SegmentButton005 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButton005 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButton005 page error:" + err);
      }
      console.info("SegmentButtonTest005 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButton005 after each called");
    });

    /**
     * @tc.number    SegmentButtonTest005_001
     * @tc.name      SegmentButtonTest005_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonTest005_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest005_001] START');
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
      console.info("[SegmentButtonTest005_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityText).assertEqual('notSelect');
      console.info('[SegmentButtonTest005_001] END');
      done();
    });

    /**
     * @tc.number    SegmentButtonTest005_002
     * @tc.name      SegmentButtonTest005_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonTest005_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest005_002] START');
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
      console.info("[SegmentButtonTest005_002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityText).assertEqual('select');
      console.info('[SegmentButtonTest005_002] END');
      done();
    });
    /**
     * @tc.number    SegmentButtonTest005_003
     * @tc.name      SegmentButtonTest005_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonTest005_003', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest005_003] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      console.info("[SegmentButtonTest005_003] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityLevel).assertEqual('yes');
      console.info('[SegmentButtonTest005_003] END');
      done();
    });
    /**
     * @tc.number    SegmentButtonTest005_004
     * @tc.name      SegmentButtonTest005_004
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonTest005_004', Level.LEVEL1, async (done: Function) => {
      console.info('[SegmentButtonTest005_004] START');
      await CommonFunc.sleep(2000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      console.info("[SegmentButtonTest005_004] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.accessibilityDescription).assertEqual('SegmentButtonItemOptions');
      console.info('[SegmentButtonTest005_004] END');
      done();
    });
  })
}
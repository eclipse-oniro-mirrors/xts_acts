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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  Level} from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonTextItem001() {
  describe('SegmentButtonTextItem001', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonTextItemTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonTextItem001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonTextItem001" == pages.name)) {
          console.info("get SegmentButtonTextItemTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonTextItemTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonTextItemTest page error:" + err);
      }
      console.info("SegmentButtonTextItemTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonTextItemTest after each called");
    });

    /**
     * @tc.name   SegmentButtonTextItemTest_001
     * @tc.number SegmentButtonTextItemTest_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonTextItemTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = await Driver.create();
      console.info('SegmentButtonTextItem getText START');
      await CommonFunc.sleep(2000);
      let tab1 = await driver.findComponent(ON.text('页签按钮1'));
      expect(tab1 !== null).assertTrue();
      console.info('[SegmentButtonTextItemTest_001] END');
      done();
    });
  })
}
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
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonIconTextItem1() {
  describe('SegmentButtonIconTextItem1', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonIconTextItem1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonIconTextItem1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonIconTextItem1" == pages.name)) {
          console.info("get SegmentButtonIconTextItem1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonIconTextItem1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonIconTextItem1 page error:" + err);
      }
      console.info("SegmentButtonIconTextItem1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonIconTextItem1 after each called");
    });

    /**
     * @tc.name   SegmentButtonIconTextItem1_001
     * @tc.number SegmentButtonIconTextItem1_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonIconTextItem1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonIconTextItem1_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonIconTextItem101"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[3]
        .$children[0]
        .$children[0]
        .$children[0];
      console.info("[SegmentButtonIconTextItem1_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.src).assertEqual('resource:///125830170.svg');
      await CommonFunc.sleep(1000);
      let selecticon: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0];
      console.info("[SegmentButtonIconTextItem1_001] component selecticon is: " + JSON.stringify(selecticon));
      expect(selecticon.$attrs.src).assertEqual('resource:///125830169.svg');
      console.info('[SegmentButtonIconTextItem1_001] END');
      done();
    });


    /**
     * @tc.name   SegmentButtonIconTextItem1_002
     * @tc.number SegmentButtonIconTextItem1_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonIconTextItem1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonIconTextItem1_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonIconTextItem102"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[0]//button位置
        .$children[0]
        .$children[0]
        .$children[0];
      console.info("[SegmentButtonIconTextItem1_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.src).assertEqual('resource:///125830170.svg');
      await CommonFunc.sleep(1000);
      let selecticon: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[4]
        .$children[0]
        .$children[0]
        .$children[0];
      console.info("[SegmentButtonIconTextItem1_002] component selecticon is: " + JSON.stringify(selecticon));
      expect(selecticon.$attrs.src).assertEqual('resource:///125830169.svg');
      await CommonFunc.sleep(1000);
      let text0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1];
      console.info("[SegmentButtonIconTextItem1_002] component selecticon is: " + JSON.stringify(selecticon));
      expect(text0.$attrs.content).assertEqual('text1');
      console.info('[SegmentButtonIconTextItem1_002] END');
      done();
    });
  })
}

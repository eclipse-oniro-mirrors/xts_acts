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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function setExpectedFrameRateRangeTest() {
  describe('setExpectedFrameRateRangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setExpectedFrameRateRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimatorResult/setExpectedFrameRateRange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setExpectedFrameRateRangeTest state pages:" + JSON.stringify(pages));
        if (!("setExpectedFrameRateRangeTest" == pages.name)) {
          console.info("get setExpectedFrameRateRangeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setExpectedFrameRateRangeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setExpectedFrameRateRangeTest page error:" + err);
      }
      console.info("setExpectedFrameRateRangeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setExpectedFrameRateRangeTest after each called");
    });

    /**
     * @tc.number setExpectedFrameRateRangeTest_001
     * @tc.name testBack
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('setExpectedFrameRateRangeTest_001', 0, async (done: Function) => {
      console.info('[setExpectedFrameRateRangeTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('create'));
      await create.click();
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('play'));
      await play.click();
      await CommonFunc.sleep(3500);
      let min = getInspectorByKey('min');
      let max = getInspectorByKey('max');
      console.info('min: ' + JSON.parse(min).$attrs.content);
      console.info('max: ' + JSON.parse(max).$attrs.content);
      expect(JSON.parse(min).$attrs.content).assertEqual('0');
      expect(JSON.parse(max).$attrs.content).assertEqual('120');
      console.info('[setExpectedFrameRateRangeTest_001] END');
      done();
    });
  })
}

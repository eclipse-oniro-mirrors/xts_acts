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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function Text_lineSpacingTest() {
  describe('Text_lineSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Text_lineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextAPI/lineSpacing",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Text_lineSpacingTest state pages:" + JSON.stringify(pages));
        if (!("Text_lineSpacingTest" == pages.name)) {
          console.info("get Text_lineSpacingTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Text_lineSpacingTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Text_lineSpacingTest page error:" + err);
      }
      console.info("Text_lineSpacingTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Text_lineSpacingTest after each called");
    });

    /**
     * @tc.number    Text_lineSpacingTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('Text_lineSpacingTest_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[Text_lineSpacingTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let LengthMetricsValue = getInspectorByKey('LengthMetricsValue');
      console.info('LengthMetricsValue-----' + JSON.parse(LengthMetricsValue).$attrs.content);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(LengthMetricsValue).$attrs.content).assertEqual('20vp');
      console.info('[Text_lineSpacingTest_001] END');
      done();
    });

  })
}

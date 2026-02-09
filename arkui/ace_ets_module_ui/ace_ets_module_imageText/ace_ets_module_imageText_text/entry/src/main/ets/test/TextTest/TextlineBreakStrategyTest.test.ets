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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextlineBreakStrategyTest() {
  describe('TextlineBreakStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextlineBreakStrategy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextlineBreakStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextlineBreakStrategyTest state pages:" + JSON.stringify(pages));
        if (!("TextlineBreakStrategy" == pages.name)) {
          console.info("get TextlineBreakStrategyTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextlineBreakStrategyTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextlineBreakStrategyTest page error:" + err);
      }
      console.info("TextlineBreakStrategyTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextlineBreakStrategyTest after each called");
    });

    /**
     * @tc.name   Text_lineBreakStrategyTest_001
     * @tc.number Text_lineBreakStrategyTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Text_lineBreakStrategyTest_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[Text_lineBreakStrategyTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btnlineBreakStrategy'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let LineBreakStrategy = getInspectorByKey('textLineBreakStrategy');
      console.info('LineBreakStrategy-----' + JSON.parse(LineBreakStrategy).$attrs.content);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(LineBreakStrategy).$attrs.content).assertEqual('BALANCED');
      console.info('[Text_lineBreakStrategyTest_001] END');
      done();
    });

  })
}

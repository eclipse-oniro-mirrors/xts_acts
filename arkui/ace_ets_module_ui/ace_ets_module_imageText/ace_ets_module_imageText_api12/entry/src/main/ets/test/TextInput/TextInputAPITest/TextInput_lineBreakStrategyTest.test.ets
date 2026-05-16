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

export default function TextInput_lineBreakStrategyTest() {
  describe('TextInput_lineBreakStrategyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInput_lineBreakStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputAPI/lineBreakStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInput_lineBreakStrategyTest state pages:" + JSON.stringify(pages));
        if (!("TextInput_lineBreakStrategyTest" == pages.name)) {
          console.info("get TextInput_lineBreakStrategyTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInput_lineBreakStrategyTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInput_lineBreakStrategyTest page error:" + err);
      }
      console.info("TextInput_lineBreakStrategyTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextInput_lineBreakStrategyTest after each called");
    });

    /**
     * @tc.name   TextInput_lineBreakStrategyTest_001
     * @tc.number TextInput_lineBreakStrategyTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextInput_lineBreakStrategyTest_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextInput_lineBreakStrategyTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let LineBreakStrategy = getInspectorByKey('LineBreakStrategy');
      console.info('LineBreakStrategy-----' + JSON.parse(LineBreakStrategy).$attrs.content);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(LineBreakStrategy).$attrs.content).assertEqual('BALANCED');
      console.info('[TextInput_lineBreakStrategyTest_001] END');
      done();
    });

  })
}

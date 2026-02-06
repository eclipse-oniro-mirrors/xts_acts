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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function promptTest() {
  describe('promptTest', () => {
    beforeEach(async (done: Function) => {
      console.info("promptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/prompt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get promptTest state pages: " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get promptTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push promptTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push promptTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   promptTest_0100
     * @tc.number prompt
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('promptTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('promptTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('prompt_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('prompt_2');
      let obj1: ESObject = JSON.parse(strJson1);
      expect(obj1.$attrs.label).assertEqual('确认');
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('prompt_2'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('prompt_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[promptTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[promptTest_0100] component obj.$attrs is: " + JSON.stringify(obj.$attrs));
      console.info("[promptTest_0100] text: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.content).assertEqual('Hello World');
      console.info('[promptTest_0100] END');
      done();
    });
  })
}


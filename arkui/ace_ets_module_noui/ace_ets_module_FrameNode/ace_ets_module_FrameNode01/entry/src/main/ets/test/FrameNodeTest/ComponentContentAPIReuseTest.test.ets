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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function ComponentContentAPIReuseTest() {
  describe('ComponentContentAPIReuseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComponentContentAPIReuseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/ComponentContentAPIReuse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComponentContentAPIReuseTest state pages: " + JSON.stringify(pages));
        if (!("ComponentContentAPIReuse" == pages.name)) {
          console.info("get ComponentContentAPIReuseTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ComponentContentAPIReuseTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComponentContentAPIReuseTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ComponentContentAPIReuseTest_0100
     * @tc.number ComponentContentAPIReuseTest_0100
     * @tc.desc   frameNode: ComponentContentAPIReuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComponentContentAPIReuseTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ComponentContentAPIReuseTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ComponentContentAPIReuse_Button'));
      await button.click();
      await CommonFunc.sleep(2500);
      let strJson: string = getInspectorByKey('ComponentContentAPIReuse_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ComponentContentAPIReuseTest_0100] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello');
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('ComponentContentAPIReuse_Button02'));
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('[ComponentContentAPIReuseTest_0100] END');
      done();
    });
  })
}
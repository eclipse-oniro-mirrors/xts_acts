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
export default function createNodeBlank() {
  describe('createNodeBlank', () => {
    beforeEach(async (done: Function) => {
      console.info("createNodeBlank beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/createNodeBlank",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createNodeBlank state pages: " + JSON.stringify(pages));
        if (!("createNodeBlank" == pages.name)) {
          console.info("get createNodeBlank state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createNodeBlank success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createNodeBlank page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    createNodeBlank_0100
     * @tc.name      createNodeBlank_0100
     * @tc.desc      frameNode: createNodeBlankToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createNodeBlank_0100', Level.LEVEL0, async (done: Function) => {
      console.info('createNodeBlank_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('createNodeBlankType'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('createNodeBlankText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[createNodeBlank_0100] component obj is: " + JSON.stringify(obj));
      console.info("[createNodeBlank_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('"Blank"');
      console.info('[createNodeBlank_0100] END');
      done();
    });
  })
}
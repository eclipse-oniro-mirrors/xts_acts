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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function createNodeFlex() {
  describe('createNodeFlex', function () {
    beforeEach(async function (done) {
      console.info("createNodeFlex beforeEach start");
      let options = {
        uri: "MainAbility/pages/FrameNode/createNodeFlex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createNodeFlex state pages: " + JSON.stringify(pages));
        if (!("createNodeFlex" == pages.name)) {
          console.info("get createNodeFlex state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createNodeFlex success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createNodeFlex page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    createNodeFlex_0100
     * @tc.name      createNodeFlex_0100
     * @tc.desc      frameNode: createNodeFlexToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createNodeFlex_0100', 0, async function (done) {
      console.info('createNodeFlex_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('createNodeFlexType'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('createNodeFlexText');
      let obj = JSON.parse(strJson);
      console.info("[createNodeFlex_0100] component obj is: " + JSON.stringify(obj));
      console.info("[createNodeFlex_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('"Flex"');
      console.info('[createNodeFlex_0100] END');
      done();
    });


  })
}


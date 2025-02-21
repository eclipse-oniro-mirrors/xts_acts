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

export default function createNodeLoad() {
  describe('createNodeLoad', function () {
    beforeEach(async function (done) {
      console.info("createNodeLoad beforeEach start");
      let options = {
        uri: "MainAbility/pages/FrameNode/createNodeLoad",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createNodeLoad state pages: " + JSON.stringify(pages));
        if (!("createNodeLoad" == pages.name)) {
          console.info("get createNodeLoad state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createNodeLoad success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createNodeLoad page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    createNodeLoad_0100
     * @tc.name      createNodeLoad_0100
     * @tc.desc      frameNode: createNodeLoadToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createNodeLoad_0100', 0, async function (done) {
      console.info('createNodeLoad_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('createNodeLoadType'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('createNodeLoadText');
      let obj = JSON.parse(strJson);
      console.info("[createNodeLoad_0100] component obj is: " + JSON.stringify(obj));
      console.info("[createNodeLoad_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('"LoadingProgress"');
      console.info('[createNodeLoad_0100] END');
      done();
    });


  })
}


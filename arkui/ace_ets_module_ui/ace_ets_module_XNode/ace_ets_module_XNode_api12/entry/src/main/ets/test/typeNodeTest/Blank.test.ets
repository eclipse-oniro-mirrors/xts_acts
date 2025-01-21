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


export default function typeNodeBlankTest() {
  describe('typeNodeBlankTest', function () {
    beforeEach(async function (done) {
      console.info("BlankTest beforeEach start");
      let options = {
        uri: "MainAbility/pages/typeNode/Blank",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BlankTest state pages: " + JSON.stringify(pages));
        if (!("Blank" == pages.name)) {
          console.info("get BlankTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push BlankTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BlankTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    BlankTest_0100
     * @tc.name      BlankTest_0100
     * @tc.desc      TypedFrameNode: Blank
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('BlankTest_0100', 0, async function (done) {
      console.info('BlankTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_Blank'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_Blank');
      let obj = JSON.parse(strJson);
      console.info("[BlankTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('Blank');
      console.info('[BlankTest_0100] END');
      done();
    });
  })
}


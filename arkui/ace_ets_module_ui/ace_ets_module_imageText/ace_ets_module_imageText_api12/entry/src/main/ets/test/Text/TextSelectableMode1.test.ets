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
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function typeNodeTextSelectableMode1Test() {
  describe('typeNodeTextSelectableMode1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSelectableMode1Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextSelectableMode1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSelectableMode1Test state pages: " + JSON.stringify(pages));
        if (!("TextSelectableMode1" == pages.name)) {
          console.info("get TextSelectableMode1Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSelectableMode1Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectableMode1Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    TextSelectableMode1Test_0100
     * @tc.name      TextSelectableMode1Test_0100
     * @tc.desc      TypedFrameNode: TextSelectableMode1
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextSelectableMode1Test_0100', 0, async (done: Function) => {
      console.info('TextSelectableMode1Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_TextSelectableMode1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_TextSelectableMode1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextSelectableMode1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.textSelectable).assertEqual('selectable-focusable');
      console.info('[TextSelectableMode1Test_0100] END');
      done();
    });
  })
}


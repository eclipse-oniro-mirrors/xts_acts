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


export default function typeNodeTextSelectableMode3Test() {
  describe('typeNodeTextSelectableMode3Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSelectableMode3Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextSelectableMode3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSelectableMode3Test state pages: " + JSON.stringify(pages));
        if (!("TextSelectableMode3" == pages.name)) {
          console.info("get TextSelectableMode3Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSelectableMode3Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectableMode3Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextSelectableMode3Test_0100
     * @tc.number TextSelectableMode3Test_0100
     * @tc.desc   TypedFrameNode:TextSelectableMode3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextSelectableMode3Test_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextSelectableMode3Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('TypeNode_TextSelectableMode3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TypeNode_TextSelectableMode3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextSelectableMode3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.textSelectable).assertEqual('unselectable');
      console.info('[TextSelectableMode3Test_0100] END');
      done();
    });
  })
}


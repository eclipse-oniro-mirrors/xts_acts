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
import CommonFunc from "../../MainAbility/common/Common";

export default function ScrollTest() {
  describe('ScrollTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Scroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollTest state pages: " + JSON.stringify(pages));
        if (!("Scroll" == pages.name)) {
          console.info("get ScrollTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_COMPONENT_Scroll_001
      * @tc.name  : ScrollTest_001
      * @tc.desc  : set enablePaging to true
      * @tc.level : Level 2
      */
    it('ScrollTest_001', Level.LEVEL1, async (done: Function) => {

      console.info('[ScrollTest_001] START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(globalThis.winLeft + Math.round(vp2px(67)), Math.round( globalThis.winTop + vp2px(200)), Math.round(globalThis.winLeft + vp2px(67)), Math.round( globalThis.winTop + vp2px(133)));
      await CommonFunc.sleep(1000);
      console.info("[ScrollTest_001] swipe success");
      let strJson1 = getInspectorByKey('scrollText');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ScrollTest_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('true');

      console.info('[ScrollTest_001] END');
      done();
    });



  })
}

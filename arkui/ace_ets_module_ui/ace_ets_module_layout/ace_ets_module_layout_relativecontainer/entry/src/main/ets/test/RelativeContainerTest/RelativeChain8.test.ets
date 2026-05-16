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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeChain8() {
  describe('RelativeChain8', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeChain8 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeChain8 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain8" == pages.name)) {
          console.info("get  RelativeChain8 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain8"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeChain8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeChain8 page error:" + err);
      }
      console.info("RelativeChain8 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain8 after each called");
    });


    /**
     * @tc.name   RelativeChain8_001
     * @tc.number RelativeChain8_001
     * @tc.desc   RelativeChain8_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain8_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain8_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain8');
      let rel_width = rel.right - rel.left;
      let rel_height = rel.bottom - rel.top;
      console.info("[RelativeChain8_001] rel rect_value is: " + JSON.stringify(rel));
      let driver: Driver = Driver.create();
      await driver.mouseClick({x: Math.round(rel.left + rel_width * 0.2), y: Math.round(rel.top + rel_height * 0.5)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RelativeChain8Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeChain8_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[RelativeChain8_001] END');
      done();
    });


    /**
     * @tc.name   RelativeChain8_002
     * @tc.number RelativeChain8_002
     * @tc.desc   RelativeChain8_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain8_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain8_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain82');
      let rel_width = rel.right - rel.left;
      let rel_height = rel.bottom - rel.top;
      console.info("[RelativeChain8_002] rel rect_value is: " + JSON.stringify(rel));
      let driver: Driver = Driver.create();
      await driver.mouseClick({x: Math.round(rel.left + rel_width * 0.2), y: Math.round(rel.top + rel_height * 0.5)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RelativeChain8Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeChain8_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[RelativeChain8_002] END');
      done();
    });
  })
}

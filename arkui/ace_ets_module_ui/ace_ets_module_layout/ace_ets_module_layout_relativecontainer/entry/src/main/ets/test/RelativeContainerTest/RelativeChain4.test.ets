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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';

export default function RelativeChain4 () {
  describe('RelativeChain4', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeChain4 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeChain4 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain4" == pages.name)) {
          console.info("get  RelativeChain4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain4"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeChain4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeChain4 page error:" + err);
      }
      console.info("RelativeChain4 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain4 after each called");
    });


    /**
     * @tc.name   RelativeChain4_001
     * @tc.number RelativeChain4_001
     * @tc.desc   RelativeChain4_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain4_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain4_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain4');
      let driver: Driver = Driver.create();
      await driver.mouseClick({x: Math.round(rel.left + vp2px(50)), y: Math.round(rel.top + vp2px(80))}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RelativeChainText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeChain4_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[RelativeChain4_001] END');
      done();
    });


    /**
     * @tc.name   RelativeChain4_002
     * @tc.number RelativeChain4_002
     * @tc.desc   RelativeChain4_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain4_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain4_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain42');
      let driver: Driver = Driver.create();
      await driver.mouseClick({x: Math.round(rel.left + vp2px(50)), y: Math.round(rel.top + vp2px(80))}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RelativeChainText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeChain4_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[RelativeChain4_002] END');
      done();
    });
  })
}

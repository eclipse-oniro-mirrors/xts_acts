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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function APIsetOnHoverTest() {
  describe('APIsetOnHoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIsetOnHoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/APIsetOnHover",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIsetOnHoverTest state pages: " + JSON.stringify(pages));
        if (!("APIsetOnHover" == pages.name)) {
          console.info("get APIsetOnHoverTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push APIsetOnHoverTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIsetOnHoverTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number frameNode
     * @tc.name APIsetOnHoverTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('APIsetOnHoverTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIsetOnHoverTest_0100 START');
      let driver = await Driver.create()
      let buttonCl = await driver.findComponent(ON.id('setOnHover_1'));
      await CommonFunc.sleep(500);
      let point = await buttonCl.getBoundsCenter();
      await driver.mouseMoveTo({
        x: point.x, y: point.y
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setOnHover_1');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[APIsetOnHoverTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[APIsetOnHoverTest_0100] title: " + JSON.stringify(obj.$attrs.content));
      console.info("[APIsetOnHoverTest_0100] backgroundColor: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.content).assertEqual('setOnHover');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[APIsetOnHoverTest_0100] END');
      done();
    });
  })
}
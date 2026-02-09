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
export default function frameNodeTest1() {
  describe('frameNodeTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/frameNode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTest1 state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get frameNodeTest1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push frameNodeTest1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeTest1 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   frameNodeTest1_0100
     * @tc.number frameNodeTest1_0100
     * @tc.desc   frameNodeTest1_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('frameNodeTest1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('frameNodeTest1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('frameNode_5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('frameNode_1');
      let obj:ESObject = JSON.parse(strJson);
      console.info("[frameNodeTest1_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('ChildrenCount:0');
      console.info('[frameNodeTest1_0100] END');
      done();
    });
  })
}
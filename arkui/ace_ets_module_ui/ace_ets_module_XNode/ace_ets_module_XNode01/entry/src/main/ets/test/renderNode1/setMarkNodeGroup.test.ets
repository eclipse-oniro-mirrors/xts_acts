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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function setMarkNodeGroupTest() {
  describe('setMarkNodeGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setMarkNodeGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode1/setMarkNodeGroup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setMarkNodeGroupTest state pages: " + JSON.stringify(pages));
        if (!("setMarkNodeGroup" == pages.name)) {
          console.info("get setMarkNodeGroupTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setMarkNodeGroupTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setMarkNodeGroupTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   setMarkNodeGroupTest_0010
     * @tc.number setMarkNodeGroupTest_0010
     * @tc.desc   renderNode: setMarkNodeGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMarkNodeGroupTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('setMarkNodeGroupTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('SetMarkNodeGroup_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('SetMarkNodeGroup_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[setMarkNodeGroupTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('true');
      console.info('[setMarkNodeGroupTest_0010] END');
      done();
    }); 
  })
}
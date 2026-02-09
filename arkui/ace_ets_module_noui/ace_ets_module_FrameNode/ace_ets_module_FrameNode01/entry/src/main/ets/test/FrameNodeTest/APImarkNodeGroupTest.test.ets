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
export default function APImarkNodeGroupTest() {
  describe('APImarkNodeGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APImarkNodeGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APImarkNodeGroup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APImarkNodeGroupTest state pages: " + JSON.stringify(pages));
        if (!("APImarkNodeGroup" == pages.name)) {
          console.info("get APImarkNodeGroupTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APImarkNodeGroupTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APImarkNodeGroupTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   APImarkNodeGroupTest_0100
     * @tc.number APImarkNodeGroupTest_0100
     * @tc.desc   frameNode: APImarkNodeGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APImarkNodeGroupTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APImarkNodeGroupTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('APImarkNodeGroup_Text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[APImarkNodeGroupTest_0100] component obj is: ",obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('true');
      console.info('[APImarkNodeGroupTest_0100] END');
      done();
    });    
  })
}
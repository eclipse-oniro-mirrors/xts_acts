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
export default function createNodeList() {
  describe('createNodeList', () => {
    beforeEach(async (done: Function) => {
      console.info("createNodeList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/createNodeList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createNodeList state pages: " + JSON.stringify(pages));
        if (!("createNodeList" == pages.name)) {
          console.info("get createNodeList state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createNodeList success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createNodeList page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    createNodeList_0100
     * @tc.name      createNodeList_0100
     * @tc.desc      frameNode: createNodeListToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createNodeList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('createNodeList_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('createNodeListType'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('createNodeListText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[createNodeList_0100] component obj is: " + JSON.stringify(obj));
      console.info("[createNodeList_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('"List"');
      console.info('[createNodeList_0100] END');
      done();
    });
  })
}
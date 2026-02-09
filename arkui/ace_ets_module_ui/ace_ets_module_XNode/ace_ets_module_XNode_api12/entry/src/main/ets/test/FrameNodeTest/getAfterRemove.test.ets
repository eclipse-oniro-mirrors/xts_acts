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
export default function getAfterRemove() {
  describe('getAfterRemove', () => {
    beforeEach(async (done: Function) => {
      console.info("getAfterRemove beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getAfterRemove",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getAfterRemove state pages: " + JSON.stringify(pages));
        if (!("getAfterRemove" == pages.name)) {
          console.info("get getAfterRemove state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getAfterRemove success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getAfterRemove page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   getAfterRemove_0100
     * @tc.number getAfterRemove_0100
     * @tc.desc   frameNode: getPreviousAfterRemove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAfterRemove_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getPosition_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('removeChildButton'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('getPreviousAfterRemoveText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAfterRemove_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('null');
      console.info('[getAfterRemove_0100] END');
      done();
    });
    /**
     * @tc.name   getAfterRemove_0200
     * @tc.number getAfterRemove_0200
     * @tc.desc   frameNode: getNextAfterRemove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAfterRemove_0200', Level.LEVEL0, async (done: Function) => {
      console.info('getAfterRemove_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('removeChildButton'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('getNextAfterRemoveText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAfterRemove_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('null');
      console.info('[getAfterRemove_0200] END');
      done();
    });
    /**
     * @tc.name   getAfterRemove_0300
     * @tc.number getAfterRemove_0300
     * @tc.desc   frameNode: getParentAfterRemove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAfterRemove_0300', Level.LEVEL0, async (done: Function) => {
      console.info('getAfterRemove_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('removeChildButton'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('getParentAfterRemoveText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[getAfterRemove_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('null');
      console.info('[getAfterRemove_0300] END');
      done();
    });
  })
}
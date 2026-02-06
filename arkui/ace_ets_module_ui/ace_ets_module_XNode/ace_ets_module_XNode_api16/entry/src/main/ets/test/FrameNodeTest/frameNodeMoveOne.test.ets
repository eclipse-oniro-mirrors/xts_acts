/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function frameNodeMoveOneTest() {
  describe('frameNodeMoveOneTest', () => {
    beforeEach(async (done: Function) => {
      console.info("frameNodeMoveOneTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveOneTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info("get frameNodeMoveOneTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get frameNodeMoveOneTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push frameNodeMoveOneTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeMoveOneTest page error:" + err);
      }
      console.info("frameNodeMoveOneTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeMoveOneTest after each called");
    });

    /**
     * @tc.number    frameNodeMoveOneTest_0100
     * @tc.name      frameNodeMoveOneTest_0100
     * @tc.desc      frameNode: test UINode node move
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeMoveOneTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('frameNodeMoveOneTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('addFrame2_id'));
      await button1.click();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('frame1AddBlue_id'));
      await button2.click();
      await CommonFunc.sleep(500);
      let button3 = await driver.findComponent(ON.id('move_id'));
      await button3.click();
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('count_id'));
      await button4.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('frame1ChildCount_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[frameNodeMoveOneTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      let strJson2: string = getInspectorByKey('frame2ChildCount_id');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[frameNodeMoveOneTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('2');
      expect(obj2.$attrs.content).assertEqual('3');
      console.info('[frameNodeMoveOneTest_0100] END');
      done();
    });

    /**
     * @tc.number    frameNodeMoveOneTest_0200
     * @tc.name      frameNodeMoveOneTest_0200
     * @tc.desc      frameNode: test UINode node text move
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('frameNodeMoveOneTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('frameNodeMoveOneTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('addFrame2_id'));
      await button1.click();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('addText_id'));
      await button2.click();
      await CommonFunc.sleep(500);
      let button3 = await driver.findComponent(ON.id('moveText_id'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('count_id'));
      await button4.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('frame3ChildCount_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[frameNodeMoveOneTest_0200] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      let strJson2: string = getInspectorByKey('getNodeParentId_id');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[frameNodeMoveOneTest_0200] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('3');
      expect(obj2.$attrs.content).assertEqual('root_id1');
      console.info('[frameNodeMoveOneTest_0200] END');
      done();
    });

  })
}
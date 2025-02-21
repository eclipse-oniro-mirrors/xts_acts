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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';

export default function commonEventTest1() {
  describe('commonEventTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("commonEventTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/commonEventTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonEventTest1 state pages:" + JSON.stringify(pages));
        if (!("commonEventTest1" == pages.name)) {
          console.info("get commonEventTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push commonEventTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonEventTest1 page error:" + err);
      }
      console.info("commonEventTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonEventTest1 after each called");
    });


    /**
     * @tc.number    commonEventTest1_0100
     * @tc.name      commonEventTest1_0100
     * @tc.desc      Test setOnMouse
     * @tc.level     Level 2
     */
    it('commonEventTest1_0100', 0, async (done: Function) => {
      console.info('commonEventTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let node: Component = await driver.findComponent(ON.id('commonEventTest1_node'));
      let point = await node.getBoundsCenter();
      await driver.mouseClick({x:Math.round(point.x), y:Math.round(point.y)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(2000);

      let btn1 = await driver.findComponent(ON.id('commonEventTest1_getOnMouse'));
      await btn1.click()
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('commonEventTest1_text1');
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('setOnMouseFrameNode')

      console.info('commonEventTest1_0100 END');
      done();
    });

    /**
     * @tc.number    commonEventTest1_0200
     * @tc.name      commonEventTest1_0200
     * @tc.desc      Test setOnSizeChange
     * @tc.level     Level 2
     */
    it('commonEventTest1_0200', 0, async (done: Function) => {
      console.info('commonEventTest1_0200 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('commonEventTest1_changeSize'));
      await btn1.click()
      console.info("[commonEventTest1_0200] btn1");
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('commonEventTest1_getOnSizeChange'));
      await btn2.click()
      console.info("[commonEventTest1_0200] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('commonEventTest1_text2');
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[commonEventTest1_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('setOnSizeChangeFrameNode')

      console.info('commonEventTest1_0200 END');
      done();
    });


  })
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';
export default function gestureEventTest() {
  describe('gestureEventTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/gestureEventTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureEventTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get gestureEventTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gestureEventTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureEventTest page error:" + err);
      }
      console.info("gestureEventTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureEventTest after each called");
    });
    /**
     * @tc.name   gestureEventTest_0100
     * @tc.number gestureEventTest_0100
     * @tc.desc   Test setOnMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureEventTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('gestureEventTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let node: Component = await driver.findComponent(ON.id('gestureEventTest_node'));
      let point = await node.getBoundsCenter();
      console.info("[gestureEventTest_0100] getBoundsCenter point.x: " + point.x + ", point.y: " + point.y);
      await driver.swipe(Math.round(point.x), Math.round(point.y), Math.round(point.x), Math.round(point.y + vp2px(50)));
      console.info('gestureEventTest_0100 point x:=' + point.x + " y:=" + point.y);
      await CommonFunc.sleep(2000);
      let btn = await driver.findComponent(ON.id('getpanGestureInfo'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('panGesture_text1');
      let strJson2 = getInspectorByKey('panGesture_text2');
      let strJson3 = getInspectorByKey('panGesture_text3');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      await CommonFunc.sleep(1000);
      console.info("[gestureEventTest_0100] panGesture_text1 is: " + obj1.$attrs.content);
      console.info("[gestureEventTest_0100] panGesture_text2 is: " + obj2.$attrs.content);
      console.info("[gestureEventTest_0100] panGesture_text3 is: " + obj3.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('Pan start')
      expect(obj2.$attrs.content).assertEqual('Pan update')
      expect(obj3.$attrs.content).assertEqual('Pan end')
      console.info('gestureEventTest_0100 END');
      done();
    });
  })
}
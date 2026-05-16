/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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


export default function setDistanceTest() {
  describe('setDistanceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PanGesture/setDistance",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureTest state pages: " + JSON.stringify(pages));
        if (!("Gesture" == pages.name)) {
          console.info("get GestureTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    setDistanceTest_0100
     * @tc.name      setDistanceTest_0100
     * @tc.desc      distance is 0 fingers is 0
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setDistanceTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('setDistanceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('change'));
      await button.click();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      let column = await driver.findComponent(ON.id('column'));
      let rect = await column.getBounds();
      let center = await column.getBoundsCenter();
      pointers.setPoint(0, 0, { x: Math.round(center.x), y: Math.round(center.y) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left), y: Math.round(center.y) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(200);
      expect(AppStorage.get('positionX')).assertLess(0);
      console.info('[setDistanceTest_0100] END');
      done();
    });

    /**
     * @tc.number    setDistanceTest_0200
     * @tc.name      setDistanceTest_0200
     * @tc.desc      distance is -1 fingers is 0
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setDistanceTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('setDistanceTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('change'));
      let distance = await driver.findComponent(ON.id('distance'));
      await distance.click()
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      let column = await driver.findComponent(ON.id('column'));
      let rect = await column.getBounds();
      let center = await column.getBoundsCenter();
      pointers.setPoint(0, 0, { x: Math.round(center.x), y: Math.round(center.y) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left), y: Math.round(center.y) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(200);
      expect(AppStorage.get('positionX')).assertLess(0);
      AppStorage.clear()
      console.info('[setDistanceTest_0200] END');
      done();
    });

    /**
     * @tc.number    setFingersTest_0100
     * @tc.name      setFingersTest_0100
     * @tc.desc      distance is 0 fingers is 10
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setFingersTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('setFingersTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('change'));
      let fingers = await driver.findComponent(ON.id('fingers'));
      await fingers.click()
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      let column = await driver.findComponent(ON.id('column'));
      let rect = await column.getBounds();
      let center = await column.getBoundsCenter();
      pointers.setPoint(0, 0, { x: Math.round(center.x), y: Math.round(center.y) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left), y: Math.round(center.y) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(200);
      expect(AppStorage.get('positionX')).assertEqual(undefined);
      console.info('[setFingersTest_0100] END');
      done();
    });

    /**
     * @tc.number    setFingersTest_0200
     * @tc.name      setFingersTest_0200
     * @tc.desc      distance is -1 fingers is 10
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setFingersTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('setFingersTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('change'));
      let fingers = await driver.findComponent(ON.id('fingers'));
      await fingers.click()
      await CommonFunc.sleep(200);
      await fingers.click()
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      let column = await driver.findComponent(ON.id('column'));
      let rect = await column.getBounds();
      let center = await column.getBoundsCenter();
      pointers.setPoint(0, 0, { x: Math.round(center.x), y: Math.round(center.y) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left), y: Math.round(center.y) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(200);
      expect(AppStorage.get('positionX')).assertLess(0);
      AppStorage.clear()
      console.info('[setFingersTest_0200] END');
      done();
    });

    /**
     * @tc.number    setFingersTest_0300
     * @tc.name      setFingersTest_0300
     * @tc.desc      distance is 11 fingers is 10
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setFingersTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('setFingersTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('change'));
      let fingers = await driver.findComponent(ON.id('fingers'));
      await fingers.click()
      await CommonFunc.sleep(200);
      await fingers.click()
      await CommonFunc.sleep(200);
      await fingers.click()
      await CommonFunc.sleep(200);
      await button.click();
      await CommonFunc.sleep(200);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      let column = await driver.findComponent(ON.id('column'));
      let rect = await column.getBounds();
      let center = await column.getBoundsCenter();
      pointers.setPoint(0, 0, { x: Math.round(center.x), y: Math.round(center.y) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left), y: Math.round(center.y) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(200);
      expect(AppStorage.get('positionX')).assertLess(0);
      console.info('[setFingersTest_0300] END');
      done();
    });
  })
}
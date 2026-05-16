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
import CommonFunc from '../../MainAbility/common/Common';
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

export default function PanRecognizerTest() {
  describe('PanRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('PanRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/PanRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PanRecognizer state pages:' + JSON.stringify(pages));
        if (!('PanRecognizer' == pages.name)) {
          console.info('get PanRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push PanRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PanRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PanRecognizer after each called');
    });

    /**
     * @tc.name   PanRecognizer_0100
     * @tc.number PanRecognizer_0100
     * @tc.desc   To test whether PanRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = globalThis.winLeft
      let windowOffsetY: number = globalThis.winTop
      console.log('PanRecognizer_0100 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj = CommonFunc.getComponentRectOnScreen('PanRecognizer1');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('PanRecognizer_0100 areaObj start', areaObj.left, areaObj.top, areaObj.right, areaObj.bottom)
      console.log('PanRecognizer_0100 areaObj clicked finger[0] start', Math.round(areaObj.left),
        Math.round(areaObj.top))
      console.log('PanRecognizer_0100 areaObj clicked finger[0] end', Math.round(areaObj.right),
        Math.round(areaObj.top))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      pointers.setPoint(0, 0,
        { x: Math.round(areaObj.left + areaWidth * 0.1), y: Math.round(areaObj.top + areaHeight * 0.5) });
      pointers.setPoint(0, 1,
        { x: Math.round(areaObj.left + areaWidth * 0.3), y: Math.round(areaObj.top + areaHeight * 0.5) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('PanRecognizer');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[PanRecognizer_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[PanRecognizer_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(AppStorage.get('PAN_GESTURE')).assertEqual(2);
      expect(AppStorage.get('All')).assertEqual(15);
      expect(obj.$attrs.content).assertEqual('PanGesture\ndistance:5\nfingers:1\nisFingerCountLimited:false');
      console.info('[PanRecognizer_0100] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0200
     * @tc.number PanRecognizer_0200
     * @tc.desc   To test for Horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0200 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Horizontal'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.bottom + rect.top) / 2),
        Math.round(rect.right),
        Math.round((rect.bottom + rect.top) / 2))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Horizontal')).assertEqual(3);
      console.info('[PanRecognizer_0200] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0300
     * @tc.number PanRecognizer_0300
     * @tc.desc   To test for Left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0300 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Left'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.bottom + rect.top) / 2),
        Math.round(rect.left),
        Math.round((rect.bottom + rect.top) / 2))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Left')).assertEqual(1);
      console.info('[PanRecognizer_0300] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0400
     * @tc.number PanRecognizer_0400
     * @tc.desc   To test for Right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0400 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Right'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.bottom + rect.top) / 2),
        Math.round(rect.right),
        Math.round((rect.bottom + rect.top) / 2))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Right')).assertEqual(2);
      console.info('[PanRecognizer_0400] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0500
     * @tc.number PanRecognizer_0500
     * @tc.desc   To test for Vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0500', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0500 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Vertical'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.top)),
        Math.round((rect.left + rect.right) / 2),
        Math.round((rect.bottom)))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Vertical')).assertEqual(12);
      console.info('[PanRecognizer_0500] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0600
     * @tc.number PanRecognizer_0600
     * @tc.desc   To test for Up
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0600', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0600 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Up'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.bottom)),
        Math.round((rect.left + rect.right) / 2),
        Math.round((rect.top)))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Up')).assertEqual(4);
      console.info('[PanRecognizer_0600] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0700
     * @tc.number PanRecognizer_0700
     * @tc.desc   To test for Down
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0700', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0700 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Down'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.top)),
        Math.round((rect.left + rect.right) / 2),
        Math.round((rect.bottom)))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('Down')).assertEqual(8);
      console.info('[PanRecognizer_0700] END');
      done();
    });

    /**
     * @tc.name   PanRecognizer_0800
     * @tc.number PanRecognizer_0800
     * @tc.desc   To test for None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanRecognizer_0800', Level.LEVEL0, async (done: Function) => {
      console.info('PanRecognizer_0800 START');
      let driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('None'));
      let rect = await button.getBounds();
      await driver.swipe(Math.round((rect.left + rect.right) / 2), Math.round((rect.bottom + rect.top) / 2),
        Math.round(rect.left),
        Math.round((rect.bottom + rect.top) / 2))
      await CommonFunc.sleep(300);
      expect(AppStorage.get('None')).assertEqual(0);
      console.info('[PanRecognizer_0800] END');
      done();
    });


  })
}
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function swipeGestureTest() {
  describe('SwipeGestureTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwipeGesture beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gesture/isFingerCountLimited/SwipeGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwipeGesture state pages:' + JSON.stringify(pages));
        if (!('SwipeGesture' == pages.name)) {
          console.info('get SwipeGesture state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SwipeGesture page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SwipeGesture page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SwipeGesture after each called');
    });

    /**
     * @tc.name   SwipeGesture1_0100
     * @tc.number SwipeGesture1_0100
     * @tc.desc   To test whether isFingerCountLimited is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwipeGesture1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGesture1_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('SwipeGesture1_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGesture');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGesture1_0100 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGesture1_0100 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1/4),Math.round(areaObj1.top + areaHeight1/4))
      console.log('SwipeGesture1_0100 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1/2))
      let driver = Driver.create();
      let speed = Math.floor(areaWidth1 * 0.6 / 0.016 / 1000) * 1000
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1/4),Math.round(areaObj1.top + areaHeight1/4),Math.round(areaObj1.left + areaWidth1/2),Math.round(areaObj1.top + areaHeight1/2),800)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SwipeGesture');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SwipeGesture1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('success');
      console.info('[SwipeGesture1_0100] END');
      done();
    });

    /**
     * @tc.name   SwipeGesture1_0200
     * @tc.number SwipeGesture1_0200
     * @tc.desc   To test whether isFingerCountLimited is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwipeGesture1_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGesture1_0200 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('SwipeGesture1_0200 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj2 = CommonFunc.getComponentRectOnScreen('SwipeGesture2');
      let areaHeight2 = areaObj2.bottom - areaObj2.top
      let areaWidth2 = areaObj2.right - areaObj2.left
      console.log('SwipeGesture1_0200 areaObj2',areaObj2.left,areaObj2.top,areaObj2.right,areaObj2.bottom)
      console.log('SwipeGesture1_0200 areaObj2 clicked start',Math.round(areaObj2.left + areaWidth2 * 0.2),Math.round(areaObj2.top + areaObj2.top + areaHeight2/2))
      console.log('SwipeGesture1_0200 areaObj2 clicked end',Math.round(areaObj2.left + areaWidth2 * 0.8),Math.round(areaObj2.top + areaObj2.top + areaHeight2/2))
      let driver = Driver.create();
      let speed = Math.floor(areaWidth2 * 0.6 / 0.016 / 1000) * 1000
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj2.left + areaWidth2 * 0.2),Math.round(areaObj2.top + areaObj2.top + areaHeight2/2),Math.round(areaObj2.left + areaWidth2 * 0.8),Math.round(areaObj2.top + areaObj2.top + areaHeight2/2),speed)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SwipeGesture2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SwipeGesture1_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_0200] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('success');
      console.info('[SwipeGesture1_0200] END');
      done();
    });

  })
}

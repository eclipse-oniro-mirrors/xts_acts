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

export default function rotationGestureEventTest() {
  describe('rotationGestureEvent', () => {
    beforeEach(async (done: Function) => {
      console.info('rotationGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/RotationGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get rotationGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('RotationGesture' == pages.name)) {
          console.info('get rotationGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push rotationGestureEvent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push rotationGestureEvent page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number
    * @tc.name  : RotationGesture1_0100
    * @tc.desc  : To test the new item of GestureEvent.
    * @tc.level : Level 2
    */
    it('RotationGesture1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RotationGesture1_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('RotationGesture1_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('RotationGesture1');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('RotationGesture1_0100 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('RotationGesture1_0100 areaObj1 clicked finger[0] start',Math.round(areaObj1.left + areaWidth1/4),Math.round(areaObj1.top + areaHeight1/4))
      console.log('RotationGesture1_0100 areaObj1 clicked finger[0] end',Math.round(areaObj1.right - areaWidth1/2),Math.round(areaObj1.top + areaHeight1/4))
      console.log('RotationGesture1_0100 areaObj1 clicked finger[1] start',Math.round(areaObj1.right - areaWidth1/2),Math.round(areaObj1.bottom - areaHeight1/4))
      console.log('RotationGesture1_0100 areaObj1 clicked finger[1] end',Math.round(areaObj1.left + areaWidth1/4),Math.round(areaObj1.bottom - areaHeight1/4))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left + areaWidth1/4),y: Math.round(areaObj1.top + areaHeight1/4) });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.right - areaWidth1/2),y: Math.round(areaObj1.top + areaHeight1/4) });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.right - areaWidth1/2),y: Math.round(areaObj1.bottom - areaHeight1/4) });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.left + areaWidth1/4),y: Math.round(areaObj1.bottom - areaHeight1/4) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('RotationGesture1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RotationGesture1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[RotationGesture1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[RotationGesture1_0100] END');
      done();
    });

  })
}


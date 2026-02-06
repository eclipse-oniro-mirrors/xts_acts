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

export default function rotationGestureTest() {
  describe('RotationGestureTest', () => {
    beforeEach(async (done: Function) => {
      console.info('RotationGesture beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/RotationRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get RotationGesture state pages:' + JSON.stringify(pages));
        if (!('RotationGesture' == pages.name)) {
          console.info('get RotationGesture state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push RotationGesture page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RotationGesture page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RotationGesture after each called');
    });

    /**
     * @tc.name   RotationRecognizer_0100
     * @tc.number RotationRecognizer_0100
     * @tc.desc   To test whether RotationRecognizer is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RotationRecognizer_0100', Level.LEVEL0, async (done: Function) => {
      console.info('RotationRecognizer_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('RotationRecognizer_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj = CommonFunc.getComponentRectOnScreen('RotationRecognizer1');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('RotationRecognizer_0100 areaObj start',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('RotationRecognizer_0100 areaObj clicked finger[0] start',Math.round(areaObj.left + areaWidth/4),Math.round(areaObj.top + areaHeight/4))
      console.log('RotationRecognizer_0100 areaObj clicked finger[0] end',Math.round(areaObj.right - areaWidth/2),Math.round(areaObj.top + areaHeight/4))
      console.log('RotationRecognizer_0100 areaObj clicked finger[1] start',Math.round(areaObj.right - areaWidth/2),Math.round(areaObj.bottom - areaHeight/4))
      console.log('RotationRecognizer_0100 areaObj clicked finger[1] end',Math.round(areaObj.left + areaWidth/4),Math.round(areaObj.bottom - areaHeight/4))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj.left + areaWidth/4),y: Math.round(areaObj.top + areaHeight/4) });
      pointers.setPoint(0,1,{x: Math.round(areaObj.right - areaWidth/2),y: Math.round(areaObj.top + areaHeight/4) });
      pointers.setPoint(1,0,{x: Math.round(areaObj.right - areaWidth/2),y: Math.round(areaObj.bottom - areaHeight/4) });
      pointers.setPoint(1,1,{x: Math.round(areaObj.left + areaWidth/4),y: Math.round(areaObj.bottom - areaHeight/4) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('RotationRecognizer');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RotationRecognizer_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[RotationRecognizer_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('RotationGesture\nangle:1\nfingers:2\nisFingerCountLimited:false');
      console.info('[RotationRecognizer_0100] END');
      done();
    });
  })
}

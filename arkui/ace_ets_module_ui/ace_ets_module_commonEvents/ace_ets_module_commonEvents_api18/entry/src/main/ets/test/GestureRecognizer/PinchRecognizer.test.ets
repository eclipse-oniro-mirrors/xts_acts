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

export default function PinchRecognizerTest() {
  describe('PinchRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('PinchRecognizer beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/PinchRecognizer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PinchRecognizer state pages:' + JSON.stringify(pages));
        if (!('PinchRecognizer' == pages.name)) {
          console.info('get PinchRecognizer state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push PinchRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PinchRecognizer page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PinchRecognizer after each called');
    });

    /**
    * @tc.number
    * @tc.name  : PinchRecognizer_0100
    * @tc.desc  : To test whether PinchRecognizer is effective.
    * @tc.level : Level 0
    */
    it('PinchRecognizer1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PinchRecognizer1_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('PinchRecognizer1_0100 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PinchRecognizer');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PinchRecognizer1_0100 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PinchRecognizer1_0100 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('PinchRecognizer1_0100 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('PinchRecognizer1_0100 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('PinchRecognizer1_0100 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left + areaWidth1 * 0.1),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.left + areaWidth1 * 0.3),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.right - areaWidth1 * 0.1),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.right - areaWidth1 * 0.3),y: Math.round(areaObj1.top + areaHeight1 * 0.5) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('PinchRecognizer');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[PinchRecognizer1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[PinchRecognizer1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PinchGesture\ndistance:5\nfingers:2\nisFingerCountLimited:false');
      console.info('[PinchRecognizer1_0100] END');
      done();
    });
  })
}
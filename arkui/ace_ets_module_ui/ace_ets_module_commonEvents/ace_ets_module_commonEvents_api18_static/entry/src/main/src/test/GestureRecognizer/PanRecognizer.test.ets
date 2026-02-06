'use static';
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function PanRecognizerTest() {
  describe('PanRecognizerTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/PanRecognizer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get PanRecognizer state pages:' + JSON.stringify(pages));
        if (!('PanRecognizer' == pages.name)) {
          console.info('get PanRecognizer state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push PanRecognizer page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('PanRecognizer after each called');
    });


    
    
/**
     * @tc.number   PanRecognizer_static_0100
     * @tc.name     PanRecognizer_static_0100
     * @tc.desc     PanRecognizer_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PanRecognizer_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PanRecognizer_static_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number;
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number;
      await CommonFunc.sleep(1000);
      console.log('PanRecognizer_static_0100 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj = CommonFunc.getComponentRectOnScreen('PanRecognizer1');
      await CommonFunc.sleep(1000);
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('PanRecognizer_static_0100 areaObj start', areaObj.left, areaObj.top, areaObj.right, areaObj.bottom)
      console.log('PanRecognizer_static_0100 areaObj clicked finger[0] start', Math.round(areaObj.left),
        Math.round(areaObj.top))
      console.log('PanRecognizer_static_0100 areaObj clicked finger[0] end', Math.round(areaObj.right),
        Math.round(areaObj.top))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let pointers: PointerMatrix = PointerMatrix.create(1, 2);
      pointers.setPoint(0, 0,
        { x: Math.round(areaObj.left + areaWidth * 0.1) as Int, y: Math.round(areaObj.top + areaHeight * 0.5) as Int });
      pointers.setPoint(0, 1,
        { x: Math.round(areaObj.left + areaWidth * 0.3) as Int, y: Math.round(areaObj.top + areaHeight * 0.5) as Int });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('PanRecognizer');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[PanRecognizer_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[PanRecognizer_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content'))
        .assertEqual('PanGesture\ndistance:5\nfingers:1\nisFingerCountLimited:false');
      console.info('[PanRecognizer_static_0100] END');
      done();
    });
  })
}

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

export default function rotationGestureTest() {
  describe('RotationGestureTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/RotationRecognizer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get RotationGesture state pages:' + JSON.stringify(pages));
        if (!('RotationRecognizer' == pages.name)) {
          console.info('get RotationGesture state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RotationGesture page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('RotationGesture after each called');
    });


    
    
/**
     * @tc.number   RotationRecognizer_static_0100
     * @tc.name     RotationRecognizer_static_0100
     * @tc.desc     RotationRecognizer_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RotationRecognizer_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RotationRecognizer_static_0100 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX: number = AppStorage.get<number>("winLeft") as number;
      let windowOffsetY: number = AppStorage.get<number>("winTop") as number;
      console.log('RotationRecognizer_static_0100 windowOffsetX and windowOffsetY', windowOffsetX, windowOffsetY)
      let areaObj = CommonFunc.getComponentRectOnScreen('RotationRecognizer1');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('RotationRecognizer_static_0100 areaObj start', areaObj.left, areaObj.top, areaObj.right,
        areaObj.bottom)
      console.log('RotationRecognizer_static_0100 areaObj clicked finger[0] start',
        Math.round(areaObj.left + areaWidth / 4), Math.round(areaObj.top + areaHeight / 4))
      console.log('RotationRecognizer_static_0100 areaObj clicked finger[0] end',
        Math.round(areaObj.right - areaWidth / 2), Math.round(areaObj.top + areaHeight / 4))
      console.log('RotationRecognizer_static_0100 areaObj clicked finger[1] start',
        Math.round(areaObj.right - areaWidth / 2), Math.round(areaObj.bottom - areaHeight / 4))
      console.log('RotationRecognizer_static_0100 areaObj clicked finger[1] end',
        Math.round(areaObj.left + areaWidth / 4), Math.round(areaObj.bottom - areaHeight / 4))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(2000);
      let pointers: PointerMatrix = PointerMatrix.create(2, 2);
      pointers.setPoint(0, 0,
        { x: Math.round(areaObj.left + areaWidth / 4) as Int, y: Math.round(areaObj.top + areaHeight / 4) as Int });
      pointers.setPoint(0, 1,
        { x: Math.round(areaObj.right - areaWidth / 2) as Int, y: Math.round(areaObj.top + areaHeight / 4) as Int });
      pointers.setPoint(1, 0,
        { x: Math.round(areaObj.right - areaWidth / 2) as Int, y: Math.round(areaObj.bottom - areaHeight / 4) as Int });
      pointers.setPoint(1, 1,
        { x: Math.round(areaObj.left + areaWidth / 4) as Int, y: Math.round(areaObj.bottom - areaHeight / 4) as Int });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('RotationRecognizer');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[RotationRecognizer_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[RotationRecognizer_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content'))
        .assertEqual('RotationGesture\nangle:1\nfingers:2\nisFingerCountLimited:false');
      console.info('[RotationRecognizer_static_0100] END');
      done();
    });
  })
}

'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function panGestureDistanceTest() {

  describe('panGestureDistanceTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/panGestureDistance',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get panGesture state pages: " + JSON.stringify(pages));
        if (!("panGestureDistance" == pages.name)) {
          console.info("get panGesture state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push panGesture page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("panGesture after each called");
    });

    
    
    
/**
     * @tc.number   panGesture_panRecognizer_getDistance_static_0010
     * @tc.name     panGesture_panRecognizer_getDistance_static_0010
     * @tc.desc     panGesture_panRecognizer_getDistance_static_0010
     * @tc.level    Level.LEVEL0
     */
it('panGesture_panRecognizer_getDistance_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('panGesture_panRecognizer_getDistance_static_0010 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('getDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`) as Int
        }, 5, 4000);
      let strJson = inspector.getInspectorByKey('distance1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[panGesture_panRecognizer_getDistance_static_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_static_0010] END');
      done();
    });

    
    
    
/**
     * @tc.number   panGesture_panRecognizer_getDistance_static_0020
     * @tc.name     panGesture_panRecognizer_getDistance_static_0020
     * @tc.desc     panGesture_panRecognizer_getDistance_static_0020
     * @tc.level    Level.LEVEL0
     */
it('panGesture_panRecognizer_getDistance_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('panGesture_panRecognizer_getDistance_static_0020 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('getDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`) as Int
        }, 5, 4000);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('map');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[panGesture_panRecognizer_getDistance_static_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_static_0020] END');
      done();
    });

    
    
    
/**
     * @tc.number   panGesture_panRecognizer_getDistance_static_0030
     * @tc.name     panGesture_panRecognizer_getDistance_static_0030
     * @tc.desc     panGesture_panRecognizer_getDistance_static_0030
     * @tc.level    Level.LEVEL0
     */
it('panGesture_panRecognizer_getDistance_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('panGesture_panRecognizer_getDistance_static_0030 START');
      let gridRect = CommonFunc.getComponentRectOnScreen('modifierGetDistance')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
        y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int
      },
        {
          x: Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`) as Int,
          y: Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`) as Int
        }, 5, 4000);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('modifierMap');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[panGesture_panRecognizer_getDistance_static_0030] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture1_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertContain('5');
      console.info('[panGesture_panRecognizer_getDistance_static_0030] END');
      done();
    });
  })
}
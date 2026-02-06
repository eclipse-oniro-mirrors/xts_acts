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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function SwipeGesture3() {
  describe('SwipeGesture3', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SwipeGesture3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGesture3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router

        let pages = routerInstance.getState();
        console.info("get SwipeGesture3 state pages:" + JSON.stringify(pages));
        if (!("SwipeGesture3" == pages.name)) {
          routerInstance.clear();
          console.info("get SwipeGesture3 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SwipeGesture3 page error:" + err);
      }
      console.info("SwipeGesture3 beforeEach end");
    });


    
    /**
     * @tc.number   SwipeGesture3_static_0100
     * @tc.name     SwipeGesture3_static_0100
     * @tc.desc     SwipeGesture3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SwipeGesture3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SwipeGesture3_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Swipe5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SwipeGesture3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture3_0100] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PinchGesture center:(0.5,0.5)');
      console.info('[SwipeGesture3_0100] END');
      done();
    });


    
    /**
     * @tc.number   SwipeGesture3_static_0200
     * @tc.name     SwipeGesture3_static_0200
     * @tc.desc     SwipeGesture3_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SwipeGesture3_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwipeGesture3_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture3');
      let top = colum.top
      let right = colum.right
      let left = colum.left
      await ((driver.swipe(Math.round(left + (right - left) / 6) as Int, Math.round(top + 50) as Int,
        Math.round(right - (right - left) / 6) as Int, Math.round(top + 450) as Int)) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Swipe6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SwipeGesture3_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture3_0200] title: " + obj.getElement('$attrs').getString('content'));
      expect((Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 93) < 10).assertEqual(true);
      console.info('[SwipeGesture3_0200] END');
      done();
    });

  })
}


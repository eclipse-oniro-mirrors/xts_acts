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

export default function PanGesture3() {
  describe('PanGesture3', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("PanGesture3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PanGesture/PanGesture3",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PanGesture3 state pages:" + JSON.stringify(pages));
        if (!("PanGesture3" == pages.name)) {
          console.info("get PanGesture3 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PanGesture3 page error:" + err);
      }
      console.info("PanGesture3 beforeEach end");
    });


    
    /**
     * @tc.number   PanGesture3_static_0100
     * @tc.name     PanGesture3_static_0100
     * @tc.desc     PanGesture3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PanGesture3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('PanGesture3_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Pan5');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PanGesture3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PanGesture3_0100] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PinchGesture center:(2,1.5)');
      console.info('[PanGesture3_0100] END');
      done();
    });


    
    /**
     * @tc.number   PanGesture3_static_0200
     * @tc.name     PanGesture3_static_0200
     * @tc.desc     PanGesture3_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PanGesture3_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PanGesture3_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('PanGesture3');
      let top = colum.top
      await ((driver.swipe(Math.round(AppStorage.get<number>("winLeft") as number + 100) as Int,
        Math.round(top + 100) as Int,
        Math.round(AppStorage.get<number>("winLeft") as number + 500) as Int,
        Math.round(top + 500) as Int)) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PanGesture3_1');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PanGesture3_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PanGesture3_0200] title: " + obj.getElement('$attrs').getString('content'));
      expect((Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 190) < 20).assertEqual(true);
      console.info('[PanGesture3_0200] END');
      done();
    });

  })
}


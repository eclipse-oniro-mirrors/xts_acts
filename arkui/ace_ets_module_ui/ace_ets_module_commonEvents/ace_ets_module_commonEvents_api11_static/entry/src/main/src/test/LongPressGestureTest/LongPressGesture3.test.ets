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


export default function LongPressGesture3() {
  describe('LongPressGesture3', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("LongPressGesture3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LongPressGesture/LongPressGesture3",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LongPressGesture3 state pages:" + JSON.stringify(pages));
        if (!("LongPressGesture3" == pages.name)) {
          console.info("get LongPressGesture3 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push LongPressGesture3 page error:" + err);
      }
      console.info("LongPressGesture3 beforeEach end");
    });


    
    /**
     * @tc.number   LongPressGesture3_static_0100
     * @tc.name     LongPressGesture3_static_0100
     * @tc.desc     LongPressGesture3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LongPressGesture3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('LongPressGesture3_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LongPress5');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LongPressGesture3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LongPressGesture3_0100] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PinchGesture center:(0.5,0.5)');
      console.info('[LongPressGesture3_0100] END');
      done();
    });


    
    /**
     * @tc.number   LongPressGesture3_static_0200
     * @tc.name     LongPressGesture3_static_0200
     * @tc.desc     LongPressGesture3_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LongPressGesture3_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LongPressGesture3_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('LongPressGesture3'));
      await (Column?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LongPress6');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LongPressGesture3_0200] component obj is: " + JSON.stringify(obj));
      console.info("[LongPressGesture3_0200] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('LongPress onAction:2');
      console.info('[LongPressGesture3_0200] END');
      done();
    });

  })
}


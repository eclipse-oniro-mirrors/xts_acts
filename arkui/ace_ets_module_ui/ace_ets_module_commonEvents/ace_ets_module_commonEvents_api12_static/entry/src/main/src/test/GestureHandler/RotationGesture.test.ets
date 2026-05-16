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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import {Component, Driver, ON } from '@ohos.UiTest';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function RotationGestureHandlerTest() {

  describe('RotationGestureHandlerTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/RotationGestureHandler',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get RotationGestureHandler state pages: " + JSON.stringify(pages));
        if (!("RotationGestureHandler" == pages.name)) {
          console.info("get RotationGestureHandler state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RotationGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RotationGestureHandler page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RotationGestureHandler after each called");
    });

    
    
    
/**
     * @tc.number   RotationGestureHandler_static_0010
     * @tc.name     RotationGestureHandler_static_0010
     * @tc.desc     RotationGestureHandler_static_0010
     * @tc.level    Level.LEVEL0
     */
it('RotationGestureHandler_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RotationGestureHandler_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('RotationGestureHandlerColumn'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('RotationGestureHandler1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('label')).assertEqual('succ');
      console.info('[RotationGestureHandler_0010] END');
      done();
    });
  })
}

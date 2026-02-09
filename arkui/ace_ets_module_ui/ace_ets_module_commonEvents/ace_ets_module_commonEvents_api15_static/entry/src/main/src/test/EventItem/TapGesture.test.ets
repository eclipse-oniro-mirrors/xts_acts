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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, Component, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tapGestureEventTest() {
  describe('tapGestureEvent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('tapGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/TapGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get tapGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('TapGesture' == pages.name)) {
          console.info('get tapGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push tapGestureEvent page error: ' + err);
        expect().assertFail();
      }
    });
    
    
    
/**
     * @tc.number   TapGesture1_static_0100
     * @tc.name     TapGesture1_static_0100
     * @tc.desc     TapGesture1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TapGesture1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      await CommonFunc.sleep(1000);
      console.info('TapGesture1_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await (driver.findComponent(ON.id('TapGesture1')) as Promise<Component>);
      await (Column?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('value');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[TapGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[TapGesture1_static_0100] title: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[TapGesture1_static_0100] END');
      done();
    });

  })
}


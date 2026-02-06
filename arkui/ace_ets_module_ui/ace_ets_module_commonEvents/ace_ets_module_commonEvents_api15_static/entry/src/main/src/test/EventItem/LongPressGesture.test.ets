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
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import { Driver, ON  } from '@ohos.UiTest';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function longPressEventTest() {
  describe('longPressEvent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('longPressEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/LongPressGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get longPressEvent state pages: ' + JSON.stringify(pages));
        if (!('LongPressGesture' == pages.name)) {
          console.info('get longPressEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push longPressEvent page error: ' + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   LongPressGesture1_static_0100
     * @tc.name     LongPressGesture1_static_0100
     * @tc.desc     LongPressGesture1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LongPressGesture1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      await CommonFunc.sleep(1000);
      console.info('LongPressGesture1_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await (driver.findComponent(ON.id('LongPressGesture1')) as Promise<Component>);
      await Column.longClick();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LongPressGesture1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[LongPressGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[LongPressGesture1_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[LongPressGesture1_static_0100] END');
      done();
    });

  })
}


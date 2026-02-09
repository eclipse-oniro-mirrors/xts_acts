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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, MouseButton, ON, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
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

export default function EventTarget_id() {
  describe('EventTarget_id', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('EventTarget_id beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventTarget_id/EventTarget_id',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get EventTarget_id state pages: ' + JSON.stringify(pages));
        if (!('EventTarget_id' == pages.name)) {
          console.info('get EventTarget_id state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push EventTarget_id page error: ' + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   EventTarget_id_static_0100
     * @tc.name     EventTarget_id_static_0100
     * @tc.desc     EventTarget_id_static_0100
     * @tc.level    Level.LEVEL0
     */
it('EventTarget_id_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[EventTarget_id_static_0100] START');
      let driver = Driver.create();
      let button1 = await (driver.findComponent(ON.id('click_id')) as Promise<Component>);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      // test the child component response
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[EventTarget_id_static_0100] strJson is: ' + strJson);
      console.info('[EventTarget_id_static_0100] EventTarget_id obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('id:click_id');

      console.info('[EventTarget_id_static_0100] END')
      done();
    });


    
    
/**
     * @tc.number   EventTarget_id_0200
     * @tc.name     EventTarget_id_0200
     * @tc.desc     EventTarget_id_0200
     * @tc.level    Level.LEVEL0
     */
it('EventTarget_id_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[EventTarget_id_0200] START');
      let driver = Driver.create();
      let button2 = await (driver.findComponent(ON.id('click_key')) as Promise<Component>);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      // test the child component response
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[EventTarget_id_0200] strJson is: ' + strJson);
      console.info('[EventTarget_id_0200] EventTarget_id obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('id:click_key');

      console.info('[EventTarget_id_0200] END');
      done();
    });
  })
}
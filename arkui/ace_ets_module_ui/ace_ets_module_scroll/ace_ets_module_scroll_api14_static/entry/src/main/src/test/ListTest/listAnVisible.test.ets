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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listAnVisible() {
  describe('listAnVisible', () => {

    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("listAnVisible beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listAnVisible",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listAnVisible state pages:" + JSON.stringify(pages));
        if (!("listAnVisible" == pages.name)) {
          console.info("get listAnVisible pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push listAnVisible page error:" + err);
      }
      console.info("listAnVisible beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listAnVisible after each called");
    });


    
    /**
     * @tc.number   listAnVisible_static_0100
     * @tc.name     listAnVisible_static_0100
     * @tc.desc     listAnVisible_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listAnVisible_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listAnVisible_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnVisible: Component = await driver.findComponent(ON.id('list_visible_change')) as Component;
      await btnVisible.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('visible_anTrue')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('visible_last_index');
      console.info("[listAnVisible_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[listAnVisible_static_0100] content: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('List: 6');
      console.info('[listAnVisible_static_0100] END');
      done();
    });
  })
}

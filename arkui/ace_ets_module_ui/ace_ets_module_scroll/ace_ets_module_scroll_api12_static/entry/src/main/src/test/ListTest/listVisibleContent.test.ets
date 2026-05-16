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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listVisibleContent() {
  describe('listVisibleContent', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listVisibleContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listVisibleContent",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listVisibleContent state pages:" + JSON.stringify(pages));
        if (!("listVisibleContent" == pages.name)) {
          console.info("get listVisibleContent pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listVisibleContent page result:" + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push listVisibleContent page error:" + err);
      }
      console.info("listVisibleContent beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listVisibleContent after each called");
    });



    
    /**
     * @tc.number   listVisibleContent_static_0100
     * @tc.name     listVisibleContent_static_0100
     * @tc.desc     listVisibleContent_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listVisibleContent_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listVisibleContent_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list1_visible');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listVisibleContent_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[listVisibleContent_static_0100] maintainVisibleContentPosition: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('maintainVisibleContentPosition')));
      expect(obj.getElement('$attrs').getBoolean('maintainVisibleContentPosition')).assertEqual(false);
      console.info('[listVisibleContent_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   listVisibleContent_static_0200
     * @tc.name     listVisibleContent_static_0200
     * @tc.desc     listVisibleContent_static_0200
     * @tc.level    Level.LEVEL1
     */
it('listVisibleContent_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listVisibleContent_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scrollTo_y')) as Component;
      await btn.click();
      await CommonFunc.sleep(3000);
      let btn2: Component = await driver.findComponent(ON.id('deleteItem_index')) as Component;
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('list_num');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listVisibleContent_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[listVisibleContent_static_0200] length: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('length: 49');
      console.info('[listVisibleContent_static_0200] END');
      done();
    });
  })
}

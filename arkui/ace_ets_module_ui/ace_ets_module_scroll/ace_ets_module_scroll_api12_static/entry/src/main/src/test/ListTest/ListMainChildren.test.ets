'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function ListMainChildrenTest() {
  describe('ListMainChildrenTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListMainChildrenTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListMainChildren',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ListMainChildrenTest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          // router.clear();
          console.info("get ListMainChildrenTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ListMainChildrenTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListMainChildrenTest page error: " + err);
        expect().assertFail();
      }
    });



    
    /**
     * @tc.number   ListMainChildrenTest_static_0100
     * @tc.name     ListMainChildrenTest_static_0100
     * @tc.desc     ListMainChildrenTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ListMainChildrenTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ListMainChildrenTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ListMainChildren_1')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListMainChildren_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListMainChildrenTest_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('ListChild:20');
      console.info('[ListMainChildrenTest_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   ListMainChildrenTest_static_0200
     * @tc.name     ListMainChildrenTest_static_0200
     * @tc.desc     ListMainChildrenTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ListMainChildrenTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ListMainChildrenTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ListMainChildren_2')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListMainChildren_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListMainChildrenTest_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('ListItemGroupChild:10');
      console.info('[ListMainChildrenTest_static_0100] END');
      done();
    });
  })
}


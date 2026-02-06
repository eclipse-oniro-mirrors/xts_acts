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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function navigation_add4_1() {
  describe('navigation_add4_1', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigation_add4_1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigation_add/navigation_add4_1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigation_add4_1 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get navigation_add4_1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigation_add4_1 page result:");
        }
      } catch (err) {
        console.error("push navigation_add4_1 page error:" + err);
      }
      console.info("navigation_add4_1 beforeEach end");
    });
    afterEach(async () => {
    });
    
    
    
/**
     * @tc.number   navigation_add4_1_static_0100
     * @tc.name     navigation_add4_1_static_0100
     * @tc.desc     navigation_add4_1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('navigation_add4_1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

  console.info('navigation_add4_1_static_0100 START');
  await CommonFunc.sleep(1000);

  let driver = Driver.create();
  await CommonFunc.sleep(1000);

  let navigation = CommonFunc.getComponentRect('navigation_add4_1_navigation');

  await driver.swipe( (Math.round(navigation.left + (navigation.right - navigation.left) / 4 * 3)) as int ,(Math.round(navigation.top + (navigation.bottom - navigation.top) / 2)) as int ,(Math.round(navigation.left + (navigation.right - navigation.left) / 4 * 1)) as int ,(Math.round(navigation.top + (navigation.bottom -  navigation.top) / 2)) as int);
  await CommonFunc.sleep(1000);

  let btn1 = await driver.findComponent(ON.id('navigation_add4_1_pageTwo_btn1'));
  await (btn1?.click() as Promise<void>);
  await CommonFunc.sleep(1000);

  let text1 = inspector.getInspectorByKey('navigation_add4_1_pageTwo_text1');
  expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('["pageOne","pageTwo"]');
  await CommonFunc.sleep(1000);
      
      
      
      
      console.info('navigation_add4_1_static_0100 END');
      done();
    });
    
    
    
  })
}
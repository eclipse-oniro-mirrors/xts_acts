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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function NavPathStack21() {
  describe('NavPathStack21', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavPathStack21 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStack21',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavPathStack21 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get NavPathStack21 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavPathStack21 page result:");
        }
      } catch (err) {
        console.error("push NavPathStack21 page error:" + err);
      }
      console.info("NavPathStack21 beforeEach end");
    });
    afterEach(async () => {
    });

    
    

    /**
     * @tc.number   NavPathStack21_static_0100
     * @tc.name     NavPathStack21_static_0100
     * @tc.desc     NavPathStack21_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavPathStack21_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavPathStack21_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('NavPathStack21_btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

  console.log('-----------------1')
      let pageOne_text1 = inspector.getInspectorByKey('NavPathStack21_pageOne_text1');
  console.log('-----------------2')
      expect(String(JSON.parseJsonElement(pageOne_text1).getElement('$attrs').getString('content'))).assertEqual('pageOne');
  console.log('-----------------3')
      await CommonFunc.sleep(500);

      let btn2 = await driver.findComponent(ON.id('NavPathStack21_btn2'));
  console.log('-----------------4')
      await (btn2?.click() as Promise<void>);
  console.log('-----------------5')
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('NavPathStack21_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('0');
      await CommonFunc.sleep(500);

      console.info('NavPathStack21_static_0100 END');
      done();
    });




  })
}
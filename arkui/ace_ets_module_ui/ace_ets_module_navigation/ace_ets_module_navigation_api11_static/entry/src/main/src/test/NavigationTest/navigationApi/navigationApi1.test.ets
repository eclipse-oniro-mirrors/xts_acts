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
import {SharedTransitionEffectType} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function navigationApi1() {
  describe('navigationApi1', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("navigationApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationApi/navigationApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get navigationApi1 state pages:" + JSON.stringify(pages));
        if (!("navigationApi1" == pages.name)) {
          console.info("get navigationApi1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push navigationApi1 page result:");
        }
      } catch (err) {
        console.error("push navigationApi1 page error:" + err);
      }
      console.info("navigationApi1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("navigationApi1 after each called");
    });

    
/**
     * @tc.number   navigationApi1_static_0100
     * @tc.name     navigationApi1_static_0100
     * @tc.desc     navigationApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('navigationApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationApi1_static_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn1 = await (driver.findComponent(ON.id('navigationApi1_btn1')) as Promise<Component>);
      await btn1.click();
  console.info('[navigationApi1_static_0100] btn1');
      await CommonFunc.sleep(1000);

      let btn2 = await (driver.findComponent(ON.id('navigationApi1_btn2')) as Promise<Component>);
      await btn2.click();
  console.info('[navigationApi1_static_0100] btn2');
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('navigationApi1_text1');
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('POP');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}

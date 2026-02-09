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
export default function NavigationStack10Jsunit() {
  describe('NavigationStack10Jsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationStack10Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack10',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationStack10Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack10" == pages.name)) {
          console.info("get NavigationStack10Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavigationStack10Jsunit success ");
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack10Jsunit page error:" + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavigationStack10Jsunit_static_0100
     * @tc.name     NavigationStack10Jsunit_static_0100
     * @tc.desc     NavigationStack10Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationStack10Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('NavigationStack10pushPathbut')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(2000);
      let scrollBar: Component = await (driver.findComponent(ON.type('Scroll')) as Promise<Component>);
      let button1 = await (scrollBar.scrollSearch(ON.id('NavigationStack10True')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(2000);
      let buttonClear = await (scrollBar.scrollSearch(ON.id('NavigationStack10get')) as Promise<Component>);
      await buttonClear.click();
      await CommonFunc.sleep(2000);
      let strfocus = inspector.getInspectorByKey('NavigationStack10getText');
      console.info('NavigationStack10Jsunit_static_0100 component focusobj is: ' + JSON.parseJsonElement(strfocus).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strfocus).getElement('$attrs').getString('content')).assertEqual('1');
      console.info('NavigationStack10Jsunit_static_0100 END')
      done();
    });

  })
}
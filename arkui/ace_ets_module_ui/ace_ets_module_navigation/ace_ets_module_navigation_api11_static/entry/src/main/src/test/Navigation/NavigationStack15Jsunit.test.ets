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

import { UtilsTest, startAbility } from '../Util.test';
export default function NavigationStack15Jsunit() {
  describe('NavigationStack15Jsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationStack15Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack15',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationStack15Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack15" == pages.name)) {
          console.info("get NavigationStack15Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavigationStack15Jsunit success ");
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack15Jsunit page error:" + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavigationStack15Jsunit_static_0100
     * @tc.name     NavigationStack15Jsunit_static_0100
     * @tc.desc     NavigationStack15Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationStack15Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver =Driver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await (driver.findComponent(ON.id('NavigationStack15ListItemText1')) as Promise<Component>);
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let scrollBar: Component = await (driver.findComponent(ON.type('Scroll')) as Promise<Component>);

      let buttoncontent = await (scrollBar.scrollSearch(ON.id('NavigationStack15ButtonContent')) as Promise<Component>);
      await buttoncontent.click();
      await CommonFunc.sleep(2000);
      let changecontent = await (scrollBar.scrollSearch(ON.id('NavigationStack15clear')) as Promise<Component>);
      await changecontent.click();
      await CommonFunc.sleep(2000);
      let textcontent = inspector.getInspectorByKey('NavigationStack15TextCont');
      console.info('NavigationStack15Jsunit_static_0100 component textobj is: ' + JSON.parseJsonElement(textcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(textcontent).getElement('$attrs').getString('content')).assertEqual('clicked1');
      console.info('NavigationStack15Jsunit_static_0100 END')
      done();
    });

  })
}
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
export default function NavigationStack25Jsunit() {
  describe('NavigationStack25Jsunit',  () =>{
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigationStack25Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationStack25',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationStack25Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack25" == pages.name)) {
          console.info("get NavigationStack25Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavigationStack25Jsunit success ");
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack25Jsunit page error:" + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavigationStack25Jsunit_static_0100
     * @tc.name     NavigationStack25Jsunit_static_0100
     * @tc.desc     NavigationStack25Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationStack25Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let YCbutton = await (driver.findComponent(ON.id('NavigationStack25True')) as Promise<Component>);
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let ZKbutton = await (driver.findComponent(ON.id('NavigationStack25False')) as Promise<Component>);
      await ZKbutton.click();
      await CommonFunc.sleep(2000);
      let textcontent = inspector.getInspectorByKey('NavigationStack25Blur');
      console.info('NavigationStack25Jsunit_static_0100 component textobj is: ' + JSON.parseJsonElement(textcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(textcontent).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('NavigationStack25Jsunit_static_0100 END')
      done();
    });
  })
}
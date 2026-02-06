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
export default function NavDestinationInfoStateJsunit() {
  describe('NavDestinationInfoStateJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavDestinationInfoStateJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestinationInfoState',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavDestinationInfoStateJsunit state pages:" + JSON.stringify(pages));
        if (!("NavDestinationInfoState" == pages.name)) {
          console.info("get NavDestinationInfoStateJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push NavDestinationInfoStateJsunit success ");
        }
      } catch (err) {
        console.error("push NavDestinationInfoStateJsunit page error:" + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   NavDestinationInfoStateJsunit_static_0100
     * @tc.name     NavDestinationInfoStateJsunit_static_0100
     * @tc.desc     NavDestinationInfoStateJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationInfoStateJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_static_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id('NavDestinationInfoStateText01')) as Promise<Component>);
      await btn1.click();
  console.info('NavDestinationInfoStateJsunit_static_0100 component obj is',1111)
      await CommonFunc.sleep(2000);
      let strcontent = inspector.getInspectorByKey('NavDestinationInfoStateText02');
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_static_0100 component obj is: ' + JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content')).assertEqual('ON_SHOWN');
      console.info('NavDestinationInfoStateJsunit_static_0100 END')
      done();
    });

    
/**
     * @tc.number   NavDestinationInfoStateJsunit_static_0200
     * @tc.name     NavDestinationInfoStateJsunit_static_0200
     * @tc.desc     NavDestinationInfoStateJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationInfoStateJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_static_0200 START');

  let driver = Driver.create();
  await CommonFunc.sleep(1000);
  let btn1 = await (driver.findComponent(ON.id('NavDestinationInfoStateText01')) as Promise<Component>);
  await btn1.click();
  await CommonFunc.sleep(2000);
      let strcontent = inspector.getInspectorByKey('NavDestinationInfoStateText02');
      console.info('NavDestinationInfoStateJsunit_static_0200 component obj is: ' + JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content')).assertEqual('ON_HIDDEN');
      console.info('NavDestinationInfoStateJsunit_static_0200 END')
      done();
    });

  })
}
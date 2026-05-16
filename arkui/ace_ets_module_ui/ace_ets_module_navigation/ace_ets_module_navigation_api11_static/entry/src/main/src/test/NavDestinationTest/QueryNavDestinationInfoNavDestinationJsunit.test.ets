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
export default function QueryNavDestinationInfoNavDestinationJsunit() {
  describe('QueryNavDestinationInfoNavDestinationJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("QueryNavDestinationInfoNavDestinationJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/QueryNavDestinationInfoNavDestination',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get QueryNavDestinationInfoNavDestinationJsunit state pages:" + JSON.stringify(pages));
        if (!("QueryNavDestinationInfoNavDestination" == pages.name)) {
          console.info("get QueryNavDestinationInfoNavDestinationJsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          console.info("push QueryNavDestinationInfoNavDestinationJsunit success ");
        }
      } catch (err) {
        console.error("push QueryNavDestinationInfoNavDestinationJsunit page error:" + err);
        expect().assertFail();
      }
    });

    
/**
     * @tc.number   QueryNavDestinationInfoNavDestinationJsunit_static_0100
     * @tc.name     QueryNavDestinationInfoNavDestinationJsunit_static_0100
     * @tc.desc     QueryNavDestinationInfoNavDestinationJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('QueryNavDestinationInfoNavDestinationJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await (driver.findComponent(ON.id('QueryNavDestinationInfoNavDestinationText01')) as Promise<Component>);
      await btn1.click();
      await CommonFunc.sleep(2000);
      let strcontent = inspector.getInspectorByKey('QueryNavDestinationInfoNavDestinationTextObserver');
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0100 component obj.width is: ' + JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content')).assertEqual('"QueryNavDestinationInfoNavDestination123"');
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0100 END')
      done();
    });

    
/**
     * @tc.number   QueryNavDestinationInfoNavDestinationJsunit_static_0200
     * @tc.name     QueryNavDestinationInfoNavDestinationJsunit_static_0200
     * @tc.desc     QueryNavDestinationInfoNavDestinationJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('QueryNavDestinationInfoNavDestinationJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0200 START');
      let strcontent = inspector.getInspectorByKey('XXqueryNavDestinationInfoNavDestinationText01');
      await CommonFunc.sleep(1000);
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0200 component obj.width is: ' + JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strcontent).getElement('$attrs').getString('content')).assertEqual('4');
      console.info('QueryNavDestinationInfoNavDestinationJsunit_static_0200 END')
      done();
    });
  })
}
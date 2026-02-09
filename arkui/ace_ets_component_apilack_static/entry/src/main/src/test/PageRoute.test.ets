'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function pageRouteTest() {
  describe('pageRouteTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("pageRouteTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/pageRoute',
      }
      // let result;
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pageRouteTest pages: " + JSON.stringify(pages));
        if (!("pageRoute" == pages.name)) {
          console.info("get pageRouteTest pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("pageRouteTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pageRouteTest after each called");
    })

    
    
    /**
     * @tc.number   testOnPageHide_static_01
     * @tc.name     testOnPageHide_static_01
     * @tc.desc     testOnPageHide_static_01
     * @tc.level    Level.LEVEL0
     */
it('testOnPageHide_static_01', Level.LEVEL0, async () => {
      console.info('[testOnPageHide01] START');
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("[testOnPageHide01] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('onPageHide')

      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
        console.info("testOnPageHide01 click result is: " + JSON.stringify(inspector.sendEventByKey('next', 10, "")));
      } catch (err) {
        console.info("[testOnPageHide01] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testOnPageHide01] testSendTouchEvent END');

    });
  })
}
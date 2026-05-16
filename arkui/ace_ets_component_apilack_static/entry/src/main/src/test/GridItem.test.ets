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
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function gridItemOnSelectJsunit() {
  describe('gridItemOnSelectTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridItemOnSelect after each called");
    });


    
    
    /**
     * @tc.number   testgridItemOnSelect_static_0001
     * @tc.name     testgridItemOnSelect_static_0001
     * @tc.desc     testgridItemOnSelect_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testgridItemOnSelect_static_0001', Level.LEVEL0, async () => {
      console.info('testgridItemOnSelect testgridItemOnSelect0001 START');
      await Utils.sleep(2000);
      let callback: (eventData: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("onSelect_0001 get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as ESObject)?.getProperty('STATUS').toBoolean()).assertEqual(true);

      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 60207,
        priority: events_emitter.EventPriority.LOW
      }
      inspector.sendEventByKey('onSelected', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onSelect_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testgridItemOnSelect0001 END');

    });

  }

  )
}

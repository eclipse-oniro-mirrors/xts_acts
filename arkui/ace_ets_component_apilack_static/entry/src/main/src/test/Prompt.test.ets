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


export default function promptShowDialogJsunit() {
  describe('promptShowDialogTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/prompt',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get prompt state success " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get prompt state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push prompt page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("promptShowDialog after each called");
    });

    
    
    
    /**
     * @tc.number   testpromptShowDialog_static_001
     * @tc.name     testpromptShowDialog_static_001
     * @tc.desc     testpromptShowDialog_static_001
     * @tc.level    Level.LEVEL0
     */
it('testpromptShowDialog_static_001', Level.LEVEL0, async () => {
      console.info('promptShowDialog testpromptShowDialog001 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60220,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("testpromptShowDialog001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('STATUS').toBoolean()).assertEqual(true);

        }
        console.info("onSelect_001 click result is: " + JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testpromptShowDialog001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testpromptShowDialog001 END');
    });

    
    
    
    /**
     * @tc.number   testshowActionMenu_static_0001
     * @tc.name     testshowActionMenu_static_0001
     * @tc.desc     testshowActionMenu_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testshowActionMenu_static_0001', Level.LEVEL0, async () => {
      console.info('promptShowDialog testshowActionMenu0001 START');
      await Utils.sleep(1000);
      try {
        let innerEventTwo: events_emitter.InnerEvent = {
          eventId: 60221,
          priority: events_emitter.EventPriority.LOW
        }
        let callback2: (eventData: events_emitter.EventData) => void = (backData1: events_emitter.EventData) => {
          console.info("onRequestPopupData_0011 get event state result is: " + JSON.stringify(backData1));
          expect(((backData1.data) as ESObject)?.getProperty('STATUS').toBoolean()).assertEqual(true);

        }
        console.info("onSelect_002 click result is: " + JSON.stringify(inspector.sendEventByKey('showActionMenuText', 10, "")));
        events_emitter.on(innerEventTwo, callback2);
      } catch (err) {
        console.info("onRequestPopupData_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testshowActionMenu0001 END');
    });
  })
}

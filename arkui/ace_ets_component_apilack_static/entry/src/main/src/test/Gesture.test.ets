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
import { Color, $r, PanDirection } from '@ohos.arkui.component'
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


export default function gestureSetDirectionJsunit() {
  describe('gestureSetDirectionTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gesture state success " + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gesture state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push gesture page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gestureSetDirection after each called");
    });

    
    
    
    /**
     * @tc.number   testgestureSetDirection_static_0001
     * @tc.name     testgestureSetDirection_static_0001
     * @tc.desc     testgestureSetDirection_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetDirection_static_0001', Level.LEVEL0, async () => {
      console.info('gestureSetDirection testgestureSetDirection0001 START');
      await Utils.sleep(2000);
      try {
        let callback: (eventData: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0001 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as ESObject)?.getProperty('STATUS').toStaticObject())
            .assertEqual(PanDirection.Vertical);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60204,
          priority: events_emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setDirectionPanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDirection testgestureSetDirection0002 END')

    });

    
    
    
    /**
     * @tc.number   testgestureSetDistance_static_0002
     * @tc.name     testgestureSetDistance_static_0002
     * @tc.desc     testgestureSetDistance_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetDistance_static_0002', Level.LEVEL0, async () => {
      console.info('gestureSetDistance testgestureSetDistance0002 START');
      await Utils.sleep(2000);
      try {
        let callback: (eventData: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0002 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as ESObject)?.getProperty('STATUS').toNumber()).assertEqual(4.0);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60205,
          priority: events_emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setDistancePanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0002 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDistance testgestureSetDistance0002 END');

    });

    
    
    
    /**
     * @tc.number   testgestureSetFingers_static_0003
     * @tc.name     testgestureSetFingers_static_0003
     * @tc.desc     testgestureSetFingers_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetFingers_static_0003', Level.LEVEL0, async () => {
      console.info('gestureSetFingers testgestureSetFingers0003 START');
      await Utils.sleep(2000);
      try {
        let callback: (eventData: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
          console.info("onClick_0003 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as ESObject)?.getProperty('STATUS').toBoolean()).assertEqual(true);
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 60206,
          priority: events_emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setFingersPanGesture', 10, "")
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0003 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetFingers testgestureSetFingers0003 END');

    });

  })
}

'use static';
/*
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


export default function focusControlJsunit() {
  describe('focusControlTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("focusControlTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/focusControl',
      }
      // let result = '';
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get focus state pages: " + JSON.stringify(pages));
        if (!("focusControl" == pages.name)) {
          console.info("get focus state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push focus page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("focus after each called");
    })

    
    
    /**
     * @tc.number   testFocusOnTouch_static_01
     * @tc.name     testFocusOnTouch_static_01
     * @tc.desc     testFocusOnTouch_static_01
     * @tc.level    Level.LEVEL0
     */
it('testFocusOnTouch_static_01', Level.LEVEL0, async () => {
      console.info('[testFocusOnTouch01] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch01] get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('FocusOnTouchGrpBtn')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60232,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch01 click result is: " + JSON.stringify(inspector.sendEventByKey('OnTouchGrpBtn', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch01] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch01] testSendTouchEvent END');
    });

    
    
    /**
     * @tc.number   testFocusOnTouch_static_02
     * @tc.name     testFocusOnTouch_static_02
     * @tc.desc     testFocusOnTouch_static_02
     * @tc.level    Level.LEVEL0
     */
it('testFocusOnTouch_static_02', Level.LEVEL0, async () => {
      console.info('[testFocusOnTouch02] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch02] get event state result is: " + JSON.stringify(eventData))
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('FocusOnTouchBtn1')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60233,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch02 click result is: " + JSON.stringify(inspector.sendEventByKey('OnTouchBtn1', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch02] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch02] testSendTouchEvent END');
    });

    
    
    /**
     * @tc.number   testFocusOnTouch_static_03
     * @tc.name     testFocusOnTouch_static_03
     * @tc.desc     testFocusOnTouch_static_03
     * @tc.level    Level.LEVEL0
     */
it('testFocusOnTouch_static_03', Level.LEVEL0, async () => {
      console.info('[testFocusOnTouch03] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch03] get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('FocusOnTouchBtn2')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60234,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch03 click result is: " + JSON.stringify(inspector.sendEventByKey('OnTouchBtn2', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch03] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch03] testSendTouchEvent END');
    });

    
    
    /**
     * @tc.number   testFocusOnTouch_static_04
     * @tc.name     testFocusOnTouch_static_04
     * @tc.desc     testFocusOnTouch_static_04
     * @tc.level    Level.LEVEL0
     */
it('testFocusOnTouch_static_04', Level.LEVEL0, async () => {
      console.info('[testFocusOnTouch04] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch04] get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('OnTouchBtn3')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60235,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch04 click result is: " + JSON.stringify(inspector.sendEventByKey('OnTouchBtn3', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch04] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch04] testSendTouchEvent END');
    });

    
    
    /**
     * @tc.number   testFocusOnTouch_static_05
     * @tc.name     testFocusOnTouch_static_05
     * @tc.desc     testFocusOnTouch_static_05
     * @tc.level    Level.LEVEL0
     */
it('testFocusOnTouch_static_05', Level.LEVEL0, async () => {
      console.info('[testFocusOnTouch05] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch05] get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('OnTouchBtn4')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60236,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch05 click result is: " + JSON.stringify(inspector.sendEventByKey('OnTouchBtn4', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch05] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch05] testSendTouchEvent END');
    });

    
    
    /**
     * @tc.number   testDefaultFocus_static_06
     * @tc.name     testDefaultFocus_static_06
     * @tc.desc     testDefaultFocus_static_06
     * @tc.level    Level.LEVEL0
     */
it('testDefaultFocus_static_06', Level.LEVEL0, async () => {
      console.info('[testDefaultFocus06] START');
      await Utils.sleep(1000);
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testDefaultFocus06] get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('value').toString()).assertEqual('defaultFocus')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60237,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testDefaultFocus06] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testDefaultFocus06] END');
    });
  })
}
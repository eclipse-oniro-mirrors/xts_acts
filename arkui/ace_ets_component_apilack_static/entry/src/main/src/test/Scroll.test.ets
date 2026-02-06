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


export default function scrollOnScrollBeginJsunit() {
  describe('scrollOnScrollBeginTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("scrollOnScrollBegin after each called");
    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0001
     * @tc.name     testscrollOnScrollBegin_static_0001
     * @tc.desc     testscrollOnScrollBegin_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0001', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0002
     * @tc.name     testscrollOnScrollBegin_static_0002
     * @tc.desc     testscrollOnScrollBegin_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0002', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0003
     * @tc.name     testscrollOnScrollBegin_static_0003
     * @tc.desc     testscrollOnScrollBegin_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0003', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.On");
      console.info("[testscrollOnScrollBegin0003] scrollBar value :" + obj.getElement('$attrs').getString('scrollBar'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0004
     * @tc.name     testscrollOnScrollBegin_static_0004
     * @tc.desc     testscrollOnScrollBegin_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0004', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF808080");
      console.info("[testscrollOnScrollBegin0004] scrollBarColor value :" +
      obj.getElement('$attrs').getString('scrollBarColor'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0005
     * @tc.name     testscrollOnScrollBegin_static_0005
     * @tc.desc     testscrollOnScrollBegin_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0005', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual("30.00vp");
      console.info("[testscrollOnScrollBegin0005] scrollBarWidth value :" +
      obj.getElement('$attrs').getString('scrollBarWidth'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0006
     * @tc.name     testscrollOnScrollBegin_static_0006
     * @tc.desc     testscrollOnScrollBegin_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0006', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0006 START');
      await Utils.sleep(2000);

      let callback: (eventData: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("scrollOnScrollBegin get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as ESObject)?.getProperty('STATUS')).assertEqual(true);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 10086,
        priority: events_emitter.EventPriority.LOW
      }
      inspector.sendEventByKey('Scroll', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("scrollOnScrollBegin on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollOnScrollBegin0006 END');

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0007
     * @tc.name     testscrollOnScrollBegin_static_0007
     * @tc.desc     testscrollOnScrollBegin_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0007', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0007] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertFalse();
      console.info("EdgeEffectOptions value :" +
      obj.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });

    
    
    
    /**
     * @tc.number   testscrollOnScrollBegin_static_0008
     * @tc.name     testscrollOnScrollBegin_static_0008
     * @tc.desc     testscrollOnScrollBegin_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin_static_0008', Level.LEVEL0, async () => {
      console.info('testEdgeEffectOptions testscrollOnScrollBegin0008 START');
      await Utils.sleep(2000);
      AppStorage.setOrCreate('alwaysEnabled', true);
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertTrue();
      console.info("edgeEffectOptions value :" +
      obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });
  })
}

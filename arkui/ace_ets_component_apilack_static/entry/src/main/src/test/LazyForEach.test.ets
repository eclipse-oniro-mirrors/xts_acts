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


export default function lazyForEachOnDataAddJsunit() {
  describe('lazyForEachOnDataAddTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/lazyForEach',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get lazyForEach state success " + JSON.stringify(pages));
        if (!("lazyForEach" == pages.name)) {
          console.info("get lazyForEach state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push lazyForEach page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("lazyForEachOnDataAdd after each called");
    });

    
    
    
    /**
     * @tc.number   testlazyForEachOnDataAdd_static_0001
     * @tc.name     testlazyForEachOnDataAdd_static_0001
     * @tc.desc     testlazyForEachOnDataAdd_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testlazyForEachOnDataAdd_static_0001', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 START');

      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60212,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result1 result is: " +
        ((eventData.data) as ESObject)?.getProperty('result1').toBoolean());
        try {
          console.info("callback1 success");
          console.info("Lazy_101 eventData.data.result1 result is: " +
          ((eventData.data) as ESObject)?.getProperty('result1').toBoolean());
          expect(((eventData.data) as ESObject)?.getProperty('result1').toBoolean()).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 END');
        } catch (err) {
          console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_101 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemOne', 10, "")));
        events_emitter.on(innerEvent1, callback1);
      } catch (err) {
        console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
      }
    });

    
    
    
    /**
     * @tc.number   testlazyForEachOnDataAdd_static_0002
     * @tc.name     testlazyForEachOnDataAdd_static_0002
     * @tc.desc     testlazyForEachOnDataAdd_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testlazyForEachOnDataAdd_static_0002', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 START');

      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60213,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result2 result is: " +
        ((eventData.data) as ESObject)?.getProperty('result2').toBoolean());
        try {
          console.info("callback2 success");
          console.info("Lazy_102 eventData.data.result2 result is: " +
          ((eventData.data) as ESObject)?.getProperty('result2').toBoolean());
          expect(((eventData.data) as ESObject)?.getProperty('result2').toBoolean()).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 END');
        } catch (err) {
          console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_102 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
      } catch (err) {
        console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
      }
    });

    
    
    
    /**
     * @tc.number   testlazyForEachOnDataAdd_static_0003
     * @tc.name     testlazyForEachOnDataAdd_static_0003
     * @tc.desc     testlazyForEachOnDataAdd_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testlazyForEachOnDataAdd_static_0003', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 START');

      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60214,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result3 result is: " +
        ((eventData.data) as ESObject)?.getProperty('result3').toBoolean());
        try {
          console.info("callback3 success");
          console.info("Lazy_103 eventData.data.result3 result is: " +
          ((eventData.data) as ESObject)?.getProperty('result3').toBoolean());
          expect(((eventData.data) as ESObject)?.getProperty('result3').toBoolean()).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 END');
        } catch (err) {
          console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_103 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemThree', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      } catch (err) {
        console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
      }
    });

    
    
    
    /**
     * @tc.number   testlazyForEachOnDataAdd_static_0004
     * @tc.name     testlazyForEachOnDataAdd_static_0004
     * @tc.desc     testlazyForEachOnDataAdd_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testlazyForEachOnDataAdd_static_0004', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 START');

      let innerEvent4: events_emitter.InnerEvent = {
        eventId: 60215,
        priority: events_emitter.EventPriority.LOW
      }
      let callback4: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result4 result is: " +
        ((eventData.data) as ESObject)?.getProperty('result4').toBoolean());
        try {
          console.info("callback4 success");
          console.info("Lazy_104 eventData.data.result4 result is: " +
          ((eventData.data) as ESObject)?.getProperty('result4').toBoolean());
          expect(((eventData.data) as ESObject)?.getProperty('result4').toBoolean()).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 END');
        } catch (err) {
          console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_104 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemFour', 10, "")));
        events_emitter.on(innerEvent4, callback4);
      } catch (err) {
        console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}

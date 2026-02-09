'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';
import { Color } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeAll(() => {
      console.info("marqueeJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/marquee/marquee',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get marquee state success " + JSON.stringify(pages));
        if (!("marquee" == pages.name)) {
          console.info("get marquee state success " + '');
          await CommonFunc.sleep(2000);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push marquee page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marquee page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("marquee after each called");
    });
    
    /**
     * @tc.number   testMarquee_static_0100
     * @tc.name     testMarquee_static_0100
     * @tc.desc     testMarquee_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('testMarquee_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("testMarquee_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('start')).assertEqual(true);
        done()
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 130,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_static_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: emitter.EventData) => {
        console.info("testMarquee_static_0100 get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as ESObject)?.getProperty('fontColor')).assertEqual(Color.Blue);
        done()
      }
      let innerEventOne: emitter.InnerEvent = {
        eventId: 127,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testMarquee_static_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0100 END');
      done()
    });

    /**
     * @tc.number   testMarquee_static_0200
     * @tc.name     testMarquee_static_0200
     * @tc.desc     testMarquee_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('testMarquee_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("testMarquee_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('start')).assertEqual(true);
        done()
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 130,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_static_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: emitter.EventData) => {
        console.info("testMarquee_static_0200 get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as ESObject)?.getProperty('fontSize')).assertEqual(50);
        done()
      }
      let innerEventOne: emitter.InnerEvent = {
        eventId: 128,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEventOne, callback1)
      } catch (err) {
        console.info("testMarquee_static_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0200 END');
      done()
    });

    /**
     * @tc.number   testMarquee_static_0300
     * @tc.name     testMarquee_static_0300
     * @tc.desc     testMarquee_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('testMarquee_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testMarquee_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("testMarquee_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('start')).assertEqual(true);
        done()
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 130,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_static_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: emitter.EventData) => {
        console.info("testMarquee_static_0300 get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as ESObject)?.getProperty('ACTION')).assertEqual(true);
        done()
      }
      let innerEventOne: emitter.InnerEvent = {
        eventId: 129,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEventOne, callback1)
      } catch (err) {
        console.info("testMarquee_static_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_static_0300 END');
      done()
    });
  })
}
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


import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AnimationStatus } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function imageAnimatorJsunitt() {
  describe('imageAnimatorJsunitt', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAnimator beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimator2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageAnimator state pages:" + JSON.stringify(pages));
        if (!("imageAnimator2" == pages.name)) {
          console.info("get imageAnimator pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageAnimator page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push imageAnimator page error: " + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("imageAnimator after each called");
    })

    
/**
     * @tc.number   imageAnimatorTest_static_0100
     * @tc.name     imageAnimatorTest_static_0100
     * @tc.desc     imageAnimatorTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0100 get state result is: " + JSON.stringify((indexEvent.data as ESObject)?.getProperty('state').toStaticObject()));
        expect((indexEvent.data as ESObject)?.getProperty('state').toStaticObject()).assertEqual(AnimationStatus.Running);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1150,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button_0', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0100 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0200
     * @tc.name     imageAnimatorTest_static_0200
     * @tc.desc     imageAnimatorTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('state').toStaticObject()).assertEqual(AnimationStatus.Paused);
        expect((indexEvent.data as ESObject)?.getProperty('fixedSize').toBoolean()).assertEqual(false);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 116,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0200 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0300
     * @tc.name     imageAnimatorTest_static_0300
     * @tc.desc     imageAnimatorTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('state').toStaticObject()).assertEqual(AnimationStatus.Stopped);
        expect((indexEvent.data as ESObject)?.getProperty('preDecode').toNumber()).assertEqual(0);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 117,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0300 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0400
     * @tc.name     imageAnimatorTest_static_0400
     * @tc.desc     imageAnimatorTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0400 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0400 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('fillMode').toNumber()).assertEqual(0);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 118,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0400 click result is: " + JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0400 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0500
     * @tc.name     imageAnimatorTest_static_0500
     * @tc.desc     imageAnimatorTest_static_0500
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0500 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0500 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('iterations').toNumber()).assertEqual(1);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 119,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0500 click result is: " + JSON.stringify(inspector.sendEventByKey('button4', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0500 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0600
     * @tc.name     imageAnimatorTest_static_0600
     * @tc.desc     imageAnimatorTest_static_0600
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0600 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0600 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('string').toString()).assertEqual('Repeat');
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 114,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("imageAnimatorTest_static_0600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0600 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0600 END');
      done();
    });

    
/**
     * @tc.number   imageAnimatorTest_static_0700
     * @tc.name     imageAnimatorTest_static_0700
     * @tc.desc     imageAnimatorTest_static_0700
     * @tc.level    Level.LEVEL1
     */
it('imageAnimatorTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageAnimatorTest_static_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "preDecode": 2,
          }as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 121,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("imageAnimatorTest_static_0700 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("imageAnimatorTest_static_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1500);
      let callbackOne:(indexEventOne: events_emitter.EventData) => void = (indexEventOne: events_emitter.EventData) => {
        console.info("imageAnimatorTest_static_0700 get state result is: " + JSON.stringify(indexEventOne));
        expect((indexEventOne.data as ESObject)?.getProperty('preDecode').toNumber()).assertEqual(2);
        done();
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 120,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("imageAnimatorTest_static_0700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("imageAnimatorTest_static_0700 click result is: " + JSON.stringify(inspector.sendEventByKey('button5', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('imageAnimatorTest_static_0700 END');
      done();
    });
  })
}
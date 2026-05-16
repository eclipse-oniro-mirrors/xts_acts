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
import { FillMode } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function fillModeJsunit() {
  describe('fillModeTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info('fillModeTest beforeEach called');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/fillMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get fillMode state pages:" + JSON.stringify(pages));
        if (!("fillMode" == pages.name)) {
          console.info("get fillMode pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push fillMode page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error('beforeEach push fillMode page error:' + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('fillMode test after each called');
    });

    
/**
     * @tc.number   fillModeTest_static_0100
     * @tc.name     fillModeTest_static_0100
     * @tc.desc     fillModeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('fillModeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('fillModeTest_static_0100 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('fillMode').toStaticObject()).assertEqual(FillMode.Backwards);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 94,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("fillModeTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0100 END');
      done();
    });

    
/**
     * @tc.number   fillModeTest_static_0200
     * @tc.name     fillModeTest_static_0200
     * @tc.desc     fillModeTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('fillModeTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('fillModeTest_static_0200 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('fillMode').toStaticObject()).assertEqual(FillMode.Both);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 95,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("fillModeTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0200 END');
      done();
    });

    
/**
     * @tc.number   fillModeTest_static_0300
     * @tc.name     fillModeTest_static_0300
     * @tc.desc     fillModeTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('fillModeTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('fillModeTest_static_0300 START');
      await CommonFunc.sleep(1500);
      let callback:(indexEvent: events_emitter.EventData) => void =  (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as ESObject)?.getProperty('fillMode').toStaticObject()).assertEqual(FillMode.None);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 96,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err:Error) {
        console.info("fillModeTest_static_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_static_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_static_0300 END');
      done();
    });
  })
}
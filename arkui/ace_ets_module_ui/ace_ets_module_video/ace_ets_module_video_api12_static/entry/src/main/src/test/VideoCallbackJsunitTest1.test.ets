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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function VideoCallBackJsunit() {
  describe('VideoCallBackJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("VideoCallBackJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/videoCallback',
      }
      try {
        const videoCallback = AppStorage.get<Router>("router") as Router
        videoCallback.clear();
        let pages = videoCallback.getState();
        console.info("get VideoCallBackJsunit state pages: " + JSON.stringify(pages));
        if (!("videoCallback" == pages.name)) {
          console.info("get VideoCallBackJsunit state pages.name: " + JSON.stringify(pages.name));
          videoCallback.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoCallBackJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      const videoCallback = AppStorage.get<Router>("router") as Router
      videoCallback.back();
    })

    
    
/**
     * @tc.number   videoCallbackJsunit_static_0500
     * @tc.name     videoCallbackJsunit_static_0500
     * @tc.desc     videoCallbackJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('videoCallbackJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let callback = (event: emitter.EventData) => {
        const data: Record<String,RecordData> = event.data as Record<String,RecordData>
        expect(data['action']).assertEqual('onStart');
        console.info('videoCallbackJsunit_static_0500 event: ' + data['action']);
      }
      let event: emitter.InnerEvent = {
        eventId: 50101,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(event, callback);

      let button = await driver.findComponent(ON.id('start'));
      await CommonFunc.sleep(2000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let callback2 = (event: emitter.EventData) => {
        const data: Record<String,RecordData> = event.data as Record<String,RecordData>
        expect(data['action']).assertEqual('onStop');
        console.info('videoCallbackJsunit_static_0500 event: ' + data['action']);
      }
      let event2: emitter.InnerEvent = {
        eventId: 50102,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await CommonFunc.sleep(2000);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      // await driver.pressBack();
      done();
    });


    
    
/**
     * @tc.number   videoCallbackJsunit_static_0501
     * @tc.name     videoCallbackJsunit_static_0501
     * @tc.desc     videoCallbackJsunit_static_0501
     * @tc.level    Level.LEVEL0
     */
it('videoCallbackJsunit_static_0501', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let callback = (event: emitter.EventData) => {
        const data: Record<String,RecordData> = event.data as Record<String,RecordData>
        expect(data['action']).assertEqual('onStart');
        console.info('videoCallbackJsunit_static_0500 event: ' + data['action']);
      }
      let event: emitter.InnerEvent = {
        eventId: 50101,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(event, callback);
      let button = await driver.findComponent(ON.id('start'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let button3 = await driver.findComponent(ON.id('pause'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let callback2 = (event: emitter.EventData) => {
        const data: Record<String,RecordData> = event.data as Record<String,RecordData>
        expect(data['action']).assertEqual('onStop');
        console.info('videoCallbackJsunit_static_0500 event: ' + data['action']);
      }
      let event2: emitter.InnerEvent = {
        eventId: 50102,
        priority: emitter.EventPriority.LOW
      }
      emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      await driver.pressBack();
      done();
    });
  })
}
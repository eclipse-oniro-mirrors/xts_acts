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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import Utils from '../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

export default function OnNewParamRouter() {
  describe('OnNewParamRouter', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnNewParamRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/OnNewParamRouter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnNewParamRouter state success " + JSON.stringify(pages));
        if (!("OnNewParamRouter" == pages.name)) {
          console.info("get OnNewParamRouter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push OnNewParamRouter page error:" + err);
      }
      console.info("OnNewParamRouter beforeEach end");
    });

    afterEach(async () => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
      await CommonFunc.sleep(1000);
      console.info("OnNewParamRouter after each called");
    });


    
    /**
     * @tc.number   OnNewParamRouter_static_0100
     * @tc.name     OnNewParamRouter_static_0100
     * @tc.desc     OnNewParamRouter_static_0100
     * @tc.level    Level.LEVEL2
     */
it('OnNewParamRouter_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('OnNewParamRouter_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0100] btn1 click');
      await driver.delayMs(1000);

      let callback = (indexEvent: events_emitter.EventData) => {
        console.info('OnNewParamRouter_0100 get state result is: ' + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as ESObject)?.getProperty('paramString').toString()).assertEqual('{"msg":"pushUrl One Single"}');
        } catch (err) {
          console.info('OnNewParamRouter_0100 get state result is err: ' + JSON.stringify(err));
        }
        console.info('[OnNewParamRouter_0100] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info('OnNewParamRouter_0100 on events_emitter err : ' + JSON.stringify(err));
      }

      let btn2 = await driver.findComponent(ON.id('pushUrlId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0100] btn2 click');
      done()
    });

    
    /**
     * @tc.number   OnNewParamRouter_static_0200
     * @tc.name     OnNewParamRouter_static_0200
     * @tc.desc     OnNewParamRouter_static_0200
     * @tc.level    Level.LEVEL2
     */
it('OnNewParamRouter_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('OnNewParamRouter_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0100] btn1 click');
      await driver.delayMs(1000);

      let callback = (indexEvent: events_emitter.EventData) => {
        console.info('OnNewParamRouter_0200 get state result is: ' + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as ESObject)?.getProperty('paramString').toString()).assertEqual('"test string"');
        } catch (err) {
          console.info('OnNewParamRouter_0200 get state result is err: ' + JSON.stringify(err));
        }
        console.info('[OnNewParamRouter_0200] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info('OnNewParamRouter_0200 on events_emitter err : ' + JSON.stringify(err));
      }

      let btn2 = await driver.findComponent(ON.id('replaceUrlId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0200] btn2 click');
      done()
    });

    
    /**
     * @tc.number   OnNewParamRouter_static_0300
     * @tc.name     OnNewParamRouter_static_0300
     * @tc.desc     OnNewParamRouter_static_0300
     * @tc.level    Level.LEVEL2
     */
it('OnNewParamRouter_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('OnNewParamRouter_0300 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1 = await driver.findComponent(ON.id('pushId'));
      await (btn1?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0100] btn1 click');
      await driver.delayMs(1000);

      let callback = (indexEvent: events_emitter.EventData) => {
        console.info('OnNewParamRouter_0300 get state result is: ' + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as ESObject)?.getProperty('paramString').toString()).assertEqual('20');
        } catch (err) {
          console.info('OnNewParamRouter_0300 get state result is err: ' + JSON.stringify(err));
        }
        console.info('[OnNewParamRouter_0300] END');
        done();
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info('OnNewParamRouter_0300 on events_emitter err : ' + JSON.stringify(err));
      }

      let btn2 = await driver.findComponent(ON.id('pushNamedId'));
      await (btn2?.click() as Promise<void>)
      console.info('[OnNewParamRouter_0300] btn2 click');
      done()
    });


  })
}
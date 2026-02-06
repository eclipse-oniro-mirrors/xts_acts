'use static';
/*
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
import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


let domain: number = 0x0000;
let tag: string = 'testTag';

export default function OhosRouterJsunit() {
  describe('ohosRouterTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ohosRouter state success " + JSON.stringify(pages));
        if (!("ohosRouter" == pages.name)) {
          console.info("get ohosRouter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(4000);
        }
      } catch (err) {
        console.error("push ohosRouter page error " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ohosRouter after each called");
    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_001
     * @tc.name     ohosRouterTest_static_001
     * @tc.desc     ohosRouterTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_001', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest001] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.pushUrl(options);
        await Utils.sleep(1000);
        let pages = routerInstance.getState();
        expect(pages.index).assertEqual(3);
        expect(pages.name).assertEqual('ohosRouterA');
        expect(pages.path).assertEqual('pages/');
      } catch (err) {
        console.error("[ohosRouterTest001] push page error: " + err);
      }
      await Utils.sleep(2000);

    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_002
     * @tc.name     ohosRouterTest_static_002
     * @tc.desc     ohosRouterTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_002', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest002] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest002] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest002] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params').toString()).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest002] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest002] click push button result is: "
        + JSON.stringify(inspector.sendEventByKey('pushButtonA', 10, "")));
      await Utils.sleep(1000);
      routerInstance.back();
      await Utils.sleep(1000);

    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_003
     * @tc.name     ohosRouterTest_static_003
     * @tc.desc     ohosRouterTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_003', Level.LEVEL0, async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      console.info('[ohosRouterTest003] START');
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(2000);
      let size = routerInstance.getLength();
      console.info("[ohosRouterTest003] size" + size);
      expect(size).assertEqual("1");
      await Utils.sleep(1000);

    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_004
     * @tc.name     ohosRouterTest_static_004
     * @tc.desc     ohosRouterTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_004', Level.LEVEL0, async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      console.info('[ohosRouterTest004] START');
      routerInstance.clear();
      await Utils.sleep(1000);
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest004] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      let optionsB: router.RouterOptions = {
        url: 'pages/ohosRouterB'
      }
      try {
        routerInstance.replaceUrl(optionsB);
      } catch (err) {
        console.error("[ohosRouterTest004] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1500);
      let size = routerInstance.getLength();
      console.info("[ohosRouterTest004] size" + size);
      expect(size).assertEqual("2");
    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_005
     * @tc.name     ohosRouterTest_static_005
     * @tc.desc     ohosRouterTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_005', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest005] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest005] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest005] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params').toString()).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest005] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest005] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('ReplaceButtonA', 10, "")));

    });


    
    
    /**
     * @tc.number   ohosRouterTest_static_006
     * @tc.name     ohosRouterTest_static_006
     * @tc.desc     ohosRouterTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_006', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest006] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest006] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest006] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params').toString()).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest006] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest006] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('pushurlButton1', 10, "")));

    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_008
     * @tc.name     ohosRouterTest_static_008
     * @tc.desc     ohosRouterTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_008', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest008] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest008] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest008] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params').toString()).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest008] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest008] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('pushurlButton1A', 10, "")));

    });

    
    
    /**
     * @tc.number   ohosRouterTest_static_007
     * @tc.name     ohosRouterTest_static_007
     * @tc.desc     ohosRouterTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_007', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest007] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.replaceUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest007] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest007] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params')).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest007] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest007] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('ReplaceButtonA', 10, "")));

    });
    
    
    /**
     * @tc.number   ohosRouterTest_static_009
     * @tc.name     ohosRouterTest_static_009
     * @tc.desc     ohosRouterTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('ohosRouterTest_static_009', Level.LEVEL0, async () => {
      console.info('[ohosRouterTest009] START');
      let options: router.RouterOptions = {
        url: 'pages/ohosRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.replaceUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest009] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest009] get state result is: " + JSON.stringify(paramsEvent));
        expect(((paramsEvent.data) as ESObject)?.getProperty('params')).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest009] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest009] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('replaceurl1', 10, "")));

    });
  });
}
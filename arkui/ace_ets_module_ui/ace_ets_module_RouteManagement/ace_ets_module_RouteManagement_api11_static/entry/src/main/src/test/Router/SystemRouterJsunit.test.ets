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
import { describe, it, expect, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

export default function systemRouterJsunit() {
  describe('systemRouterTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    
/**
     * @tc.number   systemRouterTest001_static
     * @tc.name     systemRouterTest001_static
     * @tc.desc     systemRouterTest001_static
     * @tc.level    Level.LEVEL2
     */
it('systemRouterTest001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[systemRouterTest001_static] START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/systemRouterA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.pushUrl(options);
        await Utils.sleep(1000);
        let pages = routerInstance.getState();
        expect(pages.name).assertEqual('systemRouterA');
        expect(pages.path).assertEqual('MainAbility/pages/Router/');
      } catch (err) {
        console.error("[systemRouterTest001_static] push page error: " + err);
      }
      await Utils.sleep(2000);
      done();
    });

    
/**
     * @tc.number   systemRouterTest002_static
     * @tc.name     systemRouterTest002_static
     * @tc.desc     systemRouterTest002_static
     * @tc.level    Level.LEVEL2
     */
it('systemRouterTest002_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[systemRouterTest002_static] START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/systemRouterA'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[systemRouterTest002_static] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[systemRouterTest002_static] get state result is: " + JSON.stringify(paramsEvent));
        expect((paramsEvent.data as Record<String,RecordData>)['params']).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 211,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[systemRouterTest002_static] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[systemRouterTest002_static] click push button result is: "
        + JSON.stringify(inspector.sendEventByKey('pushButtonA', 10, "")));
      await Utils.sleep(1000);
      routerInstance.back();
      await Utils.sleep(1000);
      done();
    });

    
/**
     * @tc.number   systemRouterTest003_static
     * @tc.name     systemRouterTest003_static
     * @tc.desc     systemRouterTest003_static
     * @tc.level    Level.LEVEL2
     */
// it('systemRouterTest003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       const routerInstance = AppStorage.get<Router>("router") as Router
//       console.info('[systemRouterTest003_static] START');
//       await Utils.sleep(1000);
//       routerInstance.clear();
//       await Utils.sleep(2000);
//       let size = routerInstance.getLength();
//       console.info("[systemRouterTest003_static] size" + size);
//       expect(size).assertEqual("1");
//       await Utils.sleep(1000);
//       done();
//     });
//
//
// /**
//      * @tc.number   systemRouterTest004_static
//      * @tc.name     systemRouterTest004_static
//      * @tc.desc     systemRouterTest004_static
//      * @tc.level    Level.LEVEL2
//      */
// it('systemRouterTest004_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       const routerInstance = AppStorage.get<Router>("router") as Router
//       console.info('[systemRouterTest004_static] START');
//       routerInstance.clear();
//       await Utils.sleep(1000);
//       let options: router.RouterOptions = {
//         url: 'MainAbility/pages/Router/systemRouterA'
//       }
//       try {
//         routerInstance.pushUrl(options);
//       } catch (err) {
//         console.error("[systemRouterTest004_static] push page error " + JSON.stringify(err));
//       }
//       await Utils.sleep(1000);
//       let optionsB: router.RouterOptions = {
//         url: 'MainAbility/pages/Router/systemRouterB'
//       }
//       try {
//         routerInstance.replaceUrl(optionsB);
//       } catch (err) {
//         console.error("[systemRouterTest004_static] push page error " + JSON.stringify(err));
//       }
//       await Utils.sleep(1500);
//       let size = routerInstance.getLength();
//       console.info("[systemRouterTest004_static] size" + size);
//       expect(size).assertEqual("2");
//       done();
//     });

    
/**
     * @tc.number   systemRouterTest005_static
     * @tc.name     systemRouterTest005_static
     * @tc.desc     systemRouterTest005_static
     * @tc.level    Level.LEVEL2
     */
it('systemRouterTest005_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[systemRouterTest005_static] START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/systemRouterB'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[systemRouterTest005_static] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      routerInstance.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[systemRouterTest005_static] get state result is: " + JSON.stringify(paramsEvent));
        expect((paramsEvent.data as Record<String,RecordData>)['params']).assertEqual('B Page');

      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 211,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[systemRouterTest005_static] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[systemRouterTest005_static] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('ReplaceButtonA', 10, "")));
      await Utils.sleep(1500);
      done();
    });
  });
}


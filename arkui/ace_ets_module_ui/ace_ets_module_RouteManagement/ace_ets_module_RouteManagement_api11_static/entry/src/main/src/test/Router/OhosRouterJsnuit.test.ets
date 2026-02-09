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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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

export default function OhosRouterJsunit() {
  describe('ohosRouterJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/ohosRouterA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ohosRouter state success " + JSON.stringify(pages));
        if (!("ohosRouterA" == pages.name)) {
          console.info("get ohosRouter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push ohosRouter page error " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ohosRouter after each called");
    });

    
/**
     * @tc.number   ohosRouterTest001_static
     * @tc.name     ohosRouterTest001_static
     * @tc.desc     ohosRouterTest001_static
     * @tc.level    Level.LEVEL2
     */
it('ohosRouterTest001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ohosRouterTest001_static] START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/ohosRouterA',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        expect(pages.index).assertEqual(3);
        expect(pages.name).assertEqual('ohosRouterA');
        expect(pages.path).assertEqual('MainAbility/pages/Router/');
      } catch (err) {
        console.error("[ohosRouterTest001_static] push page error: " + err);
      }
      await CommonFunc.sleep(2000);
      done();
    });

    
/**
     * @tc.number   ohosRouterTest002_static
     * @tc.name     ohosRouterTest002_static
     * @tc.desc     ohosRouterTest002_static
     * @tc.level    Level.LEVEL2
     */
// it('ohosRouterTest002_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[ohosRouterTest002_static] START');
//       let options: router.RouterOptions = {
//         url: 'MainAbility/pages/Router/ohosRouterA'
//       }
//       const routerInstance = AppStorage.get<Router>("router") as Router
//       try {
//         routerInstance.pushUrl(options);
//       } catch (err) {
//         console.error("[ohosRouterTest002_static] push page error " + JSON.stringify(err));
//       }
//       await CommonFunc.sleep(1500);
//       let callback = (paramsEvent: events_emitter.EventData) => {
//         console.info("[ohosRouterTest002_static] get state result is: " + JSON.stringify(paramsEvent));
//         expect((paramsEvent.data as Record<String,RecordData>)['params']).assertEqual('B Page');
//       }
//       let paramsEvent: events_emitter.InnerEvent = {
//         eventId: 142,
//         priority: events_emitter.EventPriority.LOW
//       }
//       try {
//         events_emitter.on(paramsEvent, callback);
//       } catch (err) {
//         console.info("[ohosRouterTest002_static] on events_emitter err : " + JSON.stringify(err));
//       }
//       console.info("[ohosRouterTest002_static] click push button result is: "
//         + JSON.stringify(inspector.sendEventByKey('pushButtonA', 10, "")));
//       await CommonFunc.sleep(1000);
//       routerInstance.back();
//       await CommonFunc.sleep(1000);
//       done();
//     });
//
//
// /**
//      * @tc.number   ohosRouterTest003_static
//      * @tc.name     ohosRouterTest003_static
//      * @tc.desc     ohosRouterTest003_static
//      * @tc.level    Level.LEVEL2
//      */
// it('ohosRouterTest003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       const routerInstance = AppStorage.get<Router>("router") as Router
//       console.info('[ohosRouterTest003_static] START');
//       await CommonFunc.sleep(1000);
//       routerInstance.clear();
//       await CommonFunc.sleep(2000);
//       let size = routerInstance.getLength();
//       console.info("[ohosRouterTest003_static] size" + size);
//       expect(size).assertEqual("1");
//       await CommonFunc.sleep(1000);
//       done();
//     });
//
//
// /**
//      * @tc.number   ohosRouterTest004_static
//      * @tc.name     ohosRouterTest004_static
//      * @tc.desc     ohosRouterTest004_static
//      * @tc.level    Level.LEVEL2
//      */
// it('ohosRouterTest004_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       const routerInstance = AppStorage.get<Router>("router") as Router
//       console.info('[ohosRouterTest004_static] START');
//       routerInstance.clear();
//       await CommonFunc.sleep(1000);
//       let options: router.RouterOptions = {
//         url: 'MainAbility/pages/Router/ohosRouterA'
//       }
//       try {
//         routerInstance.pushUrl(options);
//       } catch (err) {
//         console.error("[ohosRouterTest004] push page error " + JSON.stringify(err));
//       }
//       await CommonFunc.sleep(2000);
//       let optionsB: router.RouterOptions = {
//         url: 'MainAbility/pages/Router/ohosRouterB'
//       }
//       try {
//         routerInstance.replaceUrl(optionsB);
//       } catch (err) {
//         console.error("[ohosRouterTest004_static] push page error " + JSON.stringify(err));
//       }
//       await CommonFunc.sleep(1500);
//       let size = routerInstance.getLength();
//       console.info("[ohosRouterTest004_static] size" + size);
//       expect(size).assertEqual("2");
//       done();
//     });

    
/**
     * @tc.number   ohosRouterTest005_static
     * @tc.name     ohosRouterTest005_static
     * @tc.desc     ohosRouterTest005_static
     * @tc.level    Level.LEVEL2
     */
it('ohosRouterTest005_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      console.info('[ohosRouterTest005_static] START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/ohosRouterA'
      }
      try {
        routerInstance.pushUrl(options);
      } catch (err) {
        console.error("[ohosRouterTest005_static] push page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      routerInstance.clear();
      await CommonFunc.sleep(1500);
      let callback = (paramsEvent: events_emitter.EventData) => {
        console.info("[ohosRouterTest005_static] get state result is: " + JSON.stringify(paramsEvent));
        expect((paramsEvent.data as Record<String,RecordData>)['params']).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest005_static] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest005_static] click replace button result is: "
        + JSON.stringify(inspector.sendEventByKey('ReplaceButtonA', 10, "")));
      done();
    });
  });
}
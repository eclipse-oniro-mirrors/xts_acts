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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';
interface Action {
  ACTION: boolean
}
export default function navigatorCodeJsunit() {
  describe('navigatorCodeJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("NavigatorClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigatorCode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigatorClick state pages:" + JSON.stringify(pages));
        if (!("NavigatorCode" == pages.name)) {
          console.info("get NavigatorClick state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigatorClick page result:");
        }
      } catch (err) {
        console.error("push NavigatorClick page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigatorClick after each called");
    });

    
/**
     * @tc.number   test_NavigatorClick_static_001
     * @tc.name     test_NavigatorClick_static_001
     * @tc.desc     test_NavigatorClick_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_NavigatorClick_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_NavigatorClick_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('NavigatorType');
      console.info("[test_NavigatorClick_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation');
      console.info('[test_NavigatorClick_static_001] END');
      done();
    });

    
/**
     * @tc.number   test_NavigatorClick_static_002
     * @tc.name     test_NavigatorClick_static_002
     * @tc.desc     test_NavigatorClick_static_002
     * @tc.level    Level.LEVEL0
     */
it('test_NavigatorClick_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_NavigatorClick_static_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "typeValue": "NavigationType.Back"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 138,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_NavigatorClick_static_002] start to publish emit" + JSON.stringify(eventData));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[test_NavigatorClick_static_002] change component error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('NavigatorType');
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation');
      done();
    });

    
/**
     * @tc.number   test_NavigatorClick_static_003
     * @tc.name     test_NavigatorClick_static_003
     * @tc.desc     test_NavigatorClick_static_003
     * @tc.level    Level.LEVEL0
     */
it('test_NavigatorClick_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_NavigatorClick_static_003] get event state result is: " + JSON.stringify(eventData));
        expect((eventData.data as Action)?.ACTION).assertEqual(10)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 139,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_NavigatorClick_static_003] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_NavigatorClick_static_003] inspector.sendEventByKey ' + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_NavigatorClick_static_003] testSendTouchEvent END');
      done();
    });
  })
}
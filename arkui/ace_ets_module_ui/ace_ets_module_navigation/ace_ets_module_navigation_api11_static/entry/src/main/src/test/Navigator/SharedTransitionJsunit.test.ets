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
interface Acton {
  duration: number
  delay: number
  type: SharedTransitionEffectType
}
export default function sharedTransitionJsunit() {
  describe('sharedTransitionJsunit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("sharedTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigator/sharedTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sharedTransition state pages:" + JSON.stringify(pages));
        if (!("sharedTransition" == pages.name)) {
          console.info("get sharedTransition state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push sharedTransition page result:");
        }
      } catch (err) {
        console.error("push sharedTransition page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("sharedTransition after each called");
    });

    
/**
     * @tc.number   sharedTransitionTest_static_0100
     * @tc.name     sharedTransitionTest_static_0100
     * @tc.desc     sharedTransitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('sharedTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sharedTransitionTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_static_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation')
      console.info('sharedTransitionTest_static_0100 END');
      done();
    });

    
/**
     * @tc.number   sharedTransitionTest_static_0200
     * @tc.name     sharedTransitionTest_static_0200
     * @tc.desc     sharedTransitionTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('sharedTransitionTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sharedTransitionTest_static_0200 START');
      let strJson = inspector.getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_static_0200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation')
      console.info('sharedTransitionTest_static_0200 END');
      done();
    });

    
/**
     * @tc.number   sharedTransitionTest_static_0300
     * @tc.name     sharedTransitionTest_static_0300
     * @tc.desc     sharedTransitionTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('sharedTransitionTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sharedTransitionTest_static_0300 START');
      let strJson = inspector.getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_static_0300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Navigation')
      console.info('sharedTransitionTest_static_0300 END');
      done();
    });

    
/**
     * @tc.number   sharedTransitionTest_static_0400
     * @tc.name     sharedTransitionTest_static_0400
     * @tc.desc     sharedTransitionTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('sharedTransitionTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sharedTransitionTest_static_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 2000,
            "delay": 5,
            "type": SharedTransitionEffectType.Exchange
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 194,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(indexEvent, eventData);
        await CommonFunc.sleep(2500);
      } catch (err) {
        console.log("sharedTransitionTest_static_0400 change component data error: " + (err as BusinessError).message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        console.info("sharedTransitionTest_static_0400 get state result is: " + JSON.stringify(indexEventOne));
        try {
          expect((indexEventOne.data as Acton)?.duration).assertEqual(2000);
          expect((indexEventOne.data as Acton)?.delay).assertEqual(5);
          expect((indexEventOne.data as Acton)?.type).assertEqual(SharedTransitionEffectType.Exchange);
        } catch (err) {
          console.info("sharedTransitionTest_static_0400 error: " + (err as BusinessError).message);
        }

      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 193,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("sharedTransitionTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("sharedTransitionTest_static_0400 click result is: " + JSON.stringify(inspector.sendEventByKey('Navigator', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('sharedTransitionTest_static_0400 END');
      done();
    });
  })
}


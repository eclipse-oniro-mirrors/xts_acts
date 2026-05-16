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
  btn1: boolean
}
export default function transitionJsunit() {
  describe('transitionTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigator/transition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get transition state pages:" + JSON.stringify(pages));
        if (!("transition" == pages.name)) {
          console.info("get transition state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push transition page result:");
        }
      } catch (err) {
        console.error("push transition page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("transition after each called");
    });

    
/**
     * @tc.number   transitionTest_static_0100
     * @tc.name     transitionTest_static_0100
     * @tc.desc     transitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('transitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('transitionTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('button');
      console.info("transitionTest_static_0100 component strJson:" + strJson);

      console.info("transitionTest_static_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Button');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('transitionTest_static_0100 END');
      done();
    });

    
/**
     * @tc.number   transitionTest_static_0200
     * @tc.name     transitionTest_static_0200
     * @tc.desc     transitionTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('transitionTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('transitionTest_static_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 233,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(1000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("transitionTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as Acton)?.btn1).assertEqual(false);
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("transitionTest_static_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("transitionTest_static_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('transitionTest_static_0200 END');
      done();
    });

    
/**
     * @tc.number   transitionTest_static_0300
     * @tc.name     transitionTest_static_0300
     * @tc.desc     transitionTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('transitionTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('transitionTest_static_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "opacity": 2,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 233,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("transitionTest_static_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("transitionTest_static_0300 change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('button');
      console.info("transitionTest_static_0300 component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      //非法入参默认初始值
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('transitionTest_static_0300 END');
      done();
    });

    
/**
     * @tc.number   transitionTest_static_0400
     * @tc.name     transitionTest_static_0400
     * @tc.desc     transitionTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('transitionTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('transitionTest_static_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "opacity": 1,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 233,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("transitionTest_static_0400 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("transitionTest_static_0400 change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('button');
      console.info("transitionTest_static_040 component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info('transitionTest_static_0400 END');
      done();
    });
  })
}
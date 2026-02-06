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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function refreshString() {
  describe('refreshString', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("refresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshLevel1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get refresh state pages:" + JSON.stringify(pages));
        if (!("refreshLevel1" == pages.name)) {
          console.info("get refresh state pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push refresh page error:" + err);
      }
    });

    

      
  
/**
     * @tc.number   refreshString_static_0100
     * @tc.name     refreshString_static_0100
     * @tc.desc     refreshString_static_0100
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0100] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "*&^%$#@!~..."
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0100] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0100] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("*&^%$#@!~...");
      console.info('refreshString_static_0100 END');
      done();
    });

    

      
  
/**
     * @tc.number   refreshString_static_0200
     * @tc.name     refreshString_static_0200
     * @tc.desc     refreshString_static_0200
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "*&#123swq..."
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0200] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("*&#123swq...");
      console.info('refreshString_static_0200 END');
      done();
    });

    

      
  
/**
     * @tc.number   refreshString_static_0300
     * @tc.name     refreshString_static_0300
     * @tc.desc     refreshString_static_0300
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "下拉刷新。。。"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0300] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("下拉刷新。。。");
      console.info('refreshString_static_0300 END');
      done();
    });

    

      
  
/**
     * @tc.number   refreshString_static_0400
     * @tc.name     refreshString_static_0400
     * @tc.desc     refreshString_static_0400
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "123123"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0400] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("123123");
      console.info('refreshString_static_0400 END');
      done();
    });

    

      
  
/**
     * @tc.number   refreshString_static_0500
     * @tc.name     refreshString_static_0500
     * @tc.desc     refreshString_static_0500
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "abcabc"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0500] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("abcabc");
      console.info('refreshString_static_0500 END');
      done();
    });

    

      
  
/**
     * @tc.number   refreshString_static_0600
     * @tc.name     refreshString_static_0600
     * @tc.desc     refreshString_static_0600
     * @tc.level    Level.LEVEL0
     */
it('refreshString_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[refreshString_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": "    "
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshString_static_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshString_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshLevel1');

      console.info("[refreshString_static_0600] JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("    ");
      console.info('refreshString_static_0600 END');
      done();
    });

  });
}

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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level,afterAll } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function enableJsunit() {
  describe('enableTest', () => {
    beforeAll(() => {
      console.info("enableJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("enableJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/enabled/enable",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("enable" == pages.name)) {
          console.info("get enableJsunit state pages:" + JSON.stringify(pages));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enableJsunit page error:" + err);
      }
      console.info("enableJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("enable after each called");
    });
    // afterAll(() => {
    //   const routerInstance = AppStorage.get<Router>("router") as Router
    //   routerInstance.back();
    // })

    
    /**
     * @tc.number   testEnable_static_01
     * @tc.name     testEnable_static_01
     * @tc.desc     testEnable_static_01
     * @tc.level    Level.LEVEL0
     */
it('testEnable_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEnable01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('enabled');
      console.info("[testEnable01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enabled')).assertEqual(true);
      console.info('[testEnable01] END');
      done()
    });

    
    /**
     * @tc.number   testEnable_static_03
     * @tc.name     testEnable_static_03
     * @tc.desc     testEnable_static_03
     * @tc.level    Level.LEVEL0
     */
it('testEnable_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEnable03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enabled": -3
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1111,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testEnable03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testEnable03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('enabled');
      console.info("[testEnable03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enabled')).assertEqual(true);
      console.info('testEnable03 END');
      done()
    });

    
    /**
     * @tc.number   testEnable_static_04
     * @tc.name     testEnable_static_04
     * @tc.desc     testEnable_static_04
     * @tc.level    Level.LEVEL0
     */
it('testEnable_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testEnable04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enabled": 33567444
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1111,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testEnable04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("testEnable04 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let objNew: string = inspector.getInspectorByKey('enabled');
      console.info("testEnable04 component objNew is: " + JSON.stringify(JSON.parseJsonElement(objNew)));
      expect(JSON.parseJsonElement(objNew).getElement('$attrs').getBoolean('enabled')).assertEqual(true);
      done()
    });

    
    /**
     * @tc.number   testEnable_static_02
     * @tc.name     testEnable_static_02
     * @tc.desc     testEnable_static_02
     * @tc.level    Level.LEVEL0
     */
it('testEnable_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEnable02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enabled": false,
            "text": "disable"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 93,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testEnable02] start to publish emit",eventData.data);
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testEnable02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('enabled');
      await CommonFunc.sleep(2000);
      console.info("[testEnable02] obj is: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enabled'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('enabled')).assertEqual(false);
      console.info('testEnable02 END');
      done()
    });
  })
}

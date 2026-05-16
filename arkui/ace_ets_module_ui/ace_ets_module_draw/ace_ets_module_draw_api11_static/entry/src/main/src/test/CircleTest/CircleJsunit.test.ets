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
import emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function circleJsunit() {
  describe('circleJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("circle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Circle/circle3',
      }
      try {
        const circle = AppStorage.get<Router>("router") as Router
        circle.clear();
        let pages = circle.getState();
        console.info("get circle state pages:" + JSON.stringify(pages));
        if (!("circle3" == pages.name)) {
          console.info("get circle state pages.name:" + JSON.stringify(pages.name));
          circle.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        err = err as BusinessError;
        console.error("push circle page error:" + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("circle after each called");
    });

    
    /**
     * @tc.number   circleTest_static_0100
     * @tc.name     circleTest_static_0100
     * @tc.desc     circleTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('circleTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('circleTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('circle');
      console.info("circleTest_static_0100 component strJson:" + strJson);

      console.info("circleTest_static_0100 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('450.00px');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('450.00px');
      done();
    });

    
    /**
     * @tc.number   circleTest_static_0200
     * @tc.name     circleTest_static_0200
     * @tc.desc     circleTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('circleTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[circleTest_static_0200] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "width": '500px',
            "height": '500px',
          } as Record<String,RecordData>
        } as emitter.EventData
        console.info('[circleTest_static_0200] START');
        let innerEvent: emitter.InnerEvent = {
          eventId: 77,
          priority: emitter.EventPriority.LOW
        }
        console.info("[circleTest_static_0200] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[circleTest_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[circleTest_static_0200] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('500.00px');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('500.00px');
      console.info('circleTest_static_0200 END');
      done();
    });

    
    /**
     * @tc.number   circleTest_static_0300
     * @tc.name     circleTest_static_0300
     * @tc.desc     circleTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('circleTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[circleTest_static_0300] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "width": '-a',
            "height": '-b',
          } as Record<String,RecordData>
        } as emitter.EventData
        console.info('[circleTest_static_0300] START');
        let innerEvent: emitter.InnerEvent = {
          eventId: 77,
          priority: emitter.EventPriority.LOW
        }
        console.info("[circleTest_030] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        err = err as BusinessError;
        console.log("[circleTest_030] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[circleTest_static_0300] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('0.00vp');
      console.info('circleTest_static_0300 END');
      done();
    });
  })
}

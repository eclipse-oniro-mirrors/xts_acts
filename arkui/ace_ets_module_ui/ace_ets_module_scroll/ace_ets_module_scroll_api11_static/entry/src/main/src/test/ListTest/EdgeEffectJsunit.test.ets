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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { EdgeEffect } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function edgeEffectJsunit() {
  describe('edgeEffectTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/edgeEffect',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get edgeEffect state success " + JSON.stringify(pages));
        if (!("edgeEffect" == pages.name)) {
          console.info("get edgeEffect state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push edgeEffect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push edgeEffect page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("edgeEffect after each called");
    });


    
    /**
     * @tc.number   edgeEffectTest_static_0100
     * @tc.name     edgeEffectTest_static_0100
     * @tc.desc     edgeEffectTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('edgeEffectTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('edgeEffectTest_static_0100 START');
      let strJson: string = inspector.getInspectorByKey('list');
      console.info("edgeEffectTest_static_0100 component strJson:" + strJson);
      console.info("edgeEffectTest_static_0100 component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('edgeEffect'))
        .assertEqual("EdgeEffect.None");
      done();
    });


    
    /**
     * @tc.number   edgeEffectTest_static_0200
     * @tc.name     edgeEffectTest_static_0200
     * @tc.desc     edgeEffectTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('edgeEffectTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('edgeEffectTest_static_0200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeEffect": EdgeEffect.Spring,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 91,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("edgeEffectTest_static_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err: Error) {
        console.log("edgeEffectTest_static_0200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJsonNew: string = inspector.getInspectorByKey('list');
      console.info("edgeEffectTest_static_0200 component objNew is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('edgeEffect'))
        .assertEqual('EdgeEffect.Spring');
      console.info('edgeEffectTest_static_0200 END');
      done();
    });
  })
}
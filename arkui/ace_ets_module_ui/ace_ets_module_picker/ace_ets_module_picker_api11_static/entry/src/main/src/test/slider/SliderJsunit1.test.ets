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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
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
import Utils  from "../../../ets/MainAbility/common/Utils";
import Utils from '../../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter'
import { Axis } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function sliderJsunit1() {
  describe('appInfoTest_five_3', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider1/slider',
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = router.getState();
        console.info("[slider] current page is: " + JSON.stringify(pages.name));
        if (!('slider' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.info("push slider page page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      console.info('[slider] after each called');
      const router = AppStorage.get<Router>("router") as Router
      router.clear();
      await sleep(1)
    });


    
    
    /**
     * @tc.number   testSlider001_static
     * @tc.name     testSlider001_static
     * @tc.desc     testSlider001_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSlider001] START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('slider');
      console.info("[testSlider001] component strJson:" + strJson);
      console.info("[testSlider001] decoration:" + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('decoration')).assertEqual(undefined);
      done();
    });


    
    
    /**
     * @tc.number   testSlider002_static
     * @tc.name     testSlider002_static
     * @tc.desc     testSlider002_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider002_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSlider002] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "decorationValue": Axis.Horizontal
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSlider002] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testSlider002] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('slider');
      console.info("[testSlider002] component strJson:" + strJson);
      console.info("[testSlider002] decoration:" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('decoration'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('decoration')).assertEqual(undefined);
      done();
    });


    
    
    /**
     * @tc.number   testSlider003_static
     * @tc.name     testSlider003_static
     * @tc.desc     testSlider003_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider003_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSlider003] START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('slider');
      console.info("[testSlider003] component strJson:" + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('value')).assertEqual(undefined);
      done();
    });


    
    
    /**
     * @tc.number   testSlider004_static
     * @tc.name     testSlider004_static
     * @tc.desc     testSlider004_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider004_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testSlider004] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "10",
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSlider004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:Error) {
        console.log("[testSlider004] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('slider');
      console.info("[testSlider004] component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').tryGetElement('value')).assertEqual(undefined);
      done();
    });


    
    
    /**
     * @tc.number   testSlider005_static
     * @tc.name     testSlider005_static
     * @tc.desc     testSlider005_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider005_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testSlider005 START');
      let strJson: string = inspector.getInspectorByKey('slider');
      console.info("testSlider005 component strJson:" + strJson);
      console.info("testSlider005 component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('step')).assertEqual(undefined);
      console.info('testSlider005 END');
      done();
    });


    
    
    /**
     * @tc.number   testSlider006_static
     * @tc.name     testSlider006_static
     * @tc.desc     testSlider006_static
     * @tc.level    Level.LEVEL1
     */
it('testSlider006_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testSlider006 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stepValue": "10",
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 196,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testSlider006 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testSlider006 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew: string = inspector.getInspectorByKey('slider');
      console.info("testSlider006 component objNew is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').tryGetElement('step')).assertEqual(undefined);
      console.info('testSlider006 END');
      done();
    });
  })
}
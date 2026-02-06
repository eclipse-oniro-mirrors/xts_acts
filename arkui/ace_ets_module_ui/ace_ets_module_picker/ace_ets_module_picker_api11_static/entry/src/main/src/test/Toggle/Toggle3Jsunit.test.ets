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
import events_emitter from '@ohos.events.emitter';
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

export default function Toggle3Jsunit() {
  describe('Toggle3Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("toggle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Toggle/toggle3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get toggle state pages:" + JSON.stringify(pages));
        if (!("toggle3" == pages.name)) {
          console.info("get toggle pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push toggle page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("toggle after each called");
    });

    
    
    /**
     * @tc.number   testToggle01_static
     * @tc.name     testToggle01_static
     * @tc.desc     testToggle01_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle01_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testToggle01] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('toggle');
      console.info("[testToggle01] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Toggle');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual('#330A59F7');
      console.info('[testToggle01] END');
      done();
    });


    
    
    /**
     * @tc.number   testToggle02_static
     * @tc.name     testToggle02_static
     * @tc.desc     testToggle02_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle02_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testToggle02] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('toggle');
      console.info("[testToggle02] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual('ToggleType.Button');
      console.info('[testToggle02] END');
      done();
    });

    
    
    /**
     * @tc.number   testToggle03_static
     * @tc.name     testToggle03_static
     * @tc.desc     testToggle03_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle03_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testToggle03] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('toggle');
      console.info("[testToggle03] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('isOn')).assertEqual('false');
      console.info('[testToggle03] END');
      done();
    });


    
    
    /**
     * @tc.number   testToggle04_static
     * @tc.name     testToggle04_static
     * @tc.desc     testToggle04_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle04_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": true,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('isOn')).assertEqual('true');
      console.info('testToggle04 END');
      done();
    });


    
    
    /**
     * @tc.number   testToggle05_static
     * @tc.name     testToggle05_static
     * @tc.desc     testToggle05_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle05_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle05 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedColor": '#330A59F8',
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle05 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle05 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('toggle');
      console.info("testToggle05 component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('selectedColor')).assertEqual('#330A59F8');
      console.info('testToggle05 END');
      done();
    });

    
    
    /**
     * @tc.number   testToggle08_static
     * @tc.name     testToggle08_static
     * @tc.desc     testToggle08_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle08_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": false,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('isOn')).assertEqual('false');
      console.info('testToggle04 END');
      done();
    });


    
    
    /**
     * @tc.number   testToggle09_static
     * @tc.name     testToggle09_static
     * @tc.desc     testToggle09_static
     * @tc.level    Level.LEVEL1
     */
it('testToggle09_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testToggle04 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isOn": false,
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 231,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testToggle04 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("testToggle04 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('toggle');
      console.info("testToggle04 component JSON.parseJsonElement(strJsonNew) is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('isOn')).assertEqual('false');
      console.info('testToggle04 END');
      done();
    });
  })
}

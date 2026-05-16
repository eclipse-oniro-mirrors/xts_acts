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

export default function rating3Jsunit() {
  describe('rating3Jsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/rating3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get rating state pages:" + JSON.stringify(pages));
        if (!("rating3" == pages.name)) {
          console.info("get rating pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push rating page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:'MainAbility/pages/index/index'});
      await Utils.sleep(1000);
      console.info("rating after each called");
    });

    
    /**
     * @tc.number   testRating_static_100
     * @tc.name     testRating_static_100
     * @tc.desc     testRating_static_100
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 2 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_100 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("2.000000");
      console.info('testRating_static_100 END');
      done();
    });
    
    
    /**
     * @tc.number   testRating_static_200
     * @tc.name     testRating_static_200
     * @tc.desc     testRating_static_200
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRating_static_200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stepSize')).assertEqual("0.500000");
      console.info('testRating_static_200 END');
      done();
    });

    
    /**
     * @tc.number   testRating_static_300
     * @tc.name     testRating_static_300
     * @tc.desc     testRating_static_300
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 3 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_300 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("3.000000");
      console.info('testRating_static_300 END');
      done();
    });

    
    /**
     * @tc.number   testRating_static_400
     * @tc.name     testRating_static_400
     * @tc.desc     testRating_static_400
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_400 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 4 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_400 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_400 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("4.000000");
      console.info('testRating_static_400 END');
      done();
    });

    
    /**
     * @tc.number   testRating_static_500
     * @tc.name     testRating_static_500
     * @tc.desc     testRating_static_500
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_500 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 5 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_500 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_500 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("5.000000");
      console.info('testRating_static_500 END');
      done();
    });

    
    /**
     * @tc.number   testRating_static_600
     * @tc.name     testRating_static_600
     * @tc.desc     testRating_static_600
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_600 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 0 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_600 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_600 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("0.000000");
      console.info('testRating_static_600 END');
      done();
    });

    
    
    /**
     * @tc.number   testRating_static_700
     * @tc.name     testRating_static_700
     * @tc.desc     testRating_static_700
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_700 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 1 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_700 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_700 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("1.000000");
      console.info('testRating_static_700 END');
      done();
    });


    
    
    /**
     * @tc.number   testRating_static_800
     * @tc.name     testRating_static_800
     * @tc.desc     testRating_static_800
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_800 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": -1 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_800 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_800 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("0.000000");
      console.info('testRating_static_800 END');
      done();
    });


    
    
    /**
     * @tc.number   testRating_static_900
     * @tc.name     testRating_static_900
     * @tc.desc     testRating_static_900
     * @tc.level    Level.LEVEL1
     */
it('testRating_static_900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testRating_static_900 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 0 as double
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_static_900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_static_900 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Rating');

      console.info("testRating_static_900 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rating')).assertEqual("0.000000");
      console.info('testRating_static_900 END');
      done();
    });
  })
}
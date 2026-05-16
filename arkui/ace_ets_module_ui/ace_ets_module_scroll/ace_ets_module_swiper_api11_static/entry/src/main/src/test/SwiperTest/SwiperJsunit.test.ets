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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { $r, Resource, ArrowStyle } from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';

import { UtilsTest, startAbility } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;
const uiContext = new UIContext();

export default function swiperJsunit() {
  describe('swiperTest', () => {
    beforeAll(() => {
      console.info("swiperJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiper',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push swiper page success ");
        }
      } catch (err: Error) {
        console.error("push swiper page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiper after each called");
    });

    
    /**
     * @tc.number   swiperTest_static_0100
     * @tc.name     swiperTest_static_0100
     * @tc.desc     swiperTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0100 START');
      let strJson: string = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_0100 component strJson:" + strJson);

      console.info("swiperTest_0100 component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("swiperTest_0100 JSON.parse(strJson).$attrs.index: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('index'));
      // console.info("swiperTest_0100 JSON.parse(strJson).$attrs.indicatorStyle: " + JSON.parseJsonElement(strJson)
      //   .getElement('$attrs')
      //   .getString('indicatorStyle'));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual('1');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0200
     * @tc.name     swiperTest_static_0200
     * @tc.desc     swiperTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0200 START');
      let strJson: string = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_0200 component strJson:" + strJson);
      console.info("swiperTest_static_0200 component obj is: " + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator')).assertEqual('true')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('false');
      console.info('swiperTest_static_0200 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0300
     * @tc.name     swiperTest_static_0300
     * @tc.desc     swiperTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0300 START');
      let strJson: string = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_0300 component strJson:" + strJson);

      console.info("swiperTest_static_0300 component JSON.parse(strJson) is: " + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('duration')).assertEqual('1000');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual('false');
      console.info('swiperTest_static_0300 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0400
     * @tc.name     swiperTest_static_0400
     * @tc.desc     swiperTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0400 START');
      let strJson: string = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_0400 component strJson:" + strJson);

      console.info("swiperTest_static_0400 component JSON.parse(strJson) is: " + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('false');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('interval')).assertEqual('4000');
      console.info('swiperTest_static_0400 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0500
     * @tc.name     swiperTest_static_0500
     * @tc.desc     swiperTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0500 START');
      let strJson: string = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_0500 component strJson:" + strJson);

      console.info("swiperTest_static_0500 component JSON.parse(strJson) is: " + JSON.parseJsonElement(strJson));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('disableSwipe')).assertEqual('false');
      console.info('swiperTest_static_0500 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0600
     * @tc.name     swiperTest_static_0600
     * @tc.desc     swiperTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0600 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "index": 3
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 207,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_0600 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_0600 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew: string = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_0600 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('index')).assertEqual('3');
      console.info('swiperTest_static_0600 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0700
     * @tc.name     swiperTest_static_0700
     * @tc.desc     swiperTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "autoPlay": true
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 207,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_0700 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_0700 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('autoPlay')).assertEqual('true');
      console.info('swiperTest_static_0700 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0800
     * @tc.name     swiperTest_static_0800
     * @tc.desc     swiperTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0800 START');
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_static_0800 get state result is: " + JSON.stringify(InnerEvent));
        expect(((InnerEvent.data) as Record<String,RecordData>)?.['ACTION'] ?? true).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 205,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err: Error) {
        console.info("swiperTest_static_0800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_static_0800 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('swiperTest_static_0800 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_0900
     * @tc.name     swiperTest_static_0900
     * @tc.desc     swiperTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0900 START');
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_static_0900 get state result is: " + JSON.stringify(InnerEvent));
        expect(((InnerEvent.data) as Record<String,RecordData>)?.['ACTION'] ?? true).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 206,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err: Error) {
        console.info("swiperTest_static_0900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_static_0900 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('swiperTest_static_0900 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1000
     * @tc.name     swiperTest_static_1000
     * @tc.desc     swiperTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1000 START');
      await CommonFunc.sleep(1500);
      let callbackOne = (InnerEventOne: events_emitter.EventData) => {
        console.info("swiperTest_static_1000 get state result is: " + JSON.stringify(InnerEventOne));
        expect(((InnerEventOne.data) as Record<String,RecordData>)?.['ACTION'] ?? true).assertEqual(true);
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 206,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callbackOne);
      } catch (err: Error) {
        console.info("swiperTest_static_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_static_1000 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_static_1000 get state result is: " + JSON.stringify(InnerEvent));
        expect(((InnerEvent.data) as Record<String,RecordData>)?.['ACTION'] ?? true).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 204,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err: Error) {
        console.info("swiperTest_static_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('swiperTest_static_1000 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1100
     * @tc.name     swiperTest_static_1100
     * @tc.desc     swiperTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "loop": true
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1100 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew: string = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1100 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('loop')).assertEqual('true');
      console.info('swiperTest_static_1100 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1200
     * @tc.name     swiperTest_static_1200
     * @tc.desc     swiperTest_static_1200
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": true
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1200 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew: string = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1200 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('vertical')).assertEqual('true');
      console.info('swiperTest_static_1200 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1300
     * @tc.name     swiperTest_static_1300
     * @tc.desc     swiperTest_static_1300
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "interval": "3000"
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 209,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1300 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1300 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('interval')).assertEqual('3000');
      console.info('swiperTest_static_1300 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1400
     * @tc.name     swiperTest_static_1400
     * @tc.desc     swiperTest_static_1400
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "indicator": false
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 209,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1400 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1400 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');
      console.info("swiperTest_static_1400 component JSON.parse(strJson)New is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('indicator')).assertEqual('false');
      console.info('swiperTest_static_1400 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1500
     * @tc.name     swiperTest_static_1500
     * @tc.desc     swiperTest_static_1500
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1500 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 500
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1500 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1500 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('duration')).assertEqual('500');
      console.info('swiperTest_static_1500 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1600
     * @tc.name     swiperTest_static_1600
     * @tc.desc     swiperTest_static_1600
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1600 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "itemSpace": "1"
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1600 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1600 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1600 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('itemSpace')).assertEqual('1.00vp');
      console.info('swiperTest_static_1600 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1700
     * @tc.name     swiperTest_static_1700
     * @tc.desc     swiperTest_static_1700
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "loop": "true123"
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1700 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1700 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('loop')).assertEqual('true');
      console.info('swiperTest_static_1700 END');
      done()
    });

    
    /**
     * @tc.number   swiperTest_static_1900
     * @tc.name     swiperTest_static_1900
     * @tc.desc     swiperTest_static_1900
     * @tc.level    Level.LEVEL0
     */
it('swiperTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_1900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 0
          } as Record<String,RecordData>
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_static_1900 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err: Error) {
        console.log("swiperTest_static_1900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = inspector.getInspectorByKey('swiper');

      console.info("swiperTest_static_1900 component JSON.parse(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('duration')).assertEqual('0');
      console.info('swiperTest_static_1900 END');
      done()
    });

  })
}
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
import emitter from '@ohos.events.emitter'
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Message, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import curves from '@ohos.curves';
import { PlayMode } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

interface DataI {
  duration: number
  curve: string
  iterations: number
  tempo: number
  playmode: string
  iteration: number
}

class Msg {
  name: string = ''
  value: number

  constructor(name: string, value: number) {
    this.name = name
    this.value = value
  }
}

interface ParamName {
  name: string,
  message: MessageManager<number>
}

interface ParamName1 {
  name: string,
  message: MessageManager<string>
}

interface ParamName2 {
  name: string,
  message: MessageManager<PlayMode>
}

export default function animateJsunit() {
  describe('animateTest', () => {

    beforeAll(() => {
      console.info("animateJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("animateJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Animation/animate"
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get animateJsunit state pages:" + JSON.stringify(pages));
        if (!("animate" == pages.name)) {
          console.info("get animateJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push animateJsunit page error:" + err);
      }
      console.info("animateJsunit beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("animate after each called");
    });

    
    /**
     * @tc.number   animateTest_static_0100
     * @tc.name     animateTest_static_0100
     * @tc.desc     animateTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0100 START');
      await CommonFunc.sleep(1500);
      let indexEvent: emitter.InnerEvent = {
        eventId: 51,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['duration'] == 100).assertTrue();
        } catch (err) {
          console.info("animateTest_0100 get state result is errr: " + JSON.stringify(err));
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0100 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0200
     * @tc.name     animateTest_static_0200
     * @tc.desc     animateTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0200 START');
      await CommonFunc.sleep(1500);
      let indexEvent: emitter.InnerEvent = {
        eventId: 52,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0200 get state result is: " + JSON.stringify(indexEvent))
        expect((indexEvent.data as Record<String,RecordData>)['curve']).assertEqual('Ease');
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0200 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0300
     * @tc.name     animateTest_static_0300
     * @tc.desc     animateTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0300 START');
      await CommonFunc.sleep(1500);
      let indexEvent: emitter.InnerEvent = {
        eventId: 53,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['iterations'] == 1).assertTrue();
        } catch (err) {
          console.info("animateTest_0300 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0300 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0400
     * @tc.name     animateTest_static_0400
     * @tc.desc     animateTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0400 START');
      await CommonFunc.sleep(1500);
      let indexEvent: emitter.InnerEvent = {
        eventId: 54,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0400 get state result is: " + JSON.stringify(indexEvent))
        expect((indexEvent.data as Record<String,RecordData>)['tempo']).assertEqual(1000);
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0400 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0400 click result is: " + JSON.stringify(inspector.sendEventByKey('button4', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0400 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0500
     * @tc.name     animateTest_static_0500
     * @tc.desc     animateTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0500 START');
      await CommonFunc.sleep(1500);
      let indexEvent: emitter.InnerEvent = {
        eventId: 55,
        priority: emitter.EventPriority.LOW
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        expect((indexEvent.data as Record<String,RecordData>)['playmode']).assertEqual(PlayMode.Normal);
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0500 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0500 click result is: " + JSON.stringify(inspector.sendEventByKey('button5', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0500 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0600
     * @tc.name     animateTest_static_0600
     * @tc.desc     animateTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'duration', value: 2000
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 151,
        priority: emitter.EventPriority.LOW
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['duration'] == 2000).assertTrue();
        } catch (err) {
          console.info("animateTest_0600 get state result err is: " + JSON.stringify(err));
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0600 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0600 click result is: " + JSON.stringify(inspector.sendEventByKey('button11', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0600 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0700
     * @tc.name     animateTest_static_0700
     * @tc.desc     animateTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0700 START');
      const animate = AppStorage.get<MessageManager<String>>("MessageManagerString")
      let msg: Message<string> = {
        name: 'curve', value: 'Linear'
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 152,
        priority: emitter.EventPriority.LOW
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['curve']).assertEqual('Linear');
        } catch (err) {
          console.info("animateTest_0700 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0700 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0700 click result is: " + JSON.stringify(inspector.sendEventByKey('button12', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0700 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0800
     * @tc.name     animateTest_static_0800
     * @tc.desc     animateTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0800 START');

      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'iteration', value: 2
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 153,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['iterations']).assertEqual(2);
        } catch (err) {
          console.info("animateTest_0800 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0800 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0800 click result is: " + JSON.stringify(inspector.sendEventByKey('button13', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0800 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_0900
     * @tc.name     animateTest_static_0900
     * @tc.desc     animateTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_0900 START');

      const animate = AppStorage.get<MessageManager<Double>>("MessageManagerLong")
      let msg: Message<Double> = {
        name: 'tempo', value: 20000
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 154,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_0900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['tempo']).assertEqual(20000);
        } catch (err) {
          console.info("animateTest_0900 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0900 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0900 click result is: " + JSON.stringify(inspector.sendEventByKey('button14', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_0900 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1000
     * @tc.name     animateTest_static_1000
     * @tc.desc     animateTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1000 START');
      const animate = AppStorage.get<MessageManager<PlayMode>>("MessageManagerPlayMode")
      let msg: Message<PlayMode> = {
        name: 'playmode', value: PlayMode.Alternate
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 155,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['playmode'])
            .assertEqual(PlayMode.Alternate);
        } catch (err) {
          console.info("animateTest_1000 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1000 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1000 click result is: " + JSON.stringify(inspector.sendEventByKey('button15', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1000 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1100
     * @tc.name     animateTest_static_1100
     * @tc.desc     animateTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1100 START');
      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'duration', value: -1000
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1001,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['duration']).assertEqual(-1000);
        } catch (err) {
          console.info("animateTest_1100 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1100 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1100 click result is: " + JSON.stringify(inspector.sendEventByKey('button6', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1100 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1200
     * @tc.name     animateTest_static_1200
     * @tc.desc     animateTest_static_1200
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1200 START');

      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'duration', value: 100000000
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1002,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1200 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['duration']).assertEqual(100000000);
        } catch (err) {
          console.info("animateTest_1200 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1200 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1200 click result is: " + JSON.stringify(inspector.sendEventByKey('button7', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1200 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1300
     * @tc.name     animateTest_static_1300
     * @tc.desc     animateTest_static_1300
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1300 START');

      const animate = AppStorage.get<MessageManager<String>>("MessageManagerString")
      let msg: Message<string> = {
        name: 'curve', value: '123'
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1003,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['curve']).assertEqual('123');
        } catch (err) {
          console.info("animateTest_1300 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1300 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1300 click result is: " + JSON.stringify(inspector.sendEventByKey('button8', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1300 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1400
     * @tc.name     animateTest_static_1400
     * @tc.desc     animateTest_static_1400
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1400 START');

      const animate = AppStorage.get<MessageManager<String>>("MessageManagerString")
      let msg: Message<string> = {
        name: 'curve', value: 'abc'
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1004,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1400 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['curve']).assertEqual('abc');
        } catch (err) {
          console.info("animateTest_1400 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1400 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1400 click result is: " + JSON.stringify(inspector.sendEventByKey('button9', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1400 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1500
     * @tc.name     animateTest_static_1500
     * @tc.desc     animateTest_static_1500
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1500 START');
      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'iteration', value: 121
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1005,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1500 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['iteration']).assertEqual(121);
        } catch (err) {
          console.info("animateTest_1500 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1500 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1500 click result is: " + JSON.stringify(inspector.sendEventByKey('button10', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1500 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1600
     * @tc.name     animateTest_static_1600
     * @tc.desc     animateTest_static_1600
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1600 START');
      const animate = AppStorage.get<MessageManager<Int>>("MessageManager")
      let msg: Message<Int> = {
        name: 'iteration', value: -5
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1006,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['iteration']).assertEqual(-5);
        } catch (err) {
          console.info("animateTest_1600 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1600 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1600 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button111', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1600 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1700
     * @tc.name     animateTest_static_1700
     * @tc.desc     animateTest_static_1700
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1700 START');
      const animate = AppStorage.get<MessageManager<Double>>("MessageManagerLong")
      let msg: Message<Double> = {
        name: 'tempo', value: 12121212121212
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1007,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['tempo']).assertEqual(12121212121212);
        } catch (err) {
          console.info("animateTest_1700 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1700 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1700 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button121', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1700 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1800
     * @tc.name     animateTest_static_1800
     * @tc.desc     animateTest_static_1800
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1800 START');

      const animate = AppStorage.get<MessageManager<Double>>("MessageManagerLong")
      let msg: Message<Double> = {
        name: 'tempo', value: -5
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1008,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['tempo']).assertEqual(-5);
        } catch (err) {
          console.info("animateTest_1800 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1800 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1800 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button131', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1800 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_1900
     * @tc.name     animateTest_static_1900
     * @tc.desc     animateTest_static_1900
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_1900 START');

      const animate = AppStorage.get<MessageManager<Int>>("MessageManagerPlayModeInt")
      let msg: Message<Int> = {
        name: 'playmode', value: -6
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1009,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_1900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['playmode']).assertEqual(-6);
        } catch (err) {
          console.info("animateTest_1900 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1900 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1900 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button141', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_1900 END');
      done();
    });

    
    /**
     * @tc.number   animateTest_static_2000
     * @tc.name     animateTest_static_2000
     * @tc.desc     animateTest_static_2000
     * @tc.level    Level.LEVEL0
     */
it('animateTest_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animateTest_2000 START');
      const animate = AppStorage.get<MessageManager<Int>>("MessageManagerPlayModeInt")
      let msg: Message<Int> = {
        name: 'playmode', value: 123456
      }
      animate?.notify(msg);
      await CommonFunc.sleep(200);
      let indexEvent: emitter.InnerEvent = {
        eventId: 1010,
        priority: emitter.EventPriority.LOW
      }
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animateTest_2000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect((indexEvent.data as Record<String,RecordData>)['playmode']).assertEqual(123456);
        } catch (err) {
          console.info("animateTest_2000 get state result err is: " + JSON.stringify(err));
        }
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_2000 on emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_2000 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button151', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('animateTest_2000 END');
      done();
    });
  })
}
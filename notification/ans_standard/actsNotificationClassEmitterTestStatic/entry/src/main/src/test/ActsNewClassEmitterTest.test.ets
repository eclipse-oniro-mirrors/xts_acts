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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import { BusinessError, Callback,RecordData } from '@ohos.base';

class Sample {
  constructor() {
    this.count = 100;
  }

  printCount() {
    console.info('Print count : ' + this.count);
  }

  count: number;
}

let optionsHIGH: emitter.Options = {
  priority: emitter.EventPriority.IMMEDIATE
};

let optionsLOW: emitter.Options = {
  priority: emitter.EventPriority.IDLE
};

let emitter1 = new emitter.Emitter();
let emitter2 = new emitter.Emitter();
let emitter3 = new emitter.Emitter();
let emitter4 = new emitter.Emitter();

export default function ActsNewClassEmitterTest() {
  describe('ActsNewClassEmitterTest', () => {

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0100
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0100
     * @tc.desc    test onEventData interface success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0100';
        let count: int = 0;
        let eventData: emitter.EventData = {
          data: {
            'content': 'event',
            'id': 2
          } as Record<string, RecordData>
        };
        let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
          count++;
        }
        try {
          hilog.info(0x001, 'testTag', 'test case begin');
          emitter1.onEventData("event", callback);
        } catch (err) {
          hilog.info(0x001, 'testTag', `on failed,data is: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag', 'test case begin');
          emitter2.onEventData("event", callback);
        } catch (err) {
          hilog.info(0x001, 'testTag', `on failed,data is: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag', 'test emit1 success');
          emitter1.emit("event",eventData);
          await Utils.msSleep(5000);
        } catch (err) {
          hilog.info(0x001, 'testTag', `on failed,data is: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(4000);
        expect(count).assertEqual(1);
        emitter1.off("event");
        emitter2.off("event");
        done();
      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0200
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0200
     * @tc.desc    test onGenericEventData interface success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0200';
        let count: int = 0;
        let eventDataT: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        let callbackT: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            hilog.info(0x0000,'testTag',
              `callbackT emitter genericEventData: ${JSON.stringify(eventData?.data)}`);
            if (eventData?.data instanceof Sample) {
              const sampleData = eventData.data as Sample;
              sampleData.printCount();
              count++;
            }
          }
        try {
          hilog.info(0x0000,'testTag', 'test case begin');
          emitter1.onGenericEventData("event1", callbackT);
        } catch (err) {
          hilog.info(0x001, 'testTag', `on failed,data is: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info( 0x0000,'testTag', 'test case begin');
          emitter2.onGenericEventData("event1", callbackT);
        } catch (err) {
          hilog.info(0x001, 'testTag', `on failed,data is: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x0000,'testTag', 'test emit success');
          emitter2.emit("event1", eventDataT);
          await Utils.msSleep(5000);
        } catch (err) {
          hilog.info(0x0000,'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(4000);
        expect(count).assertEqual(1);
        emitter1.off("event1");
        emitter2.off("event1");
        done();
      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0300
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0300
     * @tc.desc    test onceEventData interface success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0300';
        let myDate: Record<String, RecordData> = {
          'content': 'eventOnce',
          'id': 1
        }
        let eventData: emitter.EventData = { data: myDate }
        let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        try {
          hilog.info(0x001, 'testTag',  'test case start');
          emitter1.onceEventData("eventOnce", callback);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag',  'test case start');
          emitter2.onceEventData("eventOnce", callback);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        try {
          hilog.info(0x001, 'testTag',  'emit success');
          emitter1.emit("eventOnce");
          await Utils.msSleep(6000);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(4000);
        let num: number = emitter1.getListenerCount("eventOnce");
        let num1: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x000, 'testTag',  ' getListenerCount success,data is %{public}s',
          JSON.stringify(num));
        expect(num).assertEqual(0);
        expect(num1).assertEqual(1);
        emitter1.off("eventOnce");
        emitter2.off("eventOnce");
        done();

      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0400
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0400
     * @tc.desc    test onceGenericEventData interface success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0400';
        let eventDataT: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        let callbackT: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            hilog.info(0x0000, 'testTag',
              `callbackT emitter genericEventData: ${JSON.stringify(eventData?.data)}`);
            if (eventData?.data instanceof Sample) {
              const sampleData = eventData.data as Sample;
              sampleData.printCount();
            }
          }
        try {
          hilog.info(0x001, 'testTag',  'test case start');
          emitter3.onceGenericEventData("eventOnce2", callbackT);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag',  'test case start');
          emitter4.onceGenericEventData("eventOnce2", callbackT);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag',  'emit success');
          emitter3.emit("eventOnce2");
          await Utils.msSleep(6000);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(4000);
        let num: number = emitter3.getListenerCount("eventOnce2");
        let num1: number = emitter4.getListenerCount("eventOnce2");
        hilog.info(0x000, 'testTag',  ' getListenerCount success,data is %{public}s',
          JSON.stringify(num));
        expect(num).assertEqual(0);
        expect(num1).assertEqual(1);
        emitter3.off("eventOnce2");
        emitter4.off("eventOnce2");
        done();

      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0500
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0500
     * @tc.desc    test getListenerCount success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0500';
        let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        let callback3: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        let callback4: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }

        try {
          hilog.info(0x001, 'testTag',  'test case begin');
          emitter1.onEventData("event1", callback);
          emitter1.onEventData("event1", callback1);
          emitter1.onEventData("event1", callback2);
          emitter1.onEventData("event1", callback3);
          emitter1.onEventData("event1", callback4);
          emitter2.onEventData("event1", callback);
          emitter2.onEventData("event1", callback1);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `onEventData failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          hilog.info(0x001, 'testTag',  'offEventData success');
          emitter1.offEventData("event1", callback);
          emitter1.offEventData("event1", callback1);
          emitter2.offEventData("event1", callback1);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `offEventData failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        let num1: number = emitter1.getListenerCount("event1");
        let num2: number = emitter2.getListenerCount("event1");
        hilog.info(0x000, 'testTag', 'getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(3);
        expect(num2).assertEqual(1);
        hilog.info(0x000, 'testTag',  'test case end');
        done();
      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0600
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0600
     * @tc.desc    off(eventId: string): void
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0600';
        let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        try {
          hilog.info(0x001, 'testTag',  'test case begin');
          emitter1.onEventData("event1", callback);
          emitter2.onEventData("event1", callback);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }
        try {
          emitter1.off("event1");
          emitter2.off("event1");
          hilog.info(0x0000, 'testTag', 'emitter1 off success!');
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        let num: number = emitter1.getListenerCount("event1");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num2: number = emitter2.getListenerCount("event1");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
        expect(num2).assertEqual(0);
        done();
      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0700
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0700
     * @tc.desc    offEventData(eventId: string, callback: Callback<EventData>): void;
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0700';
        let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x0000, 'testTag',  `callback eventData success: ${JSON.stringify(eventData)}`);
        }
        let myDate: Record<String, RecordData> = {
          'content': 'event1',
          'id': 1
        }
        let eventData: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x001, 'testTag',  'test case begin');
          emitter1.onEventData("event1", callback);
          emitter2.onEventData("event2", callback);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `onEventData failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        try {
          emitter1.offEventData("event1", callback);
          emitter2.offEventData("event2", callback);
          hilog.info(0x0000, 'testTag','emitter1 off success!');
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `offEventData failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        let num: number = emitter1.getListenerCount("event1");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num2: number = emitter2.getListenerCount("event2");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
        expect(num2).assertEqual(0);
        done();
      })

    /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_Static_0800
     * @tc.name    Sub_Notification_Class_Emitter_Emit_Static_0800
     * @tc.desc    offGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>): void;
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Class_Emitter_Emit_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_Static_0800';
        let eventDataT: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        let callbackT: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            hilog.info(0x0000, 'testTag', TEST_CASE_NAME,
              `callbackT emitter genericEventData: ${JSON.stringify(eventData?.data)}`);
            if (eventData?.data instanceof Sample) {
              const sampleData = eventData.data as Sample;
              sampleData.printCount();
            }
          }
        try {
          hilog.info(0x001, 'testTag',  'test case begin');
          emitter1.onGenericEventData("event1", callbackT);
          emitter2.onGenericEventData("event2", callbackT);
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        try {
          emitter1.offGenericEventData("event1", callbackT);
          emitter2.offGenericEventData("event2", callbackT);
          hilog.info(0x0000, 'testTag', 'emitter1 off success!');
        } catch (err) {
          hilog.info(0x0000, 'testTag',
            `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
          expect().assertFail();
          done();
        }

        let num: number = emitter1.getListenerCount("event1");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num2: number = emitter2.getListenerCount("event2");
        hilog.info(0x000, 'testTag',
          `${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
        expect(num2).assertEqual(0);
        done();
      })
  })
}
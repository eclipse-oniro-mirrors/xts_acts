/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { Callback } from '@kit.BasicServicesKit';

@Sendable
class Sample {
  constructor() {
    this.count = 100;
  }

  printCount() {
    console.info('Print count : ' + this.count);
  }

  count: number;
}

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function ActsNotificationCesMoreInstanceTest() {
  describe('ActsNotificationCesMoreInstanceTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0100
     * @tc.number SUB_Notification_Ces_MoreInstance_0100
     * @tc.desc   Environment adaptation for multiple instances_once/off22 and emit12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0100';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000, 'testTag', `${testNum} ${count} callback eventData success: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000, 'testTag', `${testNum} ${count} callback eventData success: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.emit("eventOnce", eventData);
        emitter2.emit("eventOnce", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce");
        emitter2.off("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0200
     * @tc.number SUB_Notification_Ces_MoreInstance_0200
     * @tc.desc   Environment adaptation for multiple instances (once/off11 and emit12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0200';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000, 'testTag', `${testNum} ${count} callback eventData success: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000, 'testTag', `${testNum} ${count} callback eventData success: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
      }

      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.emit("eventOnce", options, eventData);
        emitter2.emit("eventOnce", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce");
        emitter2.off("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0300
     * @tc.number SUB_Notification_Ces_MoreInstance_0300
     * @tc.desc   Environment adaptation for multiple instances: once/off12 and emit22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0300';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        let eventData: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        count = 0
        emitter1.emit("eventOnce", options, eventData);
        emitter2.emit("eventOnce", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce", callback1);
        emitter2.off("eventOnce", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0400
     * @tc.number SUB_Notification_Ces_MoreInstance_0400
     * @tc.desc   Environment adaptation for multiple instances: once/off12 and emit11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0400', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0400';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
          } else {
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventOnce", eventData);
        emitter2.emit("eventOnce", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce");
        emitter2.off("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0500
     * @tc.number SUB_Notification_Ces_MoreInstance_0500
     * @tc.desc   Environment adaptation for multiple instances _emit/0ff22 and on11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0500', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0500';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId");
        emitter2.off("eventId");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0600
     * @tc.number SUB_Notification_Ces_MoreInstance_0600
     * @tc.desc   Environment adaptation for multiple instances: on/emit12 and off11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0600', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0600';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId");
        emitter2.off("eventId");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0700
     * @tc.number SUB_Notification_Ces_MoreInstance_0700
     * @tc.desc   Environment adaptation for multiple instances: on/emit11 and off12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0700', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0700';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId");
        emitter2.off("eventId");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0800
     * @tc.number SUB_Notification_Ces_MoreInstance_0800
     * @tc.desc   Environment adaptation for multiple instances: on/emit11 and off22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0800', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0800';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId", callback1);
        emitter2.off("eventId", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_0900
     * @tc.number SUB_Notification_Ces_MoreInstance_0900
     * @tc.desc   Environment adaptation for multiple instances: once/emit22 and off11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_0900', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_0900';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventOnce", options, eventData);
        emitter2.emit("eventOnce", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce", callback1);
        emitter2.off("eventOnce", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1000
     * @tc.number SUB_Notification_Ces_MoreInstance_1000
     * @tc.desc   Environment adaptation for multiple instances: once/emit12 and off11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1000', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1000';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        count = 0
        emitter1.emit("eventOnce", eventData);
        emitter2.emit("eventOnce", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce", callback1);
        emitter2.off("eventOnce", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1100
     * @tc.number SUB_Notification_Ces_MoreInstance_1100
     * @tc.desc   Environment adaptation for multiple instances: once/emit11 and off12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1100';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        count = 0
        emitter1.emit("eventOnce", options, eventData);
        emitter2.emit("eventOnce", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce");
        emitter2.off("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1200
     * @tc.number SUB_Notification_Ces_MoreInstance_1200
     * @tc.desc   Environment adaptation for multiple instances: once/emit11 and off22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1200';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.once("eventOnce", callback1);
        emitter2.once("eventOnce", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventOnce");
        let num2: number = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        count = 0
        emitter1.emit("eventOnce", options, eventData);
        emitter2.emit("eventOnce", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventOnce", callback1);
        emitter2.off("eventOnce", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventOnce");
        let num2 = emitter2.getListenerCount("eventOnce");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1300
     * @tc.number SUB_Notification_Ces_MoreInstance_1300
     * @tc.desc   Environment adaptation for multiple instances: emit/0ff11 and on12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1300';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
          }
        }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        count = 0
        emitter1.emit("eventId", options, eventData);
        emitter2.emit("eventId", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId", callback1);
        emitter2.off("eventId", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1400
     * @tc.number SUB_Notification_Ces_MoreInstance_1400
     * @tc.desc   Environment adaptation for multiple instances: emit/0ff12 and on22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1400', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1400';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      let callback2: Callback<emitter.GenericEventData<Sample>> =
        (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(`${testNum} eventData: ${JSON.stringify(eventData?.data)}`);
          if (eventData?.data instanceof Sample) {
            eventData?.data?.printCount();
            expect(JSON.stringify(eventData)).assertEqual('{"data":{"count":100}}');
          }
        }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.GenericEventData<Sample> = {
          data: new Sample()
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId", callback1);
        emitter2.off("eventId", callback2);
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1500
     * @tc.number SUB_Notification_Ces_MoreInstance_1500
     * @tc.desc   Environment adaptation for multiple instances: emit/0ff11 and on11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1500', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1500';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        count = 0
        emitter1.emit("eventId", eventData);
        emitter2.emit("eventId", eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId");
        emitter2.off("eventId");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_1600
     * @tc.number SUB_Notification_Ces_MoreInstance_1600
     * @tc.desc   Environment adaptation for multiple instances: emit/0ff11 and on22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_1600', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_1600';
      let count: number = 0;
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        console.info(`${testNum} eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      try {
        emitter1.on("eventId", callback1);
        emitter2.on("eventId", callback2);
        hilog.info(0x0000, 'testTag', `${testNum} once success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} once failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1: number = emitter1.getListenerCount("eventId");
        let num2: number = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success,num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(1);
        expect(num2).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let eventData: emitter.EventData = {
          data: {
            "content": "content",
            "id": 1,
          }
        };
        let options: emitter.Options = {
          priority: emitter.EventPriority.HIGH
        };
        count = 0
        emitter1.emit("eventId", options, eventData);
        emitter2.emit("eventId", options, eventData);
        hilog.info(0x001, 'testTag', `${testNum} emit case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} emit failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        count = 0
        emitter1.off("eventId");
        emitter2.off("eventId");
        hilog.info(0x001, 'testTag', `${testNum}off case success`);
        count++
        expect(count).assertEqual(1);
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} off failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      await sleep(1000)
      try {
        let num1 = emitter1.getListenerCount("eventId");
        let num2 = emitter2.getListenerCount("eventId");
        hilog.info(0x001, 'testTag', `${testNum} getListenerCount case success:num1:${num1},num2:${num2}`);
        expect(num1).assertEqual(0);
        expect(num2).assertEqual(0);
        done()
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getListenerCount failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
  })
}
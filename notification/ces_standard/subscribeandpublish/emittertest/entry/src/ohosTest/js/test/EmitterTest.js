/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function EmitterTest() {
  describe('SUB_NOTIFICATION_CES_EMITTER_TEST', function () {
    const TAG = 'SUB_NOTIFICATION_CES_EMITTER_TEST ===> '
    console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST START`)

    let innerEvent = {
      eventId: undefined,
      priority: undefined
    }

    let eventData = {
      data: {
        'id': undefined,
        'content': undefined
      }
    }

    /* EmitterCallbackDummy should not be called */
    function EmitterCallbackDummy(eventData) {
      console.info(TAG + 'eventData.id: ' + JSON.stringify(eventData.data.id));
      console.info(TAG + 'eventData.content: ' + JSON.stringify(eventData.data.content));
      expect(eventData.data.content).asertFalse();
    }

    function EmitterCallback(eventData) {
      console.info(TAG + 'eventData.id: ' + JSON.stringify(eventData.data.id));
      console.info(TAG + 'eventData.content: ' + JSON.stringify(eventData.data.content));
      if (eventData.data.id == 0) {
        expect(eventData.data.content).assertEqual('message_0');
      } else if (eventData.data.id == 1) {
        expect(eventData.data.content).assertEqual('message_1');
      } else if (eventData.data.id == 2) {
        expect(eventData.data.content).assertEqual('message_2');
      } else if (eventData.data.id == 3) {
        expect(eventData.data.content).assertEqual('message_3');
      } else if (eventData.data.id == 4) {
        expect(eventData.data.content).assertEqual('message_4');
      } else if (eventData.data.id == 5) {
        expect(eventData.data.content).assertEqual('message_5');
      } else if (eventData.data.id == 6) {
        expect(eventData.data.content).assertEqual('message_6');
      } else if (eventData.data.id == 7) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 8) {
        expect(eventData.data.content).assertEqual('message_8');
      } else if (eventData.data.id == 9) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 10) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 11) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 12) {
        expect(eventData.data.content).assertEqual('message_12');
      } else if (eventData.data.id == 13) {
        expect(eventData.data.content).assertEqual('message_13');
      } else if (eventData.data.id == '1') {
        expect(eventData.data.content).assertEqual('message_14');
      } else if (eventData.data.id == '2') {
        expect(eventData.data.content).assertEqual('message_15');
      } else if (eventData.data.id == '') {
        expect(eventData.data.content).assertEqual('message_16');
      } else if (eventData.data.id == ' ') {
        expect(eventData.data.content).assertEqual('message_17');
      } else if (eventData.data.id == '19') {
        expect(eventData.data.content).assertEqual('19');
      } else if (eventData.data.id == '20') {
        expect(eventData.data.content).assertEqual('20');
      } else if (eventData.data.id == '21') {
        expect(eventData.data.content).assertEqual('message_21');
      }
    }

    /*
     * @tc.number    : Sub_Notification_Emitter_Subscribe_Once_0100
     * @tc.name      : verify on : on(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IDLE
     */
    it('Sub_Notification_Emitter_Subscribe_Once_0100', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0100 START`)
      innerEvent.eventId = 1
      innerEvent.priority = emitter.EventPriority.IDLE

      eventData.data.id = 0
      eventData.data.content = 'message_0'

      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(1)

      innerEvent.priority = emitter.EventPriority.HIGH
      innerEvent.eventId = 1
      eventData.data.id = 1
      eventData.data.content = 'message_1'

      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(1)
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0100 END`)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Emitter_Subscribe_Once_0200
     * @tc.name      : verify on : once(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.LOW
     */
    it('Sub_Notification_Emitter_Subscribe_Once_0200', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0200 START`)
      innerEvent.eventId = 2
      innerEvent.priority = emitter.EventPriority.LOW

      eventData.data.id = 2
      eventData.data.content = 'message_2'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(2)
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0200 END`)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Emitter_Subscribe_Once_0300
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.HIGH
     */
    it('Sub_Notification_Emitter_Subscribe_Once_0300', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0300 START`)
      innerEvent.eventId = 3
      innerEvent.priority = emitter.EventPriority.HIGH

      eventData.data.id = 3
      eventData.data.content = 'message_3'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(3)
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0300 END`)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Emitter_Subscribe_Once_0400
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('Sub_Notification_Emitter_Subscribe_Once_0400', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0400 START`)
      innerEvent.eventId = 4
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 4
      eventData.data.content = 'message_4'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(4)
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0400 END`)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Emitter_Subscribe_Once_0500
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('Sub_Notification_Emitter_Subscribe_Once_0500', Level.LEVEL1, async function (done) {
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0500 START`)
      innerEvent.eventId = 5
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 5
      eventData.data.content = 'message_5'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(5)
      console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_0500 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0600
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0600 START`)
      innerEvent.eventId = 6
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 6
      eventData.data.content = 'message_6'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(6, EmitterCallbackDummy)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0600 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0700
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0700 START`)
      innerEvent.eventId = 7
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 7
      eventData.data.content = 'message_7'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(7, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0700 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0800
     * @tc.name      : verify on: off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0800', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0800 START`)
      innerEvent.eventId = 8
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 8
      eventData.data.content = 'message_8'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(8, EmitterCallbackDummy)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0800 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0900
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0900', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0900 START`)
      innerEvent.eventId = 9
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 9
      eventData.data.content = 'message_9'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(9, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0900 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1000
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1000', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1000 START`)
      innerEvent.eventId = 10
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 10
      eventData.data.content = 'message_10'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(10)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1000 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1100
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1100', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1100 START`)
      innerEvent.eventId = 11
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 11
      eventData.data.content = 'message_11'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(11)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1200
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1200', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1200 START`)
      innerEvent.eventId = 12
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 12
      eventData.data.content = 'message_12'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(1000)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1300
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1300 START`)
      innerEvent.eventId = 13
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 13
      eventData.data.content = 'message_13'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(1000)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1300 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1400
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : Register one string ID
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1400 START`)
      eventData.data.id = '1'
      eventData.data.content = 'message_14'
      emitter.on('1', EmitterCallback)
      expect(emitter.getListenerCount('1')).assertEqual(1);

      emitter.emit('1', eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1400 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1500
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : Register 2 identical string ID
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1500 START`)
      eventData.data.id = '2'
      eventData.data.content = 'message_15'
      emitter.on('2', EmitterCallback)
      emitter.on('2', EmitterCallback)
      expect(emitter.getListenerCount('2')).assertEqual(1);

      emitter.emit('2', eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1500 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1600
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : emitter.on(''),emitter.emit(''),emitter.off('')
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1600 START`)
      eventData.data.id = ''
      eventData.data.content = 'message_16'
      emitter.on('', EmitterCallback)
      expect(emitter.getListenerCount('')).assertEqual(undefined);

      emitter.emit('', eventData)
      emitter.off('');
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1600 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1700
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : emitter.on(' '),emitter.emit(' '),emitter.off(' ')
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1700 START`)
      eventData.data.id = ' '
      eventData.data.content = 'message_17'
      emitter.on(' ', EmitterCallback)
      expect(emitter.getListenerCount(' ')).assertEqual(1);

      emitter.emit(' ', eventData)
      emitter.off(' ');
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1700 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1800
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1800', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1800 START`)
      eventData.data.id = '1'
      eventData.data.content = 'message_14'
      emitter.on('1', EmitterCallback)
      expect(emitter.getListenerCount('1')).assertEqual(1);

      innerEvent.eventId = 1
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 1
      eventData.data.content = 'message_1'
      emitter.on(innerEvent, EmitterCallback)
      expect(emitter.getListenerCount(1)).assertEqual(1);

      emitter.emit('1', eventData)
      emitter.emit(1, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1800 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1900
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1900', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1900 START`)
      eventData.data.id = '19'
      eventData.data.content = 'message_19'
      emitter.on('19', EmitterCallback)
      expect(emitter.getListenerCount('19')).assertEqual(1);

      innerEvent.eventId = 19
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1900 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2000
     * @tc.name      : verify on : on(eventId: string, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2000', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2000 START`)
      innerEvent.eventId = 20
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 20
      eventData.data.content = 'message_20'
      emitter.on(innerEvent, EmitterCallback)
      expect(emitter.getListenerCount(20)).assertEqual(1);

      emitter.emit('20', eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2000 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2100
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2100', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2100 START`)
      innerEvent.eventId = 1
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      emitter.on('22', EmitterCallback)
      emitter.on(innerEvent, EmitterCallback)
      emitter.off('22')
      emitter.off(22)
      expect(emitter.getListenerCount('22')).assertEqual(0)
      expect(emitter.getListenerCount(22)).assertEqual(0)

      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2200
     * @tc.name      : verify on : emit(eventId: string, data?: EventData): void
     * @tc.desc      : emitter.getListenerCount('23')
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2200', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2200 START`)

      emitter.on('23', EmitterCallback)
      emitter.off('23')
      emitter.emit('23')

      expect(emitter.getListenerCount('23')).assertEqual(0)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2300
     * @tc.name      : verify on : emit(eventId: string, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2300 START`)
      innerEvent.eventId = 24
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      emitter.on(innerEvent, EmitterCallback)
      emitter.off('24')
      emitter.emit('24')
      expect(emitter.getListenerCount('24')).assertEqual(0)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2300 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2400
     * @tc.name      : verify on : emit(eventId: string, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2400 START`)
      innerEvent.eventId = 25
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      emitter.on('25', EmitterCallback)
      emitter.off(25)
      emitter.emit(innerEvent)
      expect(emitter.getListenerCount(25)).assertEqual(0)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2400 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2500
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : emitter.getListenerCount('26')
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2500 START`)
      emitter.on('26', EmitterCallback)
      expect(emitter.getListenerCount('26')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2500 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2600
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : Register three identical string ID
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2600 START`)

      emitter.on('27', EmitterCallback)
      emitter.on('27', EmitterCallback)
      emitter.on('27', EmitterCallback)

      emitter.emit('27')
      emitter.emit('27')
      emitter.emit('27')
      expect(emitter.getListenerCount('27')).assertEqual(1)

      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2600 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2700
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : Register three different string ID
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2700 START`)
      emitter.on('280', EmitterCallback)
      emitter.on('281', EmitterCallback)
      emitter.on('282', EmitterCallback)
      emitter.emit('280')
      emitter.emit('281')
      emitter.emit('282')
      expect(emitter.getListenerCount('280')).assertEqual(1)
      expect(emitter.getListenerCount('281')).assertEqual(1)
      expect(emitter.getListenerCount('282')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2700 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2800
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2800', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2800 START`)
      emitter.on('290', EmitterCallback)
      emitter.on('291', EmitterCallback)
      emitter.on('292', EmitterCallback)
      emitter.emit('290')
      emitter.emit('291')
      emitter.emit('292')
      for (let i = 290; i < 293; i++) {
        innerEvent.eventId = i
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        eventData.data.id = i
        eventData.data.content = 'message_29'
        emitter.on(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
      }
      expect(emitter.getListenerCount('290')).assertEqual(1)
      expect(emitter.getListenerCount('291')).assertEqual(1)
      expect(emitter.getListenerCount('292')).assertEqual(1)
      for (let i = 290; i < 293; i++) {
        expect(emitter.getListenerCount(i)).assertEqual(1)
      }
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2800 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_2900
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_2900', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2900 START`)
      emitter.on('300', EmitterCallback)
      emitter.on('301', EmitterCallback)
      emitter.on('302', EmitterCallback)
      emitter.on('303', EmitterCallback)
      emitter.emit('300')
      emitter.emit('301')
      emitter.emit('302')
      emitter.emit('303')
      emitter.off('300');
      emitter.off('301');
      for (let i = 300; i < 304; i++) {
        innerEvent.eventId = i;
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        emitter.on(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
      }
      for (let i = 300; i < 302; i++) {
        emitter.off(i);
      }
      expect(emitter.getListenerCount(300)).assertEqual(0)
      expect(emitter.getListenerCount(303)).assertEqual(1)
      expect(emitter.getListenerCount('300')).assertEqual(0)
      expect(emitter.getListenerCount('303')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2900 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3000
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : priority: emitter.EventPriority.HIGH
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3000', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3100 START`)
      let options = {
        priority: emitter.EventPriority.HIGH
      }
      innerEvent.eventId = 31
      eventData.data.id = 31
      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, options)
      expect(emitter.getListenerCount(null)).assertEqual(undefined)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3100
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : priority: emitter.EventPriority.HIGH
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3100', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3100 START`)
      let options = {
        priority: emitter.EventPriority.HIGH
      }
      innerEvent.eventId = 31
      eventData.data.id = 31
      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, options, null)
      expect(emitter.getListenerCount(31)).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3200
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : The parameter op in Emit is empty
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3200', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3200 START`)
      eventData.data.id = '32'
      eventData.data.content = 'message_32'
      emitter.on('32', EmitterCallback)
      emitter.emit('32', null, eventData)
      expect(emitter.getListenerCount('32')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3300
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3300', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3300 START`)
      for (let i = 330000; i < 340000; i++) {
        innerEvent.eventId = i
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        emitter.on(innerEvent, EmitterCallback)
        emitter.emit(innerEvent)
      }
      for (let i = 330000; i < 340000; i++) {
        expect(emitter.getListenerCount(i)).assertEqual(1)
      }
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3300 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3400
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : Emit and GetListenerCount type is string
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3400', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3400 START`)
      emitter.on('340000', EmitterCallback)
      for (let i = 340000; i < 350000; i++) {
        emitter.emit('340000')
      }
      expect(emitter.getListenerCount('340000')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3400 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3500
     * @tc.name      : verify on : getListenerCount(eventId: number|string): number
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3500', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3500 START`)
      innerEvent.eventId = 35
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      emitter.on(innerEvent, EmitterCallback)
      emitter.on('35', EmitterCallback)
      for (let i = 350000; i < 360000; i++) {
        emitter.emit(innerEvent)
      }
      for (let i = 350000; i < 360000; i++) {
        emitter.emit('35')
      }
      expect(emitter.getListenerCount(35)).assertEqual(1)
      expect(emitter.getListenerCount('35')).assertEqual(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3500 END`)
      done()
    })

    /*
    * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3600
    * @tc.name      : verify on : emit(eventId: string, options: Options, data?: EventData): void
    * @tc.desc      : emitter.EventPriority.IMMEDIATE
    */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3600', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3600 START`)
      innerEvent.eventId = 36
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      let options = {
        priority: emitter.EventPriority.HIGH
      }
      let eventData = {
        data: {
          'content': 'c',
          'id': 36,
        }
      }
      emitter.once('36', EmitterCallback)
      emitter.emit(innerEvent, options)
      expect(emitter.getListenerCount('36')).assertEqual(1)
      emitter.off('36', EmitterCallback)
      emitter.emit(innerEvent, options, eventData)
      expect(emitter.getListenerCount('36')).assertEqual(0)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3600 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_3700
     * @tc.name      : verify on : emit(eventId: string, options: Options, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_3700', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3700 START`)
      innerEvent.eventId = 37
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      let options = {
        priority: emitter.EventPriority.HIGH
      }
      let eventData = {
        data: {
          'content': 'c',
          'id': 37,
        }
      }
      emitter.on(null, null)
      emitter.once('37', EmitterCallback)
      emitter.off('37', EmitterCallback)
      emitter.emit(innerEvent, options, eventData)
      expect(emitter.getListenerCount('37')).assertEqual(0)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_3700 END`)
      done()
    })
    console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST END`)
  })  
}

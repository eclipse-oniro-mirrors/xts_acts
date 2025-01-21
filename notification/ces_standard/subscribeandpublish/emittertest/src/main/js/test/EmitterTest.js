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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

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
      }
    }

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0100
     * @tc.name      : verify on : on(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IDLE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0100 START`)
      innerEvent.eventId = 1
      innerEvent.priority = emitter.EventPriority.IDLE

      eventData.data.id = 0
      eventData.data.content = 'message_0'

      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      eventData.data.id = 1
      eventData.data.content = 'message_1'
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0200
     * @tc.name      : verify on : once(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.LOW
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0200 START`)
      innerEvent.eventId = 2
      innerEvent.priority = emitter.EventPriority.LOW

      eventData.data.id = 2
      eventData.data.content = 'message_2'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0300
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.HIGH
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0300 START`)
      innerEvent.eventId = 3
      innerEvent.priority = emitter.EventPriority.HIGH

      eventData.data.id = 3
      eventData.data.content = 'message_3'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0300 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0400
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0400 START`)
      innerEvent.eventId = 4
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 4
      eventData.data.content = 'message_4'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0400 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0500
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0500 START`)
      innerEvent.eventId = 5
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 5
      eventData.data.content = 'message_5'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(5)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0500 END`)
      done()
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST END`)
  })  
}

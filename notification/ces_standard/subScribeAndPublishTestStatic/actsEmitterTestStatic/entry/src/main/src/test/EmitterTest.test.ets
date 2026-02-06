/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback, RecordData} from '@ohos.base';
import { Component, Driver, ON } from '@ohos.UiTest'
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle_name: string = "com.example.emittertest.static"
let testAbilityContext: common.UIAbilityContext;

let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: undefined
}

export default function EmitterTest() {
  describe('EmitterTest', () => {
    hilog.info(domain, tag, '%{public}s', 'SUB_NOTIFICATION_CES_EMITTER_TEST START');

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Subscribe_Once_Static_0100
     * @tc.number Sub_Notification_Emitter_Subscribe_Once_Static_0100
     * @tc.desc   emitter.EventPriority.IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Emitter_Subscribe_Once_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Emitter_Subscribe_Once_Static_0100'
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0100 START`)
        let innerEvent: emitter.InnerEvent = {
          eventId: 1,
          priority: emitter.EventPriority.IDLE
        }
        let myDate: Record<String, RecordData> = {
          "id": "0",
          "content": "message_0"
        }
        let eventData: emitter.EventData = { data: myDate }
        console.info(`${TAG} myDate:${JSON.stringify(myDate)}`);
        let EmitterCallback = (): void => {
          console.info(`${TAG} eventData0:${JSON.stringify(eventData)}`);
          let eventData_0: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId: String = eventData_0["id"] as String
          if (testId == "0") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0100 Test0 Success`);
            expect(eventData_0["content"]).assertEqual('message_0');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        emitter.off(1)

        innerEvent.priority = emitter.EventPriority.HIGH
        innerEvent.eventId = 1
        let myDate1: Record<String, RecordData> = {
          "id": "1",
          "content": "message_1"
        }
        let eventData1: emitter.EventData = { data: myDate1 }
        let EmitterCallback1: Callback<emitter.EventData> = (eventData1: emitter.EventData) => {
          console.info(`${TAG} eventData1:${JSON.stringify(eventData1)}`);
          let eventData_1: Record<String, RecordData> = eventData1.data as Record<String, RecordData>
          let testId1: String = eventData_1["id"] as String
          if (testId1 == "1") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0100 Test1 Success`);
            expect(eventData_1["content"]).assertEqual('message_1');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.on(innerEvent, EmitterCallback1)
        emitter.emit(innerEvent, eventData1)
        await Utils.msSleep(1000)
        emitter.off(1)
        done()
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0100 END`)
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Subscribe_Once_Static_0200
     * @tc.number Sub_Notification_Emitter_Subscribe_Once_Static_0200
     * @tc.desc   emitter.EventPriority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Emitter_Subscribe_Once_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Emitter_Subscribe_Once_Static_0200'
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0200 START`)
        let innerEvent: emitter.InnerEvent = {
          eventId: 2,
          priority: emitter.EventPriority.LOW
        }

        let myDate: Record<String, RecordData> = {
          "id": "2",
          "content": "message_2"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData2: ${JSON.stringify(eventData)}`);
          let eventData_2: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId2: String = eventData_2["id"] as String
          if (testId2 == "2") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0200 Test Success`);
            expect(eventData_2["content"]).assertEqual('message_2');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.once(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        emitter.off(2)
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0200 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Subscribe_Once_Static_0300
     * @tc.number Sub_Notification_Emitter_Subscribe_Once_Static_0300
     * @tc.desc   emitter.EventPriority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Emitter_Subscribe_Once_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Emitter_Subscribe_Once_Static_0300'
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0300 START`)
        innerEvent.eventId = 3
        innerEvent.priority = emitter.EventPriority.HIGH
        let myDate: Record<String, RecordData> = {
          "id": "3",
          "content": "message_3"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_3: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId3: String = eventData_3["id"] as String
          if (testId3 == "3") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0300 Test Success`);
            expect(eventData_3["content"]).assertEqual('message_3');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }

        emitter.once(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        emitter.off(3)
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0300 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Subscribe_Once_Static_0400
     * @tc.number Sub_Notification_Emitter_Subscribe_Once_Static_0400
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Emitter_Subscribe_Once_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Emitter_Subscribe_Once_Static_0400'
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0400 START`)
        innerEvent.eventId = 4
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "4",
          "content": "message_4"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_4: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId4: String = eventData_4["id"] as String
          if (testId4 == "4") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0400 Test Success`);
            expect(eventData_4["content"]).assertEqual('message_4');
          }else{
            expect(false).assertTrue()
            done()
          }
        }

        emitter.once(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        emitter.off(4)
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0400 END`)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Subscribe_Once_Static_0500
     * @tc.number Sub_Notification_Emitter_Subscribe_Once_Static_0500
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Emitter_Subscribe_Once_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Emitter_Subscribe_Once_Static_0500'
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0500 START`)
        innerEvent.eventId = 5
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "5",
          "content": "message_5"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_5: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId5: String = eventData_5["id"] as String
          if (testId5 == "5") {
            console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0500 Test Success`);
            expect(eventData_5["content"]).assertEqual('message_5');
          }else{
            expect(false).assertTrue()
            done()
          }
        }

        emitter.once(innerEvent, EmitterCallback)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        emitter.off(4)
        console.info(`${TAG} Sub_Notification_Emitter_Subscribe_Once_Static_0500 END`)
        done()
      })
    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 START`)
        innerEvent.eventId = 6
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": "6",
          "content": "message_6"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_6: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId6: String = eventData_6["id"] as String
          if (testId6 == "6") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 Test Success`);
            expect(eventData_6["content"]).assertEqual('message_6');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        let EmitterCallbackDummy: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          let eventData6: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId6_1: String = eventData6["id"] as String
          let content6: string = eventData6["content"] as string
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.id: ' + JSON.stringify(testId6_1));
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.content: ' + JSON.stringify(content6));
          expect(content6).assertFalse();
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off(6, EmitterCallbackDummy)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700 START`)
        innerEvent.eventId = 7
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": "7",
          "content": "message_7"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_7: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId7: String = eventData_7["id"] as String
          if (testId7 == "7") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700 Test Success`);
            expect(eventData_7["content"]).assertEqual('message_7');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        let EmitterCallbackDummy: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          let eventData7: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId7_1: String = eventData7["id"] as String
          let content7: string = eventData7["content"] as string
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.id: ' + JSON.stringify(testId7_1));
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.content: ' + JSON.stringify(content7));
          expect(content7).assertFalse();
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off(7, EmitterCallbackDummy)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0700 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800 START`)
        innerEvent.eventId = 8
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "8",
          "content": "message_8"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_8: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId8: String = eventData_8["id"] as String
          if (testId8 == "8") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800 Test Success`);
            expect(eventData_8["content"]).assertEqual('message_8');
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        let EmitterCallbackDummy: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          let eventData8: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId8_1: String = eventData8["id"] as String
          let content8: string = eventData8["content"] as string
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.id: ' + JSON.stringify(testId8_1));
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.content: ' + JSON.stringify(content8));
          expect(content8).assertFalse();
        }
        emitter.once(innerEvent, EmitterCallback)
        emitter.off(8, EmitterCallbackDummy)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0800 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900 START`)
        innerEvent.eventId = 9
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "9",
          "content": "message_9"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`);
          let eventData_9: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId9: String = eventData_9["id"] as String
          if (testId9 == "9") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900 Test Success`);
            expect(eventData_9["content"]).assertEqual('message_9');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        let EmitterCallbackDummy: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          let eventData9: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId9_1: String = eventData9["id"] as String
          let content9: string = eventData9["content"] as string
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.id: ' + JSON.stringify(testId9_1));
          console.info('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0600 eventData.content: ' + JSON.stringify(content9));
          expect(content9).assertFalse();
        }
        emitter.once(innerEvent, EmitterCallback)
        emitter.off(9, EmitterCallbackDummy)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_0900 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000 START`)
        innerEvent.eventId = 10
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": "10",
          "content": "message_10"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`)
          let eventData_10: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId10: String = eventData_10["id"] as String
          console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000 Test Success`);
          expect(eventData_10["content"]).assertEqual('message_10');
          done()
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off(10)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1000 END`)
        done()
      })
    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100 START`)
        innerEvent.eventId = 11
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": "11",
          "content": "message_11"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`)
          let eventData_11: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId11: String = eventData_11["id"] as String
          if (testId11 == "11") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100 Test Success`);
            expect(eventData_11["content"]).assertEqual('message_11');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.once(innerEvent, EmitterCallback)
        emitter.off(11)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1100 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200 START`)
        innerEvent.eventId = 12
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "12",
          "content": "message_12"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`)
          let eventData_12: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId12: String = eventData_12["id"] as String
          if (testId12 == "12") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200 Test Success`);
            expect(eventData_12["content"]).assertEqual('message_12');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off(1000)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1200 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300 START`)
        innerEvent.eventId = 13
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate: Record<String, RecordData> = {
          "id": "13",
          "content": "message_13"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG} eventData: ${JSON.stringify(eventData)}`)
          let eventData_13: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId13: String = eventData_13["id"] as String
          if (testId13 == "13") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300 Test Success`);
            expect(eventData_13["content"]).assertEqual('message_13');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off(1000)
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1300 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1400
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1400
     * @tc.desc   Register one string ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1400'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1400 START`)
        let myDate: Record<String, RecordData> = {
          "id": "1",
          "content": "message_14"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG}` + ' on success');
          let eventData_14: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId14: String = eventData_14["id"] as String
          if (testId14 == "1") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1400 Test Success`);
            expect(eventData_14["content"]).assertEqual('message_14');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.onEventData('1', EmitterCallback)
        expect(emitter.getListenerCount('1')).assertEqual(1);

        emitter.emit('1', eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1400 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1500
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1500
     * @tc.desc   Register 2 identical string ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1500'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1500 START`)
        let myDate: Record<String, RecordData> = {
          "id": '2',
          "content": "message_15"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG}` + ' on success');
          let eventData_15: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId15: String = eventData_15["id"] as String
          if (testId15 == "2") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1500 Test Success`);
            expect(eventData_15["content"]).assertEqual('message_15');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
          console.info(`${TAG}` + ' test case end');
        }
        emitter.onEventData('2', EmitterCallback)
        emitter.onEventData('2', EmitterCallback)
        expect(emitter.getListenerCount('2')).assertEqual(1);

        emitter.emit('2', eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1500 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600
     * @tc.desc   emitter.onEventData(''),emitter.emit(''),emitter.off('')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600 START`)
    
        let myDate: Record<String, RecordData> = {
          "id": '',
          "content": "message_16"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(`${TAG}` + ' on success');
           let eventData_16: Record<String, RecordData> = eventData.data as Record<String, RecordData>
              let testId16: String = eventData_16["id"] as String
              if (testId16 == "") {
                console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600 Test Success`);
                expect(eventData_16["content"]).assertEqual('message_16');
                done()
              }else{
                expect(false).assertTrue()
                done()
              }
          console.info(`${TAG}` + ' test case end');
    
        }
        emitter.onEventData('', EmitterCallback)
        expect(emitter.getListenerCount('')).assertEqual(0);
    
        emitter.emit('', eventData)
        emitter.off('');
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1600 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1700
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1700
     * @tc.desc   emitter.onEventData(' '),emitter.emit(' '),emitter.off(' ')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1700'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1700 START`)

        let myDate: Record<String, RecordData> = {
          "id": ' ',
          "content": "message_17"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          let eventData_17: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId17: String = eventData_17["id"] as String
          if (testId17 == " ") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1700 Test Success`);
            expect(eventData_17["content"]).assertEqual('message_17');
            done()
          }else{
            expect(false).assertTrue()
            done()
          }
          console.info(`${TAG}` + ' test case end');
        }
        emitter.onEventData(' ', EmitterCallback)
        expect(emitter.getListenerCount(' ')).assertEqual(1);

        emitter.emit(' ', eventData)
        await Utils.msSleep(1000)
        emitter.off(' ');
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1700 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1800
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1800
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1800'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1800 START`)

        let myDate18: Record<String, RecordData> = {
          "id": '14',
          "content": "message_14"
        }
        let eventData: emitter.EventData = { data: myDate18 }

        let EmitterCallback = (): void => {
          console.info(`${TAG}  on success`);
          let eventData_14: Record<String, RecordData> = eventData.data as Record<String, RecordData>
          let testId14: String = eventData_14["id"] as String
          if (testId14 == "14") {
            console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1800 Test Success`);
            expect(eventData_14["content"]).assertEqual('message_14');
          } else{
            expect(false).assertTrue()
            done()
          }
        }
        emitter.onEventData('14', EmitterCallback)
        console.info(` ${TAG} test getListenerCount 14  ` + emitter.getListenerCount('14'));
        expect(emitter.getListenerCount('14')).assertEqual(1);

        innerEvent.eventId = 14
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        let myDate18_1: Record<String, RecordData> = {
          "id": '14',
          "content": "message_14"
        }
        let eventData18_1: emitter.EventData = { data: myDate18_1 }

        emitter.on(innerEvent, EmitterCallback)
        console.info(` ${TAG} test getListenerCount 14 ` + emitter.getListenerCount(14));
        expect(emitter.getListenerCount(14)).assertEqual(1);

        emitter.emit('14', eventData)
        emitter.emit(innerEvent, eventData18_1)
        await Utils.msSleep(2000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1800 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1900
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1900
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_1900'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1900 START`)
        let myDate: Record<String, RecordData> = {
          "id": '19',
          "content": "message_19"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback = (): void => {
          console.info(` ${TAG} on success`);
          expect(false).assertTrue();
          console.info(` ${TAG} test case end`);
          done()
        }
        emitter.onEventData('19', EmitterCallback)
        expect(emitter.getListenerCount('19')).assertEqual(1);

        innerEvent.eventId = 19
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        emitter.emit(innerEvent, eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1900 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2000
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2000
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2000'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2000 START`)
        innerEvent.eventId = 20
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": '20',
          "content": "message_20"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          expect(false).assertTrue();
          console.info(`${TAG}` + ' test case end');
          done();
        }
        emitter.on(innerEvent, EmitterCallback)
        expect(emitter.getListenerCount(innerEvent.eventId)).assertEqual(1);

        emitter.emit('20', eventData)
        await Utils.msSleep(1000)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2000 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2100
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2100
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2100';
        let EmitterCallback1 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' test case end');
          done()
        }

        let EmitterCallback2 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' test case end');
          done()
        }

        innerEvent.eventId = 1
        innerEvent.priority = emitter.EventPriority.IMMEDIATE

        emitter.onEventData('22', EmitterCallback1)
        emitter.on(innerEvent, EmitterCallback2)
        emitter.off('22')
        emitter.off(22)
        expect(emitter.getListenerCount('22')).assertEqual(0)
        expect(emitter.getListenerCount(22)).assertEqual(0)
        await Utils.msSleep(1000)
        console.info(`${tag} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2100 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2200
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2200
     * @tc.desc   emitter.getListenerCount('23')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2200'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2200 START`)
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          expect(false).assertTrue();
          console.info(`${TAG}` + ' test case end');
          done();
        }
        emitter.onEventData('23', EmitterCallback)
        emitter.off('23')
        emitter.emit('23')
        await Utils.msSleep(1000)
        expect(emitter.getListenerCount('23')).assertEqual(0)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2200 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2300
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2300
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2300'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2300 START`)
        innerEvent.eventId = 24
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          expect(false).assertTrue();
          console.info(`${TAG}` + ' test case end');
          done();
        }
        emitter.on(innerEvent, EmitterCallback)
        emitter.off('24')
        emitter.emit('24')
        await Utils.msSleep(1000)
        expect(emitter.getListenerCount('24')).assertEqual(0)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2300 END`)
        await Utils.msSleep(1000)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2400
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2400
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2400'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2400 START`)
        innerEvent.eventId = 25
        innerEvent.priority = emitter.EventPriority.IMMEDIATE
        let myDate: Record<String, RecordData> = {
          "id": '25',
          "content": "message_25"
        }
        let eventData: emitter.EventData = { data: myDate }
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          expect(false).assertTrue();
          console.info(`${TAG}` + ' test case end');
          done();
        }
        emitter.onEventData('25', EmitterCallback)
        emitter.off(25)
        emitter.emit(innerEvent)
        await Utils.msSleep(1000)
        expect(emitter.getListenerCount(25)).assertEqual(0)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2400 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2500
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2500
     * @tc.desc   emitter.getListenerCount('26')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2500'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2500 START`)
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
          expect(false).assertTrue();
          console.info(`${TAG}` + ' test case end');
          done();
        }
        emitter.onEventData('26', EmitterCallback)
        await Utils.msSleep(1000)
        expect(emitter.getListenerCount('26')).assertEqual(1)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2500 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2600
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2600
     * @tc.desc   Register three identical string ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2600'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2600 START`)
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
        }
        emitter.onEventData('27', EmitterCallback)
        emitter.onEventData('27', EmitterCallback)
        emitter.onEventData('27', EmitterCallback)

        emitter.emit('27')
        emitter.emit('27')
        emitter.emit('27')
        await Utils.msSleep(2000)
        expect(emitter.getListenerCount('27')).assertEqual(1)

        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2600 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2700
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2700
     * @tc.desc   Register three different string ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2700'
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2700 START`)
        let EmitterCallback = () => {
          console.info(`${TAG}` + ' on success');
        }
        emitter.onEventData('280', EmitterCallback)
        emitter.onEventData('281', EmitterCallback)
        emitter.onEventData('282', EmitterCallback)
        emitter.emit('280')
        emitter.emit('281')
        emitter.emit('282')
        await Utils.msSleep(2000)
        expect(emitter.getListenerCount('280')).assertEqual(1)
        expect(emitter.getListenerCount('281')).assertEqual(1)
        expect(emitter.getListenerCount('282')).assertEqual(1)
        console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_2700 END`)
        await Utils.msSleep(2000)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      let TEST_CASE_NAME: string = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600'
      console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600 START`)
      innerEvent.eventId = 36
      innerEvent.priority = emitter.EventPriority.IMMEDIATE
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      }
      let myDate: Record<String, RecordData> = {
        "id": 36,
        "content": 'c'
      }
      let eventData: emitter.EventData = { data: myDate }
      let EmitterCallback = (): void => {
        console.info(`${TEST_CASE_NAME}` + ' once success');
        expect(false).assertTrue();
        console.info(`${TEST_CASE_NAME}` + ' test case end');
        done()
      }
      emitter.once(innerEvent, EmitterCallback)
      await Utils.msSleep(1000)
      emitter.emit("36", options, eventData)
      await Utils.msSleep(1000)
      console.info(`${TEST_CASE_NAME}  ` + emitter.getListenerCount(innerEvent.eventId));
      let num: number = emitter.getListenerCount(innerEvent.eventId)
      expect(num).assertEqual(1)
      emitter.off(innerEvent.eventId, EmitterCallback)
      await Utils.msSleep(1000)
      emitter.emit("36", options, eventData)
      console.info(`${TEST_CASE_NAME}  ` + emitter.getListenerCount(innerEvent.eventId));
      let num2: number = emitter.getListenerCount(innerEvent.eventId)
      expect(num2).assertEqual(0)
      console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3600 END`)
      done()
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800';
        console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800 START`)
        let EmitterCallback1 = () => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on1 success');
        }
        let EmitterCallback2 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on2 success');
        }
        let EmitterCallback3 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on3 success');
        }
        emitter.onEventData('290', EmitterCallback1)
        emitter.onEventData('291', EmitterCallback2)
        emitter.onEventData('292', EmitterCallback3)
        emitter.emit('290')
        emitter.emit('291')
        emitter.emit('292')
        await Utils.msSleep(1000)
        for (let i: long = 290; i < 293; i++) {
          innerEvent.eventId = i
          innerEvent.priority = emitter.EventPriority.IMMEDIATE
          let myDate: Record<String, RecordData> = {
            "id": i,
            "content": "message_29"
          }
          let eventData: emitter.EventData = { data: myDate }
          let EmitterCallback = (): void => {
            hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success');
          }
          emitter.on(innerEvent, EmitterCallback)
          emitter.emit(innerEvent, eventData)
          await Utils.msSleep(1000)
        }
        expect(emitter.getListenerCount('290')).assertEqual(1)
        expect(emitter.getListenerCount('291')).assertEqual(1)
        expect(emitter.getListenerCount('292')).assertEqual(1)
        for (let i: long = 290; i < 293; i++) {
          expect(emitter.getListenerCount(i)).assertEqual(1)
        }
        console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2800 END`)
        done()
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(` SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900 START`)
        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900';
        let EmitterCallback1 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on1 success');
        }
        let EmitterCallback2 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on2 success');
        }
        let EmitterCallback3 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on3 success');
        }
        let EmitterCallback4 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on4 success');
        }
        emitter.onEventData('300', EmitterCallback1)
        emitter.onEventData('301', EmitterCallback2)
        emitter.onEventData('302', EmitterCallback3)
        emitter.onEventData('303', EmitterCallback4)
        emitter.emit('300')
        emitter.emit('301')
        emitter.emit('302')
        emitter.emit('303')
        await Utils.msSleep(1000)
        emitter.off('300');
        emitter.off('301');

        for (let i: long = 300; i < 304; i++) {
          let innerEvent: emitter.InnerEvent = {
            eventId: i,
            priority: emitter.EventPriority.IMMEDIATE
          }
          let myDate: Record<String, RecordData> = {
            "id": i,
            "content": "message_30"
          }
          let eventData: emitter.EventData = { data: myDate }
          let EmitterCallback = (): void => {
            hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success' + i);
          }
          emitter.on(innerEvent, EmitterCallback)
          emitter.emit(innerEvent, eventData)
          await Utils.msSleep(1000)
        }
        for (let i = 300; i < 302; i++) {
          emitter.off(i);
        }
        await Utils.msSleep(1000)
        expect(emitter.getListenerCount(300)).assertEqual(0)
        expect(emitter.getListenerCount(303)).assertEqual(1)
        expect(emitter.getListenerCount('300')).assertEqual(0)
        expect(emitter.getListenerCount('303')).assertEqual(1)
        console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_2900 END`)
        done()
      })


    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3300
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3300
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3300 START`)
        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3300';
        let count: int = 0;

        for (let i: long = 3300; i < 3310; i++) {
          let innerEvent: emitter.InnerEvent = {
            eventId: i,
            priority: emitter.EventPriority.IMMEDIATE
          }
          let EmitterCallback = (): void => {
            hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success');
            count ++;
            if (count == 10) {
              for (let i: long = 3300; i < 3310; i++) {
                expect(emitter.getListenerCount(i)).assertEqual(1)
              }
              done()
            }
          }
          emitter.on(innerEvent, EmitterCallback)
          emitter.emit(innerEvent)
        }
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3400
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3400
     * @tc.desc   Emit and GetListenerCount type is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(`SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3400 START`)
        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3400';
        let countEmit: int = 0;
        let EmitterCallback = (): void => {
          countEmit++;
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on success countEmit = ' + countEmit);
          if (countEmit == 10) {
            expect(emitter.getListenerCount("3400")).assertEqual(1);
            done()
          }
        }
        emitter.onEventData("3400", EmitterCallback)
        for (let i: number = 3400; i < 3410; i++) {
          emitter.emit("3400")
        }
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500
     * @tc.number SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500
     * @tc.desc   emitter.EventPriority.IMMEDIATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(`${tag} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500 START`)
        const TEST_CASE_NAME = 'SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500';
        let count1:int = 0;
        let count2:int = 0;
        let innerEvent: emitter.InnerEvent = {
          eventId: 35,
          priority: emitter.EventPriority.IMMEDIATE
        }
        let EmitterCallback1 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on1 success');
          count1++;
          if(count1 == 10 &&count2 == 10 ){
            expect(emitter.getListenerCount(innerEvent.eventId)).assertEqual(1)
            expect(emitter.getListenerCount("35")).assertEqual(1)
            console.info(`${tag} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500 END`)
            done()
          }
        }
        let EmitterCallback2 = (): void => {
          hilog.info(0x000, `${tag}`, `${TEST_CASE_NAME}` + ' on2 success');
          count2++;
          if(count1 == 10 &&count2 == 10 ){
            expect(emitter.getListenerCount(innerEvent.eventId)).assertEqual(1)
            expect(emitter.getListenerCount("35")).assertEqual(1)
            console.info(`${tag} SUB_NOTIFICATION_CES_EMITTER_TEST_Static_3500 END`)
            done()
          }
        }
        emitter.on(innerEvent, EmitterCallback1)
        emitter.onEventData("35", EmitterCallback2)
        for (let i: number = 3500; i < 3510; i++) {
          emitter.emit(innerEvent)
        }
        for (let i: number = 3500; i < 3510; i++) {
          emitter.emit("35")
        }
      })

  

    hilog.info(domain, tag, '%{public}s', ` SUB_NOTIFICATION_CES_EMITTER_TEST END`)
  })
}

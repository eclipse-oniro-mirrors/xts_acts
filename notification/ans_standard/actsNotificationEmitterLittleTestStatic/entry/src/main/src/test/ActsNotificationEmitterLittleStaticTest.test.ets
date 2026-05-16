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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
import { emitter } from '@kit.BasicServicesKit';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import {RecordData } from '@ohos.base';

const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationemitterstatictest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
class Sample {
  constructor() {
    this.count = 100;
  }
  printCount() {
    console.info('Print count : ' + this.count);
  }
  count: number;
}
export default function ActsNotificationEmitterLittleStaticTest(): void {
  const TEST_Project_NAME = 'ActsNotificationEmitterLittleStaticTest';
  describe('ActsNotificationEmitterLittleStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationemitterstatictest.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
      let setNotificationEnableCallback = (error: Error | null) => {
        let err:BusinessError=error as BusinessError
        if (error) {
          console.error(`setNotificationEnable failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("setNotificationEnable success");
        }
      }
      let bundle: notificationManager.BundleOption = {
        bundle: "com.example.actsnotificationemitterstatictest.static",
      };
      notificationManager.setNotificationEnable(bundle, true, setNotificationEnableCallback);
    });

    beforeEach(async() => {
      console.info(`${TAG} afterEach START`)
      notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err:BusinessError=e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0100
     * @tc.number SUB_Notification_Ans_Emitter_Static_0100
     * @tc.desc   Call the emitter.emit(eventId: string) API to publish an event eventid, and then call the emitter.onEventData(eventId: string, callback: Callback<EventData>) API to subscribe to the event without a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0100';
      let num:int=0
      let callback= (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num} onCallback eventData: ${JSON.stringify(eventData)}`);
        expect(false).assertTrue();
        done();
      }
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0200
     * @tc.number SUB_Notification_Ans_Emitter_Static_0200
     * @tc.desc   Call the emitter.emit(eventId: string) API to publish an event eventid, and then call the emitter.onEventData(eventId: string, callback: Callback<EventData>) API to subscribe to the event without a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0200';
      let num:int=0
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let eventId:string='1'
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}${num}GenericEventData: ${JSON.stringify(eventData.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"count":100}');
      }
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0300
     * @tc.number SUB_Notification_Ans_Emitter_Static_0300
     * @tc.desc   Call the emitter.emit(eventId: string) API to publish an event eventid, and then call the emitter.onEventData(eventId: string, callback: Callback<EventData>) API to subscribe to the event without a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0300';
      let num:int=0
      let callback= (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num} onCallback eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData)).assertEqual('{"data":{"content":"content","id":1}}');
      }
      let eventId:string='1'
      let record: Record<string, RecordData> = {
        "content": "content",
        "id": 1,
      };
      let eventData: emitter.EventData = {
        data: record
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0400
     * @tc.number SUB_Notification_Ans_Emitter_Static_0400
     * @tc.desc   The eventid is registered by calling the onEventData(eventId: string, callback: Callback<EventData>) API, and the event is successfully published by calling the emit(eventId: string): void API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0400';
      let num:int=0
      let callback= (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num} onCallback eventData: ${JSON.stringify(eventData)}`);
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0500
     * @tc.number SUB_Notification_Ans_Emitter_Static_0500
     * @tc.desc   Call the emitter.emit(eventId: string) API to publish an event eventid, and then call the emitter.onEventData(eventId: string, callback: Callback<EventData>) API to subscribe to the event without a callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0500';
      let num:int=0
      let callback= (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num} onCallback eventData: ${JSON.stringify(eventData)}`);
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId, options);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0600
     * @tc.number SUB_Notification_Ans_Emitter_Static_0600
     * @tc.desc   Invoke the onEventData(eventId: string, callback: Callback<EventData>) interface to register the event ID. Invoke the emit(eventId: string, options: Options, data: EventData): void interface to release the event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0600';
      let num:int=0
      let callback= (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num} onCallback eventData: ${JSON.stringify(eventData)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"content":"content","id":1}');
      }
      let eventId:string='1'
      let record: Record<string, RecordData> = {
        "content": "content",
        "id": 1,
      };
      let eventData: emitter.EventData = {
        data: record
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0700
     * @tc.number SUB_Notification_Ans_Emitter_Static_0700
     * @tc.desc   The eventid is registered by calling the onGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>) API. The event is successfully published by calling emit(eventId: string): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0700';
      let num:int=0
      let eventId:string='1'
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0800
     * @tc.number SUB_Notification_Ans_Emitter_Static_0800
     * @tc.desc   The event ID is registered by calling onGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>). The event is successfully published when emit(eventId: string, options: Options): void is called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0800';
      let num:int=0
      let eventId:string='1'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_0900
     * @tc.number SUB_Notification_Ans_Emitter_Static_0900
     * @tc.desc   Invoke the onGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>) interface to register the event ID. Invoke the emit<T>(eventId: string, data: GenericEventData<T>): void interface to release the event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_0900';
      let num:int=0
      let eventId:string='1'
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"count":100}');
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1000
     * @tc.number SUB_Notification_Ans_Emitter_Static_1000
     * @tc.desc   Invoke the onGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>) interface to register the event ID. Invoke the emit<T>(eventId: string, options: Options, data: GenericEventData<T>): void interface to release the event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1000';
      let num:int=0
      let eventId:string='1'
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"count":100}');
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'on callback begin');
          emitter.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'on callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1100
     * @tc.number SUB_Notification_Ans_Emitter_Static_1100
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string): void API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1100';
      let num:int=0
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num}data type: ${typeof eventData.data} ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1200
     * @tc.number SUB_Notification_Ans_Emitter_Static_1200
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string, data: EventData) API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1200';
      let num:int=0
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num}data type: ${typeof eventData.data} ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"content":"content","id":1}');
      }
      let record: Record<string, RecordData> = {
        "content": "content",
        "id": 1,
      };
      let eventData: emitter.EventData = {
        data: record
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1300
     * @tc.number SUB_Notification_Ans_Emitter_Static_1300
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string, options: Options): void API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1300';
      let num:int=0
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num}data type: ${typeof eventData.data} ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1400
     * @tc.number SUB_Notification_Ans_Emitter_Static_1400
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string, options: Options, data: EventData): void API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1400';
      let num:int=0
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num++
        console.info(`${testNum}${num}data type: ${typeof eventData.data} ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"content":"content","id":1}');
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let record: Record<string, RecordData> = {
        "content": "content",
        "id": 1,
      };
      let eventData: emitter.EventData = {
        data: record
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1500
     * @tc.number SUB_Notification_Ans_Emitter_Static_1500
     * @tc.desc   The onceGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>) API is called to register the event ID, and the emit(eventId: string): void API is called to successfully publish the event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1500';
      let num:int=0
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1600
     * @tc.number SUB_Notification_Ans_Emitter_Static_1600
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string, data: EventData) API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1600';
      let num:int=0
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(num).assertEqual(1);
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1700
     * @tc.number SUB_Notification_Ans_Emitter_Static_1700
     * @tc.desc   Invoke the onceGenericEventData<T>(eventId: string, callback: Callback<GenericEventData<T>>) interface to register the event ID. Invoke the emit<T>(eventId: string, data: GenericEventData<T>): void interface to release the event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1700';
      let num:int=0
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"count":100}');
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Emitter_Static_1800
     * @tc.number SUB_Notification_Ans_Emitter_Static_1800
     * @tc.desc   The onceEventData(eventId: string, callback: Callback<EventData>) API is called to register an event ID, and the emit(eventId: string, options: Options, data: EventData): void API is called to successfully publish an event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Emitter_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Emitter_Static_1800';
      let num:int=0
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num++
        console.info(`${testNum}GenericEventData: ${JSON.stringify(eventData?.data)}`);
        expect(JSON.stringify(eventData?.data)).assertEqual('{"count":100}');
        let storage: Sample = eventData.data! as Sample;
        storage.printCount();
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let eventId:string='1'
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter.emit(eventId,options,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          let count = emitter.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'getListenerCount '+count+' off callback success');
          expect(count).assertEqual(0);
          done()
        } catch (error) {
        let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let err:BusinessError=error as BusinessError
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}

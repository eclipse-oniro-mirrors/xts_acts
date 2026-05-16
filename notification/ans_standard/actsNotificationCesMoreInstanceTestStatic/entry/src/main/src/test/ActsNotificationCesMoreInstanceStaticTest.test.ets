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
import UIAbility from '@ohos.app.ability.UIAbility';
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
import { abilityAccessCtrl, bundleManager, bundleResourceManager, installer } from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { RecordData } from '@ohos.base'
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationcesmoreinstancestatictest.static"
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
export default function ActsNotificationCesMoreInstanceStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationCesMoreInstanceStaticTest';
  describe('ActsNotificationCesMoreInstanceStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationcesmoreinstancestatictest.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
      let setNotificationEnableCallback = (err: BusinessError | null) => {
        if (err) {
          console.error(`setNotificationEnable failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("setNotificationEnable success");
        }
      }
      let bundle: notificationManager.BundleOption = {
        bundle: "com.example.actsnotificationcesmoreinstancestatictest.static",
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
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0100
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0100
     * @tc.desc   1.2 Adapted APIs of different versions to multiple instances (on/off22 and emit12) in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0100';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
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
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId,eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId,eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0200
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0200
     * @tc.desc   1.2 Adapted APIs of different versions to multiple instances (on/off22 and emit12) in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0200';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId,options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId,options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0300
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0300
     * @tc.desc   1.2 Adaptation of APIs of Different Versions to Multiple Instances (on/off12 and emit22) in the Environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0300';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);;
      }
      let eventId:string='1'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId,options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId,options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId, callback);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0400
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0400
     * @tc.desc   1.2 Adaptation of APIs of Different Versions to Multiple Instances (on/off12 and emit22) in the Environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0400';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);;
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
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId, callback);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0500
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0500
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_once/emit22) and off11 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0500';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
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
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onceEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.offEventData(eventId, callback);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0600
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0600
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_once/emit12) and off11 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0600';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0700
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0700
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_once/emit11) and off12 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0700';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOnce: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let callbackOff: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
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
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceEventData(eventId, callbackOnce);
          await Utils.msSleep(500)
          emitter2.onceEventData(eventId, callbackOnce);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId, callbackOff);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId, callbackOff);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0800
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0800
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_once/emit11) and off22 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0800';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOnce: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
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
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceEventData(eventId, callbackOnce);
          await Utils.msSleep(500)
          emitter2.onceEventData(eventId, callbackOnce);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_0900
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_0900
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_on/emit12) and off11 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_0900';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1000
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1000
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_on/emit22) and off11 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1000';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
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
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1100
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1100
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_on/emit11) and off12 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1100';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOn: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let callbackOff: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
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
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.onEventData(eventId, callbackOn);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId,callbackOff);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId,callbackOff);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(1);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(1);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1200
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1200
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_on/emit11) and off22 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1200';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOn: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
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
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.onEventData(eventId, callbackOn);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.off(eventId);
          await Utils.msSleep(500)
          emitter2.off(eventId);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1300
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1300
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_emit/Off11) and once22 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1300';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOn: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
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
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.onceEventData(eventId, callbackOn);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, options, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, options, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.offEventData(eventId, callbackOn);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1400
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1400
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_emit/Off12) and once22 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1400';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId, callback);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1500
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1500
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_emit/Off22) and once11 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1500';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callbackOn: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        num=0
        console.info(testNum+`eventData: ${JSON.stringify(eventData)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
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
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.onceEventData(eventId, callbackOn);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offEventData(eventId, callbackOn);
          await Utils.msSleep(500)
          emitter2.offEventData(eventId, callbackOn);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Notification_Ces_MoreInstance_Static_1600
     * @tc.number SUB_Notification_Ces_MoreInstance_Static_1600
     * @tc.desc   1.2 Adaptation of APIs of different versions to multiple instances (_emit/Off22) and once12 in the environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ces_MoreInstance_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ces_MoreInstance_Static_1600';
      let num:int=0
      let emitter1 = new emitter.Emitter();
      let emitter2 = new emitter.Emitter();
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        num=0
        console.info(testNum+`GenericEventData: ${JSON.stringify(eventData?.data)}`);
        num++
        expect(num).assertEqual(1);
      }
      let eventId:string='1'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      try {
        try{
          hilog.info(0x001, `${TAG}`, testNum+'once callback begin');
          emitter1.onceGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.onceGenericEventData(eventId, callback);
          hilog.info(0x001, `${TAG}`, testNum+'once callback success');
          let count1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+count1+' off callback success');
          expect(count1).assertEqual(1);
          let count2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+count2+' off callback success');
          expect(count2).assertEqual(1);
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'emit callback begin');
          emitter1.emit(eventId, eventData);
          await Utils.msSleep(500)
          emitter2.emit(eventId, eventData);
          hilog.info(0x001, `${TAG}`, testNum+'emit callback success');
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        await Utils.msSleep(2000)
        try{
          hilog.info(0x001, `${TAG}`, testNum+'off callback begin');
          emitter1.offGenericEventData(eventId, callback);
          await Utils.msSleep(500)
          emitter2.offGenericEventData(eventId, callback);
          let countOff1 = emitter1.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'off callback success');
          hilog.info(0x001, `${TAG}`, testNum+'emitter1 getListenerCount '+countOff1+' off callback success');
          expect(countOff1).assertEqual(0);
          let countOff2 = emitter2.getListenerCount(eventId);
          hilog.info(0x001, `${TAG}`, testNum+'emitter2 getListenerCount '+countOff2+' off callback success');
          expect(countOff2).assertEqual(0);
          done()
        } catch(err){
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}

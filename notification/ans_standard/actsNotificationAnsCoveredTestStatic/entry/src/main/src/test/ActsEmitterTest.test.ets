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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
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
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';

const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.hitsnotificationpriorityrefactortest.static"
let testAbilityContext: common.UIAbilityContext;
let subscriber: commonEventManager.CommonEventSubscriber; //用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: undefined
}
let count :int = 0
class Sample {
  constructor() {
    this.count = 100;
  }

  printCount() {
    console.info('Print count : ' + this.count);
  }

  count: number;
}

export default function actsEmitterTest() {
  const TEST_Project_NAME = 'actsEmitterTest';
  describe('actsEmitterTest', () => {

    afterEach(async () => {
      await Utils.msSleep(1000)
    })
    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_1800
     * @tc.number Sub_Notification_Ans_Emitter_Static_1800
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Emitter_Static_1800'
        //调用持续订阅指定事件接口
        let result: number = 0

        let callback1 = (eventData: emitter.GenericEventData<Sample>): void => {
          let storage: Sample = eventData.data! as Sample;
          storage.printCount();
          console.info(TAG + ' on GenericEventData' + result);
          console.info(TAG + ' on GenericEventData' + eventData);
          let data: Sample = eventData?.data as Sample;
          expect(data?.count).assertEqual(100);
          result += 1
        }
        emitter.onGenericEventData<Sample>("", callback1);
        let a = new Sample();
        let eventData: emitter.GenericEventData<Sample> = { data: a };
        emitter.emit<Sample>("", eventData);
        console.info(TAG + ' emitterEmit success');
        //等待5s
        await Utils.msSleep(1000)
        emitter.off("");
        console.info(TAG + ' emitterOff success');
        //继续发事件
        emitter.emit<Sample>("eventId111", eventData);
        console.info(TAG + ' emitterEmit success 取消后');
        await Utils.msSleep(5000)
        expect(result).assertEqual(0)
        done();
        console.info(`${TAG} Sub_Notification_Ans_Emitter_Static_1800 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_1900
     * @tc.number Sub_Notification_Ans_Emitter_Static_1900
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_1900==>'
        let onConsume_number: number = 0

        let callback: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            console.info(Tag + ' on GenericEventData');
            let storage: Sample = eventData.data! as Sample;
            storage.printCount();
            onConsume_number += 1
            console.info(Tag + ' on GenericEventData' + eventData);
            let data: Sample = eventData?.data as Sample;
            expect(data?.count).assertEqual(100);
          }
        emitter.onceGenericEventData<Sample>("eventId333", callback);
        await Utils.msSleep(100)
        let a = new Sample();
        let eventData: emitter.GenericEventData<Sample> = { data: a };
        let options: emitter.Options = {
          priority: emitter.EventPriority.IDLE
        }
        emitter.emit<Sample>("eventId333", options, eventData);
        console.info(Tag + 'emitterEmit success');
        await Utils.msSleep(1000)
        expect(onConsume_number).assertEqual(1)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2000
     * @tc.number Sub_Notification_Ans_Emitter_Static_2000
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_2000==>'
        let onConsume_number: number = 0

        let callback: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            console.info(Tag + ' on GenericEventData');
            let storage: Sample = eventData.data! as Sample;
            storage.printCount();
            onConsume_number += 1
            console.info(Tag + ' on GenericEventData' + eventData);
            let data: Sample = eventData?.data as Sample;
            expect(data?.count).assertEqual(100);
          }
        emitter.onceGenericEventData<Sample>("eventId333", callback);
        await Utils.msSleep(100)
        let a = new Sample();
        let eventData: emitter.GenericEventData<Sample> = { data: a };
        let options: emitter.Options = {
          priority: emitter.EventPriority.LOW
        }
        emitter.emit<Sample>("eventId333", options, eventData);
        console.info(Tag + 'emitterEmit success');
        await Utils.msSleep(1000)
        expect(onConsume_number).assertEqual(1)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2100
     * @tc.number Sub_Notification_Ans_Emitter_Static_2100
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_2100==>'
        let onConsume_number: number = 0

        let callback: Callback<emitter.GenericEventData<Sample>> =
          (eventData: emitter.GenericEventData<Sample>): void => {
            console.info(Tag + ' on GenericEventData');
            let storage: Sample = eventData.data! as Sample;
            storage.printCount();
            onConsume_number += 1
            console.info(Tag + ' on GenericEventData' + eventData);
            let data: Sample = eventData?.data as Sample;
            expect(data?.count).assertEqual(100);
          }
        emitter.onceGenericEventData<Sample>("eventId333", callback);
        await Utils.msSleep(100)
        let a = new Sample();
        let eventData: emitter.GenericEventData<Sample> = { data: a };
        let options: emitter.Options = {
          priority: emitter.EventPriority.LOW
        }
        emitter.emit<Sample>("", options, eventData);
        console.info(Tag + 'emitterEmit success');
        await Utils.msSleep(1000)
        expect(onConsume_number).assertEqual(0)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2200
     * @tc.number Sub_Notification_Ans_Emitter_Static_2200
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_Emitter_Static_2200';
        let count: int = 0;
        let eventId: string = 'eventId22'
        let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          count++;
          expect(count).assertEqual(1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option: emitter.Options = {
          priority: emitter.EventPriority.LOW
        }
        let myDate: Record<String, RecordData> = {
          "id": "1",
          "content": "c"
        }
        let eventData: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.onEventData(eventId, onCallback)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit(eventId, option, eventData)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2300
     * @tc.number Sub_Notification_Ans_Emitter_Static_2300
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_Emitter_Static_2300';
        let count: int = 0;
        let eventId: string = 'eventId23'
        let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          count++;
          expect(count).assertEqual(1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option: emitter.Options = {
          priority: emitter.EventPriority.IDLE
        }
        let myDate: Record<String, RecordData> = {
          "id": "1",
          "content": "c"
        }
        let eventData: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.onEventData(eventId, onCallback)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit(eventId, option, eventData)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2400
     * @tc.number Sub_Notification_Ans_Emitter_Static_2400
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_Emitter_Static_2400';
        let count: int = 0;
        let eventId: string = 'eventId24'
        let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          count++;
          expect(count).assertEqual(1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option: emitter.Options = {
          priority: emitter.EventPriority.IDLE
        }
        let myDate: Record<String, RecordData> = {
          "id": "1",
          "content": "c"
        }
        let eventData: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.onEventData(eventId, onCallback)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit('', option, eventData)
        expect(count).assertEqual(0);
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2500
     * @tc.number Sub_Notification_Ans_Emitter_Static_2500
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_2500==>'
        let onConsume_number: number = 0

        let callback = (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(Tag + ' on GenericEventData');
          let storage: Sample = eventData.data! as Sample;
          storage.printCount();
          onConsume_number += 1
        }
        emitter.onGenericEventData<Sample>("", callback);
        await Utils.msSleep(100)
        let a = new Sample();
        let eventData: emitter.GenericEventData<Sample> = { data: a };
        emitter.emit<Sample>("", eventData);
        console.info(Tag + 'emitterEmit success');
        await Utils.msSleep(1000)
        expect(onConsume_number).assertEqual(0)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2600
     * @tc.number Sub_Notification_Ans_Emitter_Static_2600
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_2600==>'
        let onConsume_number: number = 0
        let callback = (eventData: emitter.GenericEventData<Sample>): void => {
          console.info(Tag + ' on GenericEventData');
          let storage: Sample = eventData.data! as Sample;
          storage.printCount();
          onConsume_number += 1
        }
        emitter.onceGenericEventData<Sample>("", callback);

        //调用取消订阅事件接口
        await Utils.msSleep(2000)
        emitter.offGenericEventData("", callback);
        console.info(Tag + 'emitterOff success');
        await Utils.msSleep(1000)
        expect(onConsume_number).assertEqual(0)
        done()
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2700
     * @tc.number Sub_Notification_Ans_Emitter_Static_2700
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_Emitter_Static_2700';
        let onCallback30: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.onEventData('', onCallback30)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        emitter.offEventData('', onCallback30)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /**
     * @tc.name   Sub_Notification_Ans_Emitter_Static_2800
     * @tc.number Sub_Notification_Ans_Emitter_Static_2800
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Emitter_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Emitter_Static_2800==>'

        let myDate: Record<String, RecordData> = {
          "id": "1",
          "content": "c"
        }
        let eventData: emitter.EventData = { data: myDate }
        let onConsume_number: number = 0
        let emit_number: number = 0
        let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
          console.info(TAG+ ' once success');
        }
        emitter.onceEventData("", onCallback);
        await Utils.msSleep(100)
        emitter.emit("", eventData);
        console.info(Tag + 'emitterEmit success' + emit_number);
        await Utils.msSleep(100)
        expect(onConsume_number).assertEqual(0)
        console.info('Sub_NotificationAns_Emitter_Basic_Static_0002 PASS');
        done()
      })

  })
}

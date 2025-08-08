/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index"
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'

const TAG: string = 'NotificationActs';
const TEST_SUITE_NAME: string = 'testemitterNotification';
let bundle_name: string = "com.example.badgeemitter.static"
let domain: number = 0x000
let testAbilityContext: common.UIAbilityContext;

export default function ActsNotificationEmitterTest() {
  describe('testemitterNotification', () => {
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, TAG, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(1000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} afterEach START`)
      emitter.off('eventid')
      emitter.off('eventids')
      await Utils.msSleep(500)
      console.info(`${TAG} afterEach END`)
    })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_1100
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_1100
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_1100';
        let eventId11: string = 'eventId11'
        let option11: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }
        let myDate: Record<String, Object> = {}
        let eventData: emitter.EventData = { data: myDate }
        let onCallback11 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId11, onCallback11)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(eventId11, option11, eventData)
          await Utils.msSleep(1000)
          done();
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3800
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3800
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3800';
        let eventId38: string = 'eventId38'
        let onCallback38 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option38: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }
        let myDate: Record<String, Object> = {
          "id": "1",
          "content": "c"
        }
        let eventData: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId38, onCallback38)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit(eventId38, option38, eventData)
        await Utils.msSleep(1000)
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4300
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4300
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_4300';
        let eventId43: string = 'eventId43'
        let onCallback43 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option43: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }

        let myDate: Record<String, Object> = {
          "id": "event4300",
        }
        let data143: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId43, onCallback43)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        emitter.off(eventId43)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        emitter.emit(eventId43, option43, data143)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        await Utils.msSleep(1000)
        setTimeout(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4400
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4400
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_4400';
        let eventId44: string = 'eventId44'
        let innerEvent44: emitter.InnerEvent = {
          eventId: 44
        }
        let onCallback44 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option44: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }
        let myDate: Record<String, Object> = {
          "data": ['event4400']
        }
        let data144: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent44, onCallback44)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent44.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        emitter.off(eventId44)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        let num1: number = emitter.getListenerCount(innerEvent44.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        emitter.emit(eventId44, option44, data144)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        await Utils.msSleep(1000)
        setTimeout(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5600
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5600
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000)
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5600';
        let eventId56: string = 'eventId56'
        let innerEvent56: emitter.InnerEvent = {
          eventId: 56
        }
        let onCallback56 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done()
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId56, onCallback56)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(innerEvent56)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7300
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7300
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    //问题单号：DTS2025060711369
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_7300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_7300';
        let eventId73: string = 'eventId73'
        let onCallback173 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId73, onCallback173)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(eventId73)
          await Utils.msSleep(1000)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7600
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7600
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_7600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_7600';
        let j: number = 0
        let eventId76: string = 'eventId76'
        let option76: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }

        let myDate: Record<String, Object> = {
          "id": "event7600",
        }
        let data176: emitter.EventData = { data: myDate }
        let onCallback176 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          j++;
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId76, onCallback176)
          emitter.on(eventId76, onCallback176)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(eventId76, option76, data176)
          emitter.emit(eventId76, option76, data176)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(j).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' onCallback1 success');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7800
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_7800
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_7800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_7800';
        let eventId78: string = 'eventId78'
        let innerEvent78: emitter.InnerEvent = {
          eventId: 78
        }
        let option78: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }

        let myDate: Record<String, Object> = {
          "id": "event7800",
        }
        let data178: emitter.EventData = { data: myDate }
        let onCallback178 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback278 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId78, onCallback178)
          emitter.on(innerEvent78, onCallback278)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(eventId78, option78, data178)
          done()
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
      })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8000
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8000
    * @tc.desc   : test emit interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8000';
        let j: number = 0
        let eventId80: string = 'eventId80'
        let innerEvent80: emitter.InnerEvent = {
          eventId: 80
        }
        let option80: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }

        let myDate: Record<String, Object> = {
          "id": "event7800",
        }
        let data180: emitter.EventData = { data: myDate }
        let onCallback180 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          j++;
        }
        let onCallback280 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          j++;
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId80, onCallback180)
          emitter.on(innerEvent80, onCallback280)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
          emitter.emit(eventId80, option80, data180)
          emitter.emit(innerEvent80, data180)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(j).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' onCallback1 success');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8700
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8700
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    //问题单号：DTS2025060711369
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8700';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", (): void => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success,data is %{public}s');
            expect(true).assertTrue();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
            done();
          })
          emitter.emit('eventid');
          done()
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8800
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8800
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8800';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        const re = new RegExp("\\w+");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const view: Int32Array = new Int32Array(buffer);
        const buffer1: ArrayBuffer = new ArrayBuffer(16);
        const view1: DataView = new DataView(buffer1);
        let birthday: Date = new Date(2023, 2, 24, 15, 53);
        let b = view1.getInt16(1);
        const aa: Set<Number> = new Set<Number>([1, 2, 3]);
        const errtypes = new Error('Whoops!');
        const bmaps: Map<Number, String> = new Map<Number, String>([
          [1, 'one'], [2, 'two'], [3, 'three']
        ]);

        let myDate1: Record<String, Object> = {
          'test': 1
        }

        let testObject: emitter.EventData = { data: myDate1 }

        let myDate: Record<String, Object> = {
          "number": 1,
          "string": "str",
          "boolean": false,
          "reg": re,
          "set": aa,
          "date": birthday,
          "view": view,
          "map": bmaps,
          "error": errtypes,
          "la": b,
          "obk": testObject
        }
        let eventData: emitter.EventData = { data: myDate }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", (eventData: emitter.EventData): void => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success,data is %{public}s',
              JSON.stringify(eventData));
            expect(true).assertTrue();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
            done();
          })
          emitter.emit('eventid', eventData);
          done()
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8900
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8900
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8900';
        let count: number = 0;
        let myDate: Record<String, Object> = {
          "eventid": "eventid",
        }
        let eventData: emitter.EventData = { data: myDate }
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
          count++;
        };
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventid", oncallback2);
          emitter.emit("eventid", eventData);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          done();
        }, 1000);
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9000
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9000
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9000';
        let count: number = 0;
        let oncallback1 = (data: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s',
            JSON.stringify(data));
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        const re = new RegExp("\\w+");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const view: Int32Array = new Int32Array(buffer);
        const buffer1: ArrayBuffer = new ArrayBuffer(16);
        const view1: DataView = new DataView(buffer1);
        let birthday: Date = new Date(2024, 2, 24, 15, 53);
        let b = view1.getInt16(1);
        const aa: Set<Number> = new Set<Number>([1, 2, 3]);
        const errtypes = new Error('Whoops!');
        const bmaps: Map<Number, String> = new Map<Number, String>([
          [1, 'one'], [2, 'two'], [3, 'three']
        ]);
        let myDate1: Record<String, Object> = {
          'test': 1
        }

        let testObject: emitter.EventData = { data: myDate1 }
        let myDate: Record<String, Object> = {
          "number": 1,
          "string": "str",
          "boolean": false,
          "reg": re,
          "set": aa,
          "date": birthday,
          "view": view,
          "map": bmaps,
          "error": errtypes,
          "la": b,
          "obk": testObject
        }
        let eventData: emitter.EventData = { data: myDate }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventid", oncallback2);
          emitter.emit("eventid", eventData);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        };
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          done();
        }, 1000);
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9100
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9100
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 0
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9100';
        let count: number = 0;
        let myDate: Record<String, Object> = {
          "eventid": "eventid",
        }
        let eventData: emitter.EventData = { data: myDate }
        let oncallback1 = (data: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", eventData);
          emitter.emit("eventids", eventData);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          done();
        }, 1000);
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9200
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9200
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9200';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
          expect(true).assertTrue();
          count++;
        };

        let myDate: Record<String, Object> = {
          'string': 'string'
        }
        let data1: emitter.EventData = { data: myDate }

        let myDate1: Record<String, Object> = {
          'Array': [1, 2, 7, 8]
        }
        let data2: emitter.EventData = { data: myDate1 }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 1000);
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9300
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9300
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9300';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
          expect(true).assertTrue();
          count++;
        };
        let myDate: Record<String, Object> = {
          'number': 1
        }
        let data1: emitter.EventData = { data: myDate }
        let myDate1: Record<String, Object> = {
          'Boolean': true
        }
        let data2: emitter.EventData = { data: myDate1 }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 1000);
      })

    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9400
   * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9400
   * @tc.desc   : test on interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9400';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s',
            JSON.stringify(data1));
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s',
            JSON.stringify(data2));
          expect(true).assertTrue();
          count++;
        };

        let myDate: Record<String, Object> = {
          'Array': [1, 2, 7, 8]
        }
        const buffer1: ArrayBuffer = new ArrayBuffer(16);
        let myDate1: Record<String, Object> = {
          'Arraybuffer1': buffer1
        }
        let data1: emitter.EventData = { data: myDate1 }
        let data2: emitter.EventData = { data: myDate }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data2);
          emitter.emit("eventids", data1);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        };
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 1000);
      })

    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9500
   * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9500
   * @tc.desc   : test on interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9500';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s',
            JSON.stringify(data1));
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s',
            JSON.stringify(data2));
          expect(true).assertTrue();
          count++;
        };
        let birthday: Date = new Date(2025, 2, 24, 15, 53);
        let myDate: Record<String, Object> = {
          'Date': birthday
        }
        let data1: emitter.EventData = { data: myDate }
        const buffer: ArrayBuffer = new ArrayBuffer(16);
        const view = new DataView(buffer);

        let myDate1: Record<String, Object> = {
          'Arraybuffer': view
        }
        let data2: emitter.EventData = { data: myDate1 }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        };
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' 111111');
        await Utils.msSleep(1000)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' 222222');
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end2');
          done();
        }, 1000);
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9600
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9600
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9600';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          let dataValue: Record<String, Object> = data1.data as Record<String, Object>
          let setValue: Set<Number> = dataValue["Sets"] as Set<Number>
          hilog.info(0x000, `${TAG}`,
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on1 success,data1 is %{public}s ${setValue}`,);
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          let dataValue: Record<String, Object> = data2.data as Record<String, Object>
          let MapValue: Map<Number, String> = dataValue["Map"] as Map<Number, String>
          hilog.info(0x000, `${TAG}`,
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + `on2 success,data2 is %{public}s ${MapValue}`,);
          expect(true).assertTrue();
          count++;
        };
        const Sets: Set<Number> = new Set<Number>([1, 2, 3]);

        let RecordData: Record<String, Object> = {
          'Sets': Sets
        }
        let data1: emitter.EventData = { data: RecordData }


        const Maps: Map<Number, String> = new Map<Number, String>([
          [1, 'one'], [2, 'two'], [3, 'three']
        ]);

        let myDate1: Record<String, Object> = {
          'Map': Maps
        }
        let data2: emitter.EventData = { data: myDate1 }

        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 1000);
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9700
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9700
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9700';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s',
            JSON.stringify(data1));
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s',
            JSON.stringify(data2));
          expect(true).assertTrue();
          count++;
        };
        const errtypes = new Error('Whoops!');

        let myDate: Record<String, Object> = {
          'errtypes': errtypes
        }
        let data1: emitter.EventData = { data: myDate }
        const buffer = new ArrayBuffer(8);
        const view = new Int32Array(buffer);

        let myDate1: Record<String, Object> = {
          'TypeArray': view
        }
        let data2: emitter.EventData = { data: myDate1 }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 1000);
      })

    /*
 * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9800
 * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_9800
 * @tc.desc   : test on interface success
 * @tc.size   : Large-scaleTest
 * @tc.type   : Interface
 * @tc.level  : Level 3
 */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_9800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_9800';
        let count: number = 0;
        let oncallback1 = (data1: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s',
            JSON.stringify(data1));
          expect(true).assertTrue();
          count++;
        };
        let oncallback2 = (data2: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s',
            JSON.stringify(data2));
          expect(true).assertTrue();
          count++;
        };
        const re = new RegExp('\\w+');

        let myDate: Record<String, Object> = {
          'RegExp': re
        }
        let data1: emitter.EventData = { data: myDate }
        const Primitivetypes = 1;

        let myDate1: Record<String, Object> = {
          'Primitivetypes': Primitivetypes
        }
        let data2: emitter.EventData = { data: myDate1 }
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        try {
          emitter.on("eventid", oncallback1);
          emitter.on("eventids", oncallback2);
          emitter.emit("eventid", data1);
          emitter.emit("eventids", data2);
        } catch (e) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s',
            JSON.stringify(e));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done()
        }
        await Utils.msSleep(1000)
        setTimeout(() => {
          expect(count).assertEqual(2);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done()
        }, 1000);
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0600
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0600
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_0600';
        let eventId06: string = 'eventId06'
        let onCallback06 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId06, onCallback06)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`,
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId06)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0700
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0700
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_0700';
        let eventId07: string = 'eventId07'
        let onCallback07 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId07, onCallback07)
          emitter.on(eventId07, onCallback07)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId07)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    //DTS2025060627133
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0800
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0800
     * @tc.desc   : test on interface fail
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME:string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_0800';
      let eventId08:string = ''
      let onCallback08 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId08, onCallback08)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId08)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0900
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_0900
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_0900';
        let eventId09: string = ' '
        let onCallback09 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId09, onCallback09)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId09)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        emitter.off(eventId09)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_1000
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_1000
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_1000';
        let eventId10: string = 'eventId10'
        let innerEvent10: emitter.InnerEvent = {
          eventId: 10
        }
        let onCallback10 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent10, onCallback10)
          emitter.on(eventId10, onCallback10)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId10)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        let num1: number = emitter.getListenerCount(innerEvent10.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3000
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3000
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3000';
        let eventId30: string = 'eventId30'
        let onCallback30 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId30, onCallback30)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId30)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        emitter.off(eventId30, onCallback30)
        let num1: number = emitter.getListenerCount(eventId30)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3100
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3100
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3100';
        let eventId31: string = 'eventId31'
        let onCallback31 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId31, onCallback31)
          emitter.on(eventId31, onCallback31)
          emitter.on(eventId31, onCallback31)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId31)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        emitter.off(eventId31, onCallback31)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
        let num1: number = emitter.getListenerCount(eventId31)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(0);
        emitter.off(eventId31, onCallback31)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
        let num2 = emitter.getListenerCount(eventId31)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    //DTS2025060627133
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3200
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3200
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME:string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3200';
      let eventId32:string = ''
      let onCallback32 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId32, onCallback32)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      emitter.off(eventId32, onCallback32)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      let num: number = emitter.getListenerCount(eventId32)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3300
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3300
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3300';
        let eventId33: string = ' '
        let onCallback33 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId33, onCallback33)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId33)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        emitter.off(eventId33, onCallback33)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        let num1: number = emitter.getListenerCount(eventId33)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3400
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_3400
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 0
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_3400';
        let eventId34: string = 'eventId34'
        let innerEvent34: emitter.InnerEvent = {
          eventId: 34
        }
        let onCallback34 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback134 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId34, onCallback34)
          emitter.on(innerEvent34, onCallback134)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent34.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        let num1: number = emitter.getListenerCount(eventId34)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        emitter.off(innerEvent34.eventId, onCallback134)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
        emitter.off(eventId34, onCallback34)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
        let num2 = emitter.getListenerCount(eventId34)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(0);
        let num3 = emitter.getListenerCount(innerEvent34.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num3));
        expect(num3).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4500
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_4500
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_4500';
        let eventId45: string = 'eventId45'
        let innerEvent45: emitter.InnerEvent = {
          eventId: 45
        }
        let onCallback45 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let option45: emitter.Options = {
          priority: emitter.EventPriority.IMMEDIATE
        }
        let myDate: Record<String, Object> = {
          "content": "event4500"
        }
        let eventData145: emitter.EventData = { data: myDate }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent45, onCallback45)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent45.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        emitter.emit(eventId45, option45, eventData145)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        await Utils.msSleep(1000)
        setTimeout(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 3000)
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5000
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5000
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5000';
        let innerEvent50: emitter.InnerEvent = {
          eventId: 50
        }
        let onCallback50 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent50, onCallback50)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent50.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5100
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5100
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5100';
        let innerEvent51: emitter.InnerEvent = {
          eventId: 51
        }
        let onCallback51 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent51, onCallback51)
          emitter.on(innerEvent51, onCallback51)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent51.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5200
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5200
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5200';
        let innerEvent52: emitter.InnerEvent = {
          eventId: 52
        }
        let onCallback152 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback252 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback352 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback452 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback552 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback652 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback752 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback852 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback952 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1052 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent52, onCallback152)
          emitter.on(innerEvent52, onCallback252)
          emitter.on(innerEvent52, onCallback352)
          emitter.on(innerEvent52, onCallback452)
          emitter.on(innerEvent52, onCallback552)
          emitter.on(innerEvent52, onCallback652)
          emitter.on(innerEvent52, onCallback752)
          emitter.on(innerEvent52, onCallback852)
          emitter.on(innerEvent52, onCallback952)
          emitter.on(innerEvent52, onCallback1052)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent52.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(10);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5300
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5300
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5300';
        let eventId53 = 'eventId53'
        let onCallback153 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback253 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback353 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback453 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback553 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback653 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback753 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback853 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback953 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1053 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId53, onCallback153)
          emitter.on(eventId53, onCallback253)
          emitter.on(eventId53, onCallback353)
          emitter.on(eventId53, onCallback453)
          emitter.on(eventId53, onCallback553)
          emitter.on(eventId53, onCallback653)
          emitter.on(eventId53, onCallback753)
          emitter.on(eventId53, onCallback853)
          emitter.on(eventId53, onCallback953)
          emitter.on(eventId53, onCallback1053)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId53)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(10);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5400
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5400
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5400';
        let innerEvent54: emitter.InnerEvent = {
          eventId: 54
        }
        let onCallback154 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback254 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback354 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback454 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback554 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback654 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback754 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback854 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback954 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1054 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent54, onCallback154)
          emitter.on(innerEvent54, onCallback254)
          emitter.on(innerEvent54, onCallback354)
          emitter.on(innerEvent54, onCallback454)
          emitter.on(innerEvent54, onCallback554)
          emitter.on(innerEvent54, onCallback654)
          emitter.on(innerEvent54, onCallback754)
          emitter.on(innerEvent54, onCallback854)
          emitter.on(innerEvent54, onCallback954)
          emitter.on(innerEvent54, onCallback1054)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        emitter.off(innerEvent54.eventId, onCallback154)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
        emitter.off(innerEvent54.eventId, onCallback254)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
        emitter.off(innerEvent54.eventId, onCallback354)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off3 success');
        emitter.off(innerEvent54.eventId, onCallback454)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off4 success');
        emitter.off(innerEvent54.eventId, onCallback554)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off5 success');
        let num: number = emitter.getListenerCount(innerEvent54.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(5);
        let eventId54 = 'eventId54'
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId54, onCallback154)
          emitter.on(eventId54, onCallback254)
          emitter.on(eventId54, onCallback354)
          emitter.on(eventId54, onCallback454)
          emitter.on(eventId54, onCallback554)
          emitter.on(eventId54, onCallback654)
          emitter.on(eventId54, onCallback754)
          emitter.on(eventId54, onCallback854)
          emitter.on(eventId54, onCallback954)
          emitter.on(eventId54, onCallback1054)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        emitter.off(eventId54, onCallback154)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
        emitter.off(eventId54, onCallback254)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
        emitter.off(eventId54, onCallback354)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off3 success');
        emitter.off(eventId54, onCallback454)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off4 success');
        emitter.off(eventId54, onCallback554)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off5 success');
        let num1: number = emitter.getListenerCount(eventId54)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(5);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5500
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5500
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5500';
        let innerEvent55: emitter.InnerEvent = {
          eventId: 55
        }
        let onCallback155 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback255 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback355 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback455 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback555 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback655 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback755 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback855 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback955 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1055 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent55, onCallback155)
          emitter.on(innerEvent55, onCallback255)
          emitter.on(innerEvent55, onCallback355)
          emitter.on(innerEvent55, onCallback455)
          emitter.on(innerEvent55, onCallback555)
          emitter.on(innerEvent55, onCallback655)
          emitter.on(innerEvent55, onCallback755)
          emitter.on(innerEvent55, onCallback855)
          emitter.on(innerEvent55, onCallback955)
          emitter.on(innerEvent55, onCallback1055)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent55.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(10);
        let eventId55 = 'eventId55'
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId55, onCallback155)
          emitter.on(eventId55, onCallback255)
          emitter.on(eventId55, onCallback355)
          emitter.on(eventId55, onCallback455)
          emitter.on(eventId55, onCallback555)
          emitter.on(eventId55, onCallback655)
          emitter.on(eventId55, onCallback755)
          emitter.on(eventId55, onCallback855)
          emitter.on(eventId55, onCallback955)
          emitter.on(eventId55, onCallback1055)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId55)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(10);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5700
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5700
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5700';
        let eventId57 = 'eventId57'
        let innerEvent57: emitter.InnerEvent = {
          eventId: 57
        }
        let onCallback57 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId57, onCallback57)
          emitter.on(innerEvent57, onCallback57)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId57)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        let num2 = emitter.getListenerCount(innerEvent57.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5800
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_5800
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_5800';
        let eventId58 = 'eventId58'
        let onCallback58 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback158 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId58, onCallback58)
          emitter.on(eventId58, onCallback158)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId58)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6100
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6100
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6100';
        let eventId61: string = 'eventId61'
        let onCallback161 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback261 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId61, onCallback161)
          emitter.on(eventId61, onCallback261)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId61, onCallback161)
          emitter.off(eventId61, onCallback261)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId61)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6500
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6500
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6500';
        let eventId65: string = 'eventId65'
        let onCallback165 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId65, onCallback165)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId65)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId65)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6600
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6600
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6600';
        let eventId66: string = 'eventId66'
        let onCallback166 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId66, onCallback166)
          emitter.on(eventId66, onCallback166)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId66)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId66)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num2 = emitter.getListenerCount(eventId66)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(0);
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId66)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num3 = emitter.getListenerCount(eventId66)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num3));
        expect(num3).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    //DTS2025060627133
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6700
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6700
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME:string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6700';
      let eventId67 = ''
      let onCallback167 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId67, onCallback167)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        emitter.off(eventId67)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId67)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6800
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6800
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6800';
        let eventId68: string = ' '
        let onCallback168 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId68, onCallback168)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId68)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId68)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6900
     * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_6900
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_6900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_6900';
        let eventId69: string = 'eventId69'
        let innerEvent69: emitter.InnerEvent = {
          eventId: 69
        }
        let onCallback169 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId69, onCallback169)
          emitter.on(innerEvent69, onCallback169)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId69)
          emitter.off(innerEvent69.eventId)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId69)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num1: number = emitter.getListenerCount(innerEvent69.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8100
   * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8100
   * @tc.desc   : test getListenerCount interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8100';
        let innerEvent81: emitter.InnerEvent = {
          eventId: 81
        }
        let onCallback181 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback281 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent81, onCallback181)
          emitter.on(innerEvent81, onCallback281)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent81.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8200
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8200
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8200';
        let innerEvent82: emitter.InnerEvent = {
          eventId: 82
        }
        let onCallback182 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback282 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback382 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback482 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback582 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback682 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback782 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback882 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback982 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1082 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(innerEvent82, onCallback182)
          emitter.on(innerEvent82, onCallback282)
          emitter.on(innerEvent82, onCallback382)
          emitter.on(innerEvent82, onCallback482)
          emitter.on(innerEvent82, onCallback582)
          emitter.on(innerEvent82, onCallback682)
          emitter.on(innerEvent82, onCallback782)
          emitter.on(innerEvent82, onCallback882)
          emitter.on(innerEvent82, onCallback982)
          emitter.on(innerEvent82, onCallback1082)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(innerEvent82.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(10);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8300
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8300
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8300';
        let eventId83: string = 'eventId83'
        let onCallback183 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
          emitter.on(eventId83, onCallback183)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId83)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8400
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8400
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8400';
        let eventId84: string = 'eventId84'
        let innerEvent84: emitter.InnerEvent = {
          eventId: 84
        }
        let onCallback184 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(eventId84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
          emitter.on(innerEvent84, onCallback184)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId84)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(1);
        let num2 = emitter.getListenerCount(innerEvent84.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })
    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8500
   * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8500
   * @tc.desc   : test getListenerCount interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8500';
        let eventId85: string = 'eventId85'
        let innerEvent85: emitter.InnerEvent = {
          eventId: 85
        }
        let onCallback185 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback285 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback385 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on3 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback485 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on4 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback585 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on5 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback685 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on6 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback785 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on7 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback885 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on8 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback985 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on9 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1085 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on10 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1185 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on11 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1285 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on12 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1385 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on13 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1485 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on14 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1585 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on15 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1685 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on16 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1785 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on17 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1885 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on18 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback1985 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on19 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback2085 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on20 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId85, onCallback185)
          emitter.on(eventId85, onCallback285)
          emitter.on(eventId85, onCallback385)
          emitter.on(eventId85, onCallback485)
          emitter.on(eventId85, onCallback585)
          emitter.on(eventId85, onCallback685)
          emitter.on(eventId85, onCallback785)
          emitter.on(eventId85, onCallback885)
          emitter.on(eventId85, onCallback985)
          emitter.on(eventId85, onCallback1085)
          emitter.on(innerEvent85, onCallback1185)
          emitter.on(innerEvent85, onCallback1285)
          emitter.on(innerEvent85, onCallback1385)
          emitter.on(innerEvent85, onCallback1485)
          emitter.on(innerEvent85, onCallback1585)
          emitter.on(innerEvent85, onCallback1685)
          emitter.on(innerEvent85, onCallback1785)
          emitter.on(innerEvent85, onCallback1885)
          emitter.on(innerEvent85, onCallback1985)
          emitter.on(innerEvent85, onCallback2085)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId85, onCallback185)
          emitter.off(eventId85, onCallback285)
          emitter.off(eventId85, onCallback385)
          emitter.off(eventId85, onCallback485)
          emitter.off(eventId85, onCallback585)
          emitter.off(innerEvent85.eventId, onCallback1185)
          emitter.off(innerEvent85.eventId, onCallback1285)
          emitter.off(innerEvent85.eventId, onCallback1385)
          emitter.off(innerEvent85.eventId, onCallback1485)
          emitter.off(innerEvent85.eventId, onCallback1585)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num1: number = emitter.getListenerCount(eventId85)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(5);
        let num2 = emitter.getListenerCount(innerEvent85.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num2));
        expect(num2).assertEqual(5);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8600
    * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_Static_8600
    * @tc.desc   : test off interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_Static_8600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Emitter_Subscribe_Capabilities_Static_8600';
        let eventId86: string = 'eventId86'
        let innerEvent86: emitter.InnerEvent = {
          eventId: 86
        }
        let onCallback186 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let onCallback286 = (): void => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success');
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
          emitter.on(eventId86, onCallback186)
          emitter.on(innerEvent86, onCallback286)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
          emitter.off(eventId86)
          emitter.off(innerEvent86.eventId)
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s',
            JSON.stringify(err));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }
        let num: number = emitter.getListenerCount(eventId86)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num1: number = emitter.getListenerCount(innerEvent86.eventId)
        hilog.info(0x000, `${TAG}`,
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s',
          JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      })


  })
}
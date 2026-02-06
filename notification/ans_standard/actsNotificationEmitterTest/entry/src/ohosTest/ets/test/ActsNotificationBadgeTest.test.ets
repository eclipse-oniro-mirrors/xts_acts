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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import hilog from '@ohos.hilog';
import notificationemitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';

const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'testNotificationEmitterNotification';

export default function ActsNotificationEmitterTest() {
  describe('testNotificationEmitterNotification', () => {
    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0600
      * @tc.name   : testEmitterOneventIdforstring
      * @tc.desc   : test on interface success
      * @tc.size   : Large-scaleTest
      * @tc.type   : Interface
      * @tc.level  : Level 3
      */
    it('testEmitterOneventIdforstring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforstring';
      let eventId06 = 'eventId06'
      let onCallback06 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId06, onCallback06)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId06)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0700
     * @tc.name   : testEmitterOneventIdfortwostring
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdfortwostring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdfortwostring';
      let eventId07 = 'eventId07'
      let onCallback07 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId07, onCallback07)
        notificationemitter.on(eventId07, onCallback07)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId07)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0800
     * @tc.name   : testEmitterOneventIdforempty
     * @tc.desc   : test on interface fail
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdforempty', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforempty';
      let eventId08 = ''
      let onCallback08 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId08, onCallback08)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId08)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0900
     * @tc.name   : testEmitterOneventIdforwhitespace
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdforwhitespace', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforwhitespace';
      let eventId09 = ' '
      let onCallback09 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId09, onCallback09)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId09)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      notificationemitter.off(eventId09)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1000
     * @tc.name   : testEmitterOneventIdforstringfornumber
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdforstringfornumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforstringfornumber';
      let eventId10 = 'eventId10'
      let innerEvent10: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent10, onCallback10)
        notificationemitter.on(eventId10, onCallback10)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId10)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      let num1: number = notificationemitter.getListenerCount(innerEvent10.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1100
     * @tc.name   : testEmitterOnoneEmitterone
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnoneEmitterone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnoneEmitterone';
      let eventId11 = 'eventId11'
      let option11: notificationemitter.Options = {
        priority: 0
      }
      let onCallback11 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId11, onCallback11)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId11, option11)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1800
     * @tc.name   : testEmitterOnceeventIdforstring
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceeventIdforstring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceeventIdforstring';
      let eventId18 = 'eventId18'
      let onCallback18 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId18, onCallback18)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId18)
        setTimeout(() => {
          let num: number = notificationemitter.getListenerCount(eventId18)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
          expect(num).assertEqual(0);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 200)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1900
     * @tc.name   : testEmitterOnceeventIdfortwostring
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceeventIdfortwostring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceeventIdfortwostring';
      let eventId19 = 'eventId19'
      let onCallback19 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId19, onCallback19)
        notificationemitter.once(eventId19, onCallback19)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId19)
        setTimeout(() => {
          let num: number = notificationemitter.getListenerCount(eventId19)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
          expect(num).assertEqual(0);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 200)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2000
     * @tc.name   : testEmitterOnceeventIdforempty
     * @tc.desc   : test once interface fail
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceeventIdforempty', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceeventIdforempty';
      let eventId20 = ''
      let onCallback20 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId20, onCallback20)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId20)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2100
     * @tc.name   : testEmitterOnceeventIdforwhitespace
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceeventIdforwhitespace', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceeventIdforwhitespace';
      let eventId21 = ' '
      let onCallback21 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId21, onCallback21)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId21)
        setTimeout(() => {
          let num: number = notificationemitter.getListenerCount(eventId21)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
          expect(num).assertEqual(0);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        }, 200)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2200
     * @tc.name   : testEmitterOncetwoEmittwo
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 0
     */
    it('testEmitterOncetwoEmittwo', Level.LEVEL0, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOncetwoEmittwo';
      let eventId22 = 'eventId22'
      let innerEvent22: notificationemitter.InnerEvent = {
        eventId: 22
      }
      let onCallback22 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId22, onCallback22)
        notificationemitter.once(innerEvent22, onCallback22)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId22)
        notificationemitter.emit(innerEvent22)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        let num: number = notificationemitter.getListenerCount(eventId22)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
        expect(num).assertEqual(0);
        let num1: number = notificationemitter.getListenerCount(innerEvent22.eventId)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2300
     * @tc.name   : testEmitterOnceoneEmitonenumber
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceoneEmitonenumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceoneEmitonenumber';
      let eventId23 = 'eventId23'
      let innerEvent23: notificationemitter.InnerEvent = {
        eventId: 23
      }
      let onCallback23 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId23, onCallback23)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId23)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(innerEvent23)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        let num1: number = notificationemitter.getListenerCount(eventId23)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
        expect(num1).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3000
     * @tc.name   : testEmitterOnoneOffone
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnoneOffone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnoneOffone';
      let eventId30 = 'eventId30'
      let onCallback30 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId30, onCallback30)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId30)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.off(eventId30, onCallback30)
      let num1: number = notificationemitter.getListenerCount(eventId30)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3100
     * @tc.name   : testEmitterOnthreeOfftwo
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnthreeOfftwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnthreeOfftwo';
      let eventId31 = 'eventId31'
      let onCallback31 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId31, onCallback31)
        notificationemitter.on(eventId31, onCallback31)
        notificationemitter.on(eventId31, onCallback31)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId31)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.off(eventId31, onCallback31)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
      let num1: number = notificationemitter.getListenerCount(eventId31)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(0);
      notificationemitter.off(eventId31, onCallback31)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
      let num2 = notificationemitter.getListenerCount(eventId31)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3200
     * @tc.name   : testEmitterOneventIdforemptyOffeventIdforempty
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdforemptyOffeventIdforempty', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforemptyOffeventIdforempty';
      let eventId32 = ''
      let onCallback32 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId32, onCallback32)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      notificationemitter.off(eventId32, onCallback32)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      let num: number = notificationemitter.getListenerCount(eventId32)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3300
     * @tc.name   : testEmitterOneventIdforwhitespaceOffeventIdforwhitespace
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdforwhitespaceOffeventIdforwhitespace', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdforwhitespaceOffeventIdforwhitespace';
      let eventId33 = ' '
      let onCallback33 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId33, onCallback33)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId33)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.off(eventId33, onCallback33)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      let num1: number = notificationemitter.getListenerCount(eventId33)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3400
     * @tc.name   : testEmitterOntwoOfftwo
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 0
     */
    it('testEmitterOntwoOfftwo', Level.LEVEL0, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwoOfftwo';
      let eventId34 = 'eventId34'
      let innerEvent34: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId34, onCallback34)
        notificationemitter.on(innerEvent34, onCallback134)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent34.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      let num1: number = notificationemitter.getListenerCount(eventId34)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      notificationemitter.off(innerEvent34.eventId, onCallback134)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
      notificationemitter.off(eventId34, onCallback34)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
      let num2 = notificationemitter.getListenerCount(eventId34)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(0);
      let num3 = notificationemitter.getListenerCount(innerEvent34.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num3));
      expect(num3).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3800
     * @tc.name   : testEmitterOnoneEmitonenodata
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnoneEmitonenodata', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnoneEmitonenodata';
      let eventId38 = 'eventId38'
      let onCallback38 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let option38: notificationemitter.Options = {
        priority: 0
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId38, onCallback38)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
      notificationemitter.emit(eventId38, option38)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4300
     * @tc.name   : testEmitterOnOneOffoneEmitone
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnOneOffoneEmitone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnOneOffoneEmitone';
      let eventId43 = 'eventId43'
      let onCallback43 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let option43: notificationemitter.Options = {
        priority: 0
      }
      let data143: notificationemitter.EventData = {
        data: ['event4300']
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId43, onCallback43)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      notificationemitter.off(eventId43)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      notificationemitter.emit(eventId43, option43, data143)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4400
     * @tc.name   : testEmitterOnOnenumberOffoneEmitone
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnOnenumberOffoneEmitone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnOnenumberOffoneEmitone';
      let eventId44 = 'eventId44'
      let innerEvent44: notificationemitter.InnerEvent = {
        eventId: 44
      }
      let onCallback44 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let option44: notificationemitter.Options = {
        priority: 0
      }
      let data144: notificationemitter.EventData = {
        data: ['event4400']
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(innerEvent44, onCallback44)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent44.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.off(eventId44)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
      let num1: number = notificationemitter.getListenerCount(innerEvent44.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      notificationemitter.emit(eventId44, option44, data144)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4500
     * @tc.name   : testEmitterOnonenumberEmitone
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnonenumberEmitone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnonenumberEmitone';
      let eventId45 = 'eventId45'
      let innerEvent45: notificationemitter.InnerEvent = {
        eventId: 45
      }
      let onCallback45 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let option45: notificationemitter.Options = {
        priority: 0
      }
      let data145: notificationemitter.EventData = {
        data: ['event4500']
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(innerEvent45, onCallback45)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent45.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.emit(eventId45, option45, data145)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4600
     * @tc.name   : testEmitterOnceonenumberEmitone
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnceonenumberEmitone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnceonenumberEmitone';
      let eventId46 = 'eventId46'
      let innerEvent46: notificationemitter.InnerEvent = {
        eventId: 46
      }
      let onCallback46 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let option46: notificationemitter.Options = {
        priority: 0
      }
      let data146: notificationemitter.EventData = {
        data: ['event4600']
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(innerEvent46, onCallback46)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent46.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      notificationemitter.emit(eventId46, option46, data146)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5000
     * @tc.name   : testEmitterOnoneGetListenerCountone
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnoneGetListenerCountone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnoneGetListenerCountone';
      let innerEvent50: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent50, onCallback50)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent50.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5100
     * @tc.name   : testEmitterOntwonumberGetListenerCountone
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwonumberGetListenerCountone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwonumberGetListenerCountone';
      let innerEvent51: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent51, onCallback51)
        notificationemitter.on(innerEvent51, onCallback51)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent51.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5200
     * @tc.name   : testEmitterOntennumberGetListenerCountone
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntennumberGetListenerCountone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntennumberGetListenerCountone';
      let innerEvent52: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent52, onCallback152)
        notificationemitter.on(innerEvent52, onCallback252)
        notificationemitter.on(innerEvent52, onCallback352)
        notificationemitter.on(innerEvent52, onCallback452)
        notificationemitter.on(innerEvent52, onCallback552)
        notificationemitter.on(innerEvent52, onCallback652)
        notificationemitter.on(innerEvent52, onCallback752)
        notificationemitter.on(innerEvent52, onCallback852)
        notificationemitter.on(innerEvent52, onCallback952)
        notificationemitter.on(innerEvent52, onCallback1052)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent52.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(10);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5300
     * @tc.name   : testEmitterOntenstringGetListenerCountone
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntenstringGetListenerCountone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntenstringGetListenerCountone';
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
        notificationemitter.on(eventId53, onCallback153)
        notificationemitter.on(eventId53, onCallback253)
        notificationemitter.on(eventId53, onCallback353)
        notificationemitter.on(eventId53, onCallback453)
        notificationemitter.on(eventId53, onCallback553)
        notificationemitter.on(eventId53, onCallback653)
        notificationemitter.on(eventId53, onCallback753)
        notificationemitter.on(eventId53, onCallback853)
        notificationemitter.on(eventId53, onCallback953)
        notificationemitter.on(eventId53, onCallback1053)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId53)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(10);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5400
     * @tc.name   : testEmitterOntwentyOfftenGetListenerCounttwo
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwentyOfftenGetListenerCounttwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwentyOfftenGetListenerCounttwo';
      let innerEvent54: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent54, onCallback154)
        notificationemitter.on(innerEvent54, onCallback254)
        notificationemitter.on(innerEvent54, onCallback354)
        notificationemitter.on(innerEvent54, onCallback454)
        notificationemitter.on(innerEvent54, onCallback554)
        notificationemitter.on(innerEvent54, onCallback654)
        notificationemitter.on(innerEvent54, onCallback754)
        notificationemitter.on(innerEvent54, onCallback854)
        notificationemitter.on(innerEvent54, onCallback954)
        notificationemitter.on(innerEvent54, onCallback1054)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      notificationemitter.off(innerEvent54.eventId, onCallback154)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
      notificationemitter.off(innerEvent54.eventId, onCallback254)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
      notificationemitter.off(innerEvent54.eventId, onCallback354)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off3 success');
      notificationemitter.off(innerEvent54.eventId, onCallback454)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off4 success');
      notificationemitter.off(innerEvent54.eventId, onCallback554)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off5 success');
      let num: number = notificationemitter.getListenerCount(innerEvent54.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(5);
      let eventId54 = 'eventId54'
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId54, onCallback154)
        notificationemitter.on(eventId54, onCallback254)
        notificationemitter.on(eventId54, onCallback354)
        notificationemitter.on(eventId54, onCallback454)
        notificationemitter.on(eventId54, onCallback554)
        notificationemitter.on(eventId54, onCallback654)
        notificationemitter.on(eventId54, onCallback754)
        notificationemitter.on(eventId54, onCallback854)
        notificationemitter.on(eventId54, onCallback954)
        notificationemitter.on(eventId54, onCallback1054)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      notificationemitter.off(eventId54, onCallback154)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off1 success');
      notificationemitter.off(eventId54, onCallback254)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off2 success');
      notificationemitter.off(eventId54, onCallback354)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off3 success');
      notificationemitter.off(eventId54, onCallback454)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off4 success');
      notificationemitter.off(eventId54, onCallback554)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off5 success');
      let num1: number = notificationemitter.getListenerCount(eventId54)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(5);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5500
     * @tc.name   : testEmitterOntwentyGetListenerCounttwo
     * @tc.desc   : test getListenerCount interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwentyGetListenerCounttwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwentyGetListenerCounttwo';
      let innerEvent55: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent55, onCallback155)
        notificationemitter.on(innerEvent55, onCallback255)
        notificationemitter.on(innerEvent55, onCallback355)
        notificationemitter.on(innerEvent55, onCallback455)
        notificationemitter.on(innerEvent55, onCallback555)
        notificationemitter.on(innerEvent55, onCallback655)
        notificationemitter.on(innerEvent55, onCallback755)
        notificationemitter.on(innerEvent55, onCallback855)
        notificationemitter.on(innerEvent55, onCallback955)
        notificationemitter.on(innerEvent55, onCallback1055)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent55.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(10);
      let eventId55 = 'eventId55'
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId55, onCallback155)
        notificationemitter.on(eventId55, onCallback255)
        notificationemitter.on(eventId55, onCallback355)
        notificationemitter.on(eventId55, onCallback455)
        notificationemitter.on(eventId55, onCallback555)
        notificationemitter.on(eventId55, onCallback655)
        notificationemitter.on(eventId55, onCallback755)
        notificationemitter.on(eventId55, onCallback855)
        notificationemitter.on(eventId55, onCallback955)
        notificationemitter.on(eventId55, onCallback1055)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId55)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(10);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5600
     * @tc.name   : testEmitterOnonestringEmitonenumber
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnonestringEmitonenumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnonestringEmitonenumber';
      let eventId56 = 'eventId56'
      let innerEvent56: notificationemitter.InnerEvent = {
        eventId: 56
      }
      let onCallback56 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId56, onCallback56)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(innerEvent56)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5700
     * @tc.name   : testEmitterOnonestringonenumber
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnonestringonenumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnonestringonenumber';
      let eventId57 = 'eventId57'
      let innerEvent57: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId57, onCallback57)
        notificationemitter.on(innerEvent57, onCallback57)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId57)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      let num2 = notificationemitter.getListenerCount(innerEvent57.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5800
     * @tc.name   : testEmitterOntwocallback
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwocallback', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwocallback';
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
        notificationemitter.on(eventId58, onCallback58)
        notificationemitter.on(eventId58, onCallback158)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId58)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(2);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_5900
     * @tc.name   : testEmitterOncetwocallbackEmitone
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOncetwocallbackEmitone', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOncetwocallbackEmitone';
      let eventId59 = 'eventId59'
      let onCallback159 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once1 success');
      }
      let onCallback259 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once2 success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId59, onCallback159)
        notificationemitter.once(eventId59, onCallback259)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId59)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        let num1: number = notificationemitter.getListenerCount(eventId59)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
        expect(num1).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6000
     * @tc.name   : testEmitterOntwoeventIdnumberstringEmittwo
     * @tc.desc   : test once interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwoeventIdnumberstringEmittwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwoeventIdnumberstringEmittwo';
      let eventId60 = 'eventId60'
      let innerEvent60: notificationemitter.InnerEvent = {
        eventId: 60
      }
      let onCallback160 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once1 success');
      }
      let onCallback260 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once2 success');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.once(eventId60, onCallback160)
        notificationemitter.once(innerEvent60, onCallback260)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId60)
        notificationemitter.emit(innerEvent60)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        let num1: number = notificationemitter.getListenerCount(eventId60)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
        expect(num1).assertEqual(0);
        let num2 = notificationemitter.getListenerCount(innerEvent60.eventId)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
        expect(num2).assertEqual(0);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6100
     * @tc.name   : testEmitterOntwocallbackOfftwocallback
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwocallbackOfftwocallback', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwocallbackOfftwocallback';
      let eventId61 = 'eventId61'
      let onCallback161 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let onCallback261 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' once2 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId61, onCallback161)
        notificationemitter.on(eventId61, onCallback261)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId61, onCallback161)
        notificationemitter.off(eventId61, onCallback261)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId61)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6500
     * @tc.name   : testEmitterOneventIdonestringOffeventIdonestring
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdonestringOffeventIdonestring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdonestringOffeventIdonestring';
      let eventId65 = 'eventId65'
      let onCallback165 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId65, onCallback165)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId65)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId65)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6600
     * @tc.name   : testEmitterOntwostringOfftwo
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwostringOfftwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwostringOfftwo';
      let eventId66 = 'eventId66'
      let onCallback166 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId66, onCallback166)
        notificationemitter.on(eventId66, onCallback166)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId66)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId66)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num2 = notificationemitter.getListenerCount(eventId66)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(0);
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId66)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num3 = notificationemitter.getListenerCount(eventId66)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num3));
      expect(num3).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6700
     * @tc.name   : testEmitterOneventIdemptyOffeventIdonestring
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdemptyOffeventIdonestring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdemptyOffeventIdonestring';
      let eventId67 = ''
      let onCallback167 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId67, onCallback167)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId67)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId67)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(undefined);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6800
     * @tc.name   : testEmitterOneventIdwhitespaceOffeventIdonestring
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdwhitespaceOffeventIdonestring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdwhitespaceOffeventIdonestring';
      let eventId68 = ' '
      let onCallback168 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId68, onCallback168)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId68)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId68)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_6900
     * @tc.name   : testEmitterOneventIdonestringonenumberOfftwo
     * @tc.desc   : test off interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdonestringonenumberOfftwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdonestringonenumberOfftwo';
      let eventId69 = 'eventId69'
      let innerEvent69: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId69, onCallback169)
        notificationemitter.on(innerEvent69, onCallback169)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId69)
        notificationemitter.off(innerEvent69.eventId)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId69)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(0);
      let num1: number = notificationemitter.getListenerCount(innerEvent69.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_7300
     * @tc.name   : testEmitterOnoneEmitternodata
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOnoneEmitternodata', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOnoneEmitternodata';
      let eventId73 = 'eventId73'
      let onCallback173 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(true).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId73, onCallback173)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId73)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_7600
     * @tc.name   : testEmitterOntwoEmittertwo
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOntwoEmittertwo', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwoEmittertwo';
      let j = 0
      let eventId76 = 'eventId76'
      let option76: notificationemitter.Options = {
        priority: 0
      }
      let data176: notificationemitter.EventData = {
        data: ['event7600']
      }
      let onCallback176 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        j++;
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId76, onCallback176)
        notificationemitter.on(eventId76, onCallback176)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId76, option76, data176)
        notificationemitter.emit(eventId76, option76, data176)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        expect(j).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' onCallback1 success');
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_7800
     * @tc.name   : testEmitterOneventIdonestringonenumberEmitstring
     * @tc.desc   : test emit interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testEmitterOneventIdonestringonenumberEmitstring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdonestringonenumberEmitstring';
      let eventId78 = 'eventId78'
      let innerEvent78: notificationemitter.InnerEvent = {
        eventId: 78
      }
      let option78: notificationemitter.Options = {
        priority: 0
      }
      let data178: notificationemitter.EventData = {
        data: ['event7800']
      }
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
        notificationemitter.on(eventId78, onCallback178)
        notificationemitter.on(innerEvent78, onCallback278)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId78, option78, data178)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8000
    * @tc.name   : testEmitterOneventIdonestringonenumberEmitonestringonenumber
    * @tc.desc   : test emit interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOneventIdonestringonenumberEmitonestringonenumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdonestringonenumberEmitonestringonenumber';
      let j = 0
      let eventId80 = 'eventId80'
      let innerEvent80: notificationemitter.InnerEvent = {
        eventId: 80
      }
      let option80: notificationemitter.Options = {
        priority: 0
      }
      let data180: notificationemitter.EventData = {
        data: ['event8000']
      }
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
        notificationemitter.on(eventId80, onCallback180)
        notificationemitter.on(innerEvent80, onCallback280)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        notificationemitter.emit(eventId80, option80, data180)
        notificationemitter.emit(innerEvent80, data180)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        expect(j).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' onCallback1 success');
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8100
    * @tc.name   : testEmitterOntwocallbackGetListenerCounteventIdnumber
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOntwocallbackGetListenerCounteventIdnumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntwocallbackGetListenerCounteventIdnumber';
      let innerEvent81: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent81, onCallback181)
        notificationemitter.on(innerEvent81, onCallback281)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent81.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(2);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8200
    * @tc.name   : testEmitterOntennumberGetListenerCountnumber
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOntennumberGetListenerCountnumber', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntennumberGetListenerCountnumber';
      let innerEvent82: notificationemitter.InnerEvent = {
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
        notificationemitter.on(innerEvent82, onCallback182)
        notificationemitter.on(innerEvent82, onCallback282)
        notificationemitter.on(innerEvent82, onCallback382)
        notificationemitter.on(innerEvent82, onCallback482)
        notificationemitter.on(innerEvent82, onCallback582)
        notificationemitter.on(innerEvent82, onCallback682)
        notificationemitter.on(innerEvent82, onCallback782)
        notificationemitter.on(innerEvent82, onCallback882)
        notificationemitter.on(innerEvent82, onCallback982)
        notificationemitter.on(innerEvent82, onCallback1082)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(innerEvent82.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(10);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8300
    * @tc.name   : testEmitterOntenGetListenerCountstring
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOntenGetListenerCountstring', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntenGetListenerCountstring';
      let eventId83 = 'eventId83'
      let onCallback183 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
        notificationemitter.on(eventId83, onCallback183)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId83)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8400
    * @tc.name   : testEmitterOntennumbertenstringGetListenerCountstrnum
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOntennumbertenstringGetListenerCountstrnum', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntennumbertenstringGetListenerCountstrnum';
      let eventId84 = 'eventId84'
      let innerEvent84: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(eventId84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
        notificationemitter.on(innerEvent84, onCallback184)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId84)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(1);
      let num2 = notificationemitter.getListenerCount(innerEvent84.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(1);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8500
    * @tc.name   : testEmitterOntennumbertenstringOfffivestrfivenumGetListenerCountstrnum
    * @tc.desc   : test getListenerCount interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOntennumbertenstringOfffivestrfivenumGetListenerCountstrnum', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOntennumbertenstringOfffivestrfivenumGetListenerCountstrnum';
      let eventId85 = 'eventId85'
      let innerEvent85: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId85, onCallback185)
        notificationemitter.on(eventId85, onCallback285)
        notificationemitter.on(eventId85, onCallback385)
        notificationemitter.on(eventId85, onCallback485)
        notificationemitter.on(eventId85, onCallback585)
        notificationemitter.on(eventId85, onCallback685)
        notificationemitter.on(eventId85, onCallback785)
        notificationemitter.on(eventId85, onCallback885)
        notificationemitter.on(eventId85, onCallback985)
        notificationemitter.on(eventId85, onCallback1085)
        notificationemitter.on(innerEvent85, onCallback1185)
        notificationemitter.on(innerEvent85, onCallback1285)
        notificationemitter.on(innerEvent85, onCallback1385)
        notificationemitter.on(innerEvent85, onCallback1485)
        notificationemitter.on(innerEvent85, onCallback1585)
        notificationemitter.on(innerEvent85, onCallback1685)
        notificationemitter.on(innerEvent85, onCallback1785)
        notificationemitter.on(innerEvent85, onCallback1885)
        notificationemitter.on(innerEvent85, onCallback1985)
        notificationemitter.on(innerEvent85, onCallback2085)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId85, onCallback185)
        notificationemitter.off(eventId85, onCallback285)
        notificationemitter.off(eventId85, onCallback385)
        notificationemitter.off(eventId85, onCallback485)
        notificationemitter.off(eventId85, onCallback585)
        notificationemitter.off(innerEvent85.eventId, onCallback1185)
        notificationemitter.off(innerEvent85.eventId, onCallback1285)
        notificationemitter.off(innerEvent85.eventId, onCallback1385)
        notificationemitter.off(innerEvent85.eventId, onCallback1485)
        notificationemitter.off(innerEvent85.eventId, onCallback1585)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num1: number = notificationemitter.getListenerCount(eventId85)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(5);
      let num2 = notificationemitter.getListenerCount(innerEvent85.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num2));
      expect(num2).assertEqual(5);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8600
    * @tc.name   : testEmitterOneventIdstrnumOffstrnum
    * @tc.desc   : test off interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testEmitterOneventIdstrnumOffstrnum', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testEmitterOneventIdstrnumOffstrnum';
      let eventId86 = 'eventId86'
      let innerEvent86: notificationemitter.InnerEvent = {
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
        notificationemitter.on(eventId86, onCallback186)
        notificationemitter.on(innerEvent86, onCallback286)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off success');
        notificationemitter.off(eventId86)
        notificationemitter.off(innerEvent86.eventId)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' off failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = notificationemitter.getListenerCount(eventId86)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num));
      expect(num).assertEqual(0);
      let num1: number = notificationemitter.getListenerCount(innerEvent86.eventId)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' getListenerCount success,data is %{public}s', JSON.stringify(num1));
      expect(num1).assertEqual(0);
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })


    /*
     * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8700
     * @tc.name   : testDeserializeEmitterCallbackNoPar
     * @tc.desc   : test on interface success
     * @tc.size   : Large-scaleTest
     * @tc.type   : Interface
     * @tc.level  : Level 3
     */
    it('testDeserializeEmitterCallbackNoPar', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterCallbackNoPar';
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", () => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success,data is %{public}s');
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        })
        emitter.emit('eventid');
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8800
    * @tc.name   : testDeserializeEmitterCallback
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testDeserializeEmitterCallback', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterCallback';
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      const re = new RegExp("\\w+");
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const view: Int32Array = new Int32Array(buffer);
      const buffer1: ArrayBuffer = new ArrayBuffer(16);
      const view1: DataView = new DataView(buffer1, 0);
      const birthday: Date = new Date("December 17,1995 03:24:00");
      let a = view1.setInt16(1, 42);
      let b = view1.getInt16(1);
      const aa = new Set([1, 2, 3]);
      const errtypes = new Error('Whoops!');
      const bmaps = new Map([
        [1, 'one'], [2, 'two'], [3, 'three']
      ]);
      let testObject: emitter.EventData = {
        data: {
          'test': 1
        }
      };
      let eventData: emitter.EventData = {
        data: {
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
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", (eventData: emitter.EventData) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success,data is %{public}s', JSON.stringify(eventData));
          expect(true).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
          done();
        })
        emitter.emit('eventid', eventData);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_8900
    * @tc.name   : testDeserializeEmitterTwoOnCallbackNoPar
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testDeserializeEmitterTwoCallbackNoPar', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoCallbackNoPar';
      let count: number = 0;
      let oncallback1 = () => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
        count++;
      };
      let oncallback2 = () => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
        count++;
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventid", oncallback2);
        emitter.emit("eventid");
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        done();
      }, 1000);
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9000
    * @tc.name   : testDeserializeEmitterTwoOnCallback
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testDeserializeEmitterTwoOnCallback', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnCallback';
      let count: number = 0;
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
      const re = new RegExp("\\w+");
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const view: Int32Array = new Int32Array(buffer);
      const buffer1: ArrayBuffer = new ArrayBuffer(16);
      const view1: DataView = new DataView(buffer1, 0);
      const birthday: Date = new Date("December 17,1995 03:24:00");
      let a = view1.setInt16(1, 42);
      let b = view1.getInt16(1);
      const aa = new Set([1, 2, 3]);
      const errtypes = new Error('Whoops!');
      const bmaps = new Map([
        [1, 'one'], [2, 'two'], [3, 'three']
      ]);
      let testObject: emitter.EventData = {
        data: {
          'test': 1
        }
      };
      let eventData: emitter.EventData = {
        data: {
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
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventid", oncallback2);
        emitter.emit("eventid", eventData);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        done();
      }, 1000);
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9100
    * @tc.name   : testDeserializeEmitterTwoOnTwoEmitNoEventData
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 0
    */
    it('testDeserializeEmitterTwoOnTwoEmitNoEventData', Level.LEVEL0, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitNoEventData';
      let count: number = 0;
      let oncallback1 = () => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s');
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = () => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s');
        expect(true).assertTrue();
        count++;
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid");
        emitter.emit("eventids");
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        done();
      }, 1000);
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9200
    * @tc.name   : testDeserializeEmitterTwoOnTwoEmitStrignAndArray
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testDeserializeEmitterTwoOnTwoEmitStrignAndArray', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitStrignAndArray';
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
      let data1: emitter.EventData = {
        data: {
          'string': 'string'
        }
      };
      let data2: emitter.EventData = {
        data: {
          'Array': [1, 2, 7, 8]
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
    * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9300
    * @tc.name   : testDeserializeEmitterTwoOnTwoEmitNumberAndBoolean
    * @tc.desc   : test on interface success
    * @tc.size   : Large-scaleTest
    * @tc.type   : Interface
    * @tc.level  : Level 3
    */
    it('testDeserializeEmitterTwoOnTwoEmitNumberAndBoolean', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitNumberAndBoolean';
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
      let data1: emitter.EventData = {
        data: {
          'number': 1
        }
      };
      let data2: emitter.EventData = {
        data: {
          'Boolean': true
        }
      }
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9400
   * @tc.name   : testDeserializeEmitterTwoOnTwoEmitArrayAndBuffer
   * @tc.desc   : test on interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('testDeserializeEmitterTwoOnTwoEmitArrayAndBuffer', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitArrayAndBuffer';
      let count: number = 0;
      let oncallback1 = (data1: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s', JSON.stringify(data1));
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = (data2: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s', JSON.stringify(data2));
        expect(true).assertTrue();
        count++;
      };
      let data1: emitter.EventData = {
        data: {
          'Array': [1, 2, 3]
        }
      };
      const buffer1: ArrayBuffer = new ArrayBuffer(16);
      let data2: emitter.EventData = {
        data: {
          'Arraybuffer1': buffer1
        }
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
   * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9500
   * @tc.name   : testDeserializeEmitterTwoOnTwoEmitDateAndDateView
   * @tc.desc   : test on interface success
   * @tc.size   : Large-scaleTest
   * @tc.type   : Interface
   * @tc.level  : Level 3
   */
    it('testDeserializeEmitterTwoOnTwoEmitDateAndDateView', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitDateAndDateView';
      let count: number = 0;
      let oncallback1 = (data1: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s', JSON.stringify(data1));
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = (data2: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s', JSON.stringify(data2));
        expect(true).assertTrue();
        count++;
      };
      let birthday: Date = new Date('Decenmber 17,1995 03:24:00');
      let data1: emitter.EventData = {
        data: {
          'Date': birthday
        }
      };
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view = new DataView(buffer, 0);
      let data2: emitter.EventData = {
        data: {
          'Arraybuffer': view
        }
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
  * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9600
  * @tc.name   : testDeserializeEmitterTwoOnTwoEmitMapAndSet
  * @tc.desc   : test on interface success
  * @tc.size   : Large-scaleTest
  * @tc.type   : Interface
  * @tc.level  : Level 3
  */
    it('testDeserializeEmitterTwoOnTwoEmitMapAndSet', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitMapAndSet';
      let count: number = 0;
      let oncallback1 = (data1: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s', JSON.stringify(data1));
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = (data2: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s', JSON.stringify(data2));
        expect(true).assertTrue();
        count++;
      };
      const Sets = new Set([1, 2, 3]);
      let data1: emitter.EventData = {
        data: {
          'Sets': Sets
        }
      };
      const Maps = new Map([
        [1, 'one'], [2, 'two'], [3, 'three']
      ]);
      let data2: emitter.EventData = {
        data: {
          'Map': Maps
        }
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
 * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9700
 * @tc.name   : testDeserializeEmitterTwoOnTwoEmitErrorTypesAndTypedArray
 * @tc.desc   : test on interface success
 * @tc.size   : Large-scaleTest
 * @tc.type   : Interface
 * @tc.level  : Level 3
 */
    it('testDeserializeEmitterTwoOnTwoEmitErrorTypesAndTypedArray', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitErrorTypesAndTypedArray';
      let count: number = 0;
      let oncallback1 = (data1: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s', JSON.stringify(data1));
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = (data2: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s', JSON.stringify(data2));
        expect(true).assertTrue();
        count++;
      };
      const errtypes = new Error('Whoops!');
      let data1: emitter.EventData = {
        data: {
          'errtypes': errtypes
        }
      };
      const buffer = new ArrayBuffer(8);
      const view = new Int32Array(buffer);
      let data2: emitter.EventData = {
        data: {
          'TypeArray': view
        }
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

    /*
 * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_9800
 * @tc.name   : testDeserializeEmitterTwoOnTwoEmitRegExpAndPrimitivetypes
 * @tc.desc   : test on interface success
 * @tc.size   : Large-scaleTest
 * @tc.type   : Interface
 * @tc.level  : Level 3
 */
    it('testDeserializeEmitterTwoOnTwoEmitRegExpAndPrimitivetypes', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME = 'testDeserializeEmitterTwoOnTwoEmitRegExpAndPrimitivetypes';
      let count: number = 0;
      let oncallback1 = (data1: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success,data1 is %{public}s', JSON.stringify(data1));
        expect(true).assertTrue();
        count++;
      };
      let oncallback2 = (data2: emitter.EventData) => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on2 success,data2 is %{public}s', JSON.stringify(data2));
        expect(true).assertTrue();
        count++;
      };
      const re = new RegExp('\\w+');
      let data1: emitter.EventData = {
        data: {
          'RegExp': re
        }
      };
      const Primitivetypes = 1;
      let data2: emitter.EventData = {
        data: {
          'Primitivetypes': Primitivetypes
        }
      };
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
      try {
        emitter.on("eventid", oncallback1);
        emitter.on("eventids", oncallback2);
        emitter.emit("eventid", data1);
        emitter.emit("eventids", data2);
      } catch (e) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(e));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      ;
      setTimeout(() => {
        expect(count).assertEqual(2);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 1000);
    })

  })
}
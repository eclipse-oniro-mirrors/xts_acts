/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import systemDateTime from "@ohos.systemDateTime";

export default function systemDateTimeSyncJsunit() {
  describe('systemDateSyncTimeTest', () => {
    console.info('====>---------------systemDateTimeTest start-----------------------');

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_0010
     * @tc.number SUB_systemDateTime_getTime_sync_0010
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_0010", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getTime_sync_0010 start----------------");
      let currentTime = systemDateTime.getTime(true);
      console.info("====>SUB_systemDateTime_getTime_sync_0010 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getTime_sync_0010 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_0020
     * @tc.number SUB_systemDateTime_getTime_sync_0020
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_0020", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getTime_sync_0020 start----------------");
      let currentTime = systemDateTime.getTime(false);
      console.info("====>SUB_systemDateTime_getTime_sync_0020 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getTime_sync_0020 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_0030
     * @tc.number SUB_systemDateTime_getTime_sync_0030
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_0030", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getTime_sync_0030 start----------------");
      let currentTime = systemDateTime.getTime();
      console.info("====>SUB_systemDateTime_getTime_sync_0030 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getTime_sync_0030 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0050
     * @tc.number SUB_systemDateTime_getUptime_sync_0050
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0050", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0050 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, true);
      console.info("====>SUB_systemDateTime_getUptime_sync_0050 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0050 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0060
     * @tc.number SUB_systemDateTime_getUptime_sync_0060
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0060", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0060 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      console.info("====>SUB_systemDateTime_getUptime_sync_0060 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0060 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0070
     * @tc.number SUB_systemDateTime_getUptime_sync_0070
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0070", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0070 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE);
      console.info("====>SUB_systemDateTime_getUptime_sync_0070 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0070 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0090
     * @tc.number SUB_systemDateTime_getUptime_sync_0090
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0090", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0090 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, true);
      console.info("====>SUB_systemDateTime_getUptime_sync_0090 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0090 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0100
     * @tc.number SUB_systemDateTime_getUptime_sync_0100
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0100", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0100 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      console.info("====>SUB_systemDateTime_getUptime_sync_0100 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0110
     * @tc.number SUB_systemDateTime_getUptime_sync_0110
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0110", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0110 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP);
      console.info("====>SUB_systemDateTime_getUptime_sync_0110 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'number').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0110 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTimezoneSync_sync_0130
     * @tc.number SUB_systemDateTime_getTimezoneSync_sync_0130
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezoneSync_sync_0130', Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getTimezoneSync_sync_0130 start----------------");
      let timeZone = systemDateTime.getTimezoneSync();
      console.info("====>SUB_systemDateTime_getTimezoneSync_sync_0130 currentTime: " + JSON.stringify(timeZone));
      expect(typeof(timeZone) === 'string').assertEqual(true);
      done();
      console.info("====>----------SUB_systemDateTime_getTimezoneSync_sync_0130 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_0150
     * @tc.number SUB_systemDateTime_getUptime_sync_0150
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_0150", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getUptime_sync_0150 start----------------");
      try{
        let errTimeType: systemDateTime.TimeType | undefined;
        let realTime = systemDateTime.getUptime(errTimeType);
        console.info("====>SUB_systemDateTime_getUptime_sync_0150 currentTime: " + JSON.stringify(realTime));
        expect().assertFail();
        done();
      }catch(err){
        expect(err.code).assertEqual(401);
        console.info(`====>SUB_systemDateTime_getUptime_sync_0150 err.code:${err.code}, err.message:${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_systemDateTime_getAutoTimeStatus_sync_0100
     * @tc.number SUB_systemDateTime_getAutoTimeStatus_sync_0100
     * @tc.desc   Test systemTimeDate_getAutoTimeStatus API functionality..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getAutoTimeStatus_sync_0100", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemDateTime_getAutoTimeStatus_sync_0100 start----------------");
      try {
        let status: boolean = systemDateTime.getAutoTimeStatus();
        console.info(`====>SUB_systemDateTime_getAutoTimeStatus_sync_0100 status:${status}`);
        expect(status == true || status == false).assertTrue();
        done(); 
      } catch (err){
        console.info(`====>SUB_systemDateTime_getAutoTimeStatus_sync_0100 err.code:${err.code}, err.message:${err.message}`);
        expect().assertFail();
        done();
      }
    });
  });
};
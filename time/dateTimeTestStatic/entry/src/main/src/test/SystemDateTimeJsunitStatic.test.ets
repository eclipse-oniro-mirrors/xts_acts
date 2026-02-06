/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemDateTime from "@ohos.systemDateTime";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function SystemDateTimeJsunitStaticTest() {

    describe("SystemDateTimeJsunitStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'SystemDateTimeJsunitStaticTest start');
        
    /**
     * @tc.name   SUB_systemDateTime_getTimezone_JS_API_Static_0100
     * @tc.number SUB_systemDateTime_getTimezone_JS_API_Static_0100
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezone_JS_API_Static_0100', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0100 start");
      await systemDateTime.getTimezone().then( (data: string) : Promise<string> => {
        hilog.info(domain, tag, "SUB_systemDateTime_getTimezone_JS_API_Static_0100 data = " + data);
        expect(data != null).assertTrue();
        done();
      }).catch((error: Error): Promise<string> => {
        expect().assertFail();
        done();
      });
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0100 end");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_Static_0010
     * @tc.number SUB_systemDateTime_getTime_sync_Static_0010
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_Static_0010", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0010 start----------------");
      let currentTime = systemDateTime.getTime(true);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0010 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0010 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTimezone_JS_API_Static_0200
     * @tc.number SUB_systemDateTime_getTimezone_JS_API_Static_0200
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezone_JS_API_Static_0200', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 start");
      systemDateTime.getTimezone((err, data) => {
        try{
          if(err != null){
            hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 getTimezone fail: " + err);
            expect().assertFail();
            done();
          }
          hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 getTimezone success: " + data);
          expect(data != null).assertTrue();
          done();
        }catch(error){
          hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 catch error " + error);
          done();
        }
      })
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezone_JS_API_Static_0200 end");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_Static_0020
     * @tc.number SUB_systemDateTime_getTime_sync_Static_0020
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_Static_0020", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0020 start----------------");
      let currentTime = systemDateTime.getTime(false);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0020 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0020 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTime_sync_Static_0030
     * @tc.number SUB_systemDateTime_getTime_sync_Static_0030
     * @tc.desc   Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getTime_sync_Static_0030", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0030 start----------------");
      let currentTime = systemDateTime.getTime();
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTime_sync_Static_0030 currentTime: " + JSON.stringify(currentTime));
      expect(typeof(currentTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTime_sync_Static_0030 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0050
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0050
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0050", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0050 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, true);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0050 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0050 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0060
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0060
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0060", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0060 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0060 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0060 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0070
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0070
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0070", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0070 start----------------");
      let realActiveTime = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0070 currentTime: " + JSON.stringify(realActiveTime));
      expect(typeof(realActiveTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0070 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0090
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0090
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0090", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0090 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, true);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0090 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0090 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0100
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0100
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0100", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0100 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0100 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getUptime_sync_Static_0110
     * @tc.number SUB_systemDateTime_getUptime_sync_Static_0110
     * @tc.desc   Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemDateTime_getUptime_sync_Static_0110", Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0110 start----------------");
      let realTime = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP);
      hilog.info(domain, tag, "====>SUB_systemDateTime_getUptime_sync_Static_0110 currentTime: " + JSON.stringify(realTime));
      expect(typeof(realTime) === 'long').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getUptime_sync_Static_0110 end-----------------");
    });

    /**
     * @tc.name   SUB_systemDateTime_getTimezoneSync_sync_Static_0130
     * @tc.number SUB_systemDateTime_getTimezoneSync_sync_Static_0130
     * @tc.desc   Test systemTimeDate_setTimezone API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_systemDateTime_getTimezoneSync_sync_Static_0130', Level.LEVEL2, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTimezoneSync_sync_Static_0130 start----------------");
      let timeZone = systemDateTime.getTimezoneSync();
      hilog.info(domain, tag, "====>SUB_systemDateTime_getTimezoneSync_sync_Static_0130 currentTime: " + JSON.stringify(timeZone));
      expect(typeof(timeZone) === 'string').assertEqual(true);
      done();
      hilog.info(domain, tag, "====>----------SUB_systemDateTime_getTimezoneSync_sync_Static_0130 end-----------------");
    });


    })

}
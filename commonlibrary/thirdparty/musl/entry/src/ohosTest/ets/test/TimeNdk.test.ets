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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import time from 'libtimendk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'
import Utils from './Utils'

export default function timeNdkTest() {

  describe('MuslTimeTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTimeSetitimer001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0100
     * @tc.desc   test setitimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetitimer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = time.setitimer(0, 100000, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslTimeSetitimer002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0200
     * @tc.desc   test setitimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetitimer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = time.setitimer(0, 0, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslTimeSetitimer003
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0300
     * @tc.desc   test setitimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetitimer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = time.setitimer(0, 100000, 0, 0);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslTimeSetitimer004
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0400
     * @tc.desc   test setitimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetitimer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = time.setitimer(100000, 100000, 100000, 0);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0100
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%c"
      let c:String = time.strftime(a);
      expect(c).assertEqual("Sat Jul 30 18:40:14 2022");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0200
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%D"
      let c:String = time.strftime(a);
      expect(c).assertEqual("07/30/22");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime003
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0300
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%I"
      let c:String = time.strftime(a);
      expect(c).assertEqual("06");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime004
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0400
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%F"
      let c:String = time.strftime(a);
      expect(c).assertEqual("2022-07-30");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime005
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0500
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%j"
      let c:String = time.strftime(a);
      expect(c).assertEqual("211");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime006
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0600
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%R"
      let c:String = time.strftime(a);
      expect(c).assertEqual("18:40");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime007
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0700
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%v"
      let c:String = time.strftime(a);
      expect(c).assertEqual("30-Jul-2022");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime008
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0800
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%P"
      let c:String = time.strftime(a);
      expect(c).assertEqual("pm");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime009
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0900
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%T"
      let c: String = time.strftime(a);
      expect(c).assertEqual("18:40:14");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftime010
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_1000
     * @tc.desc   test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftime010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%k"
      let c: String = time.strftime(a);
      expect(c).assertEqual("18");
      done()
    });

    /**
     * @tc.name   testMuslTimeStrftimeL001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0100
     * @tc.desc   test strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftimeL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%c"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("Sat Jul 30 18:40:14 2022");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftimeL002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0200
     * @tc.desc   test strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftimeL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%D"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("07/30/22");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftimeL003
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0300
     * @tc.desc   test strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftimeL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%I"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("06");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftimeL004
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0400
     * @tc.desc   test strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftimeL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%F"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("2022-07-30");
      done()
    });
    /**
     * @tc.name   testMuslTimeStrftimeL005
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0500
     * @tc.desc   test strftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrftimeL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%j"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("211");
      done()
    });

    /**
     * @tc.name   testMuslTimeTimegm001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMEGM_0100
     * @tc.desc   test timegm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimegm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = time.timegm();
      expect(c).assertEqual(1659206414);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimespecget001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMESPECGET_0100
     * @tc.desc   test timespec_get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimespecget001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = time.timespec_get(a);
      expect(c).assertEqual(1);
      done()
    });
    /**
     * @tc.name   testMuslTimeTimerCreate001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMECREATE_0100
     * @tc.desc   test timer_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_create(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimerGetoverrun001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMERGETOVERRUN_0100
     * @tc.desc   test timer_getoverrun
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerGetoverrun001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_getoverrun(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimerGettime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMERGETTIME_0100
     * @tc.desc   test timer_gettime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerGettime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_gettime(a);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.name   testMuslTimeStrptime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_STRPTIME_0100
     * @tc.desc   test strptime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeStrptime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = "%u"
      let c: String = time.strptime(a);
      expect(c).assertEqual("");
      done()
    });

    /**
     * @tc.name   testMuslTimeTzset001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TZSET_0100
     * @tc.desc   test tzset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTzset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.tzset();
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeCTime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CTIME_0100
     * @tc.desc   test ctime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeCTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time.ctime()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeCTimeR001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CTIME_R_0100
     * @tc.desc   test ctime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeCTimeR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time.ctime_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeDiffTime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_DIFFTIME_0100
     * @tc.desc   test difftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeDiffTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let backParam = false;
      if (time.difftime() >= 0 || time.difftime() <= 0) {
        backParam = true;
      }
      expect(backParam).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslTimeAsctime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_ASCTIME_0100
     * @tc.desc   test asctime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeAsctime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.asctime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeAsctimeR001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_ASCTIMER_0100
     * @tc.desc   test asctime_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeAsctimeR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.asctimeR();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClock001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCK_0100
     * @tc.desc   test clock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.clock();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClockGetcpuclockid001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETCPUCLOCKED_0100
     * @tc.desc   test clock_getcpuclockid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClockGetcpuclockid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.clockGetcpuclockid();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClockGetres001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETRES_0100
     * @tc.desc   test clock_getres
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClockGetres001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockGetres();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClockGettime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETTIME_0100
     * @tc.desc   test clock_gettime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClockGettime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockGettime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClockNanosleep001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCKNANOSLEEP_0100
     * @tc.desc   test clock_nanosleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClockNanosleep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockNanosleep();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeClockSettime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_CLOCKSETTIME_0100
     * @tc.desc   test clock_settime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeClockSettime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockSettime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTimeLocaltime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_LOCALTIME_0100
     * @tc.desc   test localtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeLocaltime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.localtime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeLocaltimeR001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_LOCALTIME_R_0100
     * @tc.desc   test localtimeR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeLocaltimeR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.localtimeR();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeMkTime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_MKTIME_0100
     * @tc.desc   test mktime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeMkTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.mkTime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeGmtime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GMTIME_0100
     * @tc.desc   test gmtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGmtime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.gmtime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeGmtimeR001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GMTIME_R_0100
     * @tc.desc   test gmtimeR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGmtimeR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.gmtimeR();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeLutimes001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_LUTIMES_0100
     * @tc.desc   test lutimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeLutimes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.lutimes();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeNanosleep001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_NANOSLEEP_0100
     * @tc.desc   test nanosleep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeNanosleep001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = time.nanosleep();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslTimeTimeZone001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMEZONE_0100
     * @tc.desc   test timezone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimeZone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = time.timeZone();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeTime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIME_0100
     * @tc.desc   test time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = time.time();
      console.info("Test result= " + result);
      expect(result).assertLarger(0);
      done();
    });

    /**
     * @tc.name   testMuslTimeGetDateErr001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GETDATEERR_0100
     * @tc.desc   test getdate_err
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGetDateErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = time.getdateErr();
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslTimeDaylight001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_DAYLIGHT_0100
     * @tc.desc   test daylight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeDaylight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = time.daylight();
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
    });
  })
}

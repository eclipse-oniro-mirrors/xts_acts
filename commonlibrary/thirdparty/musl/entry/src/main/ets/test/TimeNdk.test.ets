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

import { describe, expect, it } from '@ohos/hypium'
import time from 'libtimendk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function timeNdkTest() {

  describe('MuslTimeTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETITIMER_0100
     * @tc.name       : testMuslTimeGetITimer001
     * @tc.desc       : test getitimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGetITimer001', 0, async (done: Function) => {
      let data:number = time.getITimer();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_0100
     * @tc.name       : testMuslTimeGetTimeOfDay001
     * @tc.desc       : test gettimeofday
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGetTimeOfDay001', 0, async (done: Function) => {
      let data:number = time.getTimeOfDay();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0100
     * @tc.name       : testMuslTimeSetitimer001
     * @tc.desc       : test setitimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer001', 0, async (done: Function) => {
      let a:number = time.setitimer(0, 100000, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0200
     * @tc.name       : testMuslTimeSetitimer002
     * @tc.desc       : test setitimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer002', 0, async (done: Function) => {
      let a:number = time.setitimer(0, 0, 0, 100000);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0300
     * @tc.name       : testMuslTimeSetitimer003
     * @tc.desc       : test setitimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer003', 0, async (done: Function) => {
      let a:number = time.setitimer(0, 100000, 0, 0);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_0400
     * @tc.name       : testMuslTimeSetitimer004
     * @tc.desc       : test setitimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeSetitimer004', 0, async (done: Function) => {
      let a:number = time.setitimer(100000, 100000, 100000, 0);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0100
     * @tc.name       : testMuslTimeStrftime001
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime001', 0, async (done: Function) => {
      let a = "%c"
      let c:String = time.strftime(a);
      expect(c).assertEqual("Sat Jul 30 18:40:14 2022");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0200
     * @tc.name       : testMuslTimeStrftime002
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime002', 0, async (done: Function) => {
      let a = "%D"
      let c:String = time.strftime(a);
      expect(c).assertEqual("07/30/22");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0300
     * @tc.name       : testMuslTimeStrftime003
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime003', 0, async (done: Function) => {
      let a = "%I"
      let c:String = time.strftime(a);
      expect(c).assertEqual("06");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0400
     * @tc.name       : testMuslTimeStrftime004
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime004', 0, async (done: Function) => {
      let a = "%F"
      let c:String = time.strftime(a);
      expect(c).assertEqual("2022-07-30");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0500
     * @tc.name       : testMuslTimeStrftime005
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime005', 0, async (done: Function) => {
      let a = "%j"
      let c:String = time.strftime(a);
      expect(c).assertEqual("211");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0600
     * @tc.name       : testMuslTimeStrftime006
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime006', 0, async (done: Function) => {
      let a = "%R"
      let c:String = time.strftime(a);
      expect(c).assertEqual("18:40");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0700
     * @tc.name       : testMuslTimeStrftime007
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime007', 0, async (done: Function) => {
      let a = "%v"
      let c:String = time.strftime(a);
      expect(c).assertEqual("30-Jul-2022");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0800
     * @tc.name       : testMuslTimeStrftime008
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime008', 0, async (done: Function) => {
      let a = "%P"
      let c:String = time.strftime(a);
      expect(c).assertEqual("pm");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_0900
     * @tc.name       : testMuslTimeStrftime009
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime009', 0, async (done: Function) => {
      let a = "%T"
      let c: String = time.strftime(a);
      expect(c).assertEqual("18:40:14");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_1000
     * @tc.name       : testMuslTimeStrftime010
     * @tc.desc       : test strftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftime010', 0, async (done: Function) => {
      let a = "%k"
      let c: String = time.strftime(a);
      expect(c).assertEqual("18");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0100
     * @tc.name       : testMuslTimeStrftimeL001
     * @tc.desc       : test strftime_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftimeL001', 0, async (done: Function) => {
      let a = "%c"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("Sat Jul 30 18:40:14 2022");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0200
     * @tc.name       : testMuslTimeStrftimeL002
     * @tc.desc       : test strftime_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftimeL002', 0, async (done: Function) => {
      let a = "%D"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("07/30/22");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0300
     * @tc.name       : testMuslTimeStrftimeL003
     * @tc.desc       : test strftime_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftimeL003', 0, async (done: Function) => {
      let a = "%I"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("06");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0400
     * @tc.name       : testMuslTimeStrftimeL004
     * @tc.desc       : test strftime_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftimeL004', 0, async (done: Function) => {
      let a = "%F"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("2022-07-30");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRFTIME_L_0500
     * @tc.name       : testMuslTimeStrftimeL005
     * @tc.desc       : test strftime_l
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrftimeL005', 0, async (done: Function) => {
      let a = "%j"
      let c: String = time.strftime_l(a);
      expect(c).assertEqual("211");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMEGM_0100
     * @tc.name       : testMuslTimeTimegm001
     * @tc.desc       : test timegm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimegm001', 0, async (done: Function) => {
      let c: number = time.timegm();
      expect(c).assertEqual(1659206414);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMESPECGET_0100
     * @tc.name       : testMuslTimeTimespecget001
     * @tc.desc       : test timespec_get
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimespecget001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timespec_get(a);
      expect(c).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMECREATE_0100
     * @tc.name       : testMuslTimeTimerCreate001
     * @tc.desc       : test timer_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerCreate001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_create(a);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMERDELETE_0100
     * @tc.name       : testMuslTimeTimerDelete001
     * @tc.desc       : test timer_delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerDelete001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_delete(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMERGETOVERRUN_0100
     * @tc.name       : testMuslTimeTimerGetoverrun001
     * @tc.desc       : test timer_getoverrun
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerGetoverrun001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_getoverrun(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMERGETTIME_0100
     * @tc.name       : testMuslTimeTimerGettime001
     * @tc.desc       : test timer_gettime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerGettime001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_gettime(a);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMERSETTIME_0100
     * @tc.name       : testMuslTimeTimerSettime001
     * @tc.desc       : test timer_settime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerSettime001', 0, async (done: Function) => {
      let a = 1;
      let c: number = time.timer_settime(a);
      expect(c).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_STRPTIME_0100
     * @tc.name       : testMuslTimeStrptime001
     * @tc.desc       : test strptime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeStrptime001', 0, async (done: Function) => {
      let a = "%u"
      let c: String = time.strptime(a);
      expect(c).assertEqual("");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TZSET_0100
     * @tc.name       : testMuslTimeTzset001
     * @tc.desc       : test tzset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTzset001', 0, async (done: Function) => {
      let a: number = time.tzset();
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CTIME_0100
     * @tc.name       : testMuslTimeCTime001
     * @tc.desc       : test ctime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeCTime001', 0, async (done: Function) => {
      expect(time.ctime()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CTIME_R_0100
     * @tc.name       : testMuslTimeCTimeR001
     * @tc.desc       : test ctime_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeCTimeR001', 0, async (done: Function) => {
      expect(time.ctime_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_DIFFTIME_0100
     * @tc.name       : testMuslTimeDiffTime001
     * @tc.desc       : test difftime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeDiffTime001', 0, async (done: Function) => {
      let backParam = false;
      if (time.difftime() >= 0 || time.difftime() <= 0) {
        backParam = true;
      }
      expect(backParam).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_ASCTIME_0100
     * @tc.name       : testMuslTimeAsctime001
     * @tc.desc       : test asctime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeAsctime001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.asctime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_ASCTIMER_0100
     * @tc.name       : testMuslTimeAsctimeR001
     * @tc.desc       : test asctime_r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeAsctimeR001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.asctimeR();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_0100
     * @tc.name       : testMuslTimeClock001
     * @tc.desc       : test clock
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClock001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.clock();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_ADJTIME_0100
     * @tc.name       : testMuslTimeClockAdjtime001
     * @tc.desc       : test clock_adjtime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockAdjtime001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.clockAdjtime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETCPUCLOCKED_0100
     * @tc.name       : testMuslTimeClockGetcpuclockid001
     * @tc.desc       : test clock_getcpuclockid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockGetcpuclockid001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = time.clockGetcpuclockid();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETRES_0100
     * @tc.name       : testMuslTimeClockGetres001
     * @tc.desc       : test clock_getres
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockGetres001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockGetres();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_GETTIME_0100
     * @tc.name       : testMuslTimeClockGettime001
     * @tc.desc       : test clock_gettime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockGettime001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockGettime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCKNANOSLEEP_0100
     * @tc.name       : testMuslTimeClockNanosleep001
     * @tc.desc       : test clock_nanosleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockNanosleep001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockNanosleep();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCKSETTIME_0100
     * @tc.name       : testMuslTimeClockSettime001
     * @tc.desc       : test clock_settime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeClockSettime001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = time.clockSettime();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_LOCALTIME_0100
     * @tc.name       : testMuslTimeLocaltime001
     * @tc.desc       : test localtime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeLocaltime001', 0, async (done: Function) => {
      let a: number = time.localtime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_LOCALTIME_R_0100
     * @tc.name       : testMuslTimeLocaltimeR001
     * @tc.desc       : test localtimeR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeLocaltimeR001', 0, async (done: Function) => {
      let a: number = time.localtimeR();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_MKTIME_0100
     * @tc.name       : testMuslTimeMkTime001
     * @tc.desc       : test mktime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeMkTime001', 0, async (done: Function) => {
      let a: number = time.mkTime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GMTIME_0100
     * @tc.name       : testMuslTimeGmtime001
     * @tc.desc       : test gmtime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGmtime001', 0, async (done: Function) => {
      let a: number = time.gmtime();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GMTIME_R_0100
     * @tc.name       : testMuslTimeGmtimeR001
     * @tc.desc       : test gmtimeR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeGmtimeR001', 0, async (done: Function) => {
      let a: number = time.gmtimeR();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_LUTIMES_0100
     * @tc.name       : testMuslTimeLutimes001
     * @tc.desc       : test lutimes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeLutimes001', 0, async (done: Function) => {
      let a: number = time.lutimes();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_NANOSLEEP_0100
     * @tc.name       : testMuslTimeNanosleep001
     * @tc.desc       : test nanosleep
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeNanosleep001', 0, async (done: Function) => {
      let a: number = time.nanosleep();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMEZONE_0100
     * @tc.name       : testMuslTimeTimeZone001
     * @tc.desc       : test timezone
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeTimeZone001', 0, async (done: Function) => {
      let data: number = time.timeZone();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIME_0100
     * @tc.name       : testMuslTimeTime001
     * @tc.desc       : test time
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTime001', 0, async (done: Function) => {
      let result: number = time.time();
      console.info("Test result= " + result);
      expect(result).assertLarger(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETDATEERR_0100
     * @tc.name       : testMuslTimeGetDateErr001
     * @tc.desc       : test getdate_err
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGetDateErr001', 0, async (done: Function) => {
      let result: number = time.getdateErr();
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_DAYLIGHT_0100
     * @tc.name       : testMuslTimeDaylight001
     * @tc.desc       : test daylight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeDaylight001', 0, async (done: Function) => {
      let result: number = time.daylight();
      console.info("Test result= " + result);
      expect(result).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETTIMEOFDAY_0100
     * @tc.name       : testMuslTimeSettimeofday001
     * @tc.desc       : test settimeofday
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeSettimeofday001', 0, async (done: Function) => {
      let a: number = time.settimeofday();
      expect(a).assertEqual(0);
      done()
    });
  })
}

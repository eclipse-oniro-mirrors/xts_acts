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

import { describe, it, expect } from "@ohos/hypium"
import fnmatchndk from 'libfnmatch1ndk.so'

export default function fnmatch1NdkTest() {
  describe('FnMatch1NdkTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETITIMER_TIME64_0100
     * @tc.name       : testMuslTimeGetITimerTime64001
     * @tc.desc       : test __getitimer_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGetITimerTime64001', 0, async (done: Function) => {
      expect(fnmatchndk.__getitimer_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETITIMER_TIME64_0200
     * @tc.name       : testMuslTimeGetITimerTime64002
     * @tc.desc       : test __getitimer_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGetITimerTime64002', 0, async (done: Function) => {
      expect(fnmatchndk.__getitimer_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FNMATCH_FNMATCH_0100
     * @tc.name       : testMuslResourceGetRUsageTime64001
     * @tc.desc       : test __getrusage_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceGetRUsageTime64001', 0, async (done: Function) => {
      expect(fnmatchndk.__getrusage_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FNMATCH_FNMATCH_0200
     * @tc.name       : testMuslResourceGetRUsageTime64002
     * @tc.desc       : test __getrusage_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslResourceGetRUsageTime64002', 0, async (done: Function) => {
      expect(fnmatchndk.__getrusage_time64(-2)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_TIME64_0100
     * @tc.name       : testMuslTimeGetTimeOfDayTime64001
     * @tc.desc       : test __gettimeofday_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGetTimeOfDayTime64001', 0, async (done: Function) => {
      expect(fnmatchndk.__gettimeofday_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_TIME64_0200
     * @tc.name       : testMuslTimeGetTimeOfDayTime64002
     * @tc.desc       : test __gettimeofday_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeGetTimeOfDayTime64002', 0, async (done: Function) => {
      expect(fnmatchndk.__gettimeofday_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SELECT_SELECT_TIME64_0100
     * @tc.name       : testMuslSelectPSelectTime64001
     * @tc.desc       : test __pselect_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSelectPSelectTime64001', 0, async (done: Function) => {
      expect(fnmatchndk.__pselect_time64(1)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SELECT_SELECT_TIME64_0200
     * @tc.name       : testMuslSelectPSelectTime64002
     * @tc.desc       : test __pselect_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSelectPSelectTime64002', 0, async (done: Function) => {
      expect(fnmatchndk.__pselect_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_TIME64_0100
     * @tc.name       : testMuslTimeSetItimerTime64001
     * @tc.desc       : test __setitimer_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeSetItimerTime64001', 0, async (done: Function) => {
      expect(fnmatchndk.__setitimer_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_SETITIMER_TIME64_0200
     * @tc.name       : testMuslTimeSetItimerTime64002
     * @tc.desc       : test __setitimer_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeSetItimerTime64002', 0, async (done: Function) => {
      expect(fnmatchndk.__setitimer_time64(-1)).assertEqual(-1);
      done()
    });
  })
}

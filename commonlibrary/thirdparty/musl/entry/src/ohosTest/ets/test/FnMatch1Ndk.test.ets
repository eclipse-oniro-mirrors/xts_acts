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
import Utils from './Utils'
import fnmatchndk from 'libfnmatch1ndk.so'

export default function fnmatch1NdkTest() {
  describe('FnMatch1NdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTimeGetITimerTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GETITIMER_TIME64_0100
     * @tc.desc   test __getitimer_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGetITimerTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__getitimer_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeGetITimerTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GETITIMER_TIME64_0200
     * @tc.desc   test __getitimer_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGetITimerTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__getitimer_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslResourceGetRUsageTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_FNMATCH_FNMATCH_0100
     * @tc.desc   test __getrusage_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslResourceGetRUsageTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__getrusage_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslResourceGetRUsageTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_FNMATCH_FNMATCH_0200
     * @tc.desc   test __getrusage_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslResourceGetRUsageTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__getrusage_time64(-2)).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTimeGetTimeOfDayTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_TIME64_0100
     * @tc.desc   test __gettimeofday_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGetTimeOfDayTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__gettimeofday_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeGetTimeOfDayTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_GETTIMEOFDAY_TIME64_0200
     * @tc.desc   test __gettimeofday_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeGetTimeOfDayTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__gettimeofday_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSelectPSelectTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_SELECT_SELECT_TIME64_0100
     * @tc.desc   test __pselect_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSelectPSelectTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__pselect_time64(1)).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSelectPSelectTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_SELECT_SELECT_TIME64_0200
     * @tc.desc   test __pselect_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSelectPSelectTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__pselect_time64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTimeSetItimerTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_TIME64_0100
     * @tc.desc   test __setitimer_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetItimerTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__setitimer_time64(0)).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslTimeSetItimerTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_SETITIMER_TIME64_0200
     * @tc.desc   test __setitimer_time64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeSetItimerTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fnmatchndk.__setitimer_time64(-1)).assertEqual(-1);
      done()
    });
  })
}

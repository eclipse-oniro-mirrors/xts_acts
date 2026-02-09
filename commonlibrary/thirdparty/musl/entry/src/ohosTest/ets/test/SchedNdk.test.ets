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
import sched from 'libschedndk.so'

export default function schedNdkTest() {
  describe('MuslSchedTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslSchedShedCpualloc001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDCPUALLOC_0100
     * @tc.desc   test __sched_cpualloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedShedCpualloc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.schedCpualloc();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslSchedSchedGetPriorityMax001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMAX_0100
     * @tc.desc   test sched_get_priority_max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetPriorityMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number = sched.schedGetPriorityMax(testParam);
      expect(result).assertEqual(99);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetPriorityMax002
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMAX_0200
     * @tc.desc   test sched_get_priority_max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetPriorityMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 100
      let result:number = sched.schedGetPriorityMax(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetPriorityMin001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMIX_0100
     * @tc.desc   test sched_get_priority_min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetPriorityMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number = sched.schedGetPriorityMin(testParam);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetPriorityMin002
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPRIORITYMIN_0200
     * @tc.desc   test sched_get_priority_min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetPriorityMin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 100
      let result:number = sched.schedGetPriorityMin(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedYield001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDYIELD_0100
     * @tc.desc   test sched_yield
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedYield001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_yield();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetscheduler001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETSCHEDULER_0100
     * @tc.desc   MuslSchedTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetscheduler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_getscheduler(-1);
      expect(result).assertEqual(-1);
      done()
    });


    /**
     * @tc.name   testMuslSchedSchedSetparam001
     * @tc.number testMuslSchedSchedSetparam001
     * @tc.desc   testMuslSchedSchedSetparam001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedSetparam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_setparam(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedSetparam002
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETPARAM_0200
     * @tc.desc   test sched_setparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedSetparam002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_setparam(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedSetscheduler001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETSCHEDULER_0100
     * @tc.desc   test sched_setscheduler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedSetscheduler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_setscheduler(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedSetscheduler002
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETSCHEDULER_0200
     * @tc.desc   test sched_setscheduler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedSetscheduler002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_setscheduler(0);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetaffinity001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETAFFINITY_0100
     * @tc.desc   test sched_getaffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetaffinity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_getaffinity();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetcpu001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETCPU_0100
     * @tc.desc   test sched_getcpu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetcpu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_getcpu();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedSetaffinity001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDSETAFFINITY_0100
     * @tc.desc   test sched_setaffinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedSetaffinity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_setaffinity();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedRrGetInterval001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDRRGETINTERVAL_0100
     * @tc.desc   test sched_rr_get_interval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedRrGetInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_rr_get_interval(0);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedRrGetInterval002
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDEEGETINTERVAL_0200
     * @tc.desc   test sched_rr_get_interval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedRrGetInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.sched_rr_get_interval(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedCpuCount001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDCPUCOUNT_0100
     * @tc.desc   test schedCpuCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedCpuCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = sched.schedCpuCount();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSchedSchedGetparam001
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SCHEDGETPARAM_0100
     * @tc.desc   test sched_getparam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSchedSchedGetparam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = sched.schedGetparam();
      expect(data).assertEqual(0);
      done()
    });
  })
}
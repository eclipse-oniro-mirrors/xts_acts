/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'

export default function PerformanceAnalysisKit() {
  describe('PerformanceAnalysisKit2', () => {
    /**
     * @tc.name   HicollieInvalidArgument001
     * @tc.number SUB_HICOLLIE_INVALID_ARGUMENT_0100
     * @tc.desc   test HICOLLIEINVALIDARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HicollieInvalidArgument001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk2()
      console.error("====>HicollieInvalidArgument001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   HicollieWrongContext001
     * @tc.number SUB_HICOLLIE_WRONG_THREAD_CONTEXT_0100
     * @tc.desc   test HICOLLIEWRONGTHREADCONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HicollieWrongContext001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk()
      console.error("====>HicollieWrongContext001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   StuckDetectionWithTimeout001
     * @tc.number SUB_STUCKDETECTIONWITHTMEOUT_0100
     * @tc.desc   test STUCKDETECTIONWITHTMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StuckDetectionWithTimeout001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk1()
      console.error("====>StuckDetectionWithTimeout001 err: " + ret)
      expect(ret).assertEqual(0)
      done()

    })
    /**
     * @tc.name   SetTimer001
     * @tc.number SUB_SETTIMER_0100
     * @tc.desc   test SETTIMER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimer001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer1()
      console.error("====>SetTimer001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimer002
     * @tc.number SUB_SETTIMER_0200
     * @tc.desc   test SETTIMER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimer002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer2()
      console.error("====>SetTimer002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimer003
     * @tc.number SUB_SETTIMER_0300
     * @tc.desc   test SETTIMER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimer003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer3()
      console.error("====>SetTimer003 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimer004
     * @tc.number SUB_SETTIMER_0400
     * @tc.desc   test SETTIMER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimer004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer4()
      console.error("====>SetTimer004 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimerCode001
     * @tc.number SUB_SETTIMERCODE_0100
     * @tc.desc   test SETTIMERCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimerCode001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer1()
      console.error("====>SetTimer001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimerCode002
     * @tc.number SUB_SETTIMERCODE_0200
     * @tc.desc   test SETTIMERCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimerCode002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer2()
      console.error("====>SetTimer002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimerCode003
     * @tc.number SUB_SETTIMERCODE_0300
     * @tc.desc   test SETTIMERCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimerCode003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer3()
      console.error("====>SetTimer003 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   SetTimerCode004
     * @tc.number SUB_SETTIMERCODE_0400
     * @tc.desc   test SETTIMERCODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetTimerCode004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer4()
      console.error("====>SetTimer004 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /**
     * @tc.name   TestHiCollieJankC001
     * @tc.number SUB_TESTHICOLLIEJANKC_0100
     * @tc.desc   test TESTHICOLLIEJANKC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TestHiCollieJankC001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieJankC()
      console.error("====>TestHiCollieJankC001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

  })
}

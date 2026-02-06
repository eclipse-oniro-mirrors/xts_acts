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
    /*
* @tc.number     : SUB_HICOLLIE_INVALID_ARGUMENT_0100
* @tc.name       : HicollieInvalidArgument001
* @tc.desc       : test HICOLLIEINVALIDARGUMENT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('HicollieInvalidArgument001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk2()
      console.error("====>HicollieInvalidArgument001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_HICOLLIE_WRONG_THREAD_CONTEXT_0100
* @tc.name       : HicollieWrongContext001
* @tc.desc       : test HICOLLIEWRONGTHREADCONTEXT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('HicollieWrongContext001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk()
      console.error("====>HicollieWrongContext001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_STUCKDETECTIONWITHTMEOUT_0100
* @tc.name       : StuckDetectionWithTimeout001
* @tc.desc       : test STUCKDETECTIONWITHTMEOUT
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('StuckDetectionWithTimeout001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieStuckWithTimeoutNdk1()
      console.error("====>StuckDetectionWithTimeout001 err: " + ret)
      expect(ret).assertEqual(0)
      done()

    })
    /*
* @tc.number     : SUB_SETTIMER_0100
* @tc.name       : SetTimer001
* @tc.desc       : test SETTIMER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimer001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer1()
      console.error("====>SetTimer001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMER_0200
* @tc.name       : SetTimer002
* @tc.desc       : test SETTIMER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimer002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer2()
      console.error("====>SetTimer002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMER_0300
* @tc.name       : SetTimer003
* @tc.desc       : test SETTIMER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimer003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer3()
      console.error("====>SetTimer003 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMER_0400
* @tc.name       : SetTimer004
* @tc.desc       : test SETTIMER
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimer004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer4()
      console.error("====>SetTimer004 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMERCODE_0100
* @tc.name       : SetTimerCode001
* @tc.desc       : test SETTIMERCODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimerCode001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer1()
      console.error("====>SetTimer001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMERCODE_0200
* @tc.name       : SetTimerCode002
* @tc.desc       : test SETTIMERCODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimerCode002', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer2()
      console.error("====>SetTimer002 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMERCODE_0300
* @tc.name       : SetTimerCode003
* @tc.desc       : test SETTIMERCODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimerCode003', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer3()
      console.error("====>SetTimer003 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_SETTIMERCODE_0400
* @tc.name       : SetTimerCode004
* @tc.desc       : test SETTIMERCODE
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('SetTimerCode004', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.SetTimer4()
      console.error("====>SetTimer004 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })
    /*
* @tc.number     : SUB_TESTHICOLLIEJANKC_0100
* @tc.name       : TestHiCollieJankC001
* @tc.desc       : test TESTHICOLLIEJANKC
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('TestHiCollieJankC001', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.TestHiCollieJankC()
      console.error("====>TestHiCollieJankC001 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

  })
}

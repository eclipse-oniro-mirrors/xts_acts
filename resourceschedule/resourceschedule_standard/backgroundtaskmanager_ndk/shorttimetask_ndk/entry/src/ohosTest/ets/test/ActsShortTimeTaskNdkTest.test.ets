/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium'
import shortTimeTaskNdk from 'libshorttimetaskndk.so'

export default function ActsShortTimeTaskNdkTest() {
  describe('ActsShortTimeTaskNdkTest', () => {

    /**
     * @tc.number  : SUB_Resourceschedule_ShortTimeTask_RequestSuspendDelay_0100
     * @tc.name    : test Res_ShortTimeTask_RequestSuspendDelay Test Normal Scene
     * @tc.desc    : Apply for a normal short-time task.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_ShortTimeTask_RequestSuspendDelay_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_ShortTimeTask_RequestSuspendDelay_0100 start====");
        shortTimeTaskNdk.CancelSuspendDelay();
        let requestId: number = shortTimeTaskNdk.RequestSuspendDelay();
        console.log("SUB_Resourceschedule_ShortTimeTask_RequestSuspendDelay_0100 requestId: " + requestId);
        expect(requestId).assertLarger(0);
        done()
      } catch (err) {
        console.error("SUB_Resourceschedule_ShortTimeTask_RequestSuspendDelay_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_ShortTimeTask_GetRemainingDelayTime_0100
     * @tc.name    : test Res_ShortTimeTask_GetRemainingDelayTime Test Normal Scene
     * @tc.desc    : Apply for a normal short-time task.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_ShortTimeTask_GetRemainingDelayTime_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_ShortTimeTask_GetRemainingDelayTime_0100 start====");
        let time: number = shortTimeTaskNdk.GetRemainingDelayTime();
        console.log("SUB_Resourceschedule_ShortTimeTask_GetRemainingDelayTime_0100 time: " + time);
        done()
        expect(time).assertLarger(0);
      } catch (err) {
        console.error("SUB_Resourceschedule_ShortTimeTask_GetRemainingDelayTime_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_ShortTimeTask_CancelSuspendDelay_0100
     * @tc.name    : test Res_ShortTimeTask_CancelSuspendDelay Test Normal Scene
     * @tc.desc    : Apply for a normal short-time task.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_ShortTimeTask_CancelSuspendDelay_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_ShortTimeTask_CancelSuspendDelay_0100 start====");
        let ret: number = shortTimeTaskNdk.CancelSuspendDelay();
        console.log("SUB_Resourceschedule_ShortTimeTask_CancelSuspendDelay_0100 ret: " + ret);
        expect(ret).assertEqual(0);
        done()
      } catch (err) {
        console.error("SUB_Resourceschedule_ShortTimeTask_CancelSuspendDelay_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_ShortTimeTask_GetTransientTaskInfo_0100
     * @tc.name    : test Res_ShortTimeTask_GetTransientTaskInfo Test Normal Scene
     * @tc.desc    : Test GetTransientTaskInfo native function.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_ShortTimeTask_GetTransientTaskInfo_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_ShortTimeTask_GetTransientTaskInfo_0100 start====");
        let res = shortTimeTaskNdk.GetTransientTaskInfo();
        console.log("SUB_Resourceschedule_ShortTimeTask_GetTransientTaskInfo_0100 res: " + JSON.stringify(res));
        expect(res.remainingQuota).assertInstanceOf('Number');
        expect(res.transientTasks.length == 0).assertTrue();
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_ShortTimeTask_GetTransientTaskInfo_0100 catch err: " + err);
        expect(false).assertTrue();
        done();
      }
    })

  })
}

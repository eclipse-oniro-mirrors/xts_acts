/*
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

import { describe, expect, it, Level } from '@ohos/hypium'
import backgroundtaskerror from 'libbackgroundtaskerrorcode.so'
const Success = 0
export default function ActsBackgroundTaskErrorTest() {
  describe('ActsBackgroundTaskErrorTest', () => {
    /**
     * @tc.number  : SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100
     * @tc.name    : SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100
     * @tc.desc    : Test BackgroundProcessManagerSuccess
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100 start====");
        let res: number = backgroundtaskerror.BackgroundProcessManagerSuccess();
        console.log("SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_BackgroundProcessManagerSuccess_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200
     * @tc.name    : SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200
     * @tc.desc    : Test BackgroundProcessManagerInvalidParam
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200 start====");
        let res: number = backgroundtaskerror.BackgroundProcessManagerInvalidParam();
        console.log("SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_BackgroundProcessManagerInvalidParam_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300
     * @tc.name    : SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300
     * @tc.desc    : Test SetProcessPriorityInvalidParam
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300 start====");
        let res: number = backgroundtaskerror.SetProcessPriorityInvalidParam();
        console.log("SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_SetProcessPriorityInvalidParam_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_RequestSuspendDelaySuccess_0100
     * @tc.name    : SUB_Resourceschedule_RequestSuspendDelaySuccess_0100
     * @tc.desc    : Test RequestSuspendDelaySuccess
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_RequestSuspendDelaySuccess_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_RequestSuspendDelaySuccess_0100 start====");
        let res: number = backgroundtaskerror.RequestSuspendDelaySuccess();
        console.log("SUB_Resourceschedule_RequestSuspendDelaySuccess_0100 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_RequestSuspendDelaySuccess_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200
     * @tc.name    : SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200
     * @tc.desc    : Test RequestSuspendDelayInvalidParam
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200 start====");
        let res: number = backgroundtaskerror.RequestSuspendDelayInvalidParam();
        console.log("SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_RequestSuspendDelayInvalidParam_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300
     * @tc.name    : SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300
     * @tc.desc    : Test RequestSuspendDelaySVFailed
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300 start====");
        let res: number = backgroundtaskerror.RequestSuspendDelaySVFailed();
        console.log("SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_RequestSuspendDelaySVFailed_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400
     * @tc.name    : SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400
     * @tc.desc    : Test GetRemainingDelayTimeSuccess
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400 start====");
        let res: number = backgroundtaskerror.GetRemainingDelayTimeSuccess();
        console.log("SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_GetRemainingDelayTimeSuccess_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500
     * @tc.name    : SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500
     * @tc.desc    : Test GetRemainingDelayTimeInfoVerFailed
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500 start====");
        let res: number = backgroundtaskerror.GetRemainingDelayTimeInfoVerFailed();
        console.log("SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_GetRemainingDelayTimeInfoVerFailed_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_CancelSuspendDelaySuccess_0600
     * @tc.name    : SUB_Resourceschedule_CancelSuspendDelaySuccess_0600
     * @tc.desc    : Test CancelSuspendDelaySuccess
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_CancelSuspendDelaySuccess_0600', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_CancelSuspendDelaySuccess_0600 start====");
        let res: number = backgroundtaskerror.CancelSuspendDelaySuccess();
        console.log("SUB_Resourceschedule_CancelSuspendDelaySuccess_0600 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_CancelSuspendDelaySuccess_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700
     * @tc.name    : SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700
     * @tc.desc    : Test CancelSuspendDelayVerFailed
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700 start====");
        let res: number = backgroundtaskerror.CancelSuspendDelayVerFailed();
        console.log("SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_CancelSuspendDelayVerFailed_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800
     * @tc.name    : SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800
     * @tc.desc    : Test GetTransientTaskInfoSuccess
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800 start====");
        let res: number = backgroundtaskerror.GetTransientTaskInfoSuccess();
        console.log("SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_GetTransientTaskInfoSuccess_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_TransientTaskOK_0900
     * @tc.name    : SUB_Resourceschedule_TransientTaskOK_0900
     * @tc.desc    : Test TransientTaskOK
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_TransientTaskOK_0900', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_TransientTaskOK_0900 start====");
        let res: number = backgroundtaskerror.TransientTaskOK();
        console.log("SUB_Resourceschedule_TransientTaskOK_0900 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_TransientTaskOK_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_TransientTaskInvalidParam_1000
     * @tc.name    : SUB_Resourceschedule_TransientTaskInvalidParam_1000
     * @tc.desc    : Test TransientTaskInvalidParam
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_TransientTaskInvalidParam_1000', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_TransientTaskInvalidParam_1000 start====");
        let res: number = backgroundtaskerror.TransientTaskInvalidParam();
        console.log("SUB_Resourceschedule_TransientTaskInvalidParam_1000 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_TransientTaskInvalidParam_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100
     * @tc.name    : SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100
     * @tc.desc    : Test TransientTaskCIVerificationFailed
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100 start====");
        let res: number = backgroundtaskerror.TransientTaskCIVerificationFailed();
        console.log("SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_TransientTaskCIVerificationFailed_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_TransientTaskSVFailed_1200
     * @tc.name    : SUB_Resourceschedule_TransientTaskSVFailed_1200
     * @tc.desc    : Test TransientTaskSVFailed
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_TransientTaskSVFailed_1200', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_TransientTaskSVFailed_1200 start====");
        let res: number = backgroundtaskerror.TransientTaskSVFailed();
        console.log("SUB_Resourceschedule_TransientTaskSVFailed_1200 res: " + res);
        expect(res).assertEqual(Success);
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_TransientTaskSVFailed_1200 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}

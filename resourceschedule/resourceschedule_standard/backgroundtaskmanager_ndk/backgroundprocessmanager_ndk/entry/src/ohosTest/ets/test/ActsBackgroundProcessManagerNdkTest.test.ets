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
import { backgroundProcessManager } from '@kit.BackgroundTasksKit'
import backgroundProcessManagerNdk from 'libbackgroundprocessmanagerndk.so'

export default function ActsBackgroundProcessManagerNdkTest() {
  describe('ActsBackgroundProcessManagerNdkTest', () => {

    /**
     * @tc.number  : SUB_Resourceschedule_BackgroundProcessManager_SetProcessPriority_0100
     * @tc.name    : test Res_BackgroundProcessManager_SetProcessPriority Test Normal Scene
     * @tc.desc    : SetProcessPriority api normal call.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_BackgroundProcessManager_SetProcessPriority_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_BackgroundProcessManager_SetProcessPriority_0100 start====");
        let childProcessPid = 33333;
        let res: number = backgroundProcessManagerNdk.setProcessPriority(childProcessPid, 
        backgroundProcessManager.ProcessPriority.PROCESS_BACKGROUND);
        console.log("SUB_Resourceschedule_BackgroundProcessManager_SetProcessPriority_0100 res: " + res);
        expect(res == 0).assertTrue();
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_BackgroundProcessManager_SetProcessPriority_0100 catch err: " + err);
        done();
      }
    })

    /**
     * @tc.number  : SUB_Resourceschedule_BackgroundProcessManager_ResetProcessPriority_0100
     * @tc.name    : test Res_BackgroundProcessManager_ReSetProcessPriority Test Normal Scene
     * @tc.desc    : ReSetProcessPriority api normal call.
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Resourceschedule_BackgroundProcessManager_ResetProcessPriority_0100', Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_Resourceschedule_BackgroundProcessManager_ResetProcessPriority_0100 start====");
        let childProcessPid = 33333;
        let res: number = backgroundProcessManagerNdk.resetProcessPriority(childProcessPid);
        console.log("SUB_Resourceschedule_BackgroundProcessManager_ResetProcessPriority_0100 res: " + res);
        expect(res == 0).assertTrue();
        done();
      } catch (err) {
        console.error("SUB_Resourceschedule_BackgroundProcessManager_ResetProcessPriority_0100 catch err: " + err);
        done();
      }
    })

  })
}

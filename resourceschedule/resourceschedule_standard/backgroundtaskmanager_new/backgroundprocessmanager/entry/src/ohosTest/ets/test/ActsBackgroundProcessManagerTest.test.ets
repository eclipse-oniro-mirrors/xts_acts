/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@kit.BasicServicesKit'
import { backgroundProcessManager } from '@kit.BackgroundTasksKit'
import hilog from '@ohos.hilog';
import { describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium'

const TAG = "testTag";
const DOMAIN: number = 0x0000;

export default function BackgroundProcessManagerTest() {
  describe('ActsBackgroundProcessManagerTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })


    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001
     * @tc.desc:Test that the setProcessPriority function normal call and resetProcessPriority function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001 begin---');

        try {
          let childProcessPid = 33333;
          let callbackFlag = 0;
          try {
            backgroundProcessManager.setProcessPriority(childProcessPid,
            backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE);
            callbackFlag = 1;
            expect(true).assertTrue();
            done();
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001 setProcessPriority failed, errCode: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
          }

          try {
            backgroundProcessManager.resetProcessPriority(childProcessPid);
            expect(callbackFlag).assertLarger(0);
            done();
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001 setProcessPriority failed, errCode: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_001 end---');
      })

    
    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_002
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_002
     * @tc.desc:Test that the backgroundProcessManager enum ProcessPriority of PROCESS_BACKGROUND
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_002 begin---');
          let type = backgroundProcessManager.ProcessPriority.PROCESS_BACKGROUND;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003 ProcessPriority ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(1);
          done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_002 end---');
      })

      /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003
     * @tc.desc:Test that the backgroundProcessManager enum ProcessPriority of PROCESS_INACTIVE
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003 begin---');
          let type = backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003 backgroundTaskManager ProcessPriority: ' + type);
          expect(type).assertEqual(2);
          done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_XTS_003 end---');
      })

  })
}


/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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

const PERMISSION_DENIED_CODE = 201

export default function BackgroundProcessManager() {
  describe('ActsBackgroundProcessManager', () => {

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
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001
     * @tc.desc:Test that the setPowerSaveMode function interface does not request ohos.permission.BACKGROUND_MANAGER_POWER_SAVE_MODE
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001 begin---');

        try {
          let pid = 33333;
          backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE);
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001 has failed for' + error.message + ' code: ' + error.code);
          if(error.code == 801){
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
            done();
          }
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_001 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002
     * @tc.desc:Test that the isPowerSaveMode function interface does not request ohos.permission.BACKGROUND_MANAGER_POWER_SAVE_MODE
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002 begin---');

        try {
          let pid = 55555;
          backgroundProcessManager.isPowerSaveMode(pid);
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002 has failed for' + error.message + ' code: ' + error.code);
          if(error.code == 801){
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
            done();
          }
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_NOP_XTS_002 end---');
      })

  })
}
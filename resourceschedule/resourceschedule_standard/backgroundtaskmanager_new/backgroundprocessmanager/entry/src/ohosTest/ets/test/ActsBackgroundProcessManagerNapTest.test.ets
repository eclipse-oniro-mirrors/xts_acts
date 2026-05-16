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
import { process } from '@kit.ArkTS'
import hilog from '@ohos.hilog';
import { describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium'

const TAG = "testTag";
const DOMAIN: number = 0x0000;

export default function ActsBackgroundProcessManagerNapTest() {
  describe('ActsBackgroundProcessManagerNapTest', () => {

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


    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001
     * @tc.desc   Test that the setPowerSaveMode function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001 begin---');

        try {
          let pid = process.pid;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001 backgroundTaskManager pid: ' + pid);
          backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE);
          expect(true).assertTrue();
          done();
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001 has failed for' + error.message + ' code: ' + error.code);
          if (error.code == 801) {
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }}

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_001 end---');
      })
    
    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002
     * @tc.desc   Test that the backgroundProcessManager enum PowerSaveMode of EFFICIENCY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002 begin---');
          let type: number = backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002 PowerSaveMode: ' + type);
          expect(type).assertEqual(1);
          done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_002 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003
     * @tc.desc   Test that the backgroundProcessManager enum PowerSaveMode of DEFAULT_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003 begin---');
          let type: number = backgroundProcessManager.PowerSaveMode.DEFAULT_MODE;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003 backgroundTaskManager PowerSaveMode: ' + type);
          expect(type).assertEqual(2);
          done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_003 end---');
      })
      
    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004
     * @tc.desc   Test that the isPowerSaveMode function normal call and resetProcessPriority function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 begin---');

        try {
          let pid = process.pid;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 backgroundTaskManager pid: ' + pid);
          backgroundProcessManager.isPowerSaveMode(pid).then((res) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 isPowerSaveMode promise res: %{public}s', JSON.stringify(res));
          expect(res).assertInstanceOf('Boolean');
          expect(res == false).assertTrue();
          done();
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 isPowerSaveMode promise error: %{public}s', JSON.stringify(error));
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 has failed for' + error.message + ' code: ' + error.code);
          if (error.code == 801) {
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }}

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_004 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005
     * @tc.desc   Test that the setPowerSaveMode function call with errcode is 31800002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005 begin---');

        try {
          let pid = 55555;
          backgroundProcessManager.setPowerSaveMode(pid, backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE);
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005 has failed for' + error.message + ' code: ' + error.code);
          if (error.code == 801) {
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(error.code == 31800002).assertTrue();
            done();
          }}

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_005 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006
     * @tc.desc   Test that the getPowerSaveMode function normal call and resetProcessPriority function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 begin---');

        try {
          let pid = process.pid;
          console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 backgroundTaskManager pid: ' + pid);
          backgroundProcessManager.getPowerSaveMode(pid).then((res) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 getPowerSaveMode promise res: %{public}s', JSON.stringify(res));
         expect(res === backgroundProcessManager.PowerSaveMode.DEFAULT_MODE ||
          res === backgroundProcessManager.PowerSaveMode.EFFICIENCY_MODE).assertTrue();
          done();
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 getPowerSaveMode promise error: %{public}s', JSON.stringify(error));
          })
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 has failed for' + error.message + ' code: ' + error.code);
          if (error.code == 801) {
            expect(error.code == 801).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }}

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_NAP_XTS_006 end---');
      })

  })
}
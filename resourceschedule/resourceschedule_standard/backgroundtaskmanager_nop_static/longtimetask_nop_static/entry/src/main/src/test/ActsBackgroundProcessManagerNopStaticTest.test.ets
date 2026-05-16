/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import backgroundProcessManager from '@ohos.resourceschedule.backgroundProcessManager';
import { BusinessError } from "@ohos.base"
import Utils from './Util.test';

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const PERMISSION_DENIED_CODE = 201

export default function ActsBackgroundProcessManagerNopStaticTest() {
  describe('ActsBackgroundProcessManagerNopStaticTest', () => {


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
     * @tc.number SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001
     * @tc.desc   Test that the setPowerSaveMode function interface does not request ohos.permission.BACKGROUND_MANAGER_POWER_SAVE_MODE permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001 begin---');
        let childProcessPid = StdProcess.pid();
        let callbackFlag = 0;
        try {
          backgroundProcessManager.setPowerSaveMode(childProcessPid, backgroundProcessManager.PowerSaveMode.DEFAULT_MODE).then(() => {
            console.info('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001 backgroundTaskManager setPowerSaveMode: ' + childProcessPid);
            callbackFlag = 1;
            expect(callbackFlag).assertEqual(1);
            done();
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001 promise err code:" + err?.code + " message:" + err?.message);
            if (err.code === 801) {
              expect(err.code === 801).assertTrue();
              done();
            }else{
              expect(err.code === PERMISSION_DENIED_CODE).assertTrue();
              done();
            }
          });
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001 setPowerSaveMode failed, errCode: ${(error as Error).code}, message: ${(error as Error).message}`);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_001 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002
     * @tc.desc   Test that the isPowerSaveMode function interface does not request ohos.permission.BACKGROUND_MANAGER_POWER_SAVE_MODE permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 begin---');

        let childProcessPid = StdProcess.pid();
        let callbackFlag = 0;
        try {
          backgroundProcessManager.isPowerSaveMode(childProcessPid).then((result: boolean) => {
            console.info("SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 isPowerSaveMode: " + result.toString());
            console.info('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 backgroundTaskManager childProcessPid: ' + childProcessPid);
            callbackFlag = 1;
            expect(callbackFlag).assertEqual(1);
            done();
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 promise err code:" + err?.code + " message:" + err?.message);
            if (err.code === 801) {
              expect(err.code === 801).assertTrue();
              done();
            }else{
              expect(err.code === PERMISSION_DENIED_CODE).assertTrue();
              done();
            }
          });
        } catch (error) {
          let e: Error = error as Error;
          console.error(`SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 isPowerSaveMode failed, errCode: ${e.code}, message: ${e.message}`);
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_002 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003
     * @tc.desc   Test that the getPowerSaveMode function interface does not request ohos.permission.BACKGROUND_MANAGER_POWER_SAVE_MODE permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003 begin---');
        try {
          let pid = StdProcess.pid();
          console.info('SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003 backgroundTaskManager pid: ' + pid);
          backgroundProcessManager.getPowerSaveMode(pid).then((res: backgroundProcessManager.PowerSaveMode) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003 getPowerSaveMode promise res: %{public}s', JSON.stringify(res));
            expect(res === backgroundProcessManager.PowerSaveMode.DEFAULT_MODE).assertTrue();
            done();
          }).catch((error: Error) => {
            console.error("SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003 promise err code:" + error?.code + " message:" + error?.message);
            if (error.code === 801) {
              expect(error.code === 801).assertTrue();
              done();
            }else{
              expect(error.code === PERMISSION_DENIED_CODE).assertTrue();
              done();
            }
          })
        } catch (error) {}

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_PROCESS_MANAGER_NOP_STATIC_XTS_003 end---');
      })

  })
}


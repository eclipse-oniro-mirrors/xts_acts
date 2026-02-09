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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import backgroundProcessManager from '@ohos.resourceschedule.backgroundProcessManager';

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsBackgroundProcessManagerStaticTest() {

    describe("ActsBackgroundProcessManagerStaticTest", (): void => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'describe start');
        /**
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001
         * @tc.desc   Test that the setProcessPriority function normal call and resetProcessPriority function normal call
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
            it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
                async (done:() => void): Promise<void> => {
                    hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001 begin---');

                    try {
                        let childProcessPid = 33333;
                        let callbackFlag = 0;
                        try {
                            backgroundProcessManager.setProcessPriority(childProcessPid,
                                backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE);
                            callbackFlag = 1;
                            expect(callbackFlag).assertEqual(1);
                            done();
                        } catch (error) {
                            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001 setProcessPriority failed, errCode: ${(error as Error).code}, message: ${(error as Error).message}`);
                        }

                        try {
                            backgroundProcessManager.resetProcessPriority(childProcessPid);
                            expect(callbackFlag).assertLarger(0);
                            done();
                        } catch (error) {
                            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001 setProcessPriority failed, errCode: ${(error as Error).code}, message: ${(error as Error).message}`);
                        }
                    } catch (error) {
                        let e: Error = error as Error;
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }

                    hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_001 end---');
                })


        /**
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002
         * @tc.desc   Test that the backgroundProcessManager enum ProcessPriority of PROCESS_BACKGROUND
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done:() => void): Promise<void> => {
                hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002 begin---');
                let type = backgroundProcessManager.ProcessPriority.PROCESS_BACKGROUND;
                console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002 ProcessPriority ContinuousTaskCancelReason: ' + type);
                expect(type).assertEqual(1);
                done();

                hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_002 end---');
            })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003
         * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003
         * @tc.desc   Test that the backgroundProcessManager enum ProcessPriority of PROCESS_INACTIVE
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
          it('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
              async (done:() => void): Promise<void> => {
                  hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003 begin---');
                  let type = backgroundProcessManager.ProcessPriority.PROCESS_INACTIVE;
                  console.info('SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003 backgroundTaskManager ProcessPriority: ' + type);
                  expect(type).assertEqual(2);
                  done();

                  hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_PROCESS_MANAGER_STATIC_XTS_003 end---');
              })

    })

}
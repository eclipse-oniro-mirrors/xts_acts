/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import wantAgent from '@ohos.app.ability.wantAgent'
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsShortTimeTaskManagerStaticTest() {
  describe('ActsShortTimeTaskManagerStaticTest', () => {

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001
     * @tc.desc   Test that the requestSuspendDelay function normal call and cancelSuspendDelay function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 begin---');

        try {
          let myReason = 'test requestSuspendDelay';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 Request suspension delay will time out.---');
            })
            let id: number = delayInfo.requestId;
            let time: number = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);
            backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 cancelSuspendDelay success');
            done();
            } catch (error) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 requestSuspendDelay failed. code is: %{public}s' +
              JSON.stringify(error));
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 aa error: %{public}s' +
          JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_001 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002
     * @tc.desc   Test that the getRemainingDelayTime callback function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 begin---');

        try {
          let myReason = 'test requestSuspendDelay1';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 Request suspension delay will time out.---');
            })
            let id: number = delayInfo.requestId;
            let time: number = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);

            backgroundTaskManager.getRemainingDelayTime(delayInfo.requestId,
              (err: BusinessError<void> | null, res: int | undefined) => {
                if (err) {
                  hilog.info(DOMAIN, TAG,
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 Operation getRemainingDelayTime failed.%{public}s',
                    JSON.stringify(err));
                } else {
                  hilog.info(DOMAIN, TAG, '%{public}s',
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 res: ' + res);
                  expect(res).assertLarger(0);

                  backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
                  hilog.info(DOMAIN, TAG, '%{public}s',
                    'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 cancelSuspendDelay success');
                  done();
                }
              })
          } catch (error) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 requestSuspendDelay failed: %{public}s',
              JSON.stringify(error));
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 aa error: %{public}s',
            JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_002 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003
     * @tc.desc   Test that the getRemainingDelayTime promise function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 begin---');

        try {
          let myReason = 'test requestSuspendDelay2';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
              hilog.info(DOMAIN, TAG, '%{public}s',
                '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 Request suspension delay will time out.---');
            })
            let id: int = delayInfo.requestId;
            let time: int = delayInfo.actualDelayTime;
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 The requestId is: ' + delayInfo.requestId);
            hilog.info(DOMAIN, TAG, '%{public}s',
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 The actualDelayTime is: ' + delayInfo.actualDelayTime);
            expect(id).assertLarger(0);
            expect(time).assertLarger(0);

            backgroundTaskManager.getRemainingDelayTime(delayInfo.requestId).then((res: int) => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 res: ' + res);
              expect(res).assertLarger(0);
              backgroundTaskManager.cancelSuspendDelay(delayInfo.requestId);
              hilog.info(DOMAIN, TAG, '%{public}s',
                'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 cancelSuspendDelay success');
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG,
                'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 requestSuspendDelay failed: %{public}s' +
                JSON.stringify(error));
            })
          } catch (error) {
            hilog.info(DOMAIN, TAG,
              'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 requestSuspendDelay failed: %{public}s' +
              JSON.stringify(error));
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 aa error: %{public}s',
            JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_TASK_STATIC_XTS_003 end---');
      })

  })
}
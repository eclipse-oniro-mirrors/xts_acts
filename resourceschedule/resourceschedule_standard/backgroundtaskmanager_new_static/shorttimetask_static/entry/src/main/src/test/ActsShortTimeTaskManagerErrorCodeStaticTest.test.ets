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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { WantAgent as _WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"
import Utils from './Util.test';
let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function LongTimeTaskManagerErrorCodeStaticTest() {
  describe('LongTimeTaskManagerErrorCodeStaticTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001
     * @tc.desc   Test that the requestSuspendDelay callback function error call and errocode is 9900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 begin---');

      try {
        let myReason = 'test requestSuspendDelay';
        try {
          let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 Request1 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The requestId1 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The actualDelayTime1 is: " + time);
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 requestSuspendDelay1 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        };

        try {
          let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 Request2 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The requestId2 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The actualDelayTime2 is: " + time);
        } catch (error: BusinessError) {
          console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 requestSuspendDelay2 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        };

        try {
          let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 Request3 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The requestId3 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The actualDelayTime3 is: " + time);
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 requestSuspendDelay3 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        };

        try {
          let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 Request4 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The requestId4 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 The actualDelayTime4 is: " + time);
        } catch (error: BusinessError) {
          console.log(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 requestSuspendDelay4 failed. code is ${error.code} message is ${error.message}`);
          expect((error.code) as number).assertEqual(9900002);
          done();
        };

      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_001 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002
     * @tc.desc   Test that the getRemainingDelayTime promise function error call and errocode is 9900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002 begin---');

      try {
        let id = 100;
        backgroundTaskManager.getRemainingDelayTime(id).then((res: int) => {
          console.log('promise => Operation getRemainingDelayTime succeeded. Data: ' + JSON.stringify(res));
        }).catch((error: Error) => {
          // console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002 Operation getRemainingDelayTime failed. code is ${error.code} message is ${error.message}`);
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002 Operation getRemainingDelayTime failed: %{public}s', JSON.stringify(error));
          // expect(Number(error.code)).assertEqual(9900001);
          expect(error.code == 9900001).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_002 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003
     * @tc.desc   Test that the getRemainingDelayTime callback function error call and errocode is 9900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003 begin---');

      try {
        let id = 100;
        backgroundTaskManager.getRemainingDelayTime(id, (error: BusinessError | null, res: int|undefined) => {
          if(error) {
            console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004 getRemainingDelayTime failed. code is ${error.code} message is ${error.message}`);
            expect((error.code)).assertEqual(9900001);
            done();
          } else {
            console.log('SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003 Operation getRemainingDelayTime succeeded. Data: ' + JSON.stringify(res));
          }
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_003 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004
     * @tc.desc   Test that the cancelSuspendDelay callback function error call and errocode is 9900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004 begin---');

      try {
        let id = 123;
        try {
          backgroundTaskManager.cancelSuspendDelay(id);
        } catch (error: BusinessError) {
          console.error(`SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004 cancelSuspendDelay failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect((error.code)).assertEqual(9900001);
          done();
        }
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_SHORTTIME_ERR_TASK_STATIC_XTS_004 end---');
    })

  })
}
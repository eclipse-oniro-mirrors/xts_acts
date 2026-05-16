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
import workScheduler from '@ohos.resourceschedule.workScheduler'
import { BusinessError } from "@ohos.base"
let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsWorkschedulerManagerErrorCodeStaticTest() {
  describe('ActsWorkschedulerManagerErrorCodeStaticTest', () => {

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    /** 
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001
     * @tc.desc   Test that startWork function callback errorCode is 9700005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001 begin---');
      let workInfo: workScheduler.WorkInfo = {
        workId: 1,
        bundleName: "com.acts.actsworkschedulertest.staticxxxxx",
        abilityName: "EntryAbility",
        isCharging: true,
        chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_ANY
      }
      try{
        workScheduler.startWork(workInfo)
      }catch(error) {
        error = error as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001 startWork failed. code is ${error.code} message is ${error.message}`);
        expect(Number(error.code)).assertEqual(9700004);
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_001 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002
     * @tc.desc   Test that startWork function callback errorCode is 9700005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002 begin---');
      let workInfo: workScheduler.WorkInfo = {
        workId: 2 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY,
        networkType: workScheduler.NetworkType.NETWORK_TYPE_ANY,
        isCharging: true,
        chargerType: workScheduler.ChargingType.CHARGING_PLUGGED_ANY,
        batteryLevel: 100 as int,
        batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_OKAY,
        isRepeat: false,
        repeatCycleTime: 100 as int,
        repeatCount: 100 as int,
        isPersisted: false,
        isDeepIdle: false,
        idleWaitTime: 1000 as int,
      }
      try{
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002---startWork success---');
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_002 failed. code is ${err.code} message is ${err.message}`);
        expect(Number(err.code)).assertEqual(9700005);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003
     * @tc.desc   Test that getWorkStatus callback function errorCode is 9700004
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003 begin---');
      try{
        workScheduler.getWorkStatus(1, (err: BusinessError|null, res: workScheduler.WorkInfo|undefined) => {
          if (err) {
            console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003 getWorkStatus failed. code is ${err.code} message is ${err.message}`);
            expect(Number(err.code)).assertEqual(9700004);
            done();
          } else {
            hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003---getWorkStatus success---');
            console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003 getWorkStatus success, ${JSON.stringify(res)}`);
          }
        });
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_003 failed. code is ${err.code} message is ${err.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004
     * @tc.desc   Test that getWorkStatus promise function errorCode is 9700004
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004 begin---');
      try{
        workScheduler.getWorkStatus(200).then((res: workScheduler.WorkInfo|undefined) => {
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004 getWorkStatus failed. code is ${error.code} message is ${error.message}`);
          expect(Number(error.code)).assertEqual(9700004);
          done();
        })
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_004 failed. code is ${err.code} message is ${err.message}`);
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005
     * @tc.desc   Test that isLastWorkTimeOut callback function errorCode is 9700004
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005 begin---');
      try{
        workScheduler.isLastWorkTimeOut(200).then((res: boolean|undefined) => {
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005 isLastWorkTimeOut success, data is: ${res}`);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005 isLastWorkTimeOut failed. code is ${error.code} message is ${error.message}`);
          expect(Number(error.code)).assertEqual(9700004);
          done();
        });
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_005 failed. code is ${err.code} message is ${err.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006
     * @tc.desc   Test that isLastWorkTimeOut promise function errorCode is 9700004
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006 begin---');
      try{
        workScheduler.isLastWorkTimeOut(200).then((res: boolean|undefined) => {
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006 isLastWorkTimeOut success, data is: ${res}`);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006 isLastWorkTimeOut failed. code is ${error.code} message is ${error.message}`);
          expect(Number(error.code)).assertEqual(9700004);
          done();
        });
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_ERR_TASK_STATIC_XTS_006 failed. code is ${err.code} message is ${err.message}`);
        done();
      }
    })

  })
}
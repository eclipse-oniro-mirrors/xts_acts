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

export default function WorkSchedulerJsTest() {
  describe("WorkSchedulerJsTest", () => {

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001
     * @tc.desc   Test that the startWork/stopWork/getWorkStatus callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 begin---');
      let workInfo: workScheduler.WorkInfo = {
        workId: 1 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
      }
      let callbackFlag = 0;
      try{
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001---startWork success---');

        workScheduler.getWorkStatus(1, (err: BusinessError|null, res: workScheduler.WorkInfo|undefined) => {
          if (err) {
            console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 getWorkStatus failed. code is ${err.code} message is ${err.message}`);
            expect(false).assertEqual(true);
            done();
          } else {
            hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001---getWorkStatus success---');
            console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 getWorkStatus success, ${JSON.stringify(res)}`);
            expect(res?.workId).assertEqual(1);
            callbackFlag = 1;
            workScheduler.stopWork(workInfo, false);
            console.info('SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 stopWork success');
            expect(callbackFlag).assertEqual(1);
            done();
          }
        });
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 failed. code is ${err.code} message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002
     * @tc.desc   Test that the startWork/stopWork/getWorkStatus promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002 begin---');

      let parameters: Record<string, int | double | string | boolean> = {
        "mykey0": 1,
        "mykey1": "string value",
        "mykey2": true,
        "mykey3": 1.5
      }
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
        repeatCycleTime: 180000000 as int,
        repeatCount: 100 as int,
        isPersisted: false,
        isDeepIdle: false,
        idleWaitTime: 1000 as int,
        parameters: parameters
      }
      try{
        let callbackFlag = 1;
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002---startWork success---');
        expect(callbackFlag).assertEqual(1);

        workScheduler.getWorkStatus(2).then((res: workScheduler.WorkInfo|undefined) => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002---getWorkStatus success---');
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002 getWorkStatus promise success, ${JSON.stringify(res)}`);
          expect(res?.workId).assertEqual(2);

          callbackFlag = 1;

          workScheduler.stopWork(workInfo, false);
          console.info('SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_001 stopWork success');
          expect(callbackFlag).assertEqual(1);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002 getWorkStatus failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertEqual(true);
          done();
        })
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_002 failed. code is ${err.code} message is ${err.message}`);
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_ANY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_ANY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003 workScheduler NetworkType: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_003 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_MOBILE
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_MOBILE;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004 workScheduler NetworkType: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_004 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_WIFI
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_WIFI;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005 workScheduler NetworkType: ' + type);
      expect(type).assertEqual(2);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_005 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_BLUETOOTH
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_BLUETOOTH;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
      expect(type).assertEqual(3);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_006 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_WIFI_P2P
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_WIFI_P2P;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007 workScheduler NetworkType: ' + type);
      expect(type).assertEqual(4);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_007 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008
     * @tc.desc   Test that the workScheduler enum NetworkType NETWORK_TYPE_ETHERNET
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008 begin---');
      let type = workScheduler.NetworkType.NETWORK_TYPE_ETHERNET;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008 workScheduler NetworkType: ' + type);
      expect(type).assertEqual(5);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_008 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009
     * @tc.desc   Test that the workScheduler enum ChargingType CHARGING_PLUGGED_ANY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009 begin---');
      let type = workScheduler.ChargingType.CHARGING_PLUGGED_ANY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009 workScheduler ChargingType: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_009 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010
     * @tc.desc   Test that the workScheduler enum ChargingType CHARGING_PLUGGED_ANY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010 begin---');
      let type = workScheduler.ChargingType.CHARGING_PLUGGED_AC;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010 workScheduler ChargingType: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_010 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011
     * @tc.desc   Test that the workScheduler enum ChargingType CHARGING_PLUGGED_USB
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011 begin---');
      let type = workScheduler.ChargingType.CHARGING_PLUGGED_USB;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011 workScheduler ChargingType: ' + type);
      expect(type).assertEqual(2);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_011 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012
     * @tc.desc   Test that the workScheduler enum ChargingType CHARGING_PLUGGED_WIRELESS
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012 begin---');
      let type = workScheduler.ChargingType.CHARGING_PLUGGED_WIRELESS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012 workScheduler ChargingType: ' + type);
      expect(type).assertEqual(3);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_012 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013
     * @tc.desc   Test that the workScheduler enum BatteryStatus BATTERY_STATUS_LOW
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013 begin---');
      let type = workScheduler.BatteryStatus.BATTERY_STATUS_LOW;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013 workScheduler BatteryStatus: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_013 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014
     * @tc.desc   Test that the workScheduler enum BatteryStatus BATTERY_STATUS_OKAY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014 begin---');
      let type = workScheduler.BatteryStatus.BATTERY_STATUS_OKAY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014 workScheduler BatteryStatus: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_014 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015
     * @tc.desc   Test that the workScheduler enum BatteryStatus BATTERY_STATUS_LOW_OR_OKAY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015 begin---');
      let type = workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015 workScheduler BatteryStatus: ' + type);
      expect(type).assertEqual(2);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_015 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016
     * @tc.desc   Test that the workScheduler enum StorageRequest STORAGE_LEVEL_LOW
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016 begin---');
      let type = workScheduler.StorageRequest.STORAGE_LEVEL_LOW;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016 workScheduler StorageRequest: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_016 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017
     * @tc.desc   Test that the workScheduler enum StorageRequest STORAGE_LEVEL_OKAY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017 begin---');
      let type = workScheduler.StorageRequest.STORAGE_LEVEL_OKAY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017 workScheduler StorageRequest: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_017 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018
     * @tc.desc   Test that the workScheduler enum StorageRequest STORAGE_LEVEL_LOW_OR_OKAY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018 begin---');
      let type = workScheduler.StorageRequest.STORAGE_LEVEL_LOW_OR_OKAY;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018 workScheduler StorageRequest: ' + type);
      expect(type).assertEqual(2);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_018 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019
     * @tc.desc   Test that stopAndClearWorks and obtainAllWorks callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 begin---');

      let callbackFlag = 0;
      workScheduler.stopAndClearWorks();
      callbackFlag = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019---stopAndClearWorks success---');
      expect(callbackFlag).assertEqual(1);
      let workInfo: workScheduler.WorkInfo = {
        workId: 6 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
      }
      try{
        callbackFlag = 2;
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019---startWork success---');
        expect(callbackFlag).assertEqual(2);

        workScheduler.obtainAllWorks((error: BusinessError|null, res: Array<workScheduler.WorkInfo>|undefined) =>{
          if (error) {
            console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 obtainAllWorks failed. code is ${error.code} message is ${error.message}`);
            expect(false).assertEqual(true);
            done();
          } else {
            hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019---obtainAllWorks success---');
            console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 obtainAllWorks success, ${JSON.stringify(res)}`);
            console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 obtainAllWorks res.length, ${res?.length}`);
            expect(res?.length).assertLarger(0);
            callbackFlag = 3;
            workScheduler.stopWork(workInfo, false);
            console.info('SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 stopWork success');
            expect(callbackFlag).assertEqual(3);
            done();
          }
        });
      }catch(err) {
        err = err as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_019 ----------------err---', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020
     * @tc.desc   Test that stopAndClearWorks and obtainAllWorks promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 begin---');

      let callbackFlag = 0;
      workScheduler.stopAndClearWorks();
      callbackFlag = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020---stopAndClearWorks success---');
      expect(callbackFlag).assertEqual(1);
      let workInfo: workScheduler.WorkInfo = {
        workId: 7 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
      }
      try{
        callbackFlag = 2;
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020---startWork success---');
        expect(callbackFlag).assertEqual(2);

        workScheduler.obtainAllWorks().then((res: Array<workScheduler.WorkInfo>) => {
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 workschedulerLog obtainAllWorks success, data is: ${JSON.stringify(res)}`);
          hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020---obtainAllWorks success---');
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 obtainAllWorks success, ${JSON.stringify(res)}`);
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 obtainAllWorks res.length, ${res?.length}`);
          expect(res?.length).assertLarger(0);
          callbackFlag = 3;
          workScheduler.stopWork(workInfo, false);
          console.info('SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 stopWork success');
          expect(callbackFlag).assertEqual(3);
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 obtainAllWorks promise failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertEqual(true);
          done();
        })
      }catch(err) {
        err = err as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_020 ----------------err---', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021
     * @tc.desc   Test that stopAndClearWorks and isLastWorkTimeOut callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021 begin---');

      let callbackFlag = 0;
      workScheduler.stopAndClearWorks();
      callbackFlag = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021---stopAndClearWorks success---');
      expect(callbackFlag).assertEqual(1);
      let workInfo: workScheduler.WorkInfo = {
        workId: 8 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
      }
      try{
        callbackFlag = 2;
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021---startWork success---');
        expect(callbackFlag).assertEqual(2);

        workScheduler.isLastWorkTimeOut(8, (error: BusinessError<void>|null, res: boolean|undefined) =>{
          if (error) {
            console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021 isLastWorkTimeOut failed. code is ${error.code} message is ${error.message}`);
            expect(false).assertEqual(true);
            done();
          } else {
            console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021 isLastWorkTimeOut success, data is: ${res}`);
            expect(res).assertEqual(false);
            workScheduler.stopWork(workInfo, false);
            console.info('WorkSchedulerJsStaticTest001 stopWork success');
            done();
          }
        });
      }catch(err) {
        err = err as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_021 ----------------err---', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022
     * @tc.name   SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022
     * @tc.desc   Test that stopAndClearWorks and obtainAllWorks promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022 begin---');

      workScheduler.stopAndClearWorks();
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022---stopAndClearWorks success---');
      let workInfo: workScheduler.WorkInfo = {
        workId: 9 as int,
        bundleName: "com.acts.actsworkschedulertest.static",
        abilityName: "EntryAbility",
        storageRequest: workScheduler.StorageRequest.STORAGE_LEVEL_OKAY
      }
      try{
        workScheduler.startWork(workInfo)
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022---startWork success---');

        workScheduler.isLastWorkTimeOut(9).then((res: boolean|undefined) => {
          console.info(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022 isLastWorkTimeOut success, data is: ${res}`);
          expect(res).assertEqual(false);
          workScheduler.stopWork(workInfo, false);
          console.info('SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022 stopWork success');
          done();
        }).catch((error: Error) => {
          console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022 isLastWorkTimeOut failed. code is ${error.code} message is ${error.message}`);
          expect(false).assertEqual(true);
          done();
        });
      }catch(err) {
        err = err as BusinessError;
        console.error(`SUB_RESOURCESCHEDULE_WORKSCHEDULE_TASK_STATIC_XTS_022 failed. code is ${err.code} message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })}
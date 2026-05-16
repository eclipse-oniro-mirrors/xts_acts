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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import ohos_power from '@ohos.power'

let domain: int = 0x0000;
let tag: string = 'PowerTest';

export default function PowerTest() {

  describe("PowerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   testPowerTest_static_0100
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0010
     * @tc.desc   Checks whether the screen of a device is on or off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPowerTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isActive: boolean = ohos_power.isActive();
          hilog.info(domain, tag, `${TAG} isActive: ${isActive}`);
          hilog.info(domain, tag, `${TAG} isActive type: ${typeof isActive}`);
          expect(typeof isActive).assertEqual('boolean');
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0200
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0020
     * @tc.desc   Gets and sets the power mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPowerTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let powerMode: number = ohos_power.getPowerMode();
          hilog.info(domain, tag, `${TAG} powerMode: ${powerMode}`);
          hilog.info(domain, tag, `${TAG} powerMode type: ${typeof powerMode}`);
          expect(powerMode).assertLargerOrEqual(ohos_power.DevicePowerMode.MODE_NORMAL);
          expect(powerMode).assertLessOrEqual(ohos_power.DevicePowerMode.MODE_EXTREME_POWER_SAVE);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0300
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0030
     * @tc.desc   Device isStandby interface verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isStandby: boolean = ohos_power.isStandby();
          hilog.info(domain, tag, `${TAG} isStandby: ${isStandby}`);
          hilog.info(domain, tag, `${TAG} isStandby type: ${typeof isStandby}`);
          expect(isStandby).assertFalse();
          expect(typeof isStandby).assertEqual('boolean');
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0400
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0040
     * @tc.desc   Get device power mode MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let mode: number = ohos_power.DevicePowerMode.MODE_NORMAL;
          hilog.info(domain, tag, `${TAG} mode: ${mode}`);
          expect(mode).assertEqual(600);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0500
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0050
     * @tc.desc   Get device power mode MODE_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let mode: number = ohos_power.DevicePowerMode.MODE_POWER_SAVE;
          hilog.info(domain, tag, `${TAG} mode: ${mode}`);
          expect(mode).assertEqual(601);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0600
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0060
     * @tc.desc   Get device power mode MODE_PERFORMANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let mode: number = ohos_power.DevicePowerMode.MODE_PERFORMANCE;
          hilog.info(domain, tag, `${TAG} mode: ${mode}`);
          expect(mode).assertEqual(602);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0700
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0070
     * @tc.desc   Get device power mode MODE_EXTREME_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let mode: number = ohos_power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
          hilog.info(domain, tag, `${TAG} mode: ${mode}`);
          expect(mode).assertEqual(603);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0710
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0071
     * @tc.desc   Get device power mode MODE_CUSTOM_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0710';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let mode: number = ohos_power.DevicePowerMode.MODE_CUSTOM_POWER_SAVE;
          hilog.info(domain, tag, `${TAG} mode: ${mode}`);
          expect(mode).assertEqual(650);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0800
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0080
     * @tc.desc   Test the third-party application call shutdown will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.shutdown('shutdown test');
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_0900
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0090
     * @tc.desc   Test the third-party application call reboot will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_0900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.reboot('update');
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1000
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0100
     * @tc.desc   Test the third-party application call wakeup will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.wakeup('wakeup_test');
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0110
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.suspend(true);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1200
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0120
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.suspend(false);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1300
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0130
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.suspend();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1400
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0140
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.setPowerMode(ohos_power.DevicePowerMode.MODE_EXTREME_POWER_SAVE)
            .then(() => {
              hilog.error(domain, tag, `${TAG} setPowerMode Failure`);
              expect().assertFail();
              done();
            })
            .catch((error: Error): void => {
              hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
              expect(error.code).assertEqual(202);
              done();
            });
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1500
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0150
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.setPowerMode(ohos_power.DevicePowerMode.MODE_NORMAL, (error: BusinessError | null) => {
            if (error) {
              hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
              expect(error?.code).assertEqual(202);
              done();
            } else {
              hilog.error(domain, tag, `${TAG} setPowerMode Failure`);
              expect().assertFail();
              done();
            }
          })
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1600
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0160
     * @tc.desc   Test the third-party application call setScreenOffTime will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.setScreenOffTime(3000);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1700
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0170
     * @tc.desc   Test the third-party application call hibernate will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.hibernate(true);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1800
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0180
     * @tc.desc   Test the third-party application call hibernate will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.hibernate(false);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_1900
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0190
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_1900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.refreshActivity(TAG);
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_2000
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0200
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_2000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.registerShutdownCallback((isReboot: boolean) => {
            hilog.info(domain, tag, `${TAG} isReboot:${isReboot}`);
          });
          expect().assertFail();
        } catch (error: BusinessError) {
          hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testPowerTest_static_2100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0210
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerTest_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerTest_static_2100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.unregisterShutdownCallback(() => {
            hilog.info(domain, tag, `${TAG} unregisterShutdownCallback`);
          });
          expect().assertFail();
        } catch (error: BusinessError) {
          hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })
  });
}
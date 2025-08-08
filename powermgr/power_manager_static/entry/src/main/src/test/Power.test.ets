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

let domain: number = 0x0000;
let tag: string = 'PowerStaticTest';

export default function PowerTest() {

  describe("PowerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0010
     * @tc.name testPowerTest_static_0100
     * @tc.desc Checks whether the screen of a device is on or off
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0020
     * @tc.name testPowerTest_static_0200
     * @tc.desc Gets and sets the power mode
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_0200';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        let powerMode = ohos_power.getPowerMode();
        hilog.info(domain, tag, `${TAG} powerMode: ${powerMode}`);
        hilog.info(domain, tag, `${TAG} powerMode type: ${typeof powerMode}`);
        expect(new Number(powerMode)).assertLargerOrEqual(ohos_power.DevicePowerMode.MODE_NORMAL);
        expect(new Number(powerMode)).assertLessOrEqual(ohos_power.DevicePowerMode.MODE_EXTREME_POWER_SAVE);
        done();
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0030
     * @tc.name testPowerTest_static_0300
     * @tc.desc Device isStandby interface verification
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0040
     * @tc.name testPowerTest_static_0400
     * @tc.desc Get device power mode MODE_NORMAL
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_0400';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        let mode = ohos_power.DevicePowerMode.MODE_NORMAL;
        hilog.info(domain, tag, `${TAG} mode: ${mode}`);
        expect(new Number(mode)).assertEqual(600);
        done();
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0050
     * @tc.name testPowerTest_static_0500
     * @tc.desc Get device power mode MODE_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_0500';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        let mode = ohos_power.DevicePowerMode.MODE_POWER_SAVE;
        hilog.info(domain, tag, `${TAG} mode: ${mode}`);
        expect(new Number(mode)).assertEqual(601);
        done();
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0060
     * @tc.name testPowerTest_static_0600
     * @tc.desc Get device power mode MODE_PERFORMANCE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_0600';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        let mode = ohos_power.DevicePowerMode.MODE_PERFORMANCE;
        hilog.info(domain, tag, `${TAG} mode: ${mode}`);
        expect(new Number(mode)).assertEqual(602);
        done();
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_ETSTest_0070
     * @tc.name testPowerTest_static_0700
     * @tc.desc Get device power mode MODE_EXTREME_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_0700';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        let mode = ohos_power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
        hilog.info(domain, tag, `${TAG} mode: ${mode}`);
        expect(new Number(mode)).assertEqual(603);
        done();
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0080
     * @tc.name testPowerTest_static_0800
     * @tc.desc Test the third-party application call shutdown will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0090
     * @tc.name testPowerTest_static_0900
     * @tc.desc Test the third-party application call reboot will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0100
     * @tc.name testPowerTest_static_1000
     * @tc.desc Test the third-party application call wakeup will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0110
     * @tc.name testPowerTest_static_1100
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0120
     * @tc.name testPowerTest_static_1200
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0130
     * @tc.name testPowerTest_static_1300
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0140
     * @tc.name testPowerTest_static_1400
     * @tc.desc Test the third-party application call setPowerMode will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
            expect(error.message).assertContain('System permission is denied');
            done();
          });
      } catch (e : BusinessError) {
        hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0150
     * @tc.name testPowerTest_static_1500
     * @tc.desc Test the third-party application call setPowerMode will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG: string = 'testPowerTest_static_1500';
      hilog.info(domain, tag, `${TAG} start`);
      try {
        ohos_power.setPowerMode(ohos_power.DevicePowerMode.MODE_NORMAL, (error: BusinessError | null) => {
          if (error) {
            hilog.error(domain, tag, `${TAG} error.toString: ${JSON.stringify(error)}`);
            expect(error?.message).assertContain('System permission is denied');
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0160
     * @tc.name testPowerTest_static_1600
     * @tc.desc Test the third-party application call setScreenOffTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0170
     * @tc.name testPowerTest_static_1700
     * @tc.desc Test the third-party application call hibernate will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0180
     * @tc.name testPowerTest_static_1800
     * @tc.desc Test the third-party application call hibernate will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testPowerTest_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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

  })
  hilog.info(domain, tag, '%{public}s', 'PowerStaticTest end');
}
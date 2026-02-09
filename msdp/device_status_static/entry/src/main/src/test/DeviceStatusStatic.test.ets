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
import deviceStatus from '@ohos.multimodalAwareness.deviceStatus'
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'deviceStatusTestTag';

export default function deviceStatusTest() {
  describe("deviceStatusTest", (): void => {
    hilog.info(domain, tag, `deviceStatusTest describe enter`);

    /**
     * @tc.name   SUB_MSDP_Api_deviceStatus_static_0100
     * @tc.number SUB_MSDP_Api_deviceStatus_static_0100
     * @tc.desc   SUB_MSDP_Api_deviceStatus_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_deviceStatus_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_deviceStatus_static_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          deviceStatus.offSteadyStandingDetect();
          hilog.info(domain, tag, `${caseName} offSteadyStandingDetect success`);
          done();
        } catch (error: BusinessError) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(error.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            expect(error.code).assertEqual(32500003);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_deviceStatus_static_0200
     * @tc.number SUB_MSDP_Api_deviceStatus_static_0200
     * @tc.desc   SUB_MSDP_Api_deviceStatus_static_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_deviceStatus_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_deviceStatus_static_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          deviceStatus.onSteadyStandingDetect((data: deviceStatus.SteadyStandingStatus) => {});
          hilog.info(domain, tag, `${caseName} onSteadyStandingDetect success`);
          hilog.info(domain, tag, "${caseName} SteadyStandingStatus.STATUS_EXIT is: " + deviceStatus.SteadyStandingStatus.STATUS_EXIT);
          hilog.info(domain, tag, "${caseName} SteadyStandingStatus.STATUS_ENTER is: " + deviceStatus.SteadyStandingStatus.STATUS_ENTER);
          expect(deviceStatus.SteadyStandingStatus.STATUS_EXIT == 0).assertTrue();
          expect(deviceStatus.SteadyStandingStatus.STATUS_ENTER == 1).assertTrue();
          hilog.info(domain, tag, `${caseName} onSteadyStandingDetect success`);
          done();
        } catch (error: BusinessError) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(error.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} fail`);
            expect().assertFail();
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_deviceStatus_static_0300
     * @tc.number SUB_MSDP_Api_deviceStatus_static_0300
     * @tc.desc   SUB_MSDP_Api_deviceStatus_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_deviceStatus_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_deviceStatus_static_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          deviceStatus.onSteadyStandingDetect((data: deviceStatus.SteadyStandingStatus) => {});
          await Utils.msSleep(2000);
          deviceStatus.offSteadyStandingDetect();
          hilog.info(domain, tag, `${caseName} deviceStatus.onSteadyStandingDetect success`);
          done();
        } catch (error: BusinessError) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(error.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} fail`);
            expect().assertFail();
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_deviceStatus_static_0400
     * @tc.number SUB_MSDP_Api_deviceStatus_static_0400
     * @tc.desc   SUB_MSDP_Api_deviceStatus_static_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_deviceStatus_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_deviceStatus_static_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          deviceStatus.offSteadyStandingDetect();
          hilog.info(domain, tag, `${caseName} offSteadyStandingDetect success`);
          done();
        } catch (error: BusinessError) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(error.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            expect(error.code).assertEqual(32500003);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });
  })
}
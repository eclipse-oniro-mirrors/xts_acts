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
import userStatus from '@ohos.multimodalAwareness.userStatus'
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'userStatusTestTag';

export default function userStatusTest() {
  describe("userStatusTest", (): void => {
    hilog.info(domain, tag, `userStatusTest describe enter`);

    /**
     * @tc.name   SUB_MSDP_Api_userStatus_static_0100
     * @tc.number SUB_MSDP_Api_userStatus_static_0100
     * @tc.desc   SUB_MSDP_Api_userStatus_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_userStatus_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_userStatus_static_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(userStatus.UserAgeGroup.OTHERS == 0).assertTrue();
          expect(userStatus.UserAgeGroup.CHILD == 1).assertTrue();
          hilog.info(domain, tag, `${caseName} get UserAgeGroup success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_userStatus_static_0200
     * @tc.number SUB_MSDP_Api_userStatus_static_0200
     * @tc.desc   SUB_MSDP_Api_userStatus_static_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_userStatus_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_userStatus_static_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          userStatus.offUserAgeGroupDetected();
          hilog.info(domain, tag, `${caseName} offUserAgeGroupDetected success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} offUserAgeGroupDetected fail`);
            expect(e.code).assertEqual(33900003);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_userStatus_static_0300
     * @tc.number SUB_MSDP_Api_userStatus_static_0300
     * @tc.desc   SUB_MSDP_Api_userStatus_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_userStatus_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_userStatus_static_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          userStatus.onUserAgeGroupDetected((data: userStatus.UserClassification) => {
            console.info("callback success, ageGroup" + data.ageGroup + ", confidence: " + data.confidence);
          });
          hilog.info(domain, tag, `${caseName} onUserAgeGroupDetected successed`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
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
     * @tc.name   SUB_MSDP_Api_userStatus_static_0400
     * @tc.number SUB_MSDP_Api_userStatus_static_0400
     * @tc.desc   SUB_MSDP_Api_userStatus_static_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_userStatus_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_userStatus_static_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          userStatus.onUserAgeGroupDetected((data: userStatus.UserClassification) => {});
          await Utils.msSleep(2000);
          userStatus.offUserAgeGroupDetected();
          hilog.info(domain, tag, `${caseName} onUserAgeGroupDetected successed`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
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
     * @tc.name   SUB_MSDP_Api_userStatus_static_0500
     * @tc.number SUB_MSDP_Api_userStatus_static_0500
     * @tc.desc   SUB_MSDP_Api_userStatus_static_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_userStatus_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_userStatus_static_0500";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          userStatus.onUserAgeGroupDetected((data: userStatus.UserClassification) => {});
          hilog.info(domain, tag, `${caseName} onUserAgeGroupDetected successed`);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
        }
        try {
          userStatus.offUserAgeGroupDetected();
          hilog.info(domain, tag, `${caseName} offUserAgeGroupDetected successed`);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
        }
        try {
          userStatus.offUserAgeGroupDetected((data: userStatus.UserClassification) => {});
          hilog.info(domain, tag, `${caseName} offUserAgeGroupDetected successed`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} offUserAgeGroupDetected fail`);
            expect(e.code).assertEqual(33900001);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

  })
}
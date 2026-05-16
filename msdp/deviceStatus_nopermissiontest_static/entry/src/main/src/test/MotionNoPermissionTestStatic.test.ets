/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import motion from '@ohos.multimodalAwareness.motion'
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'motionNoPermissionTestTag';

export default function motionNoPermissionTest() {
  describe("motionNoPermissionTest", (): void => {
    hilog.info(domain, tag, `motionTest describe enter`);

    /**
     * @tc.name   SUB_MSDP_Api_motionNoPermission_static_0100
     * @tc.number SUB_MSDP_Api_motionNoPermission_static_0100
     * @tc.desc   SUB_MSDP_Api_motionNoPermission_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionNoPermission_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionNoPermission_static_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          motion.onOperatingHandChanged((info: motion.OperatingHandStatus) => {});
          hilog.info(domain, tag, `${caseName} onOperatingHandChanged success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} onOperatingHandChanged fail`);
            expect(e.code).assertEqual(201);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_motionNoPermission_static_0200
     * @tc.number SUB_MSDP_Api_motionNoPermission_static_0200
     * @tc.desc   SUB_MSDP_Api_motionNoPermission_static_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionNoPermission_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionNoPermission_static_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let status : motion.OperatingHandStatus = motion.getRecentOperatingHandStatus();
          hilog.info(domain, tag, `${caseName} getRecentOperatingHandStatus success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} getRecentOperatingHandStatus fail`);
            expect(e.code).assertEqual(201);
          }
          done
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_motionNoPermission_static_0300
     * @tc.number SUB_MSDP_Api_motionNoPermission_static_0300
     * @tc.desc   SUB_MSDP_Api_motionNoPermission_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionNoPermission_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionNoPermission_static_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          motion.onHoldingHandChanged((info: motion.HoldingHandStatus) => {});
          hilog.info(domain, tag, `${caseName} onHoldingHandChanged success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} onHoldingHandChanged fail`);
            expect(e.code).assertEqual(201);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });
  })
}
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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000;
let tag: string = 'motionTestTag';
let gContext: common.UIAbilityContext;

export default function motionWithPermissionTest() {
  describe("motionWithPermissionTest", (): void => {
    hilog.info(domain, tag, `motionTest describe enter`);

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>motionWithPermissionTest beforeAll start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.mydevicestatusapp");
      await Utils.msSleep(2000);
      try {
        gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        if (gContext) {
          let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
          let permissions: Array<Permissions> = ['ohos.permission.ACTIVITY_MOTION'];
          hilog.info(0x0000, tag, "====>start requestPermissionsFromUser");
          atManager.requestPermissionsFromUser(gContext, permissions,
            (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
              hilog.info(0x0000, tag, "====>request success permissions" + JSON.stringify(data));
              hilog.info(0x0000, tag, "====>getPermissionRequestResult err" + JSON.stringify(err));
              done();
            });
          await Utils.msSleep(2000);
          await Utils.clickRequestPermission('允许');
        } else {
          hilog.error(0x0000, tag, '====>context is undefined====');
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>beforeAll failed, err: " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_MSDP_Api_motionWithPermission_static_0100
     * @tc.number SUB_MSDP_Api_motionWithPermission_static_0100
     * @tc.desc   SUB_MSDP_Api_motionWithPermission_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionWithPermission_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionWithPermission_static_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          motion.offOperatingHandChanged();
          hilog.info(domain, tag, `${caseName} offOperatingHandChanged success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} offOperatingHandChanged fail`);
            expect(e.code).assertEqual(31500001);
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_motionWithPermission_static_0200
     * @tc.number SUB_MSDP_Api_motionWithPermission_static_0200
     * @tc.desc   SUB_MSDP_Api_motionWithPermission_static_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionWithPermission_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionWithPermission_static_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          motion.onOperatingHandChanged((info: motion.OperatingHandStatus) => {});
          hilog.info(domain, tag, `${caseName} onOperatingHandChanged success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(e.code == 801) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} onOperatingHandChanged fail`);
            expect().assertFail();
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_motionWithPermission_static_0300
     * @tc.number SUB_MSDP_Api_motionWithPermission_static_0300
     * @tc.desc   SUB_MSDP_Api_motionWithPermission_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionWithPermission_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionWithPermission_static_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          motion.onOperatingHandChanged((info: motion.OperatingHandStatus) => {});
          await Utils.msSleep(2000);
          motion.offOperatingHandChanged();
          hilog.info(domain, tag, `${caseName} onOperatingHandChanged success`);
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
     * @tc.name   SUB_MSDP_Api_motionWithPermission_static_0400
     * @tc.number SUB_MSDP_Api_motionWithPermission_static_0400
     * @tc.desc   SUB_MSDP_Api_motionWithPermission_static_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_motionWithPermission_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_motionWithPermission_static_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let status : motion.OperatingHandStatus = motion.getRecentOperatingHandStatus();
          expect(status == motion.OperatingHandStatus.UNKNOWN_STATUS || status == motion.OperatingHandStatus.LEFT_HAND_OPERATED ||
            status == motion.OperatingHandStatus.RIGHT_HAND_OPERATED).assertTrue();
          expect(motion.OperatingHandStatus.UNKNOWN_STATUS == 0).assertTrue();
          expect(motion.OperatingHandStatus.LEFT_HAND_OPERATED == 1).assertTrue();
          expect(motion.OperatingHandStatus.RIGHT_HAND_OPERATED == 2).assertTrue();
          hilog.info(domain, tag, `${caseName} getRecentOperatingHandStatus success`);
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
  })
}
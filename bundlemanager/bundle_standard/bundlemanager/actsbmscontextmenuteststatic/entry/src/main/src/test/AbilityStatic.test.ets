/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { AppCloneIdentity, BundleInfo } from 'bundleManager.BundleInfo';

let uid = 101010101;
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe('ActsAbilityTest', (): void => {

    /**
     * @tc.name   getBundleNameByUidSyncUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2400
     * @tc.desc   Test getBundleNameByUidSync unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidSyncUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getBundleNameByUidSync(uid)
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        console.info("getBundleNameByUidSyncUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.name   getBundleNameByUidUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2500
     * @tc.desc   Test getBundleNameByUid unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await bundle.getBundleNameByUid(uid).then((data: string) => {
          console.info("getBundleNameByUidUnPermissionApi14 promise success " + data);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          console.info("getBundleNameByUidUnPermissionApi14 promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        })
      } catch (err) {
        err = err as BusinessError;
        console.info("getBundleNameByUidUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        bundle.getBundleNameByUid(uid, (err: BusinessError | null, data: string | undefined) => {
          console.info("getBundleNameByUidUnPermissionApi14 callback2 success " + data);
          console.info("getBundleNameByUidUnPermissionApi14 callback2 error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        console.info("getBundleNameByUidUnPermissionApi14 callback2 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getAppCloneIdentityUnPermissionApi14
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2600
     * @tc.desc   Test getAppCloneIdentity unPermission for api14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getAppCloneIdentityUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getAppCloneIdentity(uid).then((data: AppCloneIdentity) => {
          console.info("getAppCloneIdentityUnPermissionApi14 success " + data);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          console.info("getAppCloneIdentityUnPermissionApi14 promise " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        console.info("getAppCloneIdentityUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo_static_04
     * @tc.number Sub_Bms_Framework_getSignatureInfo_static_04
     * @tc.desc   Test getSignatureInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getSignatureInfo_static_04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let datas = bundle.getSignatureInfo(0);
        expect().assertFail();
        done();
      }catch(err){
        err = err as BusinessError;
        hilog.error(domain, tag, `Sub_Bms_Framework_getSignatureInfo_static_04 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(201);
        done();
      };
    })

    /**
     * @tc.name   Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.number Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.desc   Test getAbilityInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getAbilityInfo_static_01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let uri = "https://www.example.com";
      let abilityFlags = bundle.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
      bundle.getAbilityInfo(uri, abilityFlags).then((data: Array<bundle.AbilityInfo>) => {
        expect().assertFail();
        done();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getAbilityInfo_static_01 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(201);
        done();
      });
    })
  })
}
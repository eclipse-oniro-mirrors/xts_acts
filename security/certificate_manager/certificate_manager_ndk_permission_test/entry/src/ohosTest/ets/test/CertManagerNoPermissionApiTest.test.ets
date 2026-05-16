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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import CertManagerApi from 'libentry.so'
import { bundleManager } from '@kit.AbilityKit'

export default function CertManagerNoPermissionApiTest() {
  describe('CertManagerNoPermissionApiTest', () => {

    /**
     * @tc.name   SUB_Security_CertManager_Ukey_2003
     * @tc.number SUB_Security_CertManager_Ukey_2003
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_Ukey_2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Security_CertManager_Ukey_2003 start');

      let result1 = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let keyUri = "oh:t=ak;o=appCertAliasDemoEcc1;u=100;a="+result1.appInfo.uid;
      try {
        let result: number = CertManagerApi.OHCertManagerNativeApiPrivatePermission0100(keyUri)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error("SUB_Security_CertManager_Ukey_2003: e.code " + error.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_Ukey_2007
     * @tc.number SUB_Security_CertManager_Ukey_2007
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_Ukey_2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Security_CertManager_Ukey_2007 start');
      let result1 = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let keyUri = "oh:t=ak;o=RnotoxS2B2gYLIiz9WrSsaKfrSa-hT7TB7MkApLXiZEA;u=100;a=20020100?ca="+result1.appInfo.uid+"&m=842C6D552111E5615BA256FC47BB3ABA3D3872F0931CB575756E43E58E4A0393\0";
      try {
        let result: number = CertManagerApi.OHCertManagerNativeApiPublicPermission0100(keyUri)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error("SUB_Security_CertManager_Ukey_2007: e.code " + error.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_Ukey_2000
     * @tc.number SUB_Security_CertManager_Ukey_2000
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_Ukey_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Security_CertManager_Ukey_2000 start');
      let keyUri = "oh:t=ak;o=RnotoxS2B2gYLIiz9WrSsaKfrSa-hT7TB7MkApLXiZEA;;u=100;a=20020100\0";
      try {
        let result: number = CertManagerApi.OHCertManagerNativeApiUkeyPermission0100(keyUri)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error("SUB_Security_CertManager_Ukey_2000: e.code " + error.code);
        expect(null).assertFail();
      }
      done();
    });
  })
}
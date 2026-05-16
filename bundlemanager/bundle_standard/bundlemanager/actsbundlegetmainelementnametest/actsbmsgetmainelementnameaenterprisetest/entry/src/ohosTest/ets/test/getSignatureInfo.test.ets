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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function getSignatureInfo() {
  describe('getSignatureInfo', () => {
    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo01
     * @tc.number Sub_Bms_Framework_getSignatureInfo01
     * @tc.desc   Test getSignatureInfo with Skill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getSignatureInfo01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO

      bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
        let datas = bundleManager.getSignatureInfo(data.appInfo.uid);
        expect(data.signatureInfo.appId).assertEqual(datas.appId);
        expect(data.signatureInfo.fingerprint).assertEqual(datas.fingerprint);
        expect(data.signatureInfo.appIdentifier).assertEqual(datas.appIdentifier);
        expect(data.signatureInfo.certificate).assertEqual(datas.certificate);
        done();
      }).catch((err: BusinessError) => {
        console.info("getBundleInfoForSelf fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      });
    })

    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo02
     * @tc.number Sub_Bms_Framework_getSignatureInfo02
     * @tc.desc   Test getSignatureInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_getSignatureInfo02', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
      bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
        let datas = bundleManager.getSignatureInfo(0);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(17700021);
        done();
      });

    })

    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo03
     * @tc.number Sub_Bms_Framework_getSignatureInfo03
     * @tc.desc   Test getSignatureInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Bms_Framework_getSignatureInfo03', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
      bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
        let datas = bundleManager.getSignatureInfo(null);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(401);
        done();
      });
    })
  })
}
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
let bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;

export default function getInstalledBundleList(): void {
  describe('getInstalledBundleList', (): void => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_getInstalledBundleListstatic_0100
     * @tc.number SUB_BMS_FRAMEWORK_getInstalledBundleListstatic_0100
     * @tc.desc   Check getInstalledBundleList with invalid bundleFlags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_getInstalledBundleListstatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await bundle.getInstalledBundleList(bundleFlags).then((data: Array<bundle.BundleInfo>) => {
            console.info('getInstalledBundleListInvalidBundleFlags success: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err: Error): void => {
            let message = (err as BusinessError).message;
            let code = (err as BusinessError).code;
            console.info('getInstalledBundleListInvalidBundleFlags failed: ' + JSON.stringify(err) + code + "==>" + message);
            expect(code).assertEqual(201);
            expect(message).assertEqual('BusinessError 201: Permission denied. An attempt was made to GetInstalledBundleList forbidden by permission: ohos.permission.ENTERPRISE_GET_INSTALLED_BUNDLE_LIST.')
            done();
          })
        } catch (err) {
          console.info('getInstalledBundleListInvalidBundleFlags catch error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}
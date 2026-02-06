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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { AppCloneIdentity } from 'bundleManager.BundleInfo';

const TAG = "ActsBmsgetAppCloneIdentityTest"

export default function getAppCloneIdentity() {
  describe('ActsBmsgetAppCloneIdentityTest', (): void => {

    /**
     * @tc.name   getAppCloneIdentity_0100
     * @tc.number GetAppCloneIdentity_0100
     * @tc.desc   Test GetAppCloneIdentity interfaces with other hap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAppCloneIdentity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let dataInfo =
          bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        try {
          await bundleManager.getAppCloneIdentity(dataInfo.appInfo!.uid).then((data: AppCloneIdentity) => {
            if (data) {
              console.info(TAG + 'getAppCloneIdentity_0100 successfully: ' + JSON.stringify(data));
              expect(data.bundleName).assertEqual(dataInfo.appInfo!.name);
              expect(data.appIndex).assertEqual(0);
              done();
            } else {
              console.info(TAG + 'getAppCloneIdentity_0100 fail data null ');
              expect().assertFail();
              done();
            }
          }).catch((err: Error): void => {
            let message = (err as BusinessError).message;
            console.info(TAG + 'getAppCloneIdentity_0100 getBundleInfo catch failed: ' + message);
            expect(err).assertFail();
            done();
          });
        } catch (err) {
          let message = (err as BusinessError).message;
          console.info(TAG + 'getAppCloneIdentity_0100 catch failed: ' + message);
          expect().assertFail();
          done();
        }
      });

  });
}
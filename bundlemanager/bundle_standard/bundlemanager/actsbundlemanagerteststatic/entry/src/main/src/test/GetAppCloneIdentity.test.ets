/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

const TAG = "ErrcodeTest"

export default function GetAppCloneIdentityTest() {
  describe('GetAppCloneIdentityTest', (): void => {
    /**
     * @tc.name   getAppCloneIdentity201
     * @tc.number Sub_Bms_getAppCloneIdentity_201
     * @tc.desc   test errCode 201 when call getAppCloneIdentity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAppCloneIdentity201', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(TAG + "getAppCloneIdentity201 start");
      try {
        await bundleManager.getAppCloneIdentity(-1).then((res: AppCloneIdentity) => {
          console.info(TAG + 'getAppCloneIdentity201 successfully: ' + JSON.stringify(res));
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          let message = (err as BusinessError).message;
          console.info(TAG +'getAppCloneIdentity201 getBundleInfo catch failed: ' + message);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getAppCloneIdentity201 catch failed: ' + message);
        expect().assertFail();
        done();
      }
    });

  })
}
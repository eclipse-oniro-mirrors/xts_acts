/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function GetBundleNameByUidTest() {
  describe('GetBundleNameByUidTest', (): void => {


    /**
     * @tc.name   getBundleNameByUidCallBack17700021
     * @tc.number Sub_Bms_getBundleNameByUid_CallBack_17700021
     * @tc.desc   test errCode 17700021 when call getBundleNameByUid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidCallBack17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(TAG +"getBundleNameByUidCallBack17700021 start");
      try {
        bundleManager.getBundleNameByUid(2190, (err: BusinessError | null, data: string | undefined) => {
          if (err?.code != 0) {
            console.info(TAG + 'getBundleNameByUidCallBack401  failed: ' + err?.message);
            expect(err?.code).assertEqual(17700021);
            done();
          } else {
            console.info(TAG + 'getBundleNameByUidCallBack401 successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        })
      } catch (exception: BusinessError) {
        console.error(`Failed to getBundleNameByUidCallBack17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getBundleNameByUidPromise17700021
     * @tc.number Sub_Bms_getBundleNameByUid_Promise_17700021
     * @tc.desc   test errCode 17700021 when call getBundleNameByUid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidPromise17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(TAG + "getBundleNameByUidPromise17700021 start");
      try {
        bundleManager.getBundleNameByUid(2190).then((data: string) => {
          console.info(TAG + 'getBundleNameByUidPromise17700021 successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          console.info(TAG + 'getBundleNameByUidPromise17700021 failed: ' + err.message);
          expect(err.code).assertEqual(17700021);
          done();
        })
      } catch (exception: BusinessError) {
        console.error(`Failed to getBundleNameByUidPromise17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   getBundleNameByUidSync17700021
     * @tc.number Sub_Bms_getBundleNameByUidSync_17700021
     * @tc.desc   test errCode 401 when call getBundleNameByUidSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBundleNameByUidSync17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info(TAG +"getBundleNameByUidSync17700021 start");
      try {
        let data = bundleManager.getBundleNameByUidSync(2190);
        console.info(TAG + 'getBundleNameByUidSync17700021 successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (exception: BusinessError) {
        console.error(`Failed to getBundleNameByUidSync17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(17700021);
        done();
      }
    });

  })
}
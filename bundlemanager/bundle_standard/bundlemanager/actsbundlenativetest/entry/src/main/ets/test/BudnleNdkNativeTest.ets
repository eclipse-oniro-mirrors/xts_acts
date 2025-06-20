/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
 // @ts-ignore
 import bundlendk from 'libbundlendk.so'
 
 const BUNDLE_NAME = "com.actsbundle.napitest"
 const FINGER_PRINT = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5"
 const name = "module_metadata"
 const value = "a test demo for module metadata"
 const resource = ""
 
 interface dataType {
   name: string;
   value: string;
   resource: string;
 }

export default function budnleNdkNativeTest() {
    describe('BundleNdkTest', function () {

      /**
      * @tc.number    SUB_BMS_BASIC_ETS_NATIVE_0100
      * @tc.name      budnleNdkNativeTest001
      * @tc.desc      budnleNdkNativeTest
      */
      it('BundleNdkTest001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
          let data = bundlendk.getCurrentApplicationInfo();
          console.info("Test NAPI data= " + JSON.stringify(data));
          expect(data.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.fingerprint).assertEqual(FINGER_PRINT);
          done()
      });

      /**
      * @tc.number    SUB_BMS_BASIC_ETS_NATIVE_0200
      * @tc.name      budnleNdkNativeTest002
      * @tc.desc      budnleNdkNativeTest_IsDebugMode
      */
      it('BundleNdkTest002', 0, (done: Function) => {
        try{
          let data = bundlendk.IsDebugMode();
          hilog.info(0x0000, 'Debug_Metadata_test', 'IsDebugModeTest %{public}s ', data);
          expect(data).assertEqual(false);
        }catch (err) {
          let message = (err as BusinessError).message;
          hilog.error(0x0000, 'Debug_Metadata_test', 'IsDebugMode failed: %{public}s', message);
        }
        done();
      })

      /**
      * @tc.number    SUB_BMS_BASIC_ETS_NATIVE_0300
      * @tc.name      budnleNdkNativeTest003
      * @tc.desc      budnleNdkNativeTest_IsDebugMode
      */
     it('BundleNdkTest003', 0, (done: Function) => {
      try{
        let data  = bundlendk.GetModuleMetadata();
        hilog.info(0x0000, 'Debug_Metadata_test ', '%{public}s', JSON.stringify(data));
        const firstData : dataType = data[0].metadata[0];
        expect(firstData.name).assertEqual("module_metadata");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata name %{public}s', firstData.name);
        expect(firstData.value).assertEqual("a test demo for module metadata");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata value %{public}s', firstData.value);
        expect(firstData.resource).assertEqual("");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata resource %{public}s', firstData.resource);
      } catch (err) {
        let message = (err as BusinessError).message;
        hilog.error(0x0000, 'Debug_Metadata_test ', 'GetModuleMetadata failed: %{public}s', message);
      }
      done();
    })
  })
}

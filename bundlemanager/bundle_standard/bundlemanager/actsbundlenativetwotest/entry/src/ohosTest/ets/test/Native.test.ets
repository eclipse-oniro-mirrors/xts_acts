/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import entry_add from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';

const BUNDLE_NAME = "com.actsbundle.napitest2"
const FINGER_PRINT = "D729F438E1EF2E154994E2B077F6C0CD592BA9F9C938BB428FCDA564FF805EE4"
const name = "module_metadata"
const value = "a test demo for module metadata"
const resource = ""

interface dataType {
  name: string;
  value: string;
  resource: string;
}
export default function nativeTest() {
  describe('ActsNativeTest', () => {

    /**
     * @tc.name   BundleNdkTest001
     * @tc.number SUB_BMS_BASIC_ETS_NATIVE_0100
     * @tc.desc   budnleNdkNativeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BundleNdkTest001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (done: Function) => {
        let data = entry_add.getCurrentApplicationInfo();
        console.info("Test NAPI data= " + JSON.stringify(data));
        expect(data['bundleName']).assertEqual(BUNDLE_NAME);
        expect(data['fingerprint']).assertEqual(FINGER_PRINT);
        done()
    });

    /**
     * @tc.name   BundleNdkTest002
     * @tc.number SUB_BMS_BASIC_ETS_NATIVE_0200
     * @tc.desc   budnleNdkNativeTest_IsDebugMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BundleNdkTest002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: Function) => {
      try{
        let data = entry_add.IsDebugMode();
        hilog.info(0x0000, 'Debug_Metadata_test', 'IsDebugModeTest %{public}s ', data);
        expect(data).assertEqual(true);
      }catch (err) {
        let message = (err as BusinessError).message;
        hilog.error(0x0000, 'Debug_Metadata_test', 'IsDebugMode failed: %{public}s', message);
      }
      done();
    })

  /**
   * @tc.name   BundleNdkTest003
   * @tc.number SUB_BMS_BASIC_ETS_NATIVE_0300
   * @tc.desc   budnleNdkNativeTest_IsDebugMode
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BundleNdkTest003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: Function) => {
      try{
        let data  = entry_add.GetModuleMetadata();
        hilog.info(0x0000, 'Debug_Metadata_test ', '%{public}s', JSON.stringify(data));
        const firstData : dataType = data[0].metadata[0];
        expect(firstData.name).assertEqual("module_metadata_00");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata name %{public}s', firstData.name);
        expect(firstData.value).assertEqual("a test demo for module metadata_00");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata value %{public}s', firstData.value);
        expect(firstData.resource).assertEqual("");
        hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata resource %{public}s', firstData.resource);
      } catch (err) {
        let message = (err as BusinessError).message;
        hilog.error(0x0000, 'Debug_Metadata_test ', 'GetModuleMetadata failed: %{public}s', message);
      }
      done();
    })

    /**
     * @tc.name   BundleNdkTest004
     * @tc.number SUB_BMS_BASIC_ETS_NATIVE_0400
     * @tc.desc   budnleNdkNativeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BundleNdkTest004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: Function) => {
      try{
        let data = entry_add.IsDebugMode();
        hilog.info(0x0000, 'Debug_Metadata_test', 'IsDebugModeTest %{public}s ', data);
        expect(data).assertEqual(true);
      }catch (err) {
        let message = (err as BusinessError).message;
        hilog.error(0x0000, 'Debug_Metadata_test', 'IsDebugMode failed: %{public}s', message);
      }
      done();
    })

    /**
     * @tc.name   BundleNdkTest005
     * @tc.number SUB_BMS_BASIC_ETS_NATIVE_0500
     * @tc.desc   budnleNdkNativeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BundleNdkTest005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      try{
        let data  = entry_add.GetModuleMetadata();
        hilog.info(0x0000, 'Debug_Metadata_test ', '%{public}s', JSON.stringify(data));

        for (let index = 0; index < data[0].metadata.length; index++) {
          const firstData : dataType = data[0].metadata[index];
          expect(firstData.name).assertEqual("module_metadata_0"+index);
          hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata name %{public}s', firstData.name);
          expect(firstData.value).assertEqual("a test demo for module metadata_0"+index);
          hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata value %{public}s', firstData.value);
          expect(firstData.resource).assertEqual("");
          hilog.info(0x0000, 'Debug_Metadata_test', 'GetModuleMetadata resource %{public}s', firstData.resource);
        }
      } catch (err) {
        let message = (err as BusinessError).message;
        hilog.error(0x0000, 'Debug_Metadata_test ', 'GetModuleMetadata failed: %{public}s', message);
        expect(true).assertFalse();
      }
    })
  })
}
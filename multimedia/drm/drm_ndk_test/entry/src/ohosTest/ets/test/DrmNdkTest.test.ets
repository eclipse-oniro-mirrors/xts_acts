/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import testNapi from 'libentry.so'

interface GeneratedObjectLiteralInterface_1 {
  CONTENT_PROTECTION_LEVEL_UNKNOWN: number;
  CONTENT_PROTECTION_LEVEL_SW_CRYPTO: number;
  CONTENT_PROTECTION_LEVEL_HW_CRYPTO: number;
  CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO: number;
  CONTENT_PROTECTION_LEVEL_MAX: number;
}

let Drm_ContentProtectionLevel: GeneratedObjectLiteralInterface_1 = {
  CONTENT_PROTECTION_LEVEL_UNKNOWN: 0,
  CONTENT_PROTECTION_LEVEL_SW_CRYPTO: 1,
  CONTENT_PROTECTION_LEVEL_HW_CRYPTO: 2,
  CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO: 3,
  CONTENT_PROTECTION_LEVEL_MAX: 4
}

interface GeneratedObjectLiteralInterface_2 {
  DRM_ERR_OK: number;
  DRM_CAPI_ERR_BASE: number;
  DRM_ERR_NO_MEMORY: number;
  DRM_ERR_OPERATION_NOT_PERMITTED: number;
  DRM_ERR_INVALID_VAL: number;
  DRM_ERR_IO: number;
  DRM_ERR_TIMEOUT: number;
  DRM_ERR_UNKNOWN: number;
  DRM_ERR_SERVICE_DIED: number;
  DRM_ERR_INVALID_STATE: number;
  DRM_ERR_UNSUPPORTED: number;
  DRM_ERR_MAX_SYSTEM_NUM_REACHED: number;
  DRM_ERR_MAX_SESSION_NUM_REACHED: number;
  DRM_ERR_EXTEND_START: number;
}

let Drm_ErrorCode: GeneratedObjectLiteralInterface_2 = {
  DRM_ERR_OK: 0,
  DRM_CAPI_ERR_BASE: 24700500,
  DRM_ERR_NO_MEMORY: 24700501,
  DRM_ERR_OPERATION_NOT_PERMITTED: 24700502,
  DRM_ERR_INVALID_VAL: 24700503,
  DRM_ERR_IO: 24700504,
  DRM_ERR_TIMEOUT: 24700505,
  DRM_ERR_UNKNOWN: 24700506,
  DRM_ERR_SERVICE_DIED: 24700507,
  DRM_ERR_INVALID_STATE: 24700508,
  DRM_ERR_UNSUPPORTED: 24700509,
  DRM_ERR_MAX_SYSTEM_NUM_REACHED: 24700510,
  DRM_ERR_MAX_SESSION_NUM_REACHED: 24700511,
  DRM_ERR_EXTEND_START: 24700600
}

enum Drm_CertificateStatus {
  CERT_STATUS_PROVISIONED = 0,
  CERT_STATUS_NOT_PROVISIONED,
  CERT_STATUS_EXPIRED,
  CERT_STATUS_INVALID,
  CERT_STATUS_UNAVAILABLE,
}
enum Drm_OfflineKeyStatus {
  OFFLINE_MEDIA_KEY_STATUS_UNKNOWN = 0,
  OFFLINE_MEDIA_KEY_STATUS_USABLE,
  OFFLINE_MEDIA_KEY_STATUS_INACTIVE,
}
enum Drm_Support {
  DRM_FALSE = 0,
  DRM_TRUE = 1
}

let systemName: string;
let clearPlay:number = testNapi.Test_KeySystemSupported("com.clearplay.drm"); //
if (clearPlay === 1) {
  console.log("systemName is com.clearplay.drm");
  systemName = "com.clearplay.drm";
} else {
  console.log("systemName is com.wiseplay.drm");
  systemName = "com.wiseplay.drm";
}

const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(100);
      done();
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_001
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是正确的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_001', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported(systemName);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_002
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_002', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported("com.drm.wiseplay");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_003
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_003', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported("");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_004
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_004', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported(" ");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_005
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_005', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2(systemName, "video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_006
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_006', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2("com..drm", "video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_007
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_007', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2("", "video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_008
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_008', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2(" ", "video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_009
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_009', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2(systemName, "111/mp4");
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_Support.DRM_FALSE);
      } else {
        expect(c).assertEqual(Drm_Support.DRM_TRUE);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_010
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_010', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2(systemName, "");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_011
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_011', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported2(systemName, " ");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_012
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：安全等级为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0OH_VideoDecoder_CreateByName
    */
    it('SUB_MULTIMEDIA_DRM_C_API_012', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_013
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_013', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_014
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为2
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_014', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_014 isSysSupport is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_015
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为3 (wiseplay根据证书级别)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_015', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO);
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_015 isSysSupport is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_016
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：安全等级为max
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_016', 0, () => {
      let c:number =
        testNapi.Test_KeySystemSupported3(systemName, "video/mp4", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_017
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：错误的安全等级
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_017', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "video/mp4", 5);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_018
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称为空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_018', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3("", "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_019
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_019', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(" ", "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_020
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_020', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3("wiseplay.drm", "video/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_021
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_021', 0, () => {
      let c:number =
        testNapi.Test_KeySystemSupported3(systemName, "", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_022
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_022', 0, () => {
      let c:number = testNapi.Test_KeySystemSupported3(systemName, "111/mp4",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_Support.DRM_FALSE);
      } else {
        expect(c).assertEqual(Drm_Support.DRM_TRUE);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_023
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_023', 0, () => {
      let c:number =
        testNapi.Test_KeySystemSupported3(systemName, " ", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_024
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_024', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Create(systemName, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_025
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：错误的插件名称
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_025', 0, () => {
      for (let i = 0; i < 500; i++) {
        let a:number = testNapi.Test_KeySystemSupported("com.drm.wiseplay");
        expect(a).assertEqual(Drm_Support.DRM_FALSE);
        let c:number = testNapi.Test_MediaKeySystem_Create("com.drm.wiseplay", "ptr");
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_026
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：插件名称传入空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_026', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Create(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_027
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：插件名称传入空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_027', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Create("", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_028
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：handle为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_028', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Create(systemName, " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_029
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_029', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr", "version", "2.2");
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      } else {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_030
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：handle为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_030', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString(" ", "version", "2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_031
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性名为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_031', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr", " ", "2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_032
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性值为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_032', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr", "version", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_033
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性名为空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_033', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr", "", "2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_034
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性值空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_034', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr", "version", "");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_035
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度in/out)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_035', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "version", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_036
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_036', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "maxSessionNum", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_037
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_037', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "vendor", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_038
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_038', 0, () => {
      let expectLen:number = 1000;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "algorithms", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_039
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_039', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "currentHDCPLevel", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_040
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：handle为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_040', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString(" ", "version", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_041
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性名为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_041', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", " ", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_042
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_042', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "version", " ", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_043
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_043', 0, () => {
      let expectLen:number = -1;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "version", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_044
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_044', 0, () => {
      let expectLen:number = 0;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "version", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_045
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度过小
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_045', 0, () => {
      let expectLen:number = 1;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "version", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_046
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性名为空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_046', 0, () => {
      let expectLen:number = 100;
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr", "", "ptr", expectLen);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_047
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_047', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", "description", dataString, dataString.length);
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      } else {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_048
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_048', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray(" ", "description", dataString, dataString.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_049
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性名空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_049', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", " ", dataString, dataString.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_050
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性名空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_050', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", "", dataString, dataString.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空字符串
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_051
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性值空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_051', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", "description", " ", dataString.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_052
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_052', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", "description", dataString, -1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_053
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_053', 0, () => {
      let dataString:string = "414141416933427a633267414141414131373232333936313536";
      let c:number = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr", "description", dataString, 0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_054
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_054', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr", "deviceUniqueId", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_055
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_055', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray(" ", "description", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_056
    * @tc.name      : testMediaKeySystemGetConfigurationByteArray
    * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：configName空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_056', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr", " ", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_057
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：configName空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_057', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr", "", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_058
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：value空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_058', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr", "description", " ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_059
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：value_len空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_059', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr", "description", "ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_060
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_060', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetStatistics("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_061
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_061', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetStatistics(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_062
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：out空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_062', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetStatistics("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_063
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_063', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_064
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_064', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_065
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：out空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_065', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_066
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数,安全等级0？
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_066', 0, () => {
      let c:number =
        testNapi.Test_CreateMediaKeySession("ptr", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_067
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级1
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_067', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession("ptr", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO,
        "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_068
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级2
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_068', 0, () => {
      let drmMaxLevel:number = testNapi.GetMaxContentProtectionLevel("ptr", "ptr");
      console.log("SUB_MULTIMEDIA_DRM_C_API_068 GetMaxContentProtectionLevel is ", drmMaxLevel);
      if(drmMaxLevel === Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO){
        let c:number = testNapi.Test_CreateMediaKeySession("ptr", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO,
          "ptr");
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_069
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级3 （根据证书级别）
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_069', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession("ptr",
        Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO, "ptr");
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_069 isSysSupport is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_070
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：安全等级max
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_070', 0, () => {
      let c:number =
        testNapi.Test_CreateMediaKeySession("ptr", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_071
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：错误的安全等级
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_071', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession("ptr", 5, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_072
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：安全等级空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_072', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession("ptr", -1, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_073
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_073', 0, () => {
      let c:number =
        testNapi.Test_CreateMediaKeySession(" ", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO, "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_074
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_074', 0, () => {
      let c:number =
        testNapi.Test_CreateMediaKeySession("ptr", Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO, " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_075
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_075', 0, () => {
      let status:number = testNapi.GetCertificateStatus();
      console.log("testCL_status = ",status);
      if(status != Drm_CertificateStatus.CERT_STATUS_PROVISIONED) {
        let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", "ptr", "ptr", "ptr", 1);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_076
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_076', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest(" ", "ptr", "ptr", "ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_077
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：请求value空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_077', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", " ", "ptr", "ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_078
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：请求val_len指针空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_078', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", "ptr", " ", "ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);

    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_079
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：url空字符串，len不为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_079', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", "ptr", "ptr", " ", 12);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_080
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：url长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_080', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", "ptr", "ptr", "ptr", 0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_081
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_out（首地址/长度）】：url长度为-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_081', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr", "ptr", "ptr", "ptr", -1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_082
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_082', 0, () => {
      let status: number = testNapi.GetCertificateStatus();
      if (status != Drm_CertificateStatus.CERT_STATUS_PROVISIONED) {
        let c: number = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse("ptr", "genResponse", 100);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_083
     * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
     * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_083', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_084
    * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
    * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_084', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_085
    * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
    * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：license数组指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_085', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_086
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_086', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", "genKey", 100, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_087
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_087', 0, () => {
      let keyId:string =testNapi.GetOfflineMediaKeyIds();
      console.log("testCL_SUB_MULTIMEDIA_DRM_C_API_092 keyId = " +keyId);
      if(keyId != "GetOfflineMediaKeyIds failed"){
        let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", keyId, keyId.length, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_088
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：不存在的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_088', 0, () => {
      let keyStr = "11223344";
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", keyStr, keyStr.length, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_089
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：handle为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_089', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus(" ", "genKey", 100, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_090
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_090', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", " ", 100, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_091
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值长度为-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_091', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", "genKey", -1, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_092
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_092', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", "genKey", 0, "ptr", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_093
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：out指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_093', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr", "genKey", 1, " ", Drm_OfflineKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_094
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_094', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", "genKey", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_095
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_095', 0, () => {
      let keyId:string =testNapi.GetOfflineMediaKeyIds();
      if(keyId != "GetOfflineMediaKeyIds failed") {
        let c: number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", keyId, keyId.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_096
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_096', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys(" ", "genKey", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_097
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_097', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", " ", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_098
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：错误key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_098', 0, () => {
      let keyStr = "1122334455667788";
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", keyStr, keyStr.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_099
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：value长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_099', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", "genKey", 0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_100
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：value长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_100', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr", "genKey", -1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_101
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_101', 0, () => {
      let c:number =
        testNapi.Test_MediaKeySystem_GetCertificateStatus("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_102
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_102', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetCertificateStatus(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_103
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_103', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetCertificateStatus("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_104
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_104', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Destroy("ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_105
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_105', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Destroy(" ", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_106
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：多次销毁
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_106', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_Destroy("ptr", 2);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_107
    * @tc.name      : testMediaKeySystemCallback
    * @tc.desc      : 创建带回调的system【systemHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_107', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetMediaKeySystemCallback("ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_108
    * @tc.name      : testMediaKeySystemCallback
    * @tc.desc      : 创建带回调的system【systemHandle_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_108', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_SetMediaKeySystemCallback(" ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_109
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_109', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_110
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_110', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest(" ", "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_111
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_111', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", " ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_112
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_112', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });

    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_113
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误请求数据 // wiseplay不检查
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_113', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "err_data", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_114
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误请求数据长度
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_114', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "err_dataLen", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_115
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误.超过optCount最大值
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_115', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "err_optCount", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_116
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误.mineType（wiseplay未使用）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_116', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr", "err_mineType", "ptr");
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      } else {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_117
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_117', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, length, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_118
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_118', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse(" ", responseStr, length, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_119
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_119', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", " ", 10, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_120
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_120', 0, () => {
      let responseStr = "11,11,11,11,11,11,11,11,11,111";
      let len = 10;
      let c:number = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, len, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_121
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据长度0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_121', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      length = 0;
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, length, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_122
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据长度-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_122', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      length = -1;
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, length, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_123
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：out数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_123', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, length, " ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_124
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：key数据长度空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_124', 0, () => {
      let responseStr:string;
      let length:number;
      if (clearPlay) {
        let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
        responseStr = responseArray.toString();
        length = responseArray.byteLength;
      }else{
        responseStr = "genResponse";
        length = 100;
      }
      let c:number =  testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr", responseStr, length, "ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_125
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_125', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr", "ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_126
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_126', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr", "ptr", 5);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_127
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：无license
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_127', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr", "ptr", 0);
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      } else {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_128
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_128', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_CheckMediaKeyStatus(" ", "ptr", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_129
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_129', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr", " ", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_130
    * @tc.name      : testMediaKeySessionClearMediaKeys
    * @tc.desc      : 清除在线license【sessionHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_130', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_ClearMediaKeys("ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_131
    * @tc.name      : testMediaKeySessionClearMediaKeys
    * @tc.desc      : 清除在线license【sessionHandle_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_131', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_ClearMediaKeys(" ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_132
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_132', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GetContentProtectionLevel("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_133
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_133', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GetContentProtectionLevel(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_134
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_134', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GetContentProtectionLevel("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_135
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：正常参数 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_135', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", "video/avc", "ptr", true);
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_0140 result is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_136
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：正常参数 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_136', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", "video/avs3", "ptr", true);
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_0141 result is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_137
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：正常参数 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段minetype
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_137', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", "video/hevc", "ptr", true);
      console.log("XX SUB_MULTIMEDIA_DRM_C_API_0141 result is", c);
      expect(c).not().assertUndefined();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_138
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：正常参数 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_138', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("sw", "video/avc", "ptr", false);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_139
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：会话等级不支持 // hw级（硬件加强需要设备证书是加强的）
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_139', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("enhanced_hw", "video/hevc", "ptr", true);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_140
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：会话等级不支持 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_140', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("max", "video/hevc", "ptr", true);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_141
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：会话等级不支持 // hw级
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_141', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("unknow", "video/hevc", "ptr", true);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_142
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：handle空指针
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_142', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule(" ", "video/mp4", "ptr", false);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_143
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：mineType空指针
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_143', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", " ", "ptr", false);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_144
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：错误mineType
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_144', 0, () => {
      let c: number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", "111/222", "ptr", false);
      if (clearPlay === 1) {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      } else {
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_145
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：out空指针
    * @tc.size      : MediumTest  ---- wiseplay支持："video/avc"、"video/avs3"、"video/hevc" ;不检查该字段
    * @tc.type      : Function test ---clearplay不支持
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_145', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("hw", "video/mp4", " ", false);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_146
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_146', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_147
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_147', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_148
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：callback空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_148', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_149
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_149', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", 1, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_150
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_150', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest(" ", "genKey", 1, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_151
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_151', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", " ", 1, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_152
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：错误的key，插件限制
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_152', 0, () => {
      let licenseIdStr = "11,11,11,11,12,22";
      let len = 6;
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", licenseIdStr, len, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_153
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_153', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", 0, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_154
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_154', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", -1, "ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_155
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：请求out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_155', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", 1, " ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_156
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：outLen空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_156', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", 1, "ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_157
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_157', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_158
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_158', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse(" ", "genKey", 1, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_159
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_159', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number =
          testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", " ", 1, responseStr, responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_160
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_160', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 0, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_161
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_161', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", -1, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_162
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_162', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        //let responseStr = responseArray.toString();
        let c:number =
          testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, " ", responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_163
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_163', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, responseStr, 0);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_164
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_164', 0, () => {
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, responseStr, -1);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_165
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：错误的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_165', 0, () => {
      if (clearPlay) {
        let keyArray =
          new Uint8Array([0x76, 0x76, 0x76, 0x35, 0x6b, 0x6f, 0x30, 0x6e, 0x38, 0x36, 0x30, 0x74, 0x33, 0x6c, 0x37,
            0x36, 0x63, 0x35, 0x71, 0x70, 0x77, 0x69, 0x6a, 0x6d, 0x38, 0x61, 0x61, 0x38, 0x64, 0x79, 0x32, 0x32]);
        let keyStr = keyArray.toString();
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", keyStr, keyArray.length, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_166
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】错误的响应数据（不判断）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_166', 0, () => {
      if (clearPlay) {
        let responseArray = new Uint8Array([0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_167
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_167', 0, () => {
      let keyArray =
        new Uint8Array([0x31, 0x56, 0x55, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      let keyStr = keyArray.toString();
      if (clearPlay) {
        let responseArray =
          new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68,
            0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        let responseStr = responseArray.toString();
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", keyStr, keyArray.length, responseStr,
          responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_168
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：异常响应报文(不判断)
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_168', 0, () => {
      if (clearPlay) {
        let responseStr = "";
        let len = 10;
        let c:number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr", "genKey", 1, responseStr, len);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_169
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_169', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr", "getKey", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_170
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_170', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys(" ", "getKey", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_171
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：错误的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_171', 0, () => {
      let licenseResponseStr = "11,11,11,11,11,111,11,111";
      let len = 8;
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr", licenseResponseStr, len);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_172
    * @tc.name      : test MediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_172', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr", " ", 1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_173
    * @tc.name      : test MediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_173', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr", "getKey", 0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_174
    * @tc.name      : test MediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_174', 0, () => {
      let c:number = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr", "getKey", -1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    //  add cases
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_175
    * @tc.name      : Test_CreateMediaKeySession_multi
    * @tc.desc      : 创建多个session【个数】：// destroy异常,已提单
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_175', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession_multi(64);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_176
    * @tc.name      : Test_CreateMediaKeySession_multi
    * @tc.desc      : 创建多个session【个数】：
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_176', 0, () => {
      let c:number = testNapi.Test_CreateMediaKeySession_multi(65);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_177
    * @tc.name      : Test_MediaKeySession_ProcessOfflineReleaseResponse_multi
    * @tc.desc      : 多次release【个数】：
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_177', 0, () => {
      if(clearPlay) {
        let c: number = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse_multi(100);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_178
   * @tc.name      : Test_MediaKeySystem_SetConfigurationString_multi
   * @tc.desc      : 多次设置字符串，不同长度是否覆盖
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_178', 0, () => {
      if (clearPlay == 1) {
        let c:number = testNapi.Test_MediaKeySystem_SetConfigurationString_multi();
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
    });
    // add api
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_179
   * @tc.name      : Test MediaKeySystem_GetMediaKeySystems // 正常参数
   * @tc.desc      : 多次设置字符串，不同长度是否覆盖
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_179', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMediaKeySystems("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    });
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_180
   * @tc.name      : Test MediaKeySystem_GetMediaKeySystems //description 空指针
   * @tc.desc      : 多次设置字符串，不同长度是否覆盖
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_180', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMediaKeySystems(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_181
   * @tc.name      : Test MediaKeySystem_GetMediaKeySystems // count空指针
   * @tc.desc      : 多次设置字符串，不同长度是否覆盖
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_181', 0, () => {
      let c:number = testNapi.Test_MediaKeySystem_GetMediaKeySystems("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_182
    * @tc.name      : Test_MediaKeySystem_SetCallback
    * @tc.desc      : system_set 回调
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_182', 0, () => {
      let c = testNapi.Test_MediaKeySystem_SetCallback("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_183
    * @tc.name      : Test_MediaKeySystem_SetCallback
    * @tc.desc      : system_set 回调
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_183', 0, () => {
      let c = testNapi.Test_MediaKeySystem_SetCallback(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_184
    * @tc.name      : Test_MediaKeySystem_SetCallback
    * @tc.desc      : system_set 回调
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_184', 0, () => {
      let c = testNapi.Test_MediaKeySystem_SetCallback("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_185
    * @tc.name      : Test_MediaKeySession_SetCallback
    * @tc.desc      : system_set 回调
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_185', 0, () => {
      let c = testNapi.Test_MediaKeySession_SetCallback("ptr", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
    })
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_186
   * @tc.name      : Test_MediaKeySession_SetCallback
   * @tc.desc      : system_set 回调
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_186', 0, () => {
      let c = testNapi.Test_MediaKeySession_SetCallback(" ", "ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    })
    /* *
   * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_187
   * @tc.name      : Test_MediaKeySession_SetCallback // 取消回调
   * @tc.desc      : system_set 回调
   * @tc.size      : MediumTest
   * @tc.type      : Function test
   * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_DRM_C_API_187', 0, () => {
      let c = testNapi.Test_MediaKeySession_SetCallback("ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    })
  })
}

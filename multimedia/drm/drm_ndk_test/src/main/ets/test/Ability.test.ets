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
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so'
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

let Drm_ContentProtectionLevel = {
  CONTENT_PROTECTION_LEVEL_UNKNOWN : 0,
  CONTENT_PROTECTION_LEVEL_SW_CRYPTO : 1,
  CONTENT_PROTECTION_LEVEL_HW_CRYPTO : 2,
  CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO : 3,
  CONTENT_PROTECTION_LEVEL_MAX :4
}
let Drm_ErrorCode = {
  DRM_ERR_OK : 0,
  DRM_CAPI_ERR_BASE : 24700500,
  DRM_ERR_NO_MEMORY : 24700501,
  DRM_ERR_OPERATION_NOT_PERMITTED : 24700502,
  DRM_ERR_INVALID_VAL :24700503,
  DRM_ERR_IO:24700504,
  DRM_ERR_TIMEOUT:24700505,
  DRM_ERR_UNKNOWN:24700506,
  DRM_ERR_SERVICE_DIED:24700507,
  DRM_ERR_INVALID_STATE:24700508,
  DRM_ERR_UNSUPPORTED:24700509,
  DRM_ERR_MAX_SYSTEM_NUM_REACHED:24700510,
  DRM_ERR_MAX_SESSION_NUM_REACHED:24700511,
  DRM_ERR_EXTEND_START:24700600
}
enum Drm_CertificateStatus {
  CERT_STATUS_PROVISIONED = 0,
  CERT_STATUS_NOT_PROVISIONED,
  CERT_STATUS_EXPIRED,
  CERT_STATUS_INVALID,
  CERT_STATUS_UNAVAILABLE,
}
enum Drm_Support {
  DRM_FALSE =0,
  DRM_TRUE =1
}
var uuid;
var blueArea = testNapi.Test_KeySystemSupported("com.clearplay.drm"); //
if(blueArea === 1){
  console.log("uuid is com.clearplay.drm");
  uuid = "com.clearplay.drm";
} else {
  console.log("uuid is com.wiseplay.drm");
  uuid = "com.wiseplay.drm";
}

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_001
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是正确的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_001', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported(uuid);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_002
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_002', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported("com.wwwwwwwwww.drm");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_003
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_003', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported("");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_004
    * @tc.name      : testKeySystemSupported
    * @tc.desc      : 插件是否支持drm方案；插件名称是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_004', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported(" ");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_005
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_005', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2(uuid,"video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_006
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_006', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2("com..drm","video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_007
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_007', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2("","video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_008
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：插件名称是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_008', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2(" ","video/mp4");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_009
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是错误的
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_009', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2(uuid,"111/mp4");
      if(blueArea === 1) {
        expect(c).assertEqual(Drm_Support.DRM_FALSE);
      } else{
        expect(c).assertEqual(Drm_Support.DRM_TRUE); // 黄区未判断minetype，已提单
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_010
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_010', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2(uuid,"");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_011
    * @tc.name      : testKeySystemSupported2
    * @tc.desc      : 插件是否支持drm方案（两个参数：插件名称/mineType）：mineType是空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_011', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported2(uuid," ");
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_012
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：安全等级为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_012', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_013
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_013', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_014
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为2
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_014', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_015
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：正常参数，安全等级为3
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_015', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_TRUE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_016
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：安全等级为max
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_016', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_017
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：错误的安全等级
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_017', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"video/mp4",5);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_018
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称为空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_018', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3("","video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_019
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_019', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(" ","video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_020
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：插件名称错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_020', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3("wiseplay.drm","video/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_021
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_021', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_022
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_022', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid,"111/mp4",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_023
    * @tc.name      : testKeySystemSupported3
    * @tc.desc      : 插件是否支持drm方案（三个参数：插件名称/mineType/安全等级）：mineType空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_023', 0, function (done) {
      let c = testNapi.Test_KeySystemSupported3(uuid," ",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
      expect(c).assertEqual(Drm_Support.DRM_FALSE);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_024
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_024', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Create(uuid,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_025
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：错误的插件名称
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_025', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Create("wiseplay.drm","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_026
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：插件名称传入空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_026', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Create(" ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_027
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：插件名称传入空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_027', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Create("","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_028
    * @tc.name      : testMediaKeySystemCreate
    * @tc.desc      : 创建system（name_in/systemHandle_out）：handle为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_028', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Create(uuid," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_029
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_029', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr","version","2.2");
      if(blueArea === 1){
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      } else{
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);// 黄区set设置不成功，插件未实现
      }
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_030
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：handle为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_030', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString(" ","version","2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_031
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性名为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_031', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr"," ","2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_032
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性值为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_032', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr","version"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_033
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性名为空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_033', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr","","2.2");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_034
     * @tc.name      : testMediaKeySystemSetConfigurationString
     * @tc.desc      : 配置插件字符串属性（systemHandle_in/属性名_in/属性值_in）：属性值空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_034', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetConfigurationString("ptr","version","");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_035
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度in/out)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_035', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","version","ptr",55,"set");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_036
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_036', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","maxSessionNum","ptr",55,"set");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_037
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_037', 0, function (done) {
      if(!blueArea){
        let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","maxSessionNum","ptr",55,"64");
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_038
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：handle为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_038', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString(" ","version","ptr",100,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_039
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性名为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_039', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr"," ","ptr",100,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_040
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值为空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_040', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","version"," ",100,"set");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_041
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_041', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","version","ptr",-1,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_042
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_042', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","version","ptr",0,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_043
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度过小
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_043', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","version","ptr",1,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_044
     * @tc.name      : testMediaKeySystemGetConfigurationString
     * @tc.desc      : 获取插件字符串属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性名为空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_044', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationString("ptr","","ptr",55,"1.1");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_045
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_045', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr","version",dataString,dataArry.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_046
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_046', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray(" ","version",dataString,dataArry.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_047
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性名空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_047', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr"," ",dataString,dataArry.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_048
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性名空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_048', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr","",dataString,dataArry.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空字符串
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_049
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性值空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_049', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr","version"," ",dataArry.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL); // 空指针
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_050
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_050', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr","version",dataString,-1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_051
     * @tc.name      : testMediaKeySystemSetConfigurationByteArray
     * @tc.desc      : 设置插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度)/预期】：属性值长度错误
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_051', 0, function (done) {
      var dataArry =  new Uint8Array([0x22, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56,0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var dataString = dataArry.toString();
      let c = testNapi.Test_MediaKeySystem_SetConfigurationByteArray("ptr","version",dataString,0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_052
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_052', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr","value","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_053
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_053', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray(" ","version","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_054
    * @tc.name      : testMediaKeySystemGetConfigurationByteArray
    * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：configName空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_054', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr"," ","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_055
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：configName空字符串
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_055', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr","","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_056
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：value空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_056', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr","version"," ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_057
     * @tc.name      : testMediaKeySystemGetConfigurationByteArray
     * @tc.desc      : 获取插件数组属性【handle_in/属性名_in/属性值_out（头指针/长度指针)】：value_len空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_057', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetConfigurationByteArray("ptr","version","ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_058
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_058', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetStatistics("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_059
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_059', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetStatistics(" ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_060
     * @tc.name      : testMediaKeySystemGetStatistics
     * @tc.desc      : 获取度量信息【handle_in/度量信息—out)】：out空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_060', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetStatistics("ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_061
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：正常参数
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_061', 0, function (done) {
      let c;
      if(blueArea === 1) {
        c = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel("ptr","ptr",1);
      } else{
        c = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel("ptr","ptr",2);
      }
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_062
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：handle空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_062', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel(" ","ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_063
     * @tc.name      : testMediaKeySystemGetMaxContentProtectionLevel
     * @tc.desc      : 获取安全等级【handle_in/安全等级—out)/预期】：out空指针
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_063', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetMaxContentProtectionLevel("ptr"," ",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_064
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数,安全等级0？
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_064', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_065
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级1
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_065', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_066
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级2
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_066', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
     * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_067
     * @tc.name      : testCreateMediaKeySession
     * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级3
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_DRM_C_API_067', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_068
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：正常参数，安全等级max
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_068', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_069
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：错误的安全等级
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_069', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",5,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_070
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：安全等级空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_070', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",-1,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_071
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_071', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession(" ",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO,"ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_072
    * @tc.name      : testCreateMediaKeySession
    * @tc.desc      : 创建会话【systemHandle_in/安全等级_in/sessionHandle_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_072', 0, function (done) {
      let c = testNapi.Test_CreateMediaKeySession("ptr",Drm_ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_073
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_073', 0, function (done) {
      var defaultUrl = "http://default.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr","ptr",defaultUrl,defaultUrl.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_074
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_074', 0, function (done) {
      var defaultUrl = "http://default.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest(" ","ptr","ptr",defaultUrl,defaultUrl.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_075
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：请求value空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_075', 0, function (done) {
      var defaultUrl = "http://default.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr"," ","ptr",defaultUrl,defaultUrl.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_076
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：请求val_len指针空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_076', 0, function (done) {
      var defaultUrl = "http://default.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr"," ",defaultUrl,defaultUrl.length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_077
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：url错误字符串（插件处理）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_077', 0, function (done) {
      var defaultUrl = "http://111111111.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr","ptr",defaultUrl,defaultUrl.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_078
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：url空字符串，len不为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_078', 0, function (done) {
      var defaultUrl = "";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr","ptr",defaultUrl,0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_079
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：url长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_079', 0, function (done) {
      var defaultUrl = "http://default.com";
      let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr","ptr",defaultUrl,0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_080
    * @tc.name      : testMediaKeySystemGenerateKeySystemRequest
    * @tc.desc      : 获取设备证书请求【systemHandle_in/请求_out（首地址/长度指针）/URL_in（首地址/长度）】：url长度为-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_080', 0, function (done) {
    //   var defaultUrl = "http://default.com";
    //   let c = testNapi.Test_MediaKeySystem_GenerateKeySystemRequest("ptr","ptr","ptr",defaultUrl,-1);
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_081
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_081', 0, function (done) {
      var length;
      if(blueArea ==1 ){
        var arry = new Uint8Array([1, 2, 3, 4, 5]);
        var provisionResponseStr = arry.toString();
        length = arry.length;
      } else{
        var provisionResponseStr = "genResponse";
        length = 100;
      }
      let c = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse("ptr",provisionResponseStr,length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_082
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_082', 0, function (done) {
      var length;
      if(blueArea ==1 ){
        var arry = new Uint8Array([1, 2, 3, 4, 5]);
        var provisionResponseStr = arry.toString();
        length = arry.length;
      } else{
        var provisionResponseStr = "get_in_c";
        length = 100;
      }
      let c = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse(" ",provisionResponseStr,length);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_083
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：value空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_083', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse("ptr"," ",100);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_084
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：value_len长度错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_084', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse("ptr","get_in_c",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_085
    * @tc.name      : testMediaKeySystemProcessKeySystemResponse
    * @tc.desc      : 获取设备证书响应【systemHandle_in/响应_in(数据/长度)】：value_len长度-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_085', 0, function (done) {
    //   var length =-1;
    //   var arry = new Uint8Array([1, 2, 3, 4, 5]);
    //   var provisionResponseStr = arry.toString();
    //   let c = testNapi.Test_MediaKeySystem_ProcessKeySystemResponse("ptr",provisionResponseStr,length);
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })
   /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_086
    * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
    * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_086', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_087
    * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
    * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_087', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds(" ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_088
    * @tc.name      : testMediaKeySystemGetOfflineMediaKeyIds
    * @tc.desc      : 获取离线license【systemHandle_in/license数组指针】：license数组指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_088', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyIds("ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_089
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    *//
    it('SUB_MULTIMEDIA_DRM_C_API_089', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr","genKey",1,"ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_090
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：不存在的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_090', 0, function (done) {
      var responseKeyStr ="11,22,33,44";
      let len = 4;
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr",responseKeyStr,len,"ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_091
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：handle为空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_091', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus(" ","genKey",1,"ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_092
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_092', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr"," ",5,"ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_093
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_093', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr","",5,"ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    // /* *
    // * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_094
    // * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    // * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值长度为-1
    // * @tc.size      : MediumTest
    // * @tc.type      : Function test
    // * @tc.level     : Level0
    // */
    // it('SUB_MULTIMEDIA_DRM_C_API_094', 0, function (done) {
    //   let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr","genKey",-1,"ptr",0);
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL)
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_095
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：key值长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_095', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr","genKey",0,"ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL)
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_096
    * @tc.name      : testMediaKeySystem_GetOfflineMediaKeyStatus
    * @tc.desc      : 获取离线license状态【systemHandle_in/key_in(值/长度)/状态_out/预期】：out指针为空
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_096', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetOfflineMediaKeyStatus("ptr","genKey",1," ",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_097
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_097', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr","genKey",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_098
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_098', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys(" ","genKey",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_099
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_099', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr"," ",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_100
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：错误key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_100', 0, function (done) {
      var responseKeyStr = "11,22,33,44,55,66,77,88";
      let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr",responseKeyStr,8);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_101
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：value长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_101', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr","genKey",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_102
    * @tc.name      : testMediaKeySystem_ClearOfflineMediaKeys
    * @tc.desc      : 清除离线license【systemHandle_in/key_in(值/长度)】：value长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_102', 0, function (done) {
    //   let c = testNapi.Test_MediaKeySystem_ClearOfflineMediaKeys("ptr","genKey",-1);
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_103
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_103', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetCertificateStatus("ptr","ptr",Drm_CertificateStatus.CERT_STATUS_PROVISIONED);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_104
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_104', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetCertificateStatus(" ","ptr",Drm_CertificateStatus.CERT_STATUS_NOT_PROVISIONED);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_105
    * @tc.name      : testMediaKeySystemGetCertificateStatus
    * @tc.desc      : 获取provision证书状态【systemHandle_in/状态_out/预期】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_105', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_GetCertificateStatus("ptr"," ",Drm_CertificateStatus.CERT_STATUS_NOT_PROVISIONED);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_106
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_106', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Destroy("ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_107
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_107', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Destroy(" ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_108
    * @tc.name      : testMediaKeySystemDestroy
    * @tc.desc      : 销毁system【systemHandle_in】：销毁两次
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_108', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_Destroy("twice");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_109
    * @tc.name      : testMediaKeySystemCallback
    * @tc.desc      : 创建带回调的system【systemHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_109', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetMediaKeySystemCallback("ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_110
    * @tc.name      : testMediaKeySystemCallback
    * @tc.desc      : 创建带回调的system【systemHandle_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_110', 0, function (done) {
      let c = testNapi.Test_MediaKeySystem_SetMediaKeySystemCallback(" ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_111
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_111', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_112
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_112', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest(" ","ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_113
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_113', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr"," ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_114
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_114', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_115
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误type（clearplay不用type）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_115', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","err_type","ptr");
      if(blueArea){
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }else{
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_116
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误请求数据
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_116', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","err_data","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_117
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误请求数据长度
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_117', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","err_dataLen","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_118
    * @tc.name      : testMediaKeySessionGenerateMediaKeyRequest
    * @tc.desc      : 在线license请求【systemHandle_in/请求info_in/request_out】：info错误.mineType（clearplay未使用）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_118', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateMediaKeyRequest("ptr","err_mineType","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_119
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_119', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr","genResponse",1,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_120
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_120', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse(" ","genResponse",1,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_121
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_121', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr"," ",10,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_122
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据错误
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_122', 0, function (done) {
      var responseStr = "11,11,11,11,11,11,11,11,11,111";
      let len = 10;
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr",responseStr,len,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_123
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据长度0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_123', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr","genResponse",0,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_124
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：响应数据长度-1
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_124', 0, function (done) {
    //   let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr","genResponse",-1,"ptr","ptr");
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_125
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：out数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_125', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr","genResponse",1," ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_126
    * @tc.name      : testMediaKeySessionProcessMediaKeyResponse
    * @tc.desc      : 在线license响应【systemHandle_in/响应_in(数据、长度)/key_out（数据、长度）】：key数据长度空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_126', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ProcessMediaKeyResponse("ptr","genResponse",1,"ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_127
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：正常参数（wiseplay未实现）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_127', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr","ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_128
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out】：handle空指针（wiseplay未实现）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_128', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_CheckMediaKeyStatus(" ","ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_129
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out】：out空指针（wiseplay未实现）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_129', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr"," ",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_130
    * @tc.name      : testMediaKeySessionClearMediaKeys
    * @tc.desc      : 清除在线license【sessionHandle_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_130', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ClearMediaKeys("ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_131
    * @tc.name      : testMediaKeySessionClearMediaKeys
    * @tc.desc      : 清除在线license【sessionHandle_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_131', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_ClearMediaKeys(" ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_132
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_132', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GetContentProtectionLevel("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_133
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_133', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GetContentProtectionLevel(" ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_134
    * @tc.name      : testMediaKeySessionGetContentProtectionLevel
    * @tc.desc      : 获取会话安全等级【sessionHandle_in/安全等级_out】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_134', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GetContentProtectionLevel("ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_135
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_135', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr","video/mp4","ptr",1);
      if(blueArea){
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      } else{
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_136
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：mineType
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_136', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr","video/hevc","ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_137
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：mineType
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_137', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr","video/avs3","ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_138
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_138', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule(" ","video/mp4","ptr",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_139
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：mineType空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_139', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr"," ","ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_140
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：mineType空字符串
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_140', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr","","ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_141
    * @tc.name      : testMediaKeySessionGetContentRequireSecureDecoderModule
    * @tc.desc      : 查询插件是否支持安全解码【sessionHandle_in/mineType_in/支持情况/预期】：out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_141', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RequireSecureDecoderModule("ptr","video/mp4"," ",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_142
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_142', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_143
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_143', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback(" ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_144
    * @tc.name      : testMediaKeySessionSetMediaKeySessionCallback
    * @tc.desc      : 创建带回调函数的会话【sessionHandle_in/callback_in】：callback空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_144', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_SetMediaKeySessionCallback("ptr"," ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_145
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_145', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr","genKey",1,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_146
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_146', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest(" ","genKey",1,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_147
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_147', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr"," ",1,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_148
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：错误的key，插件限制
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_148', 0, function (done) {
      var licenseIdStr = "11,11,11,11,12,22";
      var len = 6;
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr",licenseIdStr,len,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_149
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_149', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr","genKey",0,"ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_150
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_150', 0, function (done) {
    //   let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr","genKey",-1,"ptr","ptr");
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_151
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：请求out空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_151', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr","genKey",1," ","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_152
    * @tc.name      : testMediaKeySessionSetGenerateOfflineReleaseRequest
    * @tc.desc      : 离线许可证释放请求【sessionHandle_in/key_in(值/长度)/离线请求_out】：outLen空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_152', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_GenerateOfflineReleaseRequest("ptr", "genKey", 1, "ptr", " ");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_153
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_153', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_154
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_154', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse(" ","genKey",1,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_155
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key值空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_155', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr"," ",1,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_156
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_156', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",0,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_157
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_157', 0, function (done) {
    //   if(blueArea){
    //     var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
    //     var responseStr = responseArray.toString();
    //     let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",-1,responseStr,responseArray.length);
    //     expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   }// TODO：黄区processOfflineReleaseResponse不支持
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_158
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_158', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        //var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1," ",responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_159
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_159', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1,responseStr,0);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_160
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：响应数据长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_160', 0, function (done) {
    //   if(blueArea){
    //     var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
    //     var responseStr = responseArray.toString();
    //     let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1,responseStr,-1);
    //     expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   }// TODO：黄区processOfflineReleaseResponse不支持
    //   done();
    // })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_161
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：错误的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_161', 0, function (done) {
      if(blueArea){
        var keyArray =  new Uint8Array([0x76, 0x76, 0x76, 0x35, 0x6b, 0x6f, 0x30, 0x6e, 0x38, 0x36, 0x30, 0x74, 0x33, 0x6c, 0x37, 0x36, 0x63, 0x35, 0x71, 0x70, 0x77, 0x69, 0x6a, 0x6d, 0x38, 0x61, 0x61, 0x38, 0x64, 0x79, 0x32, 0x32]);
        var keyStr = keyArray.toString();
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr",keyStr,keyArray.length,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_162
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：异常响应报文，能release（已提单）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_162', 0, function (done) {
      if(blueArea){
        var responseArray =  new Uint8Array([0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_163
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：key异常
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_163', 0, function (done) {
      var keyArray =  new Uint8Array([0x31, 0x56, 0x55, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
      var keyStr = keyArray.toString();
      if(blueArea){
        var responseArray =  new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
        var responseStr = responseArray.toString();
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr",keyStr,keyArray.length,responseStr,responseArray.length);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_164
    * @tc.name      : testMediaKeySessionProcessOfflineReleaseResponse
    * @tc.desc      : 离线许可证释放响应【sessionHandle_in/key_in(值/长度)/离线响应(值/长度)】：异常响应报文，能release（已提单）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_164', 0, function (done) {
      if(blueArea){
        var responseStr = "";
        var len = 10;
        let c = testNapi.Test_MediaKeySession_ProcessOfflineReleaseResponse("ptr","genKey",1,responseStr,len);
        expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      }// TODO：黄区processOfflineReleaseResponse不支持
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_165
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：正常参数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_165', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr","getKey",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_166
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：handle空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_166', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys(" ","getKey",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_167
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：错误的key
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_167', 0, function (done) {
      var licenseResponseStr ="11,11,11,11,11,111,11,111";
      var len = 8;
      let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr",licenseResponseStr,len);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_168
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key空指针
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_168', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr"," ",1);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_169
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key长度为0
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_169', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr","getKey",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_170
    * @tc.name      : testMediaKeySessionRestoreOfflineMediaKeys
    * @tc.desc      : 恢复离线许可证【sessionHandle_in/key_in(值/长度)】：key长度为负数
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    // it('SUB_MULTIMEDIA_DRM_C_API_170', 0, function (done) {
    //   let c = testNapi.Test_MediaKeySession_RestoreOfflineMediaKeys("ptr","getKey",-1);
    //   expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
    //   done();
    // })

    // add cases
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_171
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：正常参数（wiseplay未实现）
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_171', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr","ptr",5);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_DRM_C_API_172
    * @tc.name      : testMediaKeySessionCheckMediaKeyStatus
    * @tc.desc      : 在线license状态查询【sessionHandle_in/状态_out/licenseNumber】：无license
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_DRM_C_API_172', 0, function (done) {
      let c = testNapi.Test_MediaKeySession_CheckMediaKeyStatus("ptr","ptr",0);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_INVALID_VAL);
      done();
    })
  })
}
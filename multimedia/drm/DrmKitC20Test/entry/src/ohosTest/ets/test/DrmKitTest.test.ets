/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function DrmKitTest() {
  describe('drmKitTest', () => {
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
    /**
     * @tc.name   SUB_OH_MediaKeySession_GenerateMediaKeyRequestInvalue
     * @tc.number SUB_OH_MediaKeySession_GenerateMediaKeyRequestInvalue
     * @tc.desc   test OH_MediaKeySession_GenerateMediaKeyRequest Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_GenerateMediaKeyRequestInvalue', Level.LEVEL1, () => {
      try {
          let c: number = testNapi.mediaKeySession_GenerateMediaKeyRequestInvalue();
          expect(c).assertEqual(1);
        } catch (err) {
          console.error("====>SUB_OH_MediaKeySession_GenerateMediaKeyRequestInvalue catch err: " + err);
          expect(false).assertEqual(0);
        }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_ProcessMediaKeyResponseInvalue
     * @tc.number SUB_OH_MediaKeySession_ProcessMediaKeyResponseInvalue
     * @tc.desc   test OH_MediaKeySession_ProcessMediaKeyResponse Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_ProcessMediaKeyResponseInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_ProcessMediaKeyResponseInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_ProcessMediaKeyResponseInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_ClearMediaKeysInvalue
     * @tc.number SUB_OH_MediaKeySession_ClearMediaKeysInvalue
     * @tc.desc   test OH_MediaKeySession_ClearMediaKeys Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_ClearMediaKeysInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_ClearMediaKeysInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_ClearMediaKeysInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue
     * @tc.number SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue
     * @tc.desc   test OH_MediaKeySession_GenerateOfflineReleaseRequest Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_GenerateOfflineReleaseRequestInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalueOne
     * @tc.number SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalueOne
     * @tc.desc   test OH_MediaKeySession_GenerateOfflineReleaseRequestOne Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalueOne', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_GenerateOfflineReleaseRequestInvalueOne();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_GenerateOfflineReleaseRequestInvalueOne catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue
     * @tc.number SUB_OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue
     * @tc.desc   test OH_MediaKeySession_ProcessOfflineReleaseResponse Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_ProcessOfflineReleaseResponseInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_RestoreOfflineMediaKeysInvalue
     * @tc.number SUB_OH_MediaKeySession_RestoreOfflineMediaKeysInvalue
     * @tc.desc   test OH_MediaKeySession_RestoreOfflineMediaKeys Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_RestoreOfflineMediaKeysInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_RestoreOfflineMediaKeysInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_RestoreOfflineMediaKeysInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });


    /**
     * @tc.name   SUB_OH_MediaKeySession_GetContentProtectionLevelInvalue
     * @tc.number SUB_OH_MediaKeySession_GetContentProtectionLevelInvalue
     * @tc.desc   test OH_MediaKeySession_GetContentProtectionLevel Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_GetContentProtectionLevelInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_GetContentProtectionLevelInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_GetContentProtectionLevelInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_RequireSecureDecoderModuleInvalue
     * @tc.number SUB_OH_MediaKeySession_RequireSecureDecoderModuleInvalue
     * @tc.desc   test OH_MediaKeySession_RequireSecureDecoderModule Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_RequireSecureDecoderModuleInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_RequireSecureDecoderModuleInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_RequireSecureDecoderModuleInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_DestroyInvalue
     * @tc.number SUB_OH_MediaKeySession_DestroyInvalue
     * @tc.desc   test OH_MediaKeySession_Destroy Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_DestroyInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_DestroyInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_DestroyInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetMediaKeySystemsInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetMediaKeySystemsInvalue
     * @tc.desc   test OH_MediaKeySystem_GetMediaKeySystems Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetMediaKeySystemsInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetMediaKeySystemsInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetMediaKeySystemsInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_CreateInvalue
     * @tc.number SUB_OH_MediaKeySystem_CreateInvalue
     * @tc.desc   test OH_MediaKeySystem_Create Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MediaKeySystem_CreateInvalue', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.mediaKeySystem_CreateInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_CreateInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_SetConfigurationStringInvalue
     * @tc.number SUB_OH_MediaKeySystem_SetConfigurationStringInvalue
     * @tc.desc   test OH_MediaKeySystem_SetConfigurationString Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_SetConfigurationStringInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_SetConfigurationStringInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_SetConfigurationStringInvalue catch err:" + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetConfigurationStringInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetConfigurationStringInvalue
     * @tc.desc   test OH_MediaKeySystem_GetConfigurationString Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetConfigurationStringInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetConfigurationStringInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetConfigurationStringInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_SetConfigurationByteArrayInvalue
     * @tc.number SUB_OH_MediaKeySystem_SetConfigurationByteArrayInvalue
     * @tc.desc   test OH_MediaKeySystem_SetConfigurationByteArray Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_SetConfigurationByteArrayInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_SetConfigurationByteArrayInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_SetConfigurationByteArrayInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetConfigurationByteArrayInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetConfigurationByteArrayInvalue
     * @tc.desc   test OH_MediaKeySystem_GetConfigurationByteArray Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetConfigurationByteArrayInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetConfigurationByteArrayInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetConfigurationByteArrayInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetStatisticsInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetStatisticsInvalue
     * @tc.desc   test OH_MediaKeySystem_GetStatistics Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MediaKeySystem_GetStatisticsInvalue', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetStatisticsInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetStatisticsInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_CreateMediaKeySessionInvalue
     * @tc.number SUB_OH_MediaKeySystem_CreateMediaKeySessionInvalue
     * @tc.desc   test OH_MediaKeySystem_CreateMediaKeySession Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_CreateMediaKeySessionInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_CreateMediaKeySessionInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_CreateMediaKeySessionInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GenerateKeySystemRequestInvalue
     * @tc.number SUB_OH_MediaKeySystem_GenerateKeySystemRequestInvalue
     * @tc.desc   test OH_MediaKeySystem_GenerateKeySystemRequest Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GenerateKeySystemRequestInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GenerateKeySystemRequestInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GenerateKeySystemRequestInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_ProcessKeySystemResponseInvalue
     * @tc.number SUB_OH_MediaKeySystem_ProcessKeySystemResponseInvalue
     * @tc.desc   test OH_MediaKeySystem_ProcessKeySystemResponse Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_ProcessKeySystemResponseInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_ProcessKeySystemResponseInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_ProcessKeySystemResponseInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue
     * @tc.desc   test OH_MediaKeySystem_GetOfflineMediaKeyIds Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetOfflineMediaKeyIdsInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue
     * @tc.desc   test OH_MediaKeySystem_GetOfflineMediaKeyStatus Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetOfflineMediaKeyStatusInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_ClearOfflineMediaKeysInvalue
     * @tc.number SUB_OH_MediaKeySystem_ClearOfflineMediaKeysInvalue
     * @tc.desc   test OH_MediaKeySystem_ClearOfflineMediaKeys Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_ClearOfflineMediaKeysInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_ClearOfflineMediaKeysInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_ClearOfflineMediaKeysInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetCertificateStatusInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetCertificateStatusInvalue
     * @tc.desc   test OH_MediaKeySystem_GetCertificateStatus Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetCertificateStatusInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetCertificateStatusInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetCertificateStatusInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_DestroyInvalue
     * @tc.number SUB_OH_MediaKeySystem_DestroyInvalue
     * @tc.desc   test OH_MediaKeySystem_Destroy Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_DestroyInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_DestroyInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_DestroyInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySession_CheckMediaKeyStatusInvalue
     * @tc.number SUB_OH_MediaKeySession_CheckMediaKeyStatusInvalue
     * @tc.desc   test OH_MediaKeySession_CheckMediaKeyStatus Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySession_CheckMediaKeyStatusInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySession_CheckMediaKeyStatusInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySession_CheckMediaKeyStatusInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue
     * @tc.number SUB_OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue
     * @tc.desc   test OH_MediaKeySystem_GetMaxContentProtectionLevel Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeySystem_GetMaxContentProtectionLevelInvalue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_MediaKeyRequestType
     * @tc.number SUB_DRM_MediaKeyRequestType
     * @tc.desc   test DRM_MediaKeyRequestType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRM_MediaKeyRequestType', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeyRequestType();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_MediaKeyRequestType catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_MediaKeyRequestDefaultUrl
     * @tc.number SUB_DRM_MediaKeyRequestDefaultUrl
     * @tc.desc   test DRM_MediaKeyRequestDefaultUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRM_MediaKeyRequestDefaultUrl', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.mediaKeyRequestDefaultUrl();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_MediaKeyRequestDefaultUrl catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_CertificateStatusTest1
     * @tc.number SUB_DRM_CertificateStatusTest1
     * @tc.desc   test DRM_CertificateStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRM_CertificateStatusTest1', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.drmCertificateStatusTest1();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_CertificateStatusTest1 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_CertificateStatusTest2
     * @tc.number SUB_DRM_CertificateStatusTest2
     * @tc.desc   test DRM_CertificateStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DRM_CertificateStatusTest2', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.drmCertificateStatusTest2();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_CertificateStatusTest2 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_CertificateStatusTest3
     * @tc.number SUB_DRM_CertificateStatusTest3
     * @tc.desc   test DRM_CertificateStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRM_CertificateStatusTest3', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.drmCertificateStatusTest3();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_CertificateStatusTest3 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN
     * @tc.number SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN
     * @tc.desc   test DRMMediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL
     * @tc.number SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL
     * @tc.desc   test DRMMediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_INITIAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL
     * @tc.number SUB_DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL
     * @tc.desc   test DRM_MediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_RENEWAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE
     * @tc.number SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE
     * @tc.desc   test DRMMediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_RELEASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE
     * @tc.number SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE
     * @tc.desc   test DRMMediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE
     * @tc.number SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE
     * @tc.desc   test DRMMediaKeyRequestType MEDIA_KEY_REQUEST_TYPE_UPDATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE
     * @tc.number SUB_DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE
     * @tc.desc   test DRMOfflineMediaKeyStatus OFFLINE_MEDIA_KEY_STATUS_INACTIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMKeysInfo_EvenType
     * @tc.number SUB_DRMKeysInfo_EvenType
     * @tc.desc   test DRMKeysInfo_EvenType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMKeysInfo_EvenType', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMKeysInfo_EvenType();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMKeysInfo_EvenType catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_EvenType_EVENT_DRM_BASE
     * @tc.number SUB_EvenType_EVENT_DRM_BASE
     * @tc.desc   test EvenType EVENT_DRM_BASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_EvenType_EVENT_DRM_BASE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.evenType_EVENT_DRM_BASE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_EvenType_EVENT_DRM_BASE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_evenType_EVENT_PROVISION_REQUIRED
     * @tc.number SUB_evenType_EVENT_PROVISION_REQUIRED
     * @tc.desc   test EvenType EVENT_PROVISION_REQUIRED EVENT_DRM_BASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_evenType_EVENT_PROVISION_REQUIRED', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.evenType_EVENT_PROVISION_REQUIRED();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_evenType_EVENT_PROVISION_REQUIRED catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_EvenType_EVENT_VENDOR_DEFINED
     * @tc.number SUB_EvenType_EVENT_VENDOR_DEFINED
     * @tc.desc   test EvenType EVENT_VENDOR_DEFINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_EvenType_EVENT_VENDOR_DEFINED', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.evenType_EVENT_VENDOR_DEFINED();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_EvenType_EVENT_VENDOR_DEFINED catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_EvenType_EVENT_EXPIRATION_UPDATE
     * @tc.number SUB_EvenType_EVENT_EXPIRATION_UPDATE
     * @tc.desc   test EvenType EVENT_EXPIRATION_UPDATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_EvenType_EVENT_EXPIRATION_UPDATE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.evenType_EVENT_EXPIRATION_UPDATE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_EvenType_EVENT_EXPIRATION_UPDATE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMKeysInfo_keyId
     * @tc.number SUB_DRMKeysInfo_keyId
     * @tc.desc   test DRMKeysInfo keyId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMKeysInfo_keyId', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMKeysInfo_keyId();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMKeysInfo_keyId catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMKeysInfo_keysInfoCount
     * @tc.number SUB_DRMKeysInfo_keysInfoCount
     * @tc.desc   test DRMKeysInfo_keysInfo Count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMKeysInfo_keysInfoCount', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMKeysInfo_keysInfoCount();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMKeysInfo_keysInfoCount catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_DRMKeysInfo_statusValue
     * @tc.number SUB_DRMKeysInfo_statusValue
     * @tc.desc   test DRMKeysInfo statusValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DRMKeysInfo_statusValue', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.DRMKeysInfo_statusValue();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_DRMKeysInfo_statusValue catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN
     * @tc.number SUB_OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN
     * @tc.desc   test OHMediaKeySystem_Destroy DRM_ERR_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN catch err: " + err);
        expect(false).assertEqual(0);
      }
    });
  })
}
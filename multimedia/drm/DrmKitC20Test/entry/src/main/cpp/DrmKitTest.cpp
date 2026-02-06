/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "DrmKitTest.h"
#include <multimedia/drm_framework/native_mediakeysession.h>
#include <multimedia/drm_framework/native_drm_err.h>
#include <multimedia/drm_framework/native_mediakeysystem.h>
#define LICENSE_ONLINE 1
#define LICENSE_OFFLINE 0
#define DATA_BUFF_LEN 10000
#define CLEAR_PLAY "com.clearplay.drm"
#define WISE_PLAY "com.wiseplay.drm"

void addDrmKitOneTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"mediaKeySession_GenerateMediaKeyRequestInvalue", nullptr,
        OH_MediaKeySession_GenerateMediaKeyRequestInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_ProcessMediaKeyResponseInvalue", nullptr,
        OH_MediaKeySession_ProcessMediaKeyResponseInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_ClearMediaKeysInvalue", nullptr, OH_MediaKeySession_ClearMediaKeysInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addDrmKitTwoTest(std::vector<napi_property_descriptor>& descData)
{
    addDrmKitOneTest(descData);
    descData.push_back({"mediaKeySession_GenerateOfflineReleaseRequestInvalue", nullptr,
        OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_ProcessOfflineReleaseResponseInvalue", nullptr,
        OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_RestoreOfflineMediaKeysInvalue", nullptr,
        OH_MediaKeySession_RestoreOfflineMediaKeysInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_GetContentProtectionLevelInvalue", nullptr,
        OH_MediaKeySession_GetContentProtectionLevelInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_RequireSecureDecoderModuleInvalue", nullptr,
        OH_MediaKeySession_RequireSecureDecoderModuleInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_DestroyInvalue", nullptr, OH_MediaKeySession_DestroyInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetMediaKeySystemsInvalue", nullptr,
        OH_MediaKeySystem_GetMediaKeySystemsInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_CreateInvalue", nullptr, OH_MediaKeySystem_CreateInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_SetConfigurationStringInvalue", nullptr,
        OH_MediaKeySystem_SetConfigurationStringInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetConfigurationStringInvalue", nullptr,
        OH_MediaKeySystem_GetConfigurationStringInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_SetConfigurationByteArrayInvalue", nullptr,
        OH_MediaKeySystem_SetConfigurationByteArrayInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetConfigurationByteArrayInvalue", nullptr,
        OH_MediaKeySystem_GetConfigurationByteArrayInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetStatisticsInvalue", nullptr, OH_MediaKeySystem_GetStatisticsInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_CreateMediaKeySessionInvalue", nullptr,
        OH_MediaKeySystem_CreateMediaKeySessionInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GenerateKeySystemRequestInvalue", nullptr,
        OH_MediaKeySystem_GenerateKeySystemRequestInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_ProcessKeySystemResponseInvalue", nullptr,
        OH_MediaKeySystem_ProcessKeySystemResponseInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetOfflineMediaKeyIdsInvalue", nullptr,
        OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetOfflineMediaKeyStatusInvalue", nullptr,
        OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_ClearOfflineMediaKeysInvalue", nullptr,
        OH_MediaKeySystem_ClearOfflineMediaKeysInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetCertificateStatusInvalue", nullptr,
        OH_MediaKeySystem_GetCertificateStatusInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_DestroyInvalue", nullptr, OH_MediaKeySystem_DestroyInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySession_CheckMediaKeyStatusInvalue", nullptr,
        OH_MediaKeySession_CheckMediaKeyStatusInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeySystem_GetMaxContentProtectionLevelInvalue", nullptr,
        OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addDrmKitTest(std::vector<napi_property_descriptor>& descData)
{
    addDrmKitTwoTest(descData);
    descData.push_back({"mediaKeyRequestType", nullptr, DRM_MediaKeyRequestTypeValue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"mediaKeyRequestDefaultUrl", nullptr, DRM_MediaKeyRequestDefaultUrl,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"drmCertificateStatusTest1", nullptr, DRM_CertificateStatusTest1,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"drmCertificateStatusTest2", nullptr, DRM_CertificateStatusTest2,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"drmCertificateStatusTest3", nullptr, DRM_CertificateStatusTest3,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMMediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE", nullptr,
        DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMOfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE", nullptr,
        DRM_OfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMKeysInfo_EvenType", nullptr, DRM_KeysInfo_EvenType,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"evenType_EVENT_DRM_BASE", nullptr, EvenType_EVENT_DRM_BASE,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"evenType_EVENT_PROVISION_REQUIRED", nullptr, EvenType_EVENT_PROVISION_REQUIRED,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"evenType_EVENT_VENDOR_DEFINED", nullptr, EvenType_EVENT_VENDOR_DEFINED,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"evenType_EVENT_EXPIRATION_UPDATE", nullptr, EvenType_EVENT_EXPIRATION_UPDATE,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMKeysInfo_keyId", nullptr, DRM_KeysInfo_keyId,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMKeysInfo_keysInfoCount", nullptr, DRM_KeysInfo_keysInfoCount,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DRMKeysInfo_statusValue", nullptr, DRM_KeysInfo_statusValue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DrmErrCode_DRM_ERR_UNKNOWN", nullptr, Drm_ErrCode_DRM_ERR_UNKNOWN,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHMediaKeySystem_Destroy_DRM_ERR_UNKNOWN", nullptr, OH_MediaKeySystem_Destroy_DRM_ERR_UNKNOWN,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}


napi_value OH_MediaKeySession_GenerateMediaKeyRequestInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySession_ProcessMediaKeyResponseInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_ProcessMediaKeyResponse(nullptr, nullptr, 0, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySession_CheckMediaKeyStatusInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_CheckMediaKeyStatus(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySession_ClearMediaKeysInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_ClearMediaKeys(nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_ClearMediaKeys(nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_ProcessOfflineReleaseResponse(nullptr, nullptr, 0, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySession_RestoreOfflineMediaKeysInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_RestoreOfflineMediaKeys(nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySession_GetContentProtectionLevelInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_GetContentProtectionLevel(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySession_RequireSecureDecoderModuleInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_RequireSecureDecoderModule(nullptr, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySession_DestroyInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySession_Destroy(nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetMediaKeySystemsInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetMediaKeySystems(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_CreateInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_Create(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_SetConfigurationStringInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_SetConfigurationString(nullptr, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetConfigurationStringInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetConfigurationString(nullptr, nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_SetConfigurationByteArrayInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_SetConfigurationByteArray(nullptr, nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetConfigurationByteArrayInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetConfigurationByteArray(nullptr, nullptr, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetStatisticsInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetStatistics(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetMaxContentProtectionLevel(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}

napi_value OH_MediaKeySystem_CreateMediaKeySessionInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_CreateMediaKeySession(nullptr, nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GenerateKeySystemRequestInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GenerateKeySystemRequest(nullptr, nullptr, nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_ProcessKeySystemResponseInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_ProcessKeySystemResponse(nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetOfflineMediaKeyIds(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetOfflineMediaKeyStatus(nullptr, nullptr, 0, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_ClearOfflineMediaKeysInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_ClearOfflineMediaKeys(nullptr, nullptr, 0);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_GetCertificateStatusInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_GetCertificateStatus(nullptr, nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value OH_MediaKeySystem_DestroyInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = 0;
    Drm_ErrCode errCode = OH_MediaKeySystem_Destroy(nullptr);
    napi_create_int32(env, errCode == DRM_ERR_INVALID_VAL, &result);
    return result;
}
napi_value DRM_MediaKeyRequestTypeValue(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_UNKNOWN, &result);
    return result;
}
napi_value DRM_MediaKeyRequestDefaultUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.defaultUrl != nullptr, &result);
    return result;
}
napi_value DRM_CertificateStatusTest1(napi_env env, napi_callback_info info)
{
    napi_value result;

    DRM_CertificateStatus status = CERT_STATUS_NOT_PROVISIONED;
    OH_MediaKeySystem_GetCertificateStatus(nullptr, &status);
    napi_create_int32(env, status == CERT_STATUS_NOT_PROVISIONED, &result);
    return result;
}
napi_value DRM_CertificateStatusTest2(napi_env env, napi_callback_info info)
{
    napi_value result;

    DRM_CertificateStatus status = CERT_STATUS_EXPIRED;
    OH_MediaKeySystem_GetCertificateStatus(nullptr, &status);
    napi_create_int32(env, status == CERT_STATUS_EXPIRED, &result);
    return result;
}
napi_value DRM_CertificateStatusTest3(napi_env env, napi_callback_info info)
{
    napi_value result;

    DRM_CertificateStatus status = CERT_STATUS_INVALID;
    OH_MediaKeySystem_GetCertificateStatus(nullptr, &status);
    napi_create_int32(env, status == CERT_STATUS_INVALID, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_UNKNOWN, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    requestData.type = MEDIA_KEY_REQUEST_TYPE_INITIAL;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_INITIAL, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    requestData.type = MEDIA_KEY_REQUEST_TYPE_RENEWAL;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_RENEWAL, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    requestData.type = MEDIA_KEY_REQUEST_TYPE_RELEASE;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_RELEASE, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    requestData.type = MEDIA_KEY_REQUEST_TYPE_NONE;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_NONE, &result);
    return result;
}

napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE(napi_env env, napi_callback_info info)
{
    napi_value result;
    DRM_MediaKeyRequest requestData;
    requestData.type = MEDIA_KEY_REQUEST_TYPE_UPDATE;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(nullptr, nullptr, &requestData);
    napi_create_int32(env, requestData.type == MEDIA_KEY_REQUEST_TYPE_UPDATE, &result);
    return result;
}

static const char *JudgeUuid(void)
{
    bool isSupport = OH_MediaKeySystem_IsSupported(CLEAR_PLAY);
    if (isSupport == 1) {
        return CLEAR_PLAY;
    } else {
        return WISE_PLAY;
    }
}
napi_value DRM_OfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE(napi_env env, napi_callback_info info)
{
    MediaKeySystem *system_ptr = nullptr;
    uint8_t *keyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(JudgeUuid(), &system_ptr);
    int32_t offlineMediaKeyIdLen = 0;
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySession *drmKeySession = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_CreateMediaKeySession(system_ptr, &level, &drmKeySession);
    Drm_ErrCode ret4 = OH_MediaKeySystem_ClearOfflineMediaKeys(system_ptr, keyId_ptr, offlineMediaKeyIdLen);
    DRM_OfflineMediaKeyStatus status = OFFLINE_MEDIA_KEY_STATUS_USABLE;
    if (ret3 == DRM_ERR_OK) {
        Drm_ErrCode ret6 = OH_MediaKeySystem_GetOfflineMediaKeyStatus(system_ptr, keyId_ptr,
            offlineMediaKeyIdLen, &status);
        if (ret6 == DRM_ERR_OK) {
            ret3 = (status != OFFLINE_MEDIA_KEY_STATUS_USABLE) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    }
    napi_value result;
    napi_create_int32(env, status == OFFLINE_MEDIA_KEY_STATUS_USABLE, &result);
    return result;
}

uint8_t Flag_SetSesEventCallback2 = 0;
uint8_t Flag_SetSesChangeCallback2 = 0;

Drm_ErrCode sessoinKeyChangeCallBackTest2(MediaKeySession *mediaKeySessoin, DRM_KeysInfo *keysInfo, bool hasNewGoodKeys)
{
    keysInfo->keysInfoCount = MAX_KEY_INFO_COUNT * MAX_KEY_ID_LEN;
    for (int i = 0; i < MAX_KEY_INFO_COUNT; i++) {
        for (int j = 0; j < MAX_KEY_ID_LEN; j++) {
            keysInfo->keyId[i][j] = 0;
        }
    }
    for (int i = 0; i < MAX_KEY_INFO_COUNT; i++) {
        for (int j = 0; j < MAX_KEY_STATUS_VALUE_LEN; j++) {
            keysInfo->statusValue[i][j] = '\0';
        }
    }
    Flag_SetSesChangeCallback2 = 1;
    return DRM_ERR_OK;
}

Drm_ErrCode sessoinEventEvenType(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    if (eventType == EVENT_KEY_REQUIRED) {
        return DRM_ERR_OK;
    }
    if (eventType == EVENT_KEY_EXPIRED) {
        return DRM_ERR_OK;
    }
    if (eventType == EVENT_DRM_BASE) {
        return DRM_ERR_OK;
    }
    if (eventType == EVENT_PROVISION_REQUIRED) {
        return DRM_ERR_OK;
    }
    return DRM_ERR_UNKNOWN;
}

Drm_ErrCode evenTypeEVENT_DRM_BASE(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    eventType = EVENT_DRM_BASE;
    DRM_EventType eventType2 = EVENT_DRM_BASE;
    return DRM_ERR_OK;
}

Drm_ErrCode evenTypeEVENT_PROVISION_REQUIRED(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    eventType = EVENT_PROVISION_REQUIRED;
    DRM_EventType eventType2 = EVENT_PROVISION_REQUIRED;
    return DRM_ERR_OK;
}

Drm_ErrCode evenTypeEVENT_VENDOR_DEFINED(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    eventType = EVENT_VENDOR_DEFINED;
    DRM_EventType eventType2 = EVENT_VENDOR_DEFINED;
    return DRM_ERR_OK;
}

Drm_ErrCode evenTypeEVENT_EXPIRATION_UPDATE(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    eventType = EVENT_EXPIRATION_UPDATE;
    DRM_EventType eventType2 = EVENT_EXPIRATION_UPDATE;
    return DRM_ERR_OK;
}

Drm_ErrCode sessoinEventCallBackTest2(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
    int32_t infoLen, char *extra)
{
    DRM_KeysInfo *keysInfo = new DRM_KeysInfo;
    sessoinKeyChangeCallBackTest2(mediaKeySessoin, keysInfo, true);
    return DRM_ERR_OK;
}


#define DATA_REQUESTINFO_LEN 139
#define ERROR_DATA_REQUESTINFO_LEN 139
#define REQUESTINFODATA                                                                                                \
    {                                                                                                                  \
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35, 0x9B, 0x9A,    \
            0x41, 0xE8, 0xB8, 0x43, 0xDD, 0x3C, 0x6E, 0x72, 0xC4, 0x2C, 0x00, 0x00, 0x00, 0x6B, 0x7B, 0x22, 0x76,      \
            0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x22, 0x3A, 0x22, 0x56, 0x31, 0x2E, 0x30, 0x22, 0x2C, 0x22, 0x63,      \
            0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x49, 0x44, 0x22, 0x3A, 0x22, 0x64, 0x48, 0x4D, 0x74, 0x4D, 0x6A,      \
            0x59, 0x30, 0x4C, 0x54, 0x45, 0x77, 0x4F, 0x44, 0x41, 0x74, 0x59, 0x57, 0x56, 0x7A, 0x22, 0x2C, 0x22,      \
            0x6B, 0x69, 0x64, 0x73, 0x22, 0x3A, 0x5B, 0x22, 0x47, 0x2B, 0x45, 0x6B, 0x2F, 0x2B, 0x58, 0x6D, 0x55,      \
            0x6B, 0x70, 0x42, 0x48, 0x51, 0x67, 0x58, 0x59, 0x57, 0x51, 0x51, 0x49, 0x67, 0x3D, 0x3D, 0x22, 0x5D,      \
            0x2C, 0x22, 0x65, 0x6E, 0x73, 0x63, 0x68, 0x65, 0x6D, 0x61, 0x22, 0x3A, 0x22, 0x63, 0x62, 0x63, 0x31,      \
            0x22, 0x7D                                                                                                 \
    }

napi_value DRM_KeysInfo_EvenType(napi_env env, napi_callback_info info)
{
    napi_value result;

    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &sessoinEventEvenType;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_ContentProtectionLevel level;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);
    DRM_MediaKeyStatus mediaKeyStatus;
    OH_MediaKeySession_CheckMediaKeyStatus(session_ptr, &mediaKeyStatus);
    OH_MediaKeySession_ClearMediaKeys(session_ptr);
    uint8_t offlineMediaKeyId[10];
    uint8_t releaseRequest[10];
    int32_t releaseRequestLen = 10;
    OH_MediaKeySession_GenerateOfflineReleaseRequest(session_ptr, offlineMediaKeyId, releaseRequestLen,
        releaseRequest, &releaseRequestLen);
    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value EvenType_EVENT_DRM_BASE(napi_env env, napi_callback_info info)
{
    napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);
    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &evenTypeEVENT_DRM_BASE;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);

    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value EvenType_EVENT_PROVISION_REQUIRED(napi_env env, napi_callback_info info)
{
        napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &evenTypeEVENT_PROVISION_REQUIRED;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);

    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value EvenType_EVENT_VENDOR_DEFINED(napi_env env, napi_callback_info info)
{
        napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &evenTypeEVENT_VENDOR_DEFINED;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);

    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value EvenType_EVENT_EXPIRATION_UPDATE(napi_env env, napi_callback_info info)
{
        napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &evenTypeEVENT_EXPIRATION_UPDATE;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);

    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value DRM_KeysInfo_keyId(napi_env env, napi_callback_info info)
{
    napi_value result;

    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &sessoinEventCallBackTest2;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_ContentProtectionLevel level;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);
    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value DRM_KeysInfo_keysInfoCount(napi_env env, napi_callback_info info)
{
    napi_value result;

    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &sessoinEventCallBackTest2;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_ContentProtectionLevel level;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);
    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value DRM_KeysInfo_statusValue(napi_env env, napi_callback_info info)
{
    napi_value result;

    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);

    OH_MediaKeySession_Callback testCallback;
    testCallback.eventCallback = &sessoinEventCallBackTest2;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest2;
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, &testCallback);

    DRM_MediaKeyRequestInfo requestInfo;
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_ContentProtectionLevel level;
    DRM_MediaKeyRequest requestData;
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, &requestInfo, &requestData);
    napi_create_int32(env, ret6 == DRM_ERR_OK, &result);
    return result;
}

napi_value Drm_ErrCode_DRM_ERR_UNKNOWN(napi_env env, napi_callback_info info)
{
    napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);
    DRM_MediaKeyStatus mediaKeyStatus;
    ret5 = OH_MediaKeySession_CheckMediaKeyStatus(session_ptr, &mediaKeyStatus);
    napi_create_int32(env, ret5 == DRM_ERR_UNKNOWN, &result);
    return result;
}

napi_value OH_MediaKeySystem_Destroy_DRM_ERR_UNKNOWN(napi_env env, napi_callback_info info)
{
    napi_value result;
    MediaKeySession *session_ptr = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(JudgeUuid(), &drmKeySystem);
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &session_ptr);
    DRM_MediaKeyStatus mediaKeyStatus;
    ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    napi_create_int32(env, ret5 == DRM_ERR_UNKNOWN, &result);
    return result;
}
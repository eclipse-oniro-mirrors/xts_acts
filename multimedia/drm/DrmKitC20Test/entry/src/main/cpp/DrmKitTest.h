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

#ifndef DRM_KIT_TEST_H
#define DRM_KIT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

#include <vector>
void addDrmKitTest(std::vector<napi_property_descriptor>& descData);
napi_value OH_MediaKeySession_GenerateMediaKeyRequestInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_ProcessMediaKeyResponseInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_CheckMediaKeyStatusInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_ClearMediaKeysInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_GenerateOfflineReleaseRequestInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_ProcessOfflineReleaseResponseInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_RestoreOfflineMediaKeysInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_GetContentProtectionLevelInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_RequireSecureDecoderModuleInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySession_DestroyInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetMediaKeySystemsInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_CreateInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_SetConfigurationStringInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetConfigurationStringInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_SetConfigurationByteArrayInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetConfigurationByteArrayInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetStatisticsInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetMaxContentProtectionLevelInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_CreateMediaKeySessionInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GenerateKeySystemRequestInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_ProcessKeySystemResponseInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetOfflineMediaKeyIdsInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetOfflineMediaKeyStatusInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_ClearOfflineMediaKeysInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_GetCertificateStatusInvalue(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_DestroyInvalue(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeValue(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestDefaultUrl(napi_env env, napi_callback_info info);
napi_value DRM_CertificateStatusTest1(napi_env env, napi_callback_info info);
napi_value DRM_CertificateStatusTest2(napi_env env, napi_callback_info info);
napi_value DRM_CertificateStatusTest3(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UNKNOWN(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_INITIAL(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RENEWAL(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_RELEASE(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_NONE(napi_env env, napi_callback_info info);
napi_value DRM_MediaKeyRequestTypeMEDIA_KEY_REQUEST_TYPE_UPDATE(napi_env env, napi_callback_info info);
napi_value DRM_OfflineMediaKeyStatusOFFLINE_MEDIA_KEY_STATUS_INACTIVE(napi_env env, napi_callback_info info);
napi_value DRM_KeysInfo_EvenType(napi_env env, napi_callback_info info);
napi_value EvenType_EVENT_DRM_BASE(napi_env env, napi_callback_info info);
napi_value EvenType_EVENT_PROVISION_REQUIRED(napi_env env, napi_callback_info info);
napi_value EvenType_EVENT_VENDOR_DEFINED(napi_env env, napi_callback_info info);
napi_value EvenType_EVENT_EXPIRATION_UPDATE(napi_env env, napi_callback_info info);
napi_value DRM_KeysInfo_keyId(napi_env env, napi_callback_info info);
napi_value DRM_KeysInfo_keysInfoCount(napi_env env, napi_callback_info info);
napi_value DRM_KeysInfo_statusValue(napi_env env, napi_callback_info info);
napi_value Drm_ErrCode_DRM_ERR_UNKNOWN(napi_env env, napi_callback_info info);
napi_value OH_MediaKeySystem_Destroy_DRM_ERR_UNKNOWN(napi_env env, napi_callback_info info);

#endif //DRM_KIT_TEST_H

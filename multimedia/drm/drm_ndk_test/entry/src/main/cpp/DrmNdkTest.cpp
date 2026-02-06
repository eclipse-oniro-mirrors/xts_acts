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
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include "multimedia/drm_framework/native_drm_common.h"
#include "multimedia/drm_framework/native_drm_err.h"
#include "multimedia/drm_framework/native_mediakeysystem.h"
#include "multimedia/drm_framework/native_mediakeysession.h"
#include <ctime>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <netdb.h>

// hilog必加的宏，不加无法打印
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_DRM"  // 全局tag宏，标识模块日志tag
// https请求宏定义
#define CURLEASYGETINFO 200
// drm module 宏定义
#define OPTIONS_NUM 3
#define DATA_BUFF_LEN 10000
#define DATA_BLUESPONSE_LEN 50
#define DATA_REQUESTINFO_LEN 139
#define ERROR_DATA_REQUESTINFO_LEN 139
#define PROVISION_DEFAULT_URL "http://default.com"
#define CLEAR_PLAY "com.clearplay.drm"
#define WISE_PLAY "com.wiseplay.drm"
#define LICENSE_ONLINE 1
#define LICENSE_OFFLINE 0
#define HTTP_TIMEOUT 10
#define URL_LICENSE "http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense"
#define DRM_PLUGIN_COUNT 8
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
#define ERRORREQUESTINFODATA                                                                                           \
    {                                                                                                                  \
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35, 0x9B, 0x9A,    \
            0x41, 0xE8, 0xB8, 0x43, 0xDD                                                                               \
    }
#define OFFLINERESPONSE                                                                                                \
    {                                                                                                                  \
        0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D,    \
            0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61,      \
            0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D                   \
    }
#define ONLINERESPONSE                                                                                                 \
    {                                                                                                                  \
        0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D,    \
            0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61,      \
            0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D                   \
    }

#define CHECK_RETURN(cond, ret)                                                                                        \
    do {                                                                                                               \
        if ((cond)) {                                                                                                  \
            OH_LOG_ERROR(LOG_APP, "testCL_failed ,ret = %{public}d", ret);                                             \
            return ret;                                                                                                \
        }                                                                                                              \
    } while (0)
#define CHECK_GOTO(expressions, label)                                                                                 \
    do {                                                                                                               \
        if (expressions) {                                                                                             \
            OH_LOG_ERROR(LOG_APP, "testCL_goto");                                                                      \
            goto label;                                                                                                \
        }                                                                                                              \
    } while (0)
#define CHECK_PRINTF(cond, ret)                                                                                        \
    do {                                                                                                               \
        if (cond) {                                                                                                    \
            OH_LOG_ERROR(LOG_APP, "testCL_check failed ,ret = %{public}d", ret);                                       \
        }                                                                                                              \
    } while (0)

void splitStringToIntArray(char *str, uint8_t *temp) {
    int i = 0;
    char *p = str;
    char *q;
    while ((q = strchr(p, ',')) != NULL) {
        temp[i++] = atoi(p);
        p = q + 1;
    }
    temp[i] = atoi(p);
}
static const char *judge_uuid(void) {
    bool isSupport = OH_MediaKeySystem_IsSupported(CLEAR_PLAY);
    if (isSupport == 1) {
        return CLEAR_PLAY;
    } else {
        return WISE_PLAY;
    }
}

int getHttp(const std::string &url, unsigned char *request, uint32_t requestLen, unsigned char *response,
            int32_t *responseLen, uint32_t timeout) {
    int ret = -1;
    struct addrinfo hints, *res, *p;
    int sockfd;
    struct sockaddr_in server_addr;
    char host[1024], port[10];
    std::string path;

    // Parse URL
    std::string::size_type pos1 = url.find("://");
    std::string::size_type pos2 = url.find('/', pos1 + 3);

    if (pos1 == std::string::npos) {
        pos1 = 0;
    } else {
        pos1 += 3;
    }

    std::string::size_type pos3 = url.find(':', pos1);
    if (pos3 != std::string::npos && pos3 < pos2) {
        strncpy(host, url.substr(pos1, pos3 - pos1).c_str(), sizeof(host));
        strncpy(port, url.substr(pos3 + 1, pos2 - pos3 - 1).c_str(), sizeof(port));
    } else {
        strncpy(host, url.substr(pos1, pos2 - pos1).c_str(), sizeof(host));
        strncpy(port, "80", sizeof(port)); // default HTTP port
    }

    if (pos2 == std::string::npos) {
        path = "/";
    } else {
        path = url.substr(pos2);
    }

    // Prepare HTTP request
    std::string requestStr = "POST " + path +
                             " HTTP/1.1\r\n"
                             "Host: " +
                             host +
                             "\r\n"
                             "Content-Type: application/json\r\n"
                             "Content-Length: " +
                             std::to_string(requestLen) +
                             "\r\n"
                             "Connection: close\r\n\r\n";
    std::string requestData(reinterpret_cast<char *>(request), requestLen);
    requestStr += requestData;

    // Set up hints for getaddrinfo
    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    // Get address info
    if (getaddrinfo(host, port, &hints, &res) != 0) {
        std::cerr << "getaddrinfo failed" << std::endl;
        return -1;
    }

    // Create socket
    for (p = res; p != nullptr; p = p->ai_next) {
        sockfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol);
        if (sockfd == -1) {
            continue;
        }
        if (connect(sockfd, p->ai_addr, p->ai_addrlen) != -1) {
            break;
        }
        close(sockfd);
    }

    if (p == nullptr) {
        std::cerr << "failed to connect" << std::endl;
        freeaddrinfo(res);
        return -1;
    }

    freeaddrinfo(res);

    // Send HTTP request
    if (send(sockfd, requestStr.c_str(), requestStr.length(), 0) == -1) {
        std::cerr << "send failed" << std::endl;
        close(sockfd);
        return -1;
    }

    // Receive HTTP response
    std::string responseStr;
    char buffer[4096];
    ssize_t bytesReceived;
    while ((bytesReceived = recv(sockfd, buffer, sizeof(buffer) - 1, 0)) > 0) {
        buffer[bytesReceived] = '\0';
        responseStr += buffer;
    }

    if (bytesReceived == -1) {
        std::cerr << "recv failed" << std::endl;
        close(sockfd);
        return -1;
    }

    close(sockfd);

    // Parse response
    std::string::size_type bodyStart = responseStr.find("\r\n\r\n");
    if (bodyStart == std::string::npos) {
        std::cerr << "Invalid response format" << std::endl;
        return -1;
    }

    std::string responseBody = responseStr.substr(bodyStart + 4);
    *responseLen = responseBody.size();
    memcpy(response, responseBody.c_str(), *responseLen);

    return 0;
}

static int getCertificate(MediaKeySystem *drmKeySystem) {
    uint8_t requestData[DATA_BUFF_LEN] = {0};
    int32_t requestLen = DATA_BUFF_LEN;
    char defaultURLData[DATA_BUFF_LEN] = {0};
    int32_t defaultURLDataLen = DATA_BUFF_LEN;
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseDataLen_out = DATA_BUFF_LEN;
    Drm_ErrCode ret2 = OH_MediaKeySystem_GenerateKeySystemRequest(drmKeySystem, requestData, &requestLen,
                                                                  defaultURLData, defaultURLDataLen);
    CHECK_RETURN((ret2 != DRM_ERR_OK), -2);
    if (strcmp(judge_uuid(), CLEAR_PLAY) != 0) {
        int getRet = getHttp(defaultURLData, requestData, (uint32_t)requestLen, responseData, &responseDataLen_out,
                             HTTP_TIMEOUT); // 设备证书申请
        CHECK_RETURN((getRet != 0), getRet);
    } else {
        memset(responseData, 0x55, DATA_BLUESPONSE_LEN);
        responseDataLen_out = DATA_BLUESPONSE_LEN;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_ProcessKeySystemResponse(drmKeySystem, responseData, responseDataLen_out);
    CHECK_RETURN((ret3 != DRM_ERR_OK), -3);
    return 0;
}
static int getLicense(MediaKeySession *mediaKeySession, char isOnline, uint8_t *keydata, int32_t *keylen) {
    DRM_MediaKeyRequestInfo requestInfo;
    memset(&requestInfo, 0, sizeof(DRM_MediaKeyRequestInfo));
    if (isOnline) {
        requestInfo.type = MEDIA_KEY_TYPE_ONLINE;
    } else {
        requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    }
    unsigned char passhData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    memcpy(requestInfo.initData, passhData, DATA_REQUESTINFO_LEN);
    requestInfo.initDataLen = DATA_REQUESTINFO_LEN;

    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    memset(&requestData, 0, sizeof(DRM_MediaKeyRequest));
    Drm_ErrCode ret1 = OH_MediaKeySession_GenerateMediaKeyRequest(mediaKeySession, &requestInfo, &requestData);
    CHECK_RETURN((ret1 != DRM_ERR_OK), -1);

    uint8_t keyId[DATA_BUFF_LEN] = {0};
    int32_t keyIdLen = DATA_BUFF_LEN;
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseLen = DATA_BUFF_LEN;
    if (strcmp(judge_uuid(), CLEAR_PLAY) == 0) {
        if (isOnline) {
            uint8_t blue_onData[DATA_BLUESPONSE_LEN] = ONLINERESPONSE;
            memcpy(responseData, blue_onData, sizeof(blue_onData));
        } else {
            uint8_t blue_offData[DATA_BLUESPONSE_LEN] = OFFLINERESPONSE;
            memcpy(responseData, blue_offData, sizeof(blue_offData));
        }
        responseLen = DATA_BLUESPONSE_LEN;
    } else {
        int ret3 = getHttp(URL_LICENSE, requestData.data, (uint32_t)requestData.dataLen, responseData, &responseLen,
                           HTTP_TIMEOUT);
        CHECK_RETURN(ret3 != 0, ret3);
    }
    Drm_ErrCode ret2 =
        OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession, responseData, responseLen, keyId, &keyIdLen);
    CHECK_RETURN((ret2 != DRM_ERR_OK), -2);
    memcpy(keydata, keyId, keyIdLen);
    memcpy(keylen, &keyIdLen, sizeof(int32_t));
    return 0;
}
static void getOnLicResponseData(MediaKeySession *mediaKeySession, uint8_t *response, int32_t *responselen) {
    DRM_MediaKeyRequestInfo requestInfo;
    memset(&requestInfo, 0, sizeof(DRM_MediaKeyRequestInfo));
    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_ONLINE;
    requestInfo.initDataLen = sizeof(testData);
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    memset(&requestData, 0, sizeof(DRM_MediaKeyRequest));
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(mediaKeySession, &requestInfo, &requestData);
    CHECK_PRINTF((ret6 != DRM_ERR_OK), ret6);
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseLenOut = DATA_BUFF_LEN;
    int ret3 = getHttp(URL_LICENSE, requestData.data, (uint32_t)requestData.dataLen, responseData, &responseLenOut,
                       HTTP_TIMEOUT);
    CHECK_PRINTF((ret3 != 0), ret3);
    memcpy(response, responseData, responseLenOut);
    memcpy(responselen, &responseLenOut, sizeof(int32_t));
    return;
}
static napi_value GetOfflineMediaKeyIds(napi_env env, napi_callback_info info) {
    napi_value result;
    const char *backString = "GetOfflineMediaKeyIds failed";
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (ret1 != DRM_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "testCL_GetOfflineMediaKeyIds failed!");
        napi_create_string_utf8(env, backString, strlen(backString), &result);
        return result;
    }
    DRM_OfflineMediakeyIdArray mediaKeyIds;
    memset(&mediaKeyIds, 0x00, sizeof(DRM_OfflineMediakeyIdArray));
    Drm_ErrCode ret2 = OH_MediaKeySystem_GetOfflineMediaKeyIds(drmKeySystem, &mediaKeyIds);
    if ((ret2 == DRM_ERR_OK) && (mediaKeyIds.idsCount != 0)) {
        Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
        if (ret5 != DRM_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "testCL_GetOfflineMediaKeyIds failed!");
            napi_create_string_utf8(env, backString, strlen(backString), &result);
            return result;
        }
        napi_create_string_utf8(env, (const char *)&mediaKeyIds.ids[0][0], (size_t)mediaKeyIds.idsLen[0], &result);
        return result;
    } else {
        OH_LOG_DEBUG(LOG_APP, "testCL_generate offline key!");
        DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
        MediaKeySession *drmKeySession = nullptr;
        Drm_ErrCode ret3 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
        if (ret3 != DRM_ERR_OK) {
            OH_MediaKeySystem_Destroy(drmKeySystem);
            OH_LOG_ERROR(LOG_APP, "testCL_GetOfflineMediaKeyIds failed!");
            napi_create_string_utf8(env, backString, strlen(backString), &result);
            return result;
        }
        uint8_t keyData[DATA_BUFF_LEN] = {0};
        int32_t keyDataLen = DATA_BUFF_LEN;
        int licRet = getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen);
        Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
        Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
        if ((ret5 != DRM_ERR_OK) || (ret4 != DRM_ERR_OK) || (licRet != 0)) {
            OH_LOG_ERROR(LOG_APP, "testCL_GetOfflineMediaKeyIds failed!");
            napi_create_string_utf8(env, backString, strlen(backString), &result);
            return result;
        }
        napi_create_string_utf8(env, (const char *)keyData, (size_t)keyDataLen, &result);
        return result;
    }
}
static napi_value GetCertificateStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    ret = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (ret != DRM_ERR_OK) {
        napi_create_int32(env, DRM_ERR_INVALID_VAL, &result);
        return result;
    }
    DRM_CertificateStatus status = CERT_STATUS_UNAVAILABLE;
    ret = OH_MediaKeySystem_GetCertificateStatus(drmKeySystem, &status);
    if (ret != DRM_ERR_OK) {
        napi_create_int32(env, DRM_ERR_INVALID_VAL, &result);
        return result;
    }
    ret = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret != DRM_ERR_OK) {
        napi_create_int32(env, DRM_ERR_INVALID_VAL, &result);
        return result;
    }
    napi_create_int32(env, status, &result);
    return result;
}
static napi_value Test_KeySystemSupported(napi_env env, napi_callback_info info) {
    bool isSupport;
    napi_value res;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t uuidLen = 0;
    char *uuid = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uuidLen);
    uuid = new char[uuidLen + 1];
    napi_get_value_string_utf8(env, args[0], uuid, uuidLen + 1, &uuidLen);

    char *uuid_ptr = nullptr;
    if (strcmp(uuid, " ") != 0) {
        uuid_ptr = uuid;
    }
    isSupport = OH_MediaKeySystem_IsSupported(uuid_ptr);
    napi_create_int32(env, isSupport, &res);
    return res;
}
static napi_value Test_KeySystemSupported2(napi_env env, napi_callback_info info) {
    bool isSupport;
    napi_value res;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t uuidLen = 0;
    char *uuid = nullptr;
    size_t mineTypeLen = 0;
    char *mineType = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uuidLen);
    uuid = new char[uuidLen + 1];
    napi_get_value_string_utf8(env, args[0], uuid, uuidLen + 1, &uuidLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &mineTypeLen);
    mineType = new char[mineTypeLen + 1];
    napi_get_value_string_utf8(env, args[1], mineType, mineTypeLen + 1, &mineTypeLen);
    char *uuid_ptr = nullptr;
    if (strcmp(uuid, " ") != 0) {
        uuid_ptr = uuid;
    }
    char *mineType_ptr = nullptr;
    if (strcmp(mineType, " ") != 0) {
        mineType_ptr = mineType;
    }
    isSupport = OH_MediaKeySystem_IsSupported2(uuid_ptr, mineType_ptr);
    napi_create_int32(env, isSupport, &res);
    return res;
}
static napi_value Test_KeySystemSupported3(napi_env env, napi_callback_info info) {
    bool isSupport;
    napi_value res;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t uuidLen = 0;
    char *uuid = nullptr;
    size_t mineTypeLen = 0;
    char *mineType = nullptr;
    int32_t securityLevel;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uuidLen);
    uuid = new char[uuidLen + 1];
    napi_get_value_string_utf8(env, args[0], uuid, uuidLen + 1, &uuidLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &mineTypeLen);
    mineType = new char[mineTypeLen + 1];
    napi_get_value_string_utf8(env, args[1], mineType, mineTypeLen + 1, &mineTypeLen);

    napi_get_value_int32(env, args[2], &securityLevel);
    char *uuid_ptr = nullptr;
    if (strcmp(uuid, " ") != 0) {
        uuid_ptr = uuid;
    }
    char *mineType_ptr = nullptr;
    if (strcmp(mineType, " ") != 0) {
        mineType_ptr = mineType;
    }
    isSupport = OH_MediaKeySystem_IsSupported3(uuid_ptr, mineType_ptr, (DRM_ContentProtectionLevel)securityLevel);
    napi_create_int32(env, isSupport, &res);
    return res;
}
static napi_value Test_MediaKeySystem_Create(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t uuidLen = 0;
    char *uuid = nullptr;
    size_t inStringLen = 0;
    char *inString = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uuidLen);
    uuid = new char[uuidLen + 1];
    napi_get_value_string_utf8(env, args[0], uuid, uuidLen + 1, &uuidLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inStringLen);
    inString = new char[inStringLen + 1];
    napi_get_value_string_utf8(env, args[1], inString, inStringLen + 1, &inStringLen);
    const char *uuid_ptr = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = DRM_ERR_INVALID_VAL;
    if (strcmp(uuid, " ") != 0) {
        uuid_ptr = uuid;
    }
    if (strcmp(inString, " ") != 0) {
        ret1 = OH_MediaKeySystem_Create(uuid_ptr, &drmKeySystem);
    } else {
        ret1 = OH_MediaKeySystem_Create(uuid_ptr, nullptr);
    }
    if (ret1 == DRM_ERR_OK) {
        Drm_ErrCode ret2 = OH_MediaKeySystem_Destroy(drmKeySystem);
        ret = (ret2 == DRM_ERR_OK) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_SetConfigurationString(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t stringLen = 0;
    char *inString = nullptr;
    size_t valueLen = 0;
    char *inValue = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;
    size_t sysLen = 0;
    char *inSys = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &stringLen);
    inString = new char[stringLen + 1];
    napi_get_value_string_utf8(env, args[1], inString, stringLen + 1, &stringLen);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &valueLen);
    inValue = new char[valueLen + 1];
    napi_get_value_string_utf8(env, args[2], inValue, valueLen + 1, &valueLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    char *name_ptr = nullptr;
    if (strcmp(inString, " ")) {
        name_ptr = inString;
    }
    char *value_ptr = nullptr;
    if (strcmp(inValue, " ")) {
        value_ptr = inValue;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetConfigurationString(system_ptr, name_ptr, value_ptr);
    char outBuff[DATA_BUFF_LEN] = {0};
    int32_t outBuffLen = DATA_BUFF_LEN;

    if (ret2 == DRM_ERR_OK) {
        Drm_ErrCode ret4 = OH_MediaKeySystem_GetConfigurationString(drmKeySystem, inString, outBuff, outBuffLen);
        if ((ret2 == DRM_ERR_OK) && (strncmp(outBuff, inValue, outBuffLen) == 0)) {
            ret2 = DRM_ERR_OK;
        } else {
            ret2 = DRM_ERR_INVALID_VAL;
        }
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetConfigurationString(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t configNameLen = 0;
    char *configName = nullptr;
    size_t valueLen = 0;
    char *inValue = nullptr;
    int32_t outValueLen = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &configNameLen);
    configName = new char[configNameLen + 1];
    napi_get_value_string_utf8(env, args[1], configName, configNameLen + 1, &configNameLen);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &valueLen);
    inValue = new char[valueLen + 1];
    napi_get_value_string_utf8(env, args[2], inValue, valueLen + 1, &valueLen);
    napi_get_value_int32(env, args[3], &outValueLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);

    const char *set_val = "test";
    Drm_ErrCode ret2 = DRM_ERR_OK;
    if ((0 == strcmp(judge_uuid(), CLEAR_PLAY)) && (0 != strcmp(configName, " "))) {
        ret2 = OH_MediaKeySystem_SetConfigurationString(drmKeySystem, configName, set_val);
    }
    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    char *name_ptr = nullptr;
    if (0 != strcmp(configName, " ")) {
        name_ptr = configName;
    }
    char *outValue = nullptr;
    char outBuff[DATA_BUFF_LEN];
    if (0 != strncmp(inValue, " ", valueLen)) {
        outValue = outBuff;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_GetConfigurationString(system_ptr, name_ptr, outValue, outValueLen);

    if (ret3 == DRM_ERR_OK) {
        if (strcmp(judge_uuid(), CLEAR_PLAY) == 0) {
            ret3 = (strncmp(outValue, set_val, strlen(set_val)) == 0) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    }
    Drm_ErrCode ret4 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) { //
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_SetConfigurationByteArray(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    size_t stringLen = 0;
    char *inString = nullptr;
    size_t valueLen = 0;
    char *inValue = nullptr;
    size_t sysLen = 0;
    char *inSys = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &stringLen);
    inString = new char[stringLen + 1];
    napi_get_value_string_utf8(env, args[1], inString, stringLen + 1, &stringLen);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &valueLen);
    inValue = new char[valueLen + 1];
    napi_get_value_string_utf8(env, args[2], inValue, valueLen + 1, &valueLen);
    int32_t valueDataLen = 0;
    napi_get_value_int32(env, args[3], &valueDataLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    char *name_ptr = nullptr;
    if (0 != strncmp(inString, " ", stringLen)) {
        name_ptr = inString;
    }
    uint8_t *data_ptr = nullptr;
    if (0 != strncmp(inValue, " ", valueLen)) {
        data_ptr = (uint8_t *)inValue;
    }
    MediaKeySystem *system_ptr = nullptr;
    if (0 != strncmp(inSys, " ", sysLen)) {
        system_ptr = drmKeySystem;
    }
    uint8_t outValue[DATA_BUFF_LEN] = {0};
    int32_t outValueLen = DATA_BUFF_LEN;
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetConfigurationByteArray(system_ptr, name_ptr, data_ptr, valueDataLen);

    if (ret2 == DRM_ERR_OK) {
        Drm_ErrCode ret4 = OH_MediaKeySystem_GetConfigurationByteArray(drmKeySystem, name_ptr, outValue, &outValueLen);
        if (ret4 == DRM_ERR_OK) {
            ret2 = (0 == memcmp(outValue, data_ptr, valueDataLen)) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetConfigurationByteArray(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t configNameLen = 0;
    char *configName = nullptr;
    char *value = nullptr;
    size_t valueLen = 0;
    size_t valueLenStringLen = 0;
    char *valueLenString = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &configNameLen);
    configName = new char[configNameLen + 1];
    napi_get_value_string_utf8(env, args[1], configName, configNameLen + 1, &configNameLen);

    napi_get_value_string_utf8(env, args[2], nullptr, 0, &valueLen);
    value = new char[valueLen + 1];
    napi_get_value_string_utf8(env, args[2], value, valueLen + 1, &valueLen);

    napi_get_value_string_utf8(env, args[3], nullptr, 0, &valueLenStringLen);
    valueLenString = new char[valueLenStringLen + 1];
    napi_get_value_string_utf8(env, args[3], valueLenString, valueLenStringLen + 1, &valueLenStringLen);

    Drm_ErrCode ret2 = DRM_ERR_OK;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (0 == strcmp(judge_uuid(), CLEAR_PLAY)) {
        uint8_t valueData[10];
        memset(valueData, 0x55, 10);
        ret2 = OH_MediaKeySystem_SetConfigurationByteArray(drmKeySystem, configName, valueData,
                                                           10); // 蓝区没有默认值，需要先set；
    }
    MediaKeySystem *system_ptr = nullptr;
    if (0 != strcmp(inSys, " ")) {
        system_ptr = drmKeySystem;
    }
    const char *configName_ptr = nullptr;
    if (0 != strcmp(configName, " ")) {
        configName_ptr = configName;
    }
    uint8_t *value_ptr = nullptr;
    uint8_t valueData[DATA_BUFF_LEN] = {0};
    if (0 != strcmp(value, " ")) {
        value_ptr = valueData;
    }
    int32_t *valueLen_ptr = nullptr;
    int32_t valueLenData = DATA_BUFF_LEN;
    if (0 != strcmp(valueLenString, " ")) {
        valueLen_ptr = &valueLenData;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_GetConfigurationByteArray(system_ptr, configName_ptr, value_ptr, valueLen_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetStatistics(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t statisticsLen = 0;
    char *statistics = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &statisticsLen);
    statistics = new char[statisticsLen + 1];
    napi_get_value_string_utf8(env, args[1], statistics, statisticsLen + 1, &statisticsLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);

    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    DRM_Statistics *statisticsData_ptr = nullptr;
    DRM_Statistics statisticsData;
    memset(&statisticsData, 0x00, sizeof(DRM_Statistics));
    if (strcmp(statistics, " ")) {
        statisticsData_ptr = &statisticsData;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_GetStatistics(system_ptr, statisticsData_ptr);
    OH_LOG_DEBUG(LOG_APP, "testCL_statisticsCount = %{public}d", statisticsData.statisticsCount);
    for (int i = 0; i < statisticsData.statisticsCount; i++) {
        OH_LOG_DEBUG(LOG_APP, "testCL_statisticsName[%{public}d]: %{public}s", i, statisticsData.statisticsName[i]);
        OH_LOG_DEBUG(LOG_APP, "testCL_Description[%{public}d]: %{public}s", i, statisticsData.statisticsDescription[i]);
    }

    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetMaxContentProtectionLevel(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t levelLen = 0;
    char *inLevel = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &levelLen);
    inLevel = new char[levelLen + 1];
    napi_get_value_string_utf8(env, args[1], inLevel, levelLen + 1, &levelLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    DRM_ContentProtectionLevel securityLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    DRM_ContentProtectionLevel *level_ptr = nullptr;
    if (strcmp(inLevel, " ") != 0) {
        level_ptr = &securityLevel;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_GetMaxContentProtectionLevel(system_ptr, level_ptr);
    OH_LOG_DEBUG(LOG_APP, "testCL_MaxContentProtectionLevel is %{public}d", securityLevel);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetMaxContentProtectionLevel(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t levelLen = 0;
    char *inLevel = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &levelLen);
    inLevel = new char[levelLen + 1];
    napi_get_value_string_utf8(env, args[1], inLevel, levelLen + 1, &levelLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    OH_LOG_DEBUG(LOG_APP, "testCL_MediaKeySystem_Create result is %{public}d", ret1);
    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    DRM_ContentProtectionLevel securityLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    DRM_ContentProtectionLevel *level_ptr = nullptr;
    if (strcmp(inLevel, " ") != 0) {
        level_ptr = &securityLevel;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_GetMaxContentProtectionLevel(system_ptr, level_ptr);
    OH_LOG_DEBUG(LOG_APP, "testCL_GetMaxContentProtectionLevel result is %{public}d", ret2);
    OH_LOG_DEBUG(LOG_APP, "testCL_MaxContentProtectionLevel is %{public}d", securityLevel);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    OH_LOG_DEBUG(LOG_APP, "testCL_MediaKeySystem_Destroy result is %{public}d", ret3);
    napi_create_int32(env, (int32_t)securityLevel, &result);
    return result;
}
static napi_value Test_CreateMediaKeySession(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    int32_t level = 0;
    size_t sessionLen = 0;
    char *inSession = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_int32(env, args[1], &level);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &sessionLen);
    inSession = new char[sessionLen + 1];
    napi_get_value_string_utf8(env, args[2], inSession, sessionLen + 1, &sessionLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    DRM_ContentProtectionLevel *level_ptr = nullptr;
    if (level != -1) {
        level_ptr = (DRM_ContentProtectionLevel *)&level;
    }
    MediaKeySession *drmKeySession = nullptr;
    MediaKeySession **session_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = &drmKeySession;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(system_ptr, level_ptr, session_ptr);
    Drm_ErrCode ret3 = DRM_ERR_OK;
    if (ret2 == DRM_ERR_OK && (drmKeySession != nullptr)) {
        Drm_ErrCode ret3 = OH_MediaKeySession_Destroy(drmKeySession);
    }
    Drm_ErrCode ret4 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GenerateKeySystemRequest(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t requestStringLen = 0;
    char *inRequestString = nullptr;
    size_t requestLenStingLen = 0;
    char *requestLenSting = nullptr;
    size_t defaultUrlStingLen = 0;
    char *defaultUrlSting = nullptr;
    int32_t defaultUrlLen = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &requestStringLen);
    inRequestString = new char[requestStringLen + 1];
    napi_get_value_string_utf8(env, args[1], inRequestString, requestStringLen + 1, &requestStringLen);

    napi_get_value_string_utf8(env, args[2], nullptr, 0, &requestLenStingLen);
    requestLenSting = new char[requestLenStingLen + 1];
    napi_get_value_string_utf8(env, args[2], requestLenSting, requestLenStingLen + 1, &requestLenStingLen);

    napi_get_value_string_utf8(env, args[3], nullptr, 0, &defaultUrlStingLen);
    defaultUrlSting = new char[defaultUrlStingLen + 1];
    napi_get_value_string_utf8(env, args[3], defaultUrlSting, defaultUrlStingLen + 1, &defaultUrlStingLen);

    napi_get_value_int32(env, args[4], &defaultUrlLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    uint8_t *request_ptr = nullptr;
    uint8_t requestData[DATA_BUFF_LEN] = {0};
    if ((0 != strcmp(inRequestString, " "))) {
        request_ptr = requestData;
    }
    int32_t *requestLen_ptr = nullptr;
    int32_t outRequestLen = DATA_BUFF_LEN;
    if ((0 != strcmp(requestLenSting, " "))) {
        requestLen_ptr = &outRequestLen;
    }
    char *urlData_ptr = nullptr;
    char urlData[DATA_BUFF_LEN] = {0};
    int32_t UrlLen = DATA_BUFF_LEN;
    if ((0 != strcmp(defaultUrlSting, " "))) {
        urlData_ptr = urlData;
    }
    if ((defaultUrlLen != 0) && (defaultUrlLen != -1)) {
        defaultUrlLen = UrlLen;
    }
    Drm_ErrCode ret2 =
        OH_MediaKeySystem_GenerateKeySystemRequest(system_ptr, request_ptr, requestLen_ptr, urlData_ptr, defaultUrlLen);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_ProcessKeySystemResponse(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t inSys_len = 0;
    char *inSys = nullptr;
    size_t response_len = 0;
    char *response = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    int32_t responseDataLen = 0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSys_len);
    inSys = new char[inSys_len + 1];
    napi_get_value_string_utf8(env, args[0], inSys, inSys_len + 1, &inSys_len);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &response_len);
    response = new char[response_len + 1];
    napi_get_value_string_utf8(env, args[1], response, response_len + 1, &response_len);
    napi_get_value_int32(env, args[2], &responseDataLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    uint8_t *responseData_ptr = nullptr;
    uint8_t requestData[DATA_BUFF_LEN] = {0};
    int32_t requestLen = DATA_BUFF_LEN;
    char defaultURLData[DATA_BUFF_LEN] = {0};
    int32_t defaultURLDataLen = DATA_BUFF_LEN;
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseDataLen_out = DATA_BUFF_LEN;

    if (strncmp(response, "genResponse", response_len) == 0) {
        Drm_ErrCode ret3 = OH_MediaKeySystem_GenerateKeySystemRequest(drmKeySystem, requestData, &requestLen,
                                                                      defaultURLData, defaultURLDataLen);
        if (ret3 == DRM_ERR_OK) {
            int getRet = getHttp(defaultURLData, requestData, (uint32_t)requestLen, responseData, &responseDataLen_out,
                                 HTTP_TIMEOUT); // 设备证书申请
            if (getRet != 0) {
                OH_LOG_ERROR(LOG_APP, "testCL_getHttp failed ,Ret = %{public}d", getRet);
            }
            responseData_ptr = responseData;
            if (responseDataLen > 0) {
                responseDataLen = responseDataLen_out;
            }
        }
    } else if (0 != strncmp(response, " ", response_len)) {
        responseData_ptr = (uint8_t *)response;
        OH_LOG_DEBUG(LOG_APP, "testCL_input responseData");
    } else {
        responseData_ptr = nullptr;
        OH_LOG_DEBUG(LOG_APP, "testCL_responseData is nullptr");
    }
    Drm_ErrCode ret4 = OH_MediaKeySystem_ProcessKeySystemResponse(system_ptr, responseData_ptr, responseDataLen);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetOfflineMediaKeyIds(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t keyIdsLen = 0;
    char *keyIds = nullptr;
    size_t keySourceLen = 0;
    char *keySource = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret3 = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &keyIdsLen);
    keyIds = new char[keyIdsLen + 1];
    napi_get_value_string_utf8(env, args[1], keyIds, keyIdsLen + 1, &keyIdsLen);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &keySourceLen);
    keySource = new char[keySourceLen + 1];
    napi_get_value_string_utf8(env, args[2], keySource, keySourceLen + 1, &keySourceLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &drmKeySession);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    int reslicense = getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
    if (reslicense != 0) {
        OH_LOG_ERROR(LOG_APP, "testCL_get offline license failed!");
    }
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    DRM_OfflineMediakeyIdArray *offlineMediaKeyIds_ptr = nullptr;
    DRM_OfflineMediakeyIdArray mediaKeyIds;
    memset(&mediaKeyIds, 0, sizeof(DRM_OfflineMediakeyIdArray));
    if ((0 != strcmp(keyIds, " "))) {
        offlineMediaKeyIds_ptr = &mediaKeyIds;
    }
    ret3 = OH_MediaKeySystem_GetOfflineMediaKeyIds(system_ptr, offlineMediaKeyIds_ptr);
    if (ret3 == DRM_ERR_OK) {
        ret3 = (mediaKeyIds.idsCount != 0) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        OH_LOG_DEBUG(LOG_APP, "testCL_offline mediaKeyIds count is %{public}d", mediaKeyIds.idsCount);
        for (int i = 0; i < mediaKeyIds.idsCount;
             i++) { // 与./data/vendor/mediakeysystem/chinadrm/license.dat中keyid（十六进制）一致
            OH_LOG_DEBUG(LOG_APP, "testCL_offline mediaKeyIds[%{public}d] is %{public}s", i, mediaKeyIds.ids[i]);
        }
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);

    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetOfflineMediaKeyStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t keyIdStringLen = 0;
    char *keyIdString = nullptr;
    int32_t offlineMediaKeyIdLen = 0;
    size_t statusStringLen = 0;
    char *statusString = nullptr;
    int32_t expectStatus;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &keyIdStringLen);
    keyIdString = new char[keyIdStringLen + 1];
    napi_get_value_string_utf8(env, args[1], keyIdString, keyIdStringLen + 1, &keyIdStringLen);
    napi_get_value_int32(env, args[2], &offlineMediaKeyIdLen);
    napi_get_value_string_utf8(env, args[3], nullptr, 0, &statusStringLen);
    statusString = new char[statusStringLen + 1];
    napi_get_value_string_utf8(env, args[3], statusString, statusStringLen + 1, &statusStringLen);
    napi_get_value_int32(env, args[4], &expectStatus);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySession *drmKeySession = nullptr;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
    uint8_t *keyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    if (strncmp(keyIdString, "genKey", keyIdStringLen) == 0) {
        getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if (offlineMediaKeyIdLen > 0) {
            offlineMediaKeyIdLen = keyDataLen;
        }
    } else if (strncmp(keyIdString, " ", keyIdStringLen) != 0) {
        keyId_ptr = (uint8_t *)keyIdString;
    } else {
        keyId_ptr = nullptr;
    }
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strncmp(inSys, " ", sysLen))) {
        system_ptr = drmKeySystem;
    }
    DRM_OfflineMediaKeyStatus status = OFFLINE_MEDIA_KEY_STATUS_UNKNOWN;
    DRM_OfflineMediaKeyStatus *status_ptr = nullptr;
    if ((0 != strncmp(statusString, " ", statusStringLen))) {
        status_ptr = &status;
    }
    Drm_ErrCode ret4 =
        OH_MediaKeySystem_GetOfflineMediaKeyStatus(system_ptr, keyId_ptr, offlineMediaKeyIdLen, status_ptr);
    Drm_ErrCode ret5 = DRM_ERR_INVALID_VAL;
    if (ret4 == DRM_ERR_OK) { // 获取到license
        ret5 = ((int32_t)status == expectStatus) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret6 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret7 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret6 == DRM_ERR_OK && ret7 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_ClearOfflineMediaKeys(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    char *inSys = nullptr;
    size_t sysLen = 0;
    char *keyIdString = nullptr;
    size_t keyIdStringLen = 0;
    int32_t offlineMediaKeyIdLen = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &keyIdStringLen);
    keyIdString = new char[keyIdStringLen + 1];
    napi_get_value_string_utf8(env, args[1], keyIdString, keyIdStringLen + 1, &keyIdStringLen);
    napi_get_value_int32(env, args[2], &offlineMediaKeyIdLen);

    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySession *mediaKeySession = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &mediaKeySession);

    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    uint8_t *keyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    if (strncmp(keyIdString, "genKey", keyIdStringLen) == 0) {
        getLicense(mediaKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if (offlineMediaKeyIdLen > 0) {
            offlineMediaKeyIdLen = keyDataLen;
        }
    } else if ((0 != strcmp(keyIdString, " "))) {
        keyId_ptr = (uint8_t *)keyIdString;
    } else {
        keyId_ptr = nullptr;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_ClearOfflineMediaKeys(system_ptr, keyId_ptr, offlineMediaKeyIdLen);
    DRM_OfflineMediaKeyStatus status = OFFLINE_MEDIA_KEY_STATUS_USABLE;
    if (ret3 == DRM_ERR_OK) {
        Drm_ErrCode ret6 =
            OH_MediaKeySystem_GetOfflineMediaKeyStatus(system_ptr, keyId_ptr, offlineMediaKeyIdLen, &status);
        if (ret6 == DRM_ERR_OK) {
            ret3 = (status != OFFLINE_MEDIA_KEY_STATUS_USABLE) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(mediaKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetCertificateStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t StatusLen = 0;
    char *Status = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &StatusLen);
    Status = new char[StatusLen + 1];
    napi_get_value_string_utf8(env, args[1], Status, StatusLen + 1, &StatusLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    DRM_CertificateStatus status = CERT_STATUS_UNAVAILABLE;
    DRM_CertificateStatus *cerStatus_ptr = nullptr;
    if ((0 != strcmp(Status, " "))) {
        cerStatus_ptr = &status;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_GetCertificateStatus(system_ptr, cerStatus_ptr);
    if (ret2 == DRM_ERR_OK) {
        OH_LOG_DEBUG(LOG_APP, "testCL_CertificateStatus is %{public}d", status);
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_Destroy(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSysLen = 0;
    char *inSys = nullptr;
    int32_t count = 0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSysLen);
    inSys = new char[inSysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, inSysLen + 1, &inSysLen);
    napi_get_value_int32(env, args[1], &count);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    for (int i = 0; i < count; i++) {
        ret2 = OH_MediaKeySystem_Destroy(system_ptr);
    }
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
uint8_t Flag_SysCallBack = 0;
Drm_ErrCode TestSystemCallBack(DRM_EventType eventType, uint8_t *eventInfo, int32_t infoLen, char *extra) {
    OH_LOG_DEBUG(LOG_APP, "testCL_Enter systemCallBack func!");
    Flag_SysCallBack = 1;
    return DRM_ERR_OK;
}
static napi_value Test_MediaKeySystem_SetMediaKeySystemCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSysLen = 0;
    char *inSys = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSysLen);
    inSys = new char[inSysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, inSysLen + 1, &inSysLen);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
        OH_LOG_DEBUG(LOG_APP, "testCL_SetMediaKeySystemCallback system is not nullptr!");
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetMediaKeySystemCallback(system_ptr, TestSystemCallBack);
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    // Trigger callback
    if (strcmp(judge_uuid(), CLEAR_PLAY) == 0) { // clearpaly直接申请设备证书，触发回调
        int retCert = getCertificate(drmKeySystem);
        CHECK_PRINTF((retCert != 0), retCert);
        Drm_ErrCode ret4 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
        if (ret4 == DRM_ERR_OK) {
            Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
            CHECK_PRINTF((ret5 != DRM_ERR_OK), ret5);
        }
        if ((ret2 == DRM_ERR_OK)) {
            ret2 = (Flag_SysCallBack == 1) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    } else { // wiseplay手动删除证书，创建session失败，触发回调
        DRM_CertificateStatus status = CERT_STATUS_UNAVAILABLE;
        Drm_ErrCode ret3 = OH_MediaKeySystem_GetCertificateStatus(drmKeySystem, &status);
        if ((ret3 == DRM_ERR_OK) && (status != CERT_STATUS_PROVISIONED)) {
            Drm_ErrCode ret4 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
            if (ret4 == DRM_ERR_OK) {
                Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
                CHECK_PRINTF((ret5 != DRM_ERR_OK), ret5);
            }
            if ((ret2 == DRM_ERR_OK)) {
                ret2 = (Flag_SysCallBack == 1) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
            }
            int retCert = getCertificate(drmKeySystem);
            CHECK_PRINTF((retCert != 0), retCert);
        }
    }
    Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
    Flag_SysCallBack = 0; // 清标志
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret6 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
// session
static napi_value Test_MediaKeySession_GenerateMediaKeyRequest(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t infoLen = 0;
    char *infoString = nullptr;
    size_t RequestLen = 0;
    char *request = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &infoLen);
    infoString = new char[infoLen + 1];
    napi_get_value_string_utf8(env, args[1], infoString, infoLen + 1, &infoLen);

    napi_get_value_string_utf8(env, args[2], nullptr, 0, &RequestLen);
    request = new char[RequestLen + 1];
    napi_get_value_string_utf8(env, args[2], request, RequestLen + 1, &RequestLen);

    unsigned char testData[DATA_REQUESTINFO_LEN] = REQUESTINFODATA;
    unsigned char errorTestData[ERROR_DATA_REQUESTINFO_LEN] = ERRORREQUESTINFODATA;
    DRM_MediaKeyRequestInfo requestInfo;
    requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    if ((0 == strcmp(infoString, "err_dataLen"))) {
        requestInfo.initDataLen = -1;
    } else {
        requestInfo.initDataLen = sizeof(testData);
    }
    if ((0 == strcmp(infoString, "err_data"))) {
        memcpy(requestInfo.initData, errorTestData, sizeof(errorTestData));
    } else {
        memcpy(requestInfo.initData, testData, sizeof(testData));
    }
    if ((0 == strcmp(infoString, "err_mineType"))) {
        memcpy(requestInfo.mimeType, "111/222222", sizeof("111/222222"));
    } else {
        memcpy(requestInfo.mimeType, "video/mp4", sizeof("video/mp4"));
    }
    if ((0 == strcmp(infoString, "err_optCount"))) {
        requestInfo.optionsCount = MAX_MEDIA_KEY_REQUEST_OPTION_COUNT << 1;
        for (int i = 0; i < MAX_MEDIA_KEY_REQUEST_OPTION_COUNT; i++) {
            strncpy(requestInfo.optionName[i], "optionalDataName", strlen("optionalDataName"));
            strncpy(requestInfo.optionData[i], "optionalDataValue", strlen("optionalDataValue"));
        }
    } else {
        requestInfo.optionsCount = OPTIONS_NUM;
        for (int i = 0; i < requestInfo.optionsCount; i++) {
            strncpy(requestInfo.optionName[i], "optionalDataName", strlen("optionalDataName"));
            strncpy(requestInfo.optionData[i], "optionalDataValue", strlen("optionalDataValue"));
        }
    }
    DRM_MediaKeyRequestInfo *requestInfo_ptr = nullptr;
    if ((0 != strcmp(infoString, " "))) {
        requestInfo_ptr = &requestInfo;
    }
    DRM_MediaKeyRequest *mediaKeyRequest_ptr = nullptr;
    DRM_MediaKeyRequest mediaKeyRequest;
    if ((0 != strcmp(request, " "))) {
        mediaKeyRequest_ptr = &mediaKeyRequest;
    }
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    MediaKeySession *session_ptr = nullptr;
    if ((0 != strcmp(inSession, " "))) {
        session_ptr = drmKeySession;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_GenerateMediaKeyRequest(session_ptr, requestInfo_ptr, mediaKeyRequest_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_ProcessMediaKeyResponse(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t inResponseStringLen = 0;
    char *inResponseString = nullptr;
    int32_t responseLen = 0;
    size_t KeyIdStringLen = 0;
    char *KeyIdString = nullptr;
    size_t KeyIdLenStringLen = 0;
    char *KeyIdLenString = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inResponseStringLen);
    inResponseString = new char[inResponseStringLen + 1];
    napi_get_value_string_utf8(env, args[1], inResponseString, inResponseStringLen + 1, &inResponseStringLen);

    napi_get_value_int32(env, args[2], &responseLen);

    napi_get_value_string_utf8(env, args[3], nullptr, 0, &KeyIdStringLen);
    KeyIdString = new char[KeyIdStringLen + 1];
    napi_get_value_string_utf8(env, args[3], KeyIdString, KeyIdStringLen + 1, &KeyIdStringLen);

    napi_get_value_string_utf8(env, args[4], nullptr, 0, &KeyIdLenStringLen);
    KeyIdLenString = new char[KeyIdLenStringLen + 1];
    napi_get_value_string_utf8(env, args[4], KeyIdLenString, KeyIdLenStringLen + 1, &KeyIdLenStringLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);

    MediaKeySession *session_ptr = nullptr;
    if ((0 != strcmp(inSession, " "))) {
        session_ptr = drmKeySession;
    }
    uint8_t *response_ptr = nullptr;
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseLenOut = DATA_BUFF_LEN;
    if (strcmp(inResponseString, "genResponse") == 0) {
        getOnLicResponseData(drmKeySession, responseData, &responseLenOut);
        OH_LOG_DEBUG(LOG_APP, "testCL_responseData is %{public}s , len =  %{public}d", responseData, responseLenOut);
        response_ptr = responseData;
        if (responseLen > 0) {
            responseLen = responseLenOut;
        }
    } else if (strcmp(inResponseString, " ") != 0) {
        response_ptr = (uint8_t *)malloc(inResponseStringLen);
        splitStringToIntArray(inResponseString, response_ptr);
    }
    uint8_t *keyIds_ptr = nullptr;
    uint8_t keyIdsBuff[DATA_BUFF_LEN];
    if ((0 != strcmp(KeyIdString, " "))) {
        keyIds_ptr = keyIdsBuff;
    }
    int32_t *keyIdLen_ptr = nullptr;
    int32_t keyIdLen = DATA_BUFF_LEN;
    if ((0 != strcmp(KeyIdLenString, " "))) {
        keyIdLen_ptr = &keyIdLen;
    }
    Drm_ErrCode ret3 =
        OH_MediaKeySession_ProcessMediaKeyResponse(session_ptr, response_ptr, responseLen, keyIds_ptr, keyIdLen_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if ((response_ptr != nullptr) && (strcmp(inResponseString, "genResponse") != 0)) {
        free(response_ptr);
    }
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_CheckMediaKeyStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t inStatusLen = 0;
    char *inStatus = nullptr;
    int32_t licenseNum = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inStatusLen);
    inStatus = new char[inStatusLen + 1];
    napi_get_value_string_utf8(env, args[1], inStatus, inStatusLen + 1, &inStatusLen);
    napi_get_value_int32(env, args[2], &licenseNum);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);

    uint8_t keyData[10][DATA_BUFF_LEN] = {0};
    int32_t keyDataLen[10] = {DATA_BUFF_LEN};
    for (int i = 0; i < licenseNum; i++) {
        int res = getLicense(drmKeySession, LICENSE_ONLINE, keyData[i], &keyDataLen[i]);
        CHECK_PRINTF((res != 0), res);
    }
    MediaKeySession *sessoin_ptr = nullptr;
    DRM_MediaKeyStatus mediaKeyStatus;
    memset(&mediaKeyStatus, 0, sizeof(DRM_MediaKeyStatus));
    DRM_MediaKeyStatus *mediaKeyStatus_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        sessoin_ptr = drmKeySession;
    }
    if (0 != strcmp(inStatus, " ")) {
        mediaKeyStatus_ptr = &mediaKeyStatus;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_CheckMediaKeyStatus(sessoin_ptr, mediaKeyStatus_ptr);
    if (ret3 == DRM_ERR_OK) {
        OH_LOG_DEBUG(LOG_APP, "testCL_CheckMediaKeyStatus, count = %{public}d", mediaKeyStatus.statusCount);
        for (int i = 0; i < mediaKeyStatus.statusCount; i++) {
            OH_LOG_DEBUG(LOG_APP, "testCL_CheckMediaKeyStatus statusName[%{public}d] is %{public}s", i,
                         mediaKeyStatus.statusName[i]);
            OH_LOG_DEBUG(LOG_APP, "testCL_CheckMediaKeyStatus statusValue[%{public}d] is %{public}s", i,
                         mediaKeyStatus.statusValue[i]);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "testCL_CheckMediaKeyStatus failed,ret = %{public}d", ret3);
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_ClearMediaKeys(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    getLicense(drmKeySession, LICENSE_ONLINE, keyData, &keyDataLen);
    DRM_MediaKeyStatus status_before;
    memset(&status_before, 0, sizeof(DRM_MediaKeyStatus));
    Drm_ErrCode ret6 = OH_MediaKeySession_CheckMediaKeyStatus(drmKeySession, &status_before);
    if (ret6 == DRM_ERR_OK) {
        for (int i = 0; i < status_before.statusCount; i++) {
            OH_LOG_DEBUG(LOG_APP, "testCL_before clear, statusName[%{public}d] is %{public}s", i,
                         status_before.statusName[i]);
            OH_LOG_DEBUG(LOG_APP, "testCL_before clear, statusValue[%{public}d] is %{public}s", i,
                         status_before.statusValue[i]);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "testCL_before ClearMediaKeys check status failed ret = %{public}d", ret6);
    }
    MediaKeySession *session_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_ClearMediaKeys(session_ptr);
    DRM_MediaKeyStatus status_after;
    memset(&status_after, 0, sizeof(DRM_MediaKeyStatus));
    Drm_ErrCode ret7 = OH_MediaKeySession_CheckMediaKeyStatus(drmKeySession, &status_after);
    if (ret7 == DRM_ERR_OK) {
        for (int i = 0; i < status_after.statusCount; i++) {
            OH_LOG_DEBUG(LOG_APP, "testCL_after clear, statusName[%{public}d] is %{public}s", i,
                         status_after.statusName[i]);
            OH_LOG_DEBUG(LOG_APP, "testCL_after clear, statusValue[%{public}d] is %{public}s", i,
                         status_after.statusValue[i]);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "testCL_after ClearMediaKeys check status failed,ret = %{public}d", ret7);
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_GetContentProtectionLevel(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t inLevelLen = 0;
    char *inLevelSting = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inLevelLen);
    inLevelSting = new char[inLevelLen + 1];
    napi_get_value_string_utf8(env, args[1], inLevelSting, inLevelLen + 1, &inLevelLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    MediaKeySession *session = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session = drmKeySession;
    }
    DRM_ContentProtectionLevel *contentProtectionLevel = nullptr;
    DRM_ContentProtectionLevel outLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    if (0 != strcmp(inLevelSting, " ")) {
        contentProtectionLevel = &outLevel;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_GetContentProtectionLevel(session, contentProtectionLevel);
    if (ret3 == DRM_ERR_OK) {
        ret3 = (outLevel == sessionLevel) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_RequireSecureDecoderModule(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t mimeTypeLen = 0;
    char *mimeType = nullptr;
    size_t statusLen = 0;
    char *statusString = nullptr;
    bool expectStatus = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &mimeTypeLen);
    mimeType = new char[mimeTypeLen + 1];
    napi_get_value_string_utf8(env, args[1], mimeType, mimeTypeLen + 1, &mimeTypeLen);

    napi_get_value_string_utf8(env, args[2], nullptr, 0, &statusLen);
    statusString = new char[statusLen + 1];
    napi_get_value_string_utf8(env, args[2], statusString, statusLen + 1, &statusLen);

    napi_get_value_bool(env, args[3], &expectStatus);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    MediaKeySession *session_ptr = nullptr;
    if (0 == strcmp(inSession, "hw")) {
        sessionLevel = CONTENT_PROTECTION_LEVEL_HW_CRYPTO;
    } else if (0 == strcmp(inSession, "sw")) {
        sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    } else if (0 == strcmp(inSession, "enhanced_hw")) {
        sessionLevel = CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO;
    } else if (0 == strcmp(inSession, "max")) {
        sessionLevel = CONTENT_PROTECTION_LEVEL_MAX;
    } else {
        sessionLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    }
    OH_LOG_DEBUG(LOG_APP, "testCL_RequireSecureDecoderModule session level = %{public}d", sessionLevel);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    char *mineType_ptr = nullptr;
    if (0 != strcmp(mimeType, " ")) {
        mineType_ptr = mimeType;
    }
    bool *status_ptr = nullptr;
    bool outStatus = 0;
    if (0 != strcmp(statusString, " ")) {
        status_ptr = &outStatus;
        OH_LOG_DEBUG(LOG_APP, "testCL_RequireSecureDecoderModule, outStatus = %{public}d", outStatus);
        OH_LOG_DEBUG(LOG_APP, "testCL_RequireSecureDecoderModule, expectStatus = %{public}d", expectStatus);
    }

    Drm_ErrCode ret3 = OH_MediaKeySession_RequireSecureDecoderModule(session_ptr, mineType_ptr, status_ptr);
    if (ret3 == DRM_ERR_OK) {
        ret3 = (outStatus == expectStatus) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
uint8_t Flag_EnterEventCallBack = 0;
uint8_t Flag_EnterChangeCallBack = 0;
Drm_ErrCode TestSessionEventCallBack(DRM_EventType eventType, uint8_t *info, int32_t infoLen, char *extra) {
    OH_LOG_DEBUG(LOG_APP, "testCL_Enter SessionEventCallBack");
    Flag_EnterEventCallBack = 1;
    return DRM_ERR_OK;
}
Drm_ErrCode TestSessionKeyChangeCallback(DRM_KeysInfo *keysInfo, bool newKeysAvailable) {
    OH_LOG_DEBUG(LOG_APP, "testCL_Enter SessionKeyChangeCallback");
    Flag_EnterChangeCallBack = 1;
    return DRM_ERR_OK;
}
static napi_value Test_MediaKeySession_SetMediaKeySessionCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    MediaKeySession_Callback SessionCallBack;
    SessionCallBack.eventCallback = TestSessionEventCallBack;
    SessionCallBack.keyChangeCallback = TestSessionKeyChangeCallback;
    MediaKeySession *session_ptr = nullptr;
    MediaKeySession_Callback *callback_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    if (0 != strcmp(callBack, " ")) {
        callback_ptr = &SessionCallBack;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_SetMediaKeySessionCallback(session_ptr, callback_ptr);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    int resLice = getLicense(drmKeySession, LICENSE_ONLINE, keyData, &keyDataLen); // 申请license，触发回调
    if ((ret3 == DRM_ERR_OK) && (resLice == 0)) {
        ret3 = ((Flag_EnterEventCallBack == 1) || (Flag_EnterChangeCallBack == 1)) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    Flag_EnterEventCallBack = 0;
    Flag_EnterChangeCallBack = 0;
    if (ret1 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_GenerateOfflineReleaseRequest(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t KeyIdStringLen = 0;
    char *KeyIdString = nullptr;
    int32_t offlineKeyIdLen = 0;
    size_t requestStringLen = 0;
    char *requestString = nullptr;
    size_t requestLenStringLen = 0;
    char *requestLenString = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &KeyIdStringLen);
    KeyIdString = new char[KeyIdStringLen + 1];
    napi_get_value_string_utf8(env, args[1], KeyIdString, KeyIdStringLen + 1, &KeyIdStringLen);

    napi_get_value_int32(env, args[2], &offlineKeyIdLen);

    napi_get_value_string_utf8(env, args[3], nullptr, 0, &requestStringLen);
    requestString = new char[requestStringLen + 1];
    napi_get_value_string_utf8(env, args[3], requestString, requestStringLen + 1, &requestStringLen);

    napi_get_value_string_utf8(env, args[4], nullptr, 0, &requestLenStringLen);
    requestLenString = new char[requestLenStringLen + 1];
    napi_get_value_string_utf8(env, args[4], requestLenString, requestLenStringLen + 1, &requestLenStringLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    MediaKeySession *session_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    uint8_t *KeyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    if (strcmp(KeyIdString, "genKey") == 0) {
        getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
        KeyId_ptr = keyData;
        if (offlineKeyIdLen > 0) {
            offlineKeyIdLen = keyDataLen;
        }
    } else if (0 != strcmp(KeyIdString, " ")) {
        KeyId_ptr = (uint8_t *)malloc(KeyIdStringLen);
        splitStringToIntArray(KeyIdString, KeyId_ptr);
    }
    uint8_t data[DATA_BUFF_LEN] = {0};
    uint8_t *releaseRequest_ptr = nullptr;
    if (0 != strcmp(requestString, " ")) {
        releaseRequest_ptr = data;
    }
    int32_t releaseRequestLen = DATA_BUFF_LEN;
    int32_t *releaseRequestLen_ptr = nullptr;
    if (0 != strcmp(requestLenString, " ")) {
        releaseRequestLen_ptr = &releaseRequestLen;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_GenerateOfflineReleaseRequest(session_ptr, KeyId_ptr, offlineKeyIdLen,
                                                                        releaseRequest_ptr, releaseRequestLen_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if ((KeyId_ptr != nullptr) && (strcmp(KeyIdString, "genKey") != 0)) {
        free(KeyId_ptr);
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_ProcessOfflineReleaseResponse(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t KeyIdLen = 0;
    char *KeyId = nullptr;
    int32_t offlineKeyIdLen = 0;
    size_t releaseResponseLen = 0;
    char *releaseResponse = nullptr;
    int32_t responseLen = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &KeyIdLen);
    KeyId = new char[KeyIdLen + 1];
    napi_get_value_string_utf8(env, args[1], KeyId, KeyIdLen + 1, &KeyIdLen);
    napi_get_value_int32(env, args[2], &offlineKeyIdLen);
    napi_get_value_string_utf8(env, args[3], nullptr, 0, &releaseResponseLen);
    releaseResponse = new char[releaseResponseLen + 1];
    napi_get_value_string_utf8(env, args[3], releaseResponse, releaseResponseLen + 1, &releaseResponseLen);
    napi_get_value_int32(env, args[4], &responseLen);
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    MediaKeySession *session_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    uint8_t *keyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    if (strcmp(KeyId, "genKey") == 0) {
        getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if (offlineKeyIdLen > 0) {
            offlineKeyIdLen = keyDataLen;
        }
    } else if (0 != strcmp(KeyId, " ")) {
        keyId_ptr = (uint8_t *)malloc(KeyIdLen);
        splitStringToIntArray(KeyId, keyId_ptr);
    }
    uint8_t *releaseResponse_ptr = nullptr;
    if (0 != strcmp(releaseResponse, " ")) {
        releaseResponse_ptr = (uint8_t *)malloc(releaseResponseLen);
        splitStringToIntArray(releaseResponse, releaseResponse_ptr);
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_ProcessOfflineReleaseResponse(session_ptr, keyId_ptr, offlineKeyIdLen,
                                                                        releaseResponse_ptr, responseLen);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if (keyId_ptr != nullptr && strcmp(KeyId, "genKey") != 0) {
        free(keyId_ptr);
    }
    if (releaseResponse_ptr != nullptr) {
        free(releaseResponse_ptr);
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_RestoreOfflineMediaKeys(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t inSessionLen = 0;
    char *inSession = nullptr;
    size_t KeyIdLen = 0;
    char *KeyId = nullptr;
    int32_t offlineKeyIdLen = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSessionLen);
    inSession = new char[inSessionLen + 1];
    napi_get_value_string_utf8(env, args[0], inSession, inSessionLen + 1, &inSessionLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &KeyIdLen);
    KeyId = new char[KeyIdLen + 1];
    napi_get_value_string_utf8(env, args[1], KeyId, KeyIdLen + 1, &KeyIdLen);
    napi_get_value_int32(env, args[2], &offlineKeyIdLen);
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    uint8_t *keyId_ptr = nullptr;
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    if (strcmp(KeyId, "getKey") == 0) {
        getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if (offlineKeyIdLen > 0) {
            offlineKeyIdLen = keyDataLen;
        }
    } else if (0 != strcmp(KeyId, " ")) {
        keyId_ptr = (uint8_t *)malloc(KeyIdLen);
        splitStringToIntArray(KeyId, keyId_ptr);
    } else
        ;
    MediaKeySession *session_ptr = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session_ptr = drmKeySession;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_RestoreOfflineMediaKeys(session_ptr, keyId_ptr, offlineKeyIdLen);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if (keyId_ptr != nullptr && strcmp(KeyId, "getKey") != 0) {
        free(keyId_ptr);
    }
    napi_create_int32(env, ret, &result);
    return result;
}
// add cases
static napi_value Test_CreateMediaKeySession_multi(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    int32_t sessionNum = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &sessionNum);
    MediaKeySession *drmKeySession[100] = {nullptr};
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    uint32_t count_create = 0;
    for (int i = 0; i < sessionNum; i++) {
        ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession[i]);
        CHECK_GOTO(ret2 != DRM_ERR_OK, EXIT1);
        count_create++;
    }
EXIT1:
    for (int i = 0; i < (count_create); i++) {
        ret4 = OH_MediaKeySession_Destroy(drmKeySession[i]);
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && (count_create == sessionNum) && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySession_ProcessOfflineReleaseResponse_multi(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    int32_t releaseNum = 0;

    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &releaseNum);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen); // 确保生成离线license
    Drm_ErrCode ret3 = DRM_ERR_INVALID_VAL;

    if (strcmp(judge_uuid(), CLEAR_PLAY) == 0) {
        uint8_t releaseResponseData[50] = OFFLINERESPONSE;
        int32_t responseLen = 50;
        for (int i = 0; i < releaseNum; i++) {
            ret3 = OH_MediaKeySession_ProcessOfflineReleaseResponse(drmKeySession, keyData, keyDataLen,
                                                                    releaseResponseData, responseLen);
        }
    } else {
        ret3 = DRM_ERR_OK;
    }
    Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret6 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_SetConfigurationString_multi(napi_env env, napi_callback_info info) {
    napi_value result;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetConfigurationString(drmKeySystem, "version", "4500000");
    Drm_ErrCode ret3 = OH_MediaKeySystem_SetConfigurationString(drmKeySystem, "version", "2.2");

    char outBuff[20] = {0};
    int32_t outBuffLen = 20;
    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;
    if (ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret4 = OH_MediaKeySystem_GetConfigurationString(drmKeySystem, "version", outBuff, outBuffLen);
        if (strncmp(outBuff, "2.2", outBuffLen) == 0) {
            ret4 = DRM_ERR_OK;
        } else {
            ret4 = DRM_ERR_INVALID_VAL;
        }
    }
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret3, &result);
    return result;
}

// add api
uint8_t Flag_SetCallback = 0;
Drm_ErrCode testMediaSystemSetCallBack(MediaKeySystem *mediaKeySystem, DRM_EventType eventType, uint8_t *drmInfo,
                                       int32_t infoLen, char *extra) {
    OH_LOG_DEBUG(LOG_APP, "testCL_testMediaSystemSetCallBack ok");
    Flag_SetCallback = 1;
    return DRM_ERR_OK;
}
static napi_value Test_MediaKeySystem_SetCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *sys_ptr = nullptr;
    OH_MediaKeySystem_Callback callback_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        sys_ptr = drmKeySystem;
    }
    if (0 != strcmp(callBack, " ")) {
        callback_ptr = &testMediaSystemSetCallBack;
    }
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetCallback(sys_ptr, callback_ptr); // DRM_ERR_OK; //  SDK12
    CHECK_PRINTF((ret2 != DRM_ERR_OK), ret2);
    // Trigger callback
    if (strcmp(judge_uuid(), CLEAR_PLAY) == 0) { // clearpaly直接申请设备证书，触发回调
        int retCert = getCertificate(drmKeySystem);
        CHECK_PRINTF((retCert != 0), retCert);

        Drm_ErrCode ret4 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
        if (ret4 == DRM_ERR_OK) {
            Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
            CHECK_PRINTF((ret5 != DRM_ERR_OK), ret5);
        }
        if ((ret2 == DRM_ERR_OK) && (callback_ptr != nullptr)) {
            ret2 = (Flag_SetCallback == 1) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
        }
    } else { // wiseplay手动删除证书，创建session失败，触发回调
        // triggering events: no provision then createSession failed
        DRM_CertificateStatus certStatus = CERT_STATUS_UNAVAILABLE;
        Drm_ErrCode ret3 = OH_MediaKeySystem_GetCertificateStatus(drmKeySystem, &certStatus);
        if (ret3 == DRM_ERR_OK && certStatus != CERT_STATUS_PROVISIONED) {
            Drm_ErrCode ret4 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &level, &drmKeySession);
            if (ret4 == DRM_ERR_OK) {
                Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
                CHECK_PRINTF((ret5 != DRM_ERR_OK), ret5);
            }
            if ((ret2 == DRM_ERR_OK) && (callback_ptr != nullptr)) {
                ret2 = (Flag_SetCallback == 1) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
            }
        }
    }
    Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
    Flag_SetCallback = 0; // clear flags
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret6 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
// session callBack
uint8_t Flag_SetSesEventCallback = 0;
uint8_t Flag_SetSesChangeCallback = 0;
Drm_ErrCode sessoinEventCallBackTest(MediaKeySession *mediaKeySessoin, DRM_EventType eventType, uint8_t *info,
                                     int32_t infoLen, char *extra) {
    OH_LOG_DEBUG(LOG_APP, "testCL_sessoinEventCallBackTest ok;eventType = %{public}d, infoLen = %{public}d", eventType,
                 infoLen);
    Flag_SetSesEventCallback = 1;
    return DRM_ERR_OK;
}
Drm_ErrCode sessoinKeyChangeCallBackTest(MediaKeySession *mediaKeySessoin, DRM_KeysInfo *keysInfo,
                                         bool hasNewGoodKeys) {
    OH_LOG_DEBUG(LOG_APP, "testCL_sessionKeyChangeCallBackTest ok;hasNewGoodKeys = %{public}d", hasNewGoodKeys);
    Flag_SetSesChangeCallback = 1;
    return DRM_ERR_OK;
}
static napi_value Test_MediaKeySession_SetCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);

    OH_MediaKeySession_Callback testCallback;
    memset(&testCallback, 0, sizeof(OH_MediaKeySession_Callback));
    testCallback.eventCallback = &sessoinEventCallBackTest;
    testCallback.keyChangeCallback = &sessoinKeyChangeCallBackTest;
    MediaKeySession *session_ptr = nullptr;
    OH_MediaKeySession_Callback *callback_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        session_ptr = drmKeySession;
    }
    if (0 != strcmp(callBack, " ")) {
        callback_ptr = &testCallback;
    }
    Drm_ErrCode ret4 = OH_MediaKeySession_SetCallback(session_ptr, callback_ptr);
    // triggering events: get license
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    int resLice = getLicense(drmKeySession, LICENSE_OFFLINE, keyData, &keyDataLen);
    if ((ret4 == DRM_ERR_OK) && (resLice == 0) && (callback_ptr != nullptr)) {
        ret4 = ((Flag_SetSesEventCallback == 1) || (Flag_SetSesChangeCallback == 1)) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
    Flag_SetSesChangeCallback = 0;
    Flag_SetSesEventCallback = 0;
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret6 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetMediaKeySystems(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    uint32_t count = DRM_PLUGIN_COUNT;
    DRM_MediaKeySystemDescription descriptions[DRM_PLUGIN_COUNT];
    memset(descriptions, 0, sizeof(descriptions));
    DRM_MediaKeySystemDescription *des_ptr = nullptr;
    uint32_t *count_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        des_ptr = descriptions;
    }
    if (0 != strcmp(callBack, " ")) {
        count_ptr = &count;
    }
    Drm_ErrCode ret = OH_MediaKeySystem_GetMediaKeySystems(des_ptr, count_ptr);
    if (ret == DRM_ERR_OK) {
        for (int i = 0; i < count; i++) {
            OH_LOG_DEBUG(LOG_APP, "testCL_GetMediaKeySystems, name[%{public}d] is %{public}s", i, descriptions[i].name);
            OH_LOG_DEBUG(LOG_APP, "testCL_GetMediaKeySystems, uuid[%{public}d] is %{public}s", i, descriptions[i].uuid);
        }
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"GetOfflineMediaKeyIds", nullptr, GetOfflineMediaKeyIds, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCertificateStatus", nullptr, GetCertificateStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_KeySystemSupported", nullptr, Test_KeySystemSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_KeySystemSupported2", nullptr, Test_KeySystemSupported2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_KeySystemSupported3", nullptr, Test_KeySystemSupported3, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_MediaKeySystem_Create", nullptr, Test_MediaKeySystem_Create, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_MediaKeySystem_SetConfigurationString", nullptr, Test_MediaKeySystem_SetConfigurationString, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetConfigurationString", nullptr, Test_MediaKeySystem_GetConfigurationString, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_SetConfigurationByteArray", nullptr, Test_MediaKeySystem_SetConfigurationByteArray,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetConfigurationByteArray", nullptr, Test_MediaKeySystem_GetConfigurationByteArray,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_SetMediaKeySystemCallback", nullptr, Test_MediaKeySystem_SetMediaKeySystemCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetStatistics", nullptr, Test_MediaKeySystem_GetStatistics, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_MediaKeySystem_GetMaxContentProtectionLevel", nullptr, Test_MediaKeySystem_GetMaxContentProtectionLevel,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMaxContentProtectionLevel", nullptr, GetMaxContentProtectionLevel,nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_MediaKeySystem_GenerateKeySystemRequest", nullptr, Test_MediaKeySystem_GenerateKeySystemRequest, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_ProcessKeySystemResponse", nullptr, Test_MediaKeySystem_ProcessKeySystemResponse, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetOfflineMediaKeyIds", nullptr, Test_MediaKeySystem_GetOfflineMediaKeyIds, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_Destroy", nullptr, Test_MediaKeySystem_Destroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_CreateMediaKeySession", nullptr, Test_CreateMediaKeySession, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Test_MediaKeySystem_GetCertificateStatus", nullptr, Test_MediaKeySystem_GetCertificateStatus, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_GenerateMediaKeyRequest", nullptr, Test_MediaKeySession_GenerateMediaKeyRequest, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_ProcessMediaKeyResponse", nullptr, Test_MediaKeySession_ProcessMediaKeyResponse, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_CheckMediaKeyStatus", nullptr, Test_MediaKeySession_CheckMediaKeyStatus, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_ClearMediaKeys", nullptr, Test_MediaKeySession_ClearMediaKeys, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_MediaKeySession_GenerateOfflineReleaseRequest", nullptr,
         Test_MediaKeySession_GenerateOfflineReleaseRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_ProcessOfflineReleaseResponse", nullptr,
         Test_MediaKeySession_ProcessOfflineReleaseResponse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_RestoreOfflineMediaKeys", nullptr, Test_MediaKeySession_RestoreOfflineMediaKeys, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_GetContentProtectionLevel", nullptr, Test_MediaKeySession_GetContentProtectionLevel,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_RequireSecureDecoderModule", nullptr, Test_MediaKeySession_RequireSecureDecoderModule,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySession_SetMediaKeySessionCallback", nullptr, Test_MediaKeySession_SetMediaKeySessionCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetOfflineMediaKeyStatus", nullptr, Test_MediaKeySystem_GetOfflineMediaKeyStatus, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_ClearOfflineMediaKeys", nullptr, Test_MediaKeySystem_ClearOfflineMediaKeys, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_CreateMediaKeySession_multi", nullptr, Test_CreateMediaKeySession_multi, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_MediaKeySession_ProcessOfflineReleaseResponse_multi", nullptr,
         Test_MediaKeySession_ProcessOfflineReleaseResponse_multi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_SetConfigurationString_multi", nullptr, Test_MediaKeySystem_SetConfigurationString_multi,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_SetCallback", nullptr, Test_MediaKeySystem_SetCallback, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_MediaKeySession_SetCallback", nullptr, Test_MediaKeySession_SetCallback, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_MediaKeySystem_GetMediaKeySystems", nullptr, Test_MediaKeySystem_GetMediaKeySystems, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }

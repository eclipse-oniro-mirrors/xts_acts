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
#include "native_drm_common.h"
#include "native_drm_err.h"
#include "native_mediakeysystem.h"
#include "native_mediakeysession.h"
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "capi_drm_log.h"

#define DATA_BUFF_LEN 10000
#define DATA_BLUESPONSE_LEN 139
#define PROVISION_DEFAULT_URL "http://default.com"
#define BLUE_AREA "com.clearplay.drm"
#define YELLOW_AREA "com.wiseplay.drm"
#define LICENSE_ONLINE 1
#define LICENSE_OFFLINE 0
#define REQUESTINFODATA                                                                                        \
    {                                                                                                          \
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35,        \
        0x9B, 0x9A, 0x41, 0xE8, 0xB8, 0x43, 0xDD, 0x3C, 0x6E, 0x72, 0xC4, 0x2C, 0x00, 0x00, 0x00, 0x6B,        \
        0x7B, 0x22, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x22, 0x3A, 0x22, 0x56, 0x31, 0x2E, 0x30,        \
        0x22, 0x2C, 0x22, 0x63, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x49, 0x44, 0x22, 0x3A, 0x22, 0x64,        \
        0x48, 0x4D, 0x74, 0x4D, 0x6A, 0x59, 0x30, 0x4C, 0x54, 0x45, 0x77, 0x4F, 0x44, 0x41, 0x74, 0x59,        \
        0x57, 0x56, 0x7A, 0x22, 0x2C, 0x22, 0x6B, 0x69, 0x64, 0x73, 0x22, 0x3A, 0x5B, 0x22, 0x47, 0x2B,        \
        0x45, 0x6B, 0x2F, 0x2B, 0x58, 0x6D, 0x55, 0x6B, 0x70, 0x42, 0x48, 0x51, 0x67, 0x58, 0x59, 0x57,        \
        0x51, 0x51, 0x49, 0x67, 0x3D, 0x3D, 0x22, 0x5D, 0x2C, 0x22, 0x65, 0x6E, 0x73, 0x63, 0x68, 0x65,        \
        0x6D, 0x61, 0x22, 0x3A, 0x22, 0x63, 0x62, 0x63, 0x31, 0x22, 0x7D                                       \
    }
#define OFFLINERESPONSE                                                                                        \
    {                                                                                                          \
        0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42,        \
        0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,        \
        0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67,        \
        0x3D, 0x3D                                                                                             \
    }
#define ONLINERESPONSE                                                                                         \
    {                                                                                                          \
        0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42,        \
        0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,        \
        0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67,        \
        0x3D, 0x3D                                                                                             \
    }
#define CHECK_RETURN(cond, ret) \
    do {                                                         \
        if ((cond)) {                                            \
            return ret;                                          \
        }                                                        \
    } while (0)
#define UNUSED_PARAMETER(P) (P)	
	
static int getHttp(const char *IPAddr, int port, const char *link, const char *inbuf, unsigned int inbufLen,
                   uint8_t *outbuf, unsigned int *outbufLen) {
    int sockfd, ret, i, h;
    struct sockaddr_in servaddr;
    char str1[DATA_BUFF_LEN], str[8];
    fd_set t_set1;
    struct timeval tv;
    // 创建套接字
    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        return -1;
    }
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(port);
    if (inet_pton(AF_INET, IPAddr, &servaddr.sin_addr) <= 0) {
        return -1;
    };
    if (connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
        return -1;
    }
    sprintf(str, "%d", inbufLen);
    memset(str1, 0, sizeof(str1));
    strcat(str1, "POST ");
    strcat(str1, link);
    strcat(str1, " HTTP/1.1\n");
    strcat(str1, "Host: ");
    strcat(str1, IPAddr);
    strcat(str1, "\n");
    strcat(str1, "Content-Type: application/json;charset=UTF-8\n");
    strcat(str1, "Content-Length: ");
    strcat(str1, str);
    strcat(str1, "\n\n");
    strcat(str1, inbuf);
    strcat(str1, "\r\n\r\n");
    ret = write(sockfd, str1, strlen(str1));
    if (ret < 0) {
        return -1;
    } else {
    }
    FD_ZERO(&t_set1);
    FD_SET(sockfd, &t_set1);

    while (1) {
        sleep(2);
        tv.tv_sec = 0;
        tv.tv_usec = 0;
        h = 0;
        h = select(sockfd + 1, &t_set1, NULL, NULL, &tv);
        if (h == 0) {
            continue;
        }
        if (h < 0) {
            close(sockfd);
            return -1;
        }
        if (h > 0) {
            memset(outbuf, 0, *outbufLen);
            i = read(sockfd, outbuf, *outbufLen);
            if (i == 0) {
                close(sockfd);
                return -1;
            } else {
                const char *contentLenStr = strstr(reinterpret_cast<const char *>(outbuf), "Content-Length: ");
                *outbufLen = atoi(contentLenStr + strlen("Content-Length: "));
                const char *headEndStr = strstr(contentLenStr, "\r\n\r\n");
                memcpy(outbuf, headEndStr + strlen("\r\n\r\n"), *outbufLen);
                goto _EXIT;
            }
        }
    }
_EXIT:
    close(sockfd);
    return 0;
}
void splitStringToIntArray(char* str,uint8_t *temp) { //,int *num
  int i = 0;
  char *p = str;
  char *q;
  while ((q = strchr(p, ',')) != NULL) {
    temp[i++] = atoi(p);
    p = q + 1;
  }  
  temp[i] = atoi(p);
  // *num = i + 1;
//  return temp;
}
static const char* judge_uuid() {
    bool isSupport = OH_MediaKeySystem_IsSupported(BLUE_AREA); 
    if(isSupport == 1) {
            return BLUE_AREA;
    } else {
            return YELLOW_AREA;
    }
}

int getLicense(MediaKeySession *mediaKeySession, char isOnline, uint8_t *keydata , int32_t *keylen){
    memset(keydata, 0, *keylen);
    DRM_MediaKeyRequestInfo requestInfo;
    memset(&requestInfo, 0, sizeof(DRM_MediaKeyRequestInfo));
    unsigned char testData[139] = REQUESTINFODATA;
    if(isOnline){
     requestInfo.type = MEDIA_KEY_TYPE_ONLINE;  
    }else{
     requestInfo.type = MEDIA_KEY_TYPE_OFFLINE; 
    }   
    requestInfo.initDataLen = sizeof(testData);    
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    memset(&requestData, 0, sizeof(DRM_MediaKeyRequest));
    Drm_ErrCode ret1 = OH_MediaKeySession_GenerateMediaKeyRequest(mediaKeySession,&requestInfo, &requestData);
    CHECK_RETURN(ret1==DRM_ERR_INVALID_VAL,-1);
	Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    uint8_t keyId[DATA_BUFF_LEN] = {0};
    int32_t keyIdLen = DATA_BUFF_LEN;
    if(strcmp(judge_uuid(), BLUE_AREA) == 0){
        if(isOnline){
            uint8_t responseData[DATA_BLUESPONSE_LEN] = ONLINERESPONSE;
            ret2 = OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession,responseData, DATA_BLUESPONSE_LEN, keyId, &keyIdLen);
        }else{
            uint8_t responseData[DATA_BLUESPONSE_LEN] = OFFLINERESPONSE; 
            ret2 = OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession,responseData, DATA_BLUESPONSE_LEN, keyId, &keyIdLen);
        }
    }else{
        uint8_t responseData[DATA_BUFF_LEN]={0};
        int32_t responseLen = DATA_BUFF_LEN;
        int ret3 = getHttp("192.168.50.59", 9528, "/getProvision", reinterpret_cast<const char *>(requestData.data), requestData.dataLen,
                  responseData, (unsigned int *)&responseLen);  
		CHECK_RETURN(ret3!=0,-1);			  
        ret2 = OH_MediaKeySession_ProcessMediaKeyResponse(mediaKeySession,responseData, responseLen, keyId, &keyIdLen);
    }
    CHECK_RETURN(ret2==DRM_ERR_INVALID_VAL,-1);	
    memcpy(keydata, keyId, keyIdLen);
    memcpy(keylen, &keyIdLen, sizeof(uint32_t));
	return 0;
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
    if(strcmp(uuid," ") != 0){
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
    if(strcmp(uuid," ") != 0){
        uuid_ptr = uuid;
    }
    char *mineType_ptr = nullptr;
    if(strcmp(uuid," ") != 0){
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
    if(strcmp(uuid," ") != 0){
        uuid_ptr = uuid;
    }
    char *mineType_ptr = nullptr;
    if(strcmp(uuid," ") != 0){
        mineType_ptr = mineType;
    }
    isSupport = OH_MediaKeySystem_IsSupported3(uuid_ptr, mineType_ptr,(DRM_ContentProtectionLevel)securityLevel); 
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
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uuidLen);
    uuid = new char[uuidLen + 1];
    napi_get_value_string_utf8(env, args[0], uuid, uuidLen + 1, &uuidLen);

    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inStringLen);
    inString = new char[inStringLen + 1];
    napi_get_value_string_utf8(env, args[1], inString, inStringLen + 1, &inStringLen);
    Drm_ErrCode ret1 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    if (strcmp(inString, " ") == 0) {
        ret1 = OH_MediaKeySystem_Create(uuid, nullptr);
        ret2 = DRM_ERR_OK;
    } else {
        ret1 = OH_MediaKeySystem_Create(uuid, &drmKeySystem);
        if (drmKeySystem == nullptr)
            ret1 = DRM_ERR_INVALID_VAL;
        ret2 = OH_MediaKeySystem_Destroy(drmKeySystem);
    }
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
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
    
    char outBuff[DATA_BUFF_LEN]={0};
    int32_t outBuffLen = DATA_BUFF_LEN;
    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    char *name_ptr = nullptr;
    if(strcmp(inString, " ")){
        name_ptr = inString;
    }
    char *value_ptr = nullptr;
    if(strcmp(inValue, " ")){
        value_ptr = inValue;
    }    
    if (!strcmp(inSys, " ")) {
        ret2 = OH_MediaKeySystem_SetConfigurationString(nullptr, name_ptr, value_ptr);
    }else {
        ret2 = OH_MediaKeySystem_SetConfigurationString(drmKeySystem, name_ptr, value_ptr);
    }
    if (ret2 == DRM_ERR_OK) {
        ret4 = OH_MediaKeySystem_GetConfigurationString(drmKeySystem, name_ptr, outBuff, outBuffLen);
        if(strncmp(outBuff, value_ptr,outBuffLen) == 0){
            ret4 = DRM_ERR_OK;
        }else{
            ret4 = DRM_ERR_INVALID_VAL;
        }
    } 
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
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
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t configNameLen = 0;
    char *configName = nullptr;
    size_t valueLen = 0;
    char *inValue = nullptr;
    int32_t valueBuffLen = 0;
    size_t expectValueLen = 0;
    char *expectValue = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;

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
    napi_get_value_int32(env, args[3], &valueBuffLen);
    napi_get_value_string_utf8(env, args[4], nullptr, 0, &expectValueLen);
    expectValue = new char[expectValueLen + 1];
    napi_get_value_string_utf8(env, args[4], expectValue, expectValueLen + 1, &expectValueLen);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);    
    char *name_ptr = nullptr;
    if (0 != strcmp(configName, " ")) {
        name_ptr = configName;
    }   
    const char *set_val = "100";
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;    
    if (0 == strcmp(expectValue, "set")) {
        ret2 = OH_MediaKeySystem_SetConfigurationString(drmKeySystem,name_ptr, set_val);
    }
    char *outValue = nullptr;
    char outBuff[DATA_BUFF_LEN];
    if (0 != strncmp(inValue, " ",valueLen)) {
        outValue = outBuff;
    }
    MediaKeySystem *system_ptr = nullptr; 
    if (strcmp(inSys, " ") != 0) {
        system_ptr = drmKeySystem;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_GetConfigurationString(system_ptr, name_ptr, outValue, valueBuffLen);
    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;   
    if(ret3 == DRM_ERR_OK){
     if(ret2 == DRM_ERR_OK){
         ret4 = (strncmp(outValue, set_val,strlen(set_val)) == 0) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
     }else{
         ret4 = (strncmp(outValue, expectValue,expectValueLen) == 0) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
     }       
    }
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK  && ret3 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret4 == DRM_ERR_OK ) { //
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
    napi_get_value_int32(env,args[3], &valueDataLen);

    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    char *name_ptr = nullptr;
    if (0 != strncmp(inString, " ",stringLen)) {
         name_ptr = inString;
    }
    uint8_t *data_ptr = nullptr;
    if (0 != strncmp(inValue, " ",valueLen)) {
        data_ptr = (uint8_t *)malloc(valueLen); 
        splitStringToIntArray(inValue,data_ptr);
    }  
    MediaKeySystem *system_ptr =nullptr; 
    if (0 != strncmp(inSys, " ",sysLen)){
        system_ptr = drmKeySystem;
    }
    uint8_t outValue[DATA_BUFF_LEN] = {0};
    int32_t outValueLen = DATA_BUFF_LEN;
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetConfigurationByteArray(system_ptr, name_ptr, data_ptr, valueDataLen);
    if (ret2 == DRM_ERR_OK) {
        ret4 = OH_MediaKeySystem_GetConfigurationByteArray(drmKeySystem, name_ptr, outValue, &outValueLen);
        ret4 = ( 0 == memcmp(outValue, data_ptr,valueDataLen)) ? DRM_ERR_OK:DRM_ERR_INVALID_VAL;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret3 == DRM_ERR_OK) { //
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if(data_ptr != nullptr){
        free(data_ptr);
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
    
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (0==strcmp(judge_uuid(), "com.clearplay.drm")){
        uint8_t valueData[10];
        memset(valueData, 0x55, 10);
        ret2 = OH_MediaKeySystem_SetConfigurationByteArray(drmKeySystem,configName, valueData, 10); // 蓝区没有默认值，需要先set；
    } else{
        ret2 = DRM_ERR_OK;
    }
    MediaKeySystem *system_ptr =  nullptr;
    if( 0!=strcmp(inSys, " ")){
        system_ptr = drmKeySystem;
    }
    const char *configName_ptr =  nullptr;
    if( 0!=strcmp(configName, " ")){
        configName_ptr = configName;
    }  
    uint8_t *value_ptr = nullptr;
    uint8_t valueData[DATA_BUFF_LEN]={0};
    if(0!= strcmp(value, " ")){
        value_ptr = valueData;
    }
    int32_t *valueLen_ptr = nullptr;
    int32_t valueLenData = DATA_BUFF_LEN;
    if (0!=strcmp(valueLenString, " ")) {
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
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    DRM_Statistics *statisticsData_ptr = nullptr;
    DRM_Statistics statisticsData;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &statisticsLen);
    statistics = new char[statisticsLen + 1];
    napi_get_value_string_utf8(env, args[1], statistics, statisticsLen + 1, &statisticsLen);

    if (strcmp(statistics, " ")) {
        statisticsData_ptr = &statisticsData;
    }
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if(!strcmp(inSys, " ")){
        ret2 = OH_MediaKeySystem_GetStatistics(nullptr, statisticsData_ptr);
    }else{
        ret2 = OH_MediaKeySystem_GetStatistics(drmKeySystem, statisticsData_ptr);
    }
    Drm_ErrCode ret4 = (statisticsData.statisticsCount == 4) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
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
    uint32_t expectLevel = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    DRM_ContentProtectionLevel securityLevel = CONTENT_PROTECTION_LEVEL_UNKNOWN;
    DRM_ContentProtectionLevel *level_ptr = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &levelLen);
    inLevel = new char[levelLen + 1];
    napi_get_value_string_utf8(env, args[1], inLevel, levelLen + 1, &levelLen);
    napi_get_value_uint32(env, args[2], &expectLevel);

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (strcmp(inLevel, " ") != 0) {
        level_ptr = &securityLevel;
    }
    if (strcmp(inSys, " ") == 0) {
        ret2 = OH_MediaKeySystem_GetMaxContentProtectionLevel(nullptr, level_ptr);
    } else {
        ret2 = OH_MediaKeySystem_GetMaxContentProtectionLevel(drmKeySystem, level_ptr);
    }
    Drm_ErrCode ret3 = ((uint32_t)securityLevel == expectLevel) ? DRM_ERR_OK : DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret4 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_CreateMediaKeySession(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t sessionLen = 0;
    char *inSession = nullptr;
    int32_t inLevel = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    Drm_ErrCode ret4 = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel *level_ptr = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_int32(env, args[1], &inLevel);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &sessionLen);
    inSession = new char[sessionLen + 1];
    napi_get_value_string_utf8(env, args[2], inSession, sessionLen + 1, &sessionLen);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if((0 !=strcmp(inSys, " "))){
        system_ptr = drmKeySystem;
    }
    if(inLevel == -1){
        level_ptr = nullptr;
    }else{
        level_ptr = (DRM_ContentProtectionLevel *)&inLevel;
    }
    if (0 == strcmp(inSession, " ")) {
        ret2 = OH_MediaKeySystem_CreateMediaKeySession(system_ptr, level_ptr, nullptr);
    } else {
        ret2 = OH_MediaKeySystem_CreateMediaKeySession(system_ptr, level_ptr, &drmKeySession);
    }
    if(drmKeySession != nullptr){
        ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
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
    int32_t defaultUrlLen= 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    
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

    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr= drmKeySystem;
    }   
    uint8_t *request_ptr = nullptr;
    uint8_t requestData[DATA_BUFF_LEN]={0};
    if((0 != strcmp(inRequestString, " "))){
        request_ptr = requestData;
    }
    int32_t *requestLen_ptr= nullptr;
    int32_t outRequestLen = 0;
    if((0 != strcmp(requestLenSting, " "))){
        requestLen_ptr  = &outRequestLen;
    }
    char *urlData_ptr =  nullptr;
    if ((0 != strcmp(defaultUrlSting, " "))) {
        urlData_ptr = defaultUrlSting;
    }

    Drm_ErrCode ret2 = OH_MediaKeySystem_GenerateKeySystemRequest(system_ptr,request_ptr, requestLen_ptr, urlData_ptr, defaultUrlLen);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK ) {
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
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t responseLen = 0;
    char *response = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    int32_t responseDataLen = 0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &responseLen);
    response = new char[responseLen + 1];
    napi_get_value_string_utf8(env, args[1], response, responseLen + 1, &responseLen);
    
    napi_get_value_int32(env, args[2], &responseDataLen);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr =  nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    uint8_t *responseData_ptr = nullptr;
    uint8_t requestData[DATA_BUFF_LEN] = {0};
    int32_t requestLen = DATA_BUFF_LEN;
    uint8_t responseData[DATA_BUFF_LEN] = {0};
    int32_t responseDataLen_out = DATA_BUFF_LEN;    
    char defaultURLData[DATA_BUFF_LEN] = {0};
    int32_t defaultURLDataLen = DATA_BUFF_LEN; 
    if (0 == strncmp(response, "genResponse",responseLen)) {
        Drm_ErrCode ret4 = OH_MediaKeySystem_GenerateKeySystemRequest(drmKeySystem, requestData,&requestLen, defaultURLData, defaultURLDataLen);
        if(ret4 == DRM_ERR_OK){
            int getRet = getHttp("192.168.50.59", 9528, "/getProvision", reinterpret_cast<const char *>(requestData), requestLen,
                                     responseData, (unsigned int *)&responseDataLen_out);   
            if(getRet == 0){
                responseData_ptr = responseData;
                if(responseDataLen > 0){
                     responseDataLen = responseDataLen_out;
                }
            }
        }
    }else if(0 != strncmp(response, " ",responseLen)){
         responseData_ptr = (uint8_t *)malloc(responseLen); 
         splitStringToIntArray(response,responseData_ptr);
    }else;
    Drm_ErrCode ret2 = OH_MediaKeySystem_ProcessKeySystemResponse(system_ptr, responseData_ptr, responseDataLen);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);

    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if((responseData_ptr != nullptr) && (strncmp(response, "genResponse",responseLen) != 0)){
        free(responseData_ptr);
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
    char *keySource= nullptr;    
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
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
    int keyres = getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
 
    MediaKeySystem *system_ptr = nullptr;
    if((0 != strcmp(inSys, " "))){
      system_ptr = drmKeySystem;
    }
    DRM_OfflineMediakeyIdArray *offlineMediaKeyIds_ptr = nullptr;
    DRM_OfflineMediakeyIdArray mediaKeyIds; 
    if((0 != strcmp(keyIds, " "))){
      offlineMediaKeyIds_ptr = &mediaKeyIds;
    }  
    Drm_ErrCode ret3 = OH_MediaKeySystem_GetOfflineMediaKeyIds(system_ptr, offlineMediaKeyIds_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret3 == DRM_ERR_OK && keyres == 0){
        ret3 = (offlineMediaKeyIds_ptr != nullptr)?DRM_ERR_OK:DRM_ERR_INVALID_VAL;
    }	
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
    MediaKeySystem *drmKeySystem = nullptr;
    
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
    
    DRM_ContentProtectionLevel level = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    MediaKeySession *mediaKeySession = nullptr;
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&level, &mediaKeySession);

    int32_t keyLen = 0;
    uint8_t *keyId_ptr = nullptr;
	uint8_t keyData[DATA_BUFF_LEN] = {0};
	int32_t keyDataLen = DATA_BUFF_LEN;    
    if(strncmp(keyIdString, "genKey",keyIdStringLen) == 0){
        getLicense(mediaKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
        keyId_ptr =  keyData;
        if((offlineMediaKeyIdLen != -1) && offlineMediaKeyIdLen != 0){
            keyLen = keyDataLen;
        } else{
           keyLen = offlineMediaKeyIdLen; 
        }
     }else if(strncmp(keyIdString, " ",keyIdStringLen) != 0){
        keyId_ptr = (uint8_t *)malloc(keyIdStringLen); 
        splitStringToIntArray(keyIdString,keyId_ptr);
        keyLen =  offlineMediaKeyIdLen;
     }else {
        keyLen =  offlineMediaKeyIdLen;
     }
    MediaKeySystem *system_ptr = nullptr;
    if((0 != strncmp(inSys, " ",sysLen))){
        system_ptr = drmKeySystem;
    }
    DRM_OfflineMediaKeyStatus status = OFFLINE_MEDIA_KEY_STATUS_UNKNOWN;
    DRM_OfflineMediaKeyStatus *status_ptr = nullptr;
    if((0 != strncmp(statusString, " ",statusStringLen))){
        status_ptr = &status;
    }
   Drm_ErrCode ret4 = OH_MediaKeySystem_GetOfflineMediaKeyStatus(system_ptr, keyId_ptr, keyLen, status_ptr);
    Drm_ErrCode ret5 = DRM_ERR_INVALID_VAL;
    if(ret4 == DRM_ERR_OK){
     if (status == (DRM_OfflineMediaKeyStatus)expectStatus){
         ret5 = DRM_ERR_OK;
     }       
    }
    Drm_ErrCode ret6 = OH_MediaKeySession_Destroy(mediaKeySession);
    Drm_ErrCode ret7 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK  && ret5 == DRM_ERR_OK  && ret6 == DRM_ERR_OK && ret7 == DRM_ERR_OK ) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if((keyId_ptr != nullptr) && strncmp(keyIdString, "genKey",keyIdStringLen) != 0){
        free(keyId_ptr);
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
    size_t keyIdStringLen= 0;
    int32_t offlineMediaKeyIdLen = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem= nullptr;

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
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&level, &mediaKeySession);
    
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }
    int32_t keyLen = 0;
    uint8_t *keyId_ptr = nullptr;
	uint8_t keyData[DATA_BUFF_LEN] = {0};
	int32_t keyDataLen = DATA_BUFF_LEN;	
    if(strncmp(keyIdString, "genKey",keyIdStringLen) == 0){
        getLicense(mediaKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
        keyId_ptr =  keyData;
        if((offlineMediaKeyIdLen != -1) && offlineMediaKeyIdLen != 0){
            keyLen = keyDataLen;
        } else{
           keyLen = offlineMediaKeyIdLen; 
        }
     }else if ((0 != strcmp(keyIdString, " "))) {
        keyId_ptr = (uint8_t *)malloc(keyIdStringLen); 
        splitStringToIntArray(keyIdString,keyId_ptr);
        keyLen = offlineMediaKeyIdLen;
    }else{
        keyLen =  offlineMediaKeyIdLen;
    }
    Drm_ErrCode ret3 = OH_MediaKeySystem_ClearOfflineMediaKeys(system_ptr, keyId_ptr, keyLen);
	Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(mediaKeySession);
    Drm_ErrCode ret4 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if(ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK){
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if((keyId_ptr != nullptr) && strncmp(keyIdString, "genKey",keyIdStringLen) != 0){
        free(keyId_ptr);
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_MediaKeySystem_GetCertificateStatus(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t sysLen = 0;
    char *inSys = nullptr;
    size_t StatusLen = 0;
    char *Status = nullptr;
    int32_t expectLicenseStatus = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &sysLen);
    inSys = new char[sysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, sysLen + 1, &sysLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &StatusLen);
    Status = new char[StatusLen + 1];
    napi_get_value_string_utf8(env, args[1], Status, StatusLen + 1, &StatusLen);
    napi_get_value_int32(env, args[2], &expectLicenseStatus);
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);  
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    }   
    DRM_CertificateStatus licenseStatus = CERT_STATUS_UNAVAILABLE;
    DRM_CertificateStatus *licenseStatus_ptr = nullptr;    
    if((0 != strcmp(Status, " "))){
        licenseStatus_ptr = &licenseStatus;
    }

    Drm_ErrCode ret2 = OH_MediaKeySystem_GetCertificateStatus(system_ptr, licenseStatus_ptr);
    if (licenseStatus != (DRM_CertificateStatus)expectLicenseStatus)
        ret2 = DRM_ERR_INVALID_VAL;
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
    Drm_ErrCode ret2 = DRM_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSysLen = 0;
    char *inSys = nullptr;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSysLen);
    inSys = new char[inSysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, inSysLen + 1, &inSysLen);
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    if (0==strcmp(inSys, " ")) {
        ret2 = OH_MediaKeySystem_Destroy(nullptr);
    } else if(0==strcmp(inSys, "twice")){
        ret2 = OH_MediaKeySystem_Destroy(drmKeySystem);
        ret2 = OH_MediaKeySystem_Destroy(drmKeySystem);
    }else {
        ret2 = OH_MediaKeySystem_Destroy(drmKeySystem);
    }
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
Drm_ErrCode TestSystemCallBack(DRM_EventType eventType, uint8_t *eventInfo,int32_t infoLen, char *extra) {
    return DRM_ERR_OK;
}
static napi_value Test_MediaKeySystem_SetMediaKeySystemCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSysLen = 0;
    char *inSys = nullptr;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSysLen);
    inSys = new char[inSysLen + 1];
    napi_get_value_string_utf8(env, args[0], inSys, inSysLen + 1, &inSysLen);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    MediaKeySystem *system_ptr = nullptr;
    if ((0 != strcmp(inSys, " "))) {
        system_ptr = drmKeySystem;
    } 
    Drm_ErrCode ret2 = OH_MediaKeySystem_SetMediaKeySystemCallback(system_ptr, TestSystemCallBack);
    Drm_ErrCode ret3 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK) {
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
 
    unsigned char testData[139] = {
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35, 0x9B, 0x9A,
        0x41, 0xE8, 0xB8, 0x43, 0xDD, 0x3C, 0x6E, 0x72, 0xC4, 0x2C, 0x00, 0x00, 0x00, 0x6B, 0x7B, 0x22, 0x76, 0x65,
        0x72, 0x73, 0x69, 0x6F, 0x6E, 0x22, 0x3A, 0x22, 0x56, 0x31, 0x2E, 0x30, 0x22, 0x2C, 0x22, 0x63, 0x6F, 0x6E,
        0x74, 0x65, 0x6E, 0x74, 0x49, 0x44, 0x22, 0x3A, 0x22, 0x64, 0x48, 0x4D, 0x74, 0x4D, 0x6A, 0x59, 0x30, 0x4C,
        0x54, 0x45, 0x77, 0x4F, 0x44, 0x41, 0x74, 0x59, 0x57, 0x56, 0x7A, 0x22, 0x2C, 0x22, 0x6B, 0x69, 0x64, 0x73,
        0x22, 0x3A, 0x5B, 0x22, 0x47, 0x2B, 0x45, 0x6B, 0x2F, 0x2B, 0x58, 0x6D, 0x55, 0x6B, 0x70, 0x42, 0x48, 0x51,
        0x67, 0x58, 0x59, 0x57, 0x51, 0x51, 0x49, 0x67, 0x3D, 0x3D, 0x22, 0x5D, 0x2C, 0x22, 0x65, 0x6E, 0x73, 0x63,
        0x68, 0x65, 0x6D, 0x61, 0x22, 0x3A, 0x22, 0x63, 0x62, 0x63, 0x31, 0x22, 0x7D};
    DRM_MediaKeyRequestInfo requestInfo;
    requestInfo.optionsCount = 1;
    strcpy(requestInfo.optionName[0], "optionalDataName");
    strcpy(requestInfo.optionData[0], "optionalDataValue");
    if ((0 == strcmp(infoString, "err_type"))) {
        requestInfo.type = MEDIA_KEY_TYPE_OFFLINE;
    } else {
        requestInfo.type = MEDIA_KEY_TYPE_ONLINE;
    }
    if ((0 == strcmp(infoString, "err_data"))) {
        memset(requestInfo.initData, 0x55, sizeof(testData));
    }else{
        memcpy(requestInfo.initData, testData, sizeof(testData));
    }
    if ((0 == strcmp(infoString, "err_dataLen"))) {
        requestInfo.initDataLen = 10;
    } else {
        requestInfo.initDataLen = sizeof(testData);
    }
    if ((0 == strcmp(infoString, "err_mimeType"))) {
        memcpy(requestInfo.mimeType, "111/222222", sizeof("111/222222"));
    } else {
        memcpy(requestInfo.mimeType, "video/mp4", sizeof("video/mp4"));
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
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel , &drmKeySession);
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
    
    DRM_MediaKeyRequestInfo requestInfo;
    memset(&requestInfo, 0, sizeof(DRM_MediaKeyRequestInfo));
    unsigned char testData[139] = REQUESTINFODATA;
    requestInfo.type = MEDIA_KEY_TYPE_ONLINE;
    requestInfo.initDataLen = sizeof(testData);    
    requestInfo.optionsCount = 1;
    memcpy(requestInfo.mimeType, (char *)"video/mp4", sizeof("video/mp4"));
    memcpy(requestInfo.initData, testData, sizeof(testData));
    memcpy(requestInfo.optionName[0], (char *)"optionalDataName", sizeof("optionalDataName"));
    memcpy(requestInfo.optionData[0], (char *)"optionalDataValue", sizeof("optionalDataValue"));
    DRM_MediaKeyRequest requestData;
    memset(&requestData, 0, sizeof(DRM_MediaKeyRequest));
    Drm_ErrCode ret6 = OH_MediaKeySession_GenerateMediaKeyRequest(drmKeySession,&requestInfo, &requestData); 
    
    MediaKeySession *session_ptr = nullptr;
    if((0 != strcmp(inSession, " "))){
        session_ptr = drmKeySession;
    }
    uint8_t *response_ptr = nullptr;
    if(strcmp(inResponseString, "genResponse") == 0){
        if(strcmp(judge_uuid(), BLUE_AREA) == 0){
           uint8_t responseData[DATA_BLUESPONSE_LEN] = ONLINERESPONSE;
           response_ptr = responseData;
           if ((responseLen != -1) && (responseLen != 0)) {
                responseLen = DATA_BLUESPONSE_LEN;
            }             
        }else{
            uint8_t responseData[DATA_BUFF_LEN]={0};
            int32_t responseLenOut = DATA_BUFF_LEN;            
            getHttp("192.168.50.59", 9528, "/getProvision", reinterpret_cast<const char *>(requestData.data), requestData.dataLen,
                      responseData, (unsigned int *)&responseLenOut);
            response_ptr = responseData;
            if((responseLen != -1) && (responseLen != 0)){
                responseLen = responseLenOut;
            }            
        }
    }else if (strcmp(inResponseString, " ") != 0) {
        response_ptr = (uint8_t *)malloc(inResponseStringLen); 
        splitStringToIntArray(inResponseString,response_ptr);
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
    Drm_ErrCode ret3 = OH_MediaKeySession_ProcessMediaKeyResponse(session_ptr, response_ptr, responseLen, keyIds_ptr, keyIdLen_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret6 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if((response_ptr != nullptr) && (strcmp(inResponseString, "genResponse") != 0)){
        free(response_ptr);
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
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;
    for(int i=0; i<licenseNum;i++){
        getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license     
    }
    MediaKeySession *sessoin_ptr  = nullptr;
    DRM_MediaKeyStatus mediaKeyStatus;
    DRM_MediaKeyStatus *mediaKeyStatus_ptr = nullptr;
    if(0 !=strcmp(inSession, " ")){
        sessoin_ptr = drmKeySession;
    }
    if (0 != strcmp(inStatus, " ")) {
        mediaKeyStatus_ptr = &mediaKeyStatus;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_CheckMediaKeyStatus(sessoin_ptr, mediaKeyStatus_ptr);
    if(ret3 == DRM_ERR_OK){
        if(licenseNum != 0){
            ret3 = (mediaKeyStatus.statusCount == 0)?DRM_ERR_INVALID_VAL:DRM_ERR_OK;
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
    getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
    MediaKeySession *session = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session = drmKeySession;
    }    
    Drm_ErrCode ret3 = OH_MediaKeySession_ClearMediaKeys(session);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) {
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret ,&result);
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
    if(strcmp(KeyIdString, "genKey") == 0){
        getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
        KeyId_ptr = keyData;
        if(offlineKeyIdLen > 0){
            offlineKeyIdLen = keyDataLen;
        }
    }else if (0 != strcmp(KeyIdString, " ")) {
        KeyId_ptr = (uint8_t *)malloc(KeyIdStringLen);
        splitStringToIntArray(KeyIdString,KeyId_ptr);
    }   
    uint8_t data[DATA_BUFF_LEN]={0};
    uint8_t *releaseRequest_ptr = nullptr;
    if (0 != strcmp(requestString, " ")){
        releaseRequest_ptr = data;
    }
    int32_t releaseRequestLen = DATA_BUFF_LEN;
    int32_t *releaseRequestLen_ptr = nullptr;
    if (0 != strcmp(requestLenString, " ")){
        releaseRequestLen_ptr = &releaseRequestLen;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_GenerateOfflineReleaseRequest(session_ptr, KeyId_ptr, offlineKeyIdLen,releaseRequest_ptr, releaseRequestLen_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK ){
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if((KeyId_ptr != nullptr) && (strcmp(KeyIdString, "genKey") != 0)){
        free(KeyId_ptr);
    }
    napi_create_int32(env,ret, &result);
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
    if(strcmp(KeyId, "genKey") == 0){
        getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if(offlineKeyIdLen > 0){
            offlineKeyIdLen = keyDataLen;
        }
    }else if (0 != strcmp(KeyId, " ")) {
         keyId_ptr = (uint8_t *)malloc(KeyIdLen);
         splitStringToIntArray(KeyId,keyId_ptr);
     }  
     uint8_t *releaseResponse_ptr = nullptr;
     if (0 != strcmp(releaseResponse, " ")) {
        releaseResponse_ptr = (uint8_t *)malloc(releaseResponseLen);
        splitStringToIntArray(releaseResponse,releaseResponse_ptr);
     }      
    Drm_ErrCode ret3 = OH_MediaKeySession_ProcessOfflineReleaseResponse(session_ptr, keyId_ptr, offlineKeyIdLen,releaseResponse_ptr,responseLen);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK ) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    if(keyId_ptr != nullptr && strcmp(KeyId, "genKey") != 0){
        free(keyId_ptr);
    }
    if(releaseResponse_ptr != nullptr){
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
    if(strcmp(KeyId, "getKey") == 0){
        getLicense(drmKeySession, LICENSE_OFFLINE,keyData,&keyDataLen); // 确保生成离线license
        keyId_ptr = keyData;
        if(offlineKeyIdLen > 0){
            offlineKeyIdLen = keyDataLen;
        }
   }else if (0 != strcmp(KeyId, " ")) {
        keyId_ptr = (uint8_t *)malloc(KeyIdLen);
        splitStringToIntArray(KeyId,keyId_ptr);
    }else;  
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
    if(keyId_ptr != nullptr && strcmp(KeyId, "getKey") != 0){
        free(keyId_ptr);
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
    if (outLevel != sessionLevel) {
        ret3 = DRM_ERR_INVALID_VAL;
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
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_ENHANCED_HW_CRYPTO;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel,&drmKeySession);   
    MediaKeySession *session = nullptr;
    if (0 != strcmp(inSession, " ")) {
        session = drmKeySession;
    }
    char *mineType_ptr = nullptr;
    if (0 != strcmp(mimeType, " ")) {
        mineType_ptr = mimeType;
    }     
    bool *status_ptr= nullptr;
    bool outStatus = 0;
    if (0 != strcmp(statusString, " ")) {
        status_ptr = &outStatus;
    }
    Drm_ErrCode ret3 = OH_MediaKeySession_RequireSecureDecoderModule(session,mineType_ptr , status_ptr);
    Drm_ErrCode ret6 = DRM_ERR_INVALID_VAL;
    if (outStatus == expectStatus)
        ret6 = DRM_ERR_OK;
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK && ret6 == DRM_ERR_OK) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
Drm_ErrCode TestSessionEventCallBack(DRM_EventType eventType, uint8_t *info, int32_t infoLen, char *extra) {
    return DRM_ERR_OK;
}
Drm_ErrCode TestSessionKeyChangeCallback(DRM_KeysInfo *keysInfo, bool newKeysAvailable){ return DRM_ERR_OK; }
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
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel,&drmKeySession);
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
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret3 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK ) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
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
        {"Test_MediaKeySystem_GenerateKeySystemRequest", nullptr, Test_MediaKeySystem_GenerateKeySystemRequest, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_ProcessKeySystemResponse", nullptr, Test_MediaKeySystem_ProcessKeySystemResponse, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_GetOfflineMediaKeyIds", nullptr, Test_MediaKeySystem_GetOfflineMediaKeyIds, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_MediaKeySystem_Destroy", nullptr, Test_MediaKeySystem_Destroy, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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

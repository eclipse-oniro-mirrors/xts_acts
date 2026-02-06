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

#include "native_common.h"
#include "UdmfTest.h"
#include "napi/native_api.h"
#include <database/udmf/udmf.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <string>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/udmf_err_code.h>

int g_invalidParamCode = 20400001;
int g_err = 20400000;

void AddUdmfTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testDestroyInvalidParam", nullptr, TestDestroyInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testAddFileUriInvalidParam", nullptr, TestAddFileUriInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testAddFileUriSuccess", nullptr, TestAddFileUriSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testAddPixelMapInvalidParam", nullptr, TestAddPixelMapInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testAddPixelMapSuccess", nullptr, TestAddPixelMapSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetGeneralEntryInvalidParam", nullptr, TestGetGeneralEntryInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetPlainTextError", nullptr, testGetPlainTextError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetHyperlinkError", nullptr, TestGetHyperlinkError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testGetHtmlError", nullptr, TestGetHtmlError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetAppItemInvalidParam", nullptr, TestGetAppItemInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetAppItemError", nullptr, TestGetAppItemError, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddUdmfTest(std::vector<napi_property_descriptor> &descData)
{
    AddUdmfTest1(descData);
    descData.push_back({"testSetProviderInvalidParam", nullptr, TestSetProviderInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetVisibilitySuccess", nullptr, TestGetVisibilitySuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testSetVisibilityInvalidParam", nullptr, TestSetVisibilityInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testSetVisibilitySuccess", nullptr, TestSetVisibilitySuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetUnifiedDataError", nullptr, TestGetUnifiedDataError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGetUnifiedDataByOptionsError", nullptr, TestGetUnifiedDataByOptionsError, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testSetUnifiedDataError", nullptr, TestSetUnifiedDataError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testUpdateUnifiedDataError", nullptr, TestUpdateUnifiedDataError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testDeleteUnifiedDataError", nullptr, TestDeleteUnifiedDataError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testUdmfOptionsGetVisibilityProcess", nullptr, TestUdmfOptionsGetVisibilityProcess, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testUdmfOptionsGetVisibilityAll", nullptr, TestUdmfOptionsGetVisibilityAll, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testUdmfProgressInfoGetStatus", nullptr, TestUdmfProgressInfoGetStatus, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testUdmfSkip", nullptr, TestUDMFSkip, nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void* GetDataCallbackFunc(void* context, const char* type)
{
    auto plainText = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetAbstract(plainText, "doing something");
    OH_UdsPlainText_SetContent(plainText, "doing something");
    return plainText;
}

static void FinalizeFunc(void* context) {};

void DataProgressCallback(OH_Udmf_ProgressInfo* progressInfo, OH_UdmfData* data)
{
    int resultRet = -1;
    bool resultUdmf = OH_UdmfData_HasType(data, UDMF_META_GENERAL_FILE_URI);
    if (resultUdmf) {
        unsigned int recordsCount = 0;
        OH_UdmfRecord** records = OH_UdmfData_GetRecords(data, &recordsCount);
        int returnStatus;
        for (int i = 0; i < recordsCount; i++) {
            OH_UdsFileUri* imageValue = OH_UdsFileUri_Create();
            returnStatus = OH_UdmfRecord_GetFileUri(records[i], imageValue);
            const char* fileUri = OH_UdsFileUri_GetFileUri(imageValue);
            OH_UdsFileUri_Destroy(imageValue);
        }
    }
    OH_UdmfProgressInfo_GetProgress(progressInfo);
    int ret = OH_UdmfProgressInfo_GetStatus(progressInfo);
    if (ret == Udmf_ListenerStatus::UDMF_FINISHED) {
        resultRet = Udmf_ListenerStatus::UDMF_FINISHED;
    } else if (ret == Udmf_ListenerStatus::UDMF_PROCESSING) {
        resultRet = Udmf_ListenerStatus::UDMF_PROCESSING;
    } else if (ret == Udmf_ListenerStatus::UDMF_CANCELED) {
        resultRet = Udmf_ListenerStatus::UDMF_CANCELED;
    } else if (ret == Udmf_ListenerStatus::UDMF_INNER_ERROR) {
        resultRet = Udmf_ListenerStatus::UDMF_INNER_ERROR;
    } else if (ret == Udmf_ListenerStatus::UDMF_INVALID_PARAMETERS) {
        resultRet = Udmf_ListenerStatus::UDMF_INVALID_PARAMETERS;
    } else if (ret == Udmf_ListenerStatus::UDMF_DATA_NOT_FOUND) {
        resultRet = Udmf_ListenerStatus::UDMF_DATA_NOT_FOUND;
    } else if (ret == Udmf_ListenerStatus::UDMF_SYNC_FAILED) {
        resultRet = Udmf_ListenerStatus::UDMF_SYNC_FAILED;
    } else if (ret == Udmf_ListenerStatus::UDMF_COPY_FILE_FAILED) {
        resultRet = Udmf_ListenerStatus::UDMF_COPY_FILE_FAILED;
    }
}

napi_value TestDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecordProvider* provider = nullptr;
    
    int ret = OH_UdmfRecordProvider_Destroy(provider);

    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    
    return result;
}

napi_value TestAddFileUriInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record = nullptr;
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    const char *fileUriPath = "./resources/base/media/icon.png";

    OH_UdsFileUri_SetFileUri(fileUri, fileUriPath);

    int ret = OH_UdmfRecord_AddFileUri(record, fileUri);

    OH_UdsFileUri_Destroy(fileUri);

    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    return result;
}

napi_value TestAddFileUriSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    const char *fileUriPath = "./resources/base/media/icon.png";

    OH_UdsFileUri_SetFileUri(fileUri, fileUriPath);

    int ret = OH_UdmfRecord_AddFileUri(record, fileUri);

    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_OK ? 0 : 1, &result);
    return result;
}

napi_value TestAddPixelMapInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdsPixelMap *pixelMap = OH_UdsPixelMap_Create();
    uint8_t data [500];
    int dataSize = 500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNative;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmapNative);

    OH_UdsPixelMap_SetPixelMap(pixelMap, pixelmapNative);

    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    int ret = OH_UdmfRecord_AddPixelMap(nullptr, pixelMap);
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    return result;
}

napi_value TestAddPixelMapSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdsPixelMap *pixelMap = OH_UdsPixelMap_Create();
    uint8_t data [500];
    int dataSize = 500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNative;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmapNative);

    OH_UdsPixelMap_SetPixelMap(pixelMap, pixelmapNative);

    OH_UdmfRecord *udmfRecord = OH_UdmfRecord_Create();
    int ret = OH_UdmfRecord_AddPixelMap(udmfRecord, pixelMap);
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_OK ? 0 : 1, &result);
    return result;
}

napi_value TestGetGeneralEntryInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record = nullptr;
    
    char typeId[] = "test_type";
    unsigned char *entry;
    unsigned int count = 0;
    
    int ret = OH_UdmfRecord_GetGeneralEntry(record, typeId, &entry, &count);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    return result;
}

napi_value testGetPlainTextError(napi_env env, napi_callback_info info)
{
    napi_value result;
    //新建UDMF记录
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    char url[] = "";
    OH_UdsHyperlink_SetUrl(hyperlink1, url);
    int addRes = OH_UdmfRecord_AddHyperlink(record, hyperlink1);
    
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    
    int ret = OH_UdmfRecord_GetPlainText(record, plainText);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsHyperlink_Destroy(hyperlink1);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

napi_value TestGetHyperlinkError(napi_env env, napi_callback_info info)
{
    napi_value result;
    //新建UDMF记录
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    int addRes = OH_UdmfRecord_AddPlainText(record, plainText);
    
    OH_UdsHyperlink *hyperlink1 = OH_UdsHyperlink_Create();
    
    int ret = OH_UdmfRecord_GetHyperlink(record, hyperlink1);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsHyperlink_Destroy(hyperlink1);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

napi_value TestGetHtmlError(napi_env env, napi_callback_info info)
{
    napi_value result;
    //新建UDMF记录
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    int addRes = OH_UdmfRecord_AddPlainText(record, plainText);
    
    OH_UdsHtml *html1 = OH_UdsHtml_Create();
    
    int ret = OH_UdmfRecord_GetHtml(record, html1);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsHtml_Destroy(html1);
    OH_UdsPlainText_Destroy(plainText);
    return result;
}

napi_value TestGetAppItemInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsAppItem *appItem1 = OH_UdsAppItem_Create();
    char name[] = "appItem";
    
    OH_UdsAppItem_SetName(appItem1, name);
    OH_UdmfRecord_AddAppItem(record1, appItem1);
    
    OH_UdsAppItem *appItem2 = OH_UdsAppItem_Create();
    
    int ret = OH_UdmfRecord_GetAppItem(nullptr, appItem2);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsAppItem_Destroy(appItem1);
    OH_UdsAppItem_Destroy(appItem2);
    return result;
}

napi_value TestGetAppItemError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record1 = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText1 = OH_UdsPlainText_Create();
    char context[] = "hello";
    
    OH_UdsPlainText_SetContent(plainText1, context);
    OH_UdmfRecord_AddPlainText(record1, plainText1);
    
    OH_UdsAppItem *appItem2 = OH_UdsAppItem_Create();
    
    int ret = OH_UdmfRecord_GetAppItem(record1, appItem2);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfRecord_Destroy(record1);
    OH_UdsPlainText_Destroy(plainText1);
    OH_UdsAppItem_Destroy(appItem2);
    return result;
}

napi_value TestSetProviderInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfRecordProvider* provider = OH_UdmfRecordProvider_Create();
    
    int num = 1;
    void *context = &num;
    
    OH_UdmfRecordProvider_SetData(provider, content, GetDataCallbackFunc, FinalizeFunc);
    
    const char* types[3] = { "general.plain-text", "general.hyperlink", "general.html" };
    int count = 3;
    int ret = OH_UdmfRecord_SetProvider(nullptr, types, count, provider);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecordProvider_Destroy(provider);
    return result;
}

napi_value TestGetVisibilitySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    OH_UdmfOptions *pThis = OH_UdmfOptions_Create();
    Udmf_Visibility visibility = UDMF_ALL;
    OH_UdmfOptions_SetVisibility(pThis, visibility);
    
    int ret = OH_UdmfOptions_GetVisibility(pThis);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_OK ? 0 : 1, &result);
    OH_UdmfOptions_Destroy(pThis);
    return result;
}

napi_value TestSetVisibilityInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfOptions *pThis = nullptr;
    Udmf_Visibility visibility = UDMF_ALL;
    int ret = OH_UdmfOptions_SetVisibility(pThis, visibility);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode : 1, &result);
    return result;
}

napi_value TestSetVisibilitySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfOptions *pThis = OH_UdmfOptions_Create();
    Udmf_Visibility visibility = UDMF_ALL;
    int ret = OH_UdmfOptions_SetVisibility(pThis, visibility);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_OK ? 0 : 1, &result);
    return result;
}

napi_value TestGetUnifiedDataError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    char content[] = "hello world";
    OH_UdsPlainText_SetContent(plainText, content);
    OH_UdmfRecord_AddPlainText(record, plainText);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[256];
    unsigned int keyLen = 256;
    OH_Udmf_SetUnifiedData(intention, udmfUnifiedData, key, keyLen);
    OH_UdmfData *readUnifiedData = OH_UdmfData_Create();
    int ret = OH_Udmf_GetUnifiedData(key, intention, readUnifiedData);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdsPlainText_Destroy(plainText);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdmfData_Destroy(readUnifiedData);
    return result;
}

napi_value TestGetUnifiedDataByOptionsError(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[256];
    unsigned int keyLen = 256;
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, keyLen);
    
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    
    unsigned dataSize = 1;
    OH_UdmfData* dataArray1 = nullptr;
    int ret = OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return result;
}

napi_value TestSetUnifiedDataError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdmfData* udmfData = OH_UdmfData_Create();
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    OH_UdsFileUri* fileUri = OH_UdsFileUri_Create();

    const char *restrictedUri = "/proc/sys/kernel/hostname";
    OH_UdsFileUri_SetFileUri(fileUri, restrictedUri);
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_HYPERLINK);
    
    OH_UdmfRecord_AddFileUri(record, fileUri);
    
    Udmf_Intention intention = UDMF_INTENTION_DRAG;
    char key[513];
    
    int ret = OH_Udmf_SetUnifiedData(intention, udmfData, key, 512);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);

    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfData);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

napi_value TestUpdateUnifiedDataError(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    OH_UdmfData_AddRecord(udmfUnifiedData, record);
    
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_DATA_HUB;
    OH_UdmfOptions_SetIntention(options, testIntention);
    
    char key[UDMF_KEY_BUFFER_LEN];
    int setRes = OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    
    std::string uri2 = "https://new/uri/path.jpg";
    OH_UdmfData *udmfUnifiedData2 = OH_UdmfData_Create();
    OH_UdmfRecord *record2 = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri2 = OH_UdsFileUri_Create();
    
    OH_UdsFileUri_SetFileUri(fileUri2, uri2.c_str());
    OH_UdsFileUri_SetFileType(fileUri2, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record2, fileUri2);

    OH_UdmfOptions* options2 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options2, testIntention);
    OH_UdmfOptions_SetKey(options2, key); // 指定要更新的key
    
    int ret = OH_Udmf_UpdateUnifiedData(options2, udmfUnifiedData2);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    OH_UdsFileUri_Destroy(fileUri2);
    OH_UdmfRecord_Destroy(record2);
    OH_UdmfData_Destroy(udmfUnifiedData2);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options2);
    return result;
}

napi_value TestDeleteUnifiedDataError(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string uri = "https://xxx/xx/xx.jpg";
    OH_UdmfData *udmfUnifiedData = OH_UdmfData_Create();
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsFileUri *fileUri = OH_UdsFileUri_Create();
    
    OH_UdsFileUri_SetFileUri(fileUri, uri.c_str());
    OH_UdsFileUri_SetFileType(fileUri, UDMF_META_IMAGE);
    OH_UdmfRecord_AddFileUri(record, fileUri);
    
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    Udmf_Intention testIntention = UDMF_INTENTION_PICKER;
    OH_UdmfOptions_SetIntention(options, testIntention);
    char key[UDMF_KEY_BUFFER_LEN];
    OH_Udmf_SetUnifiedDataByOptions(options, udmfUnifiedData, key, UDMF_KEY_BUFFER_LEN);
    
    OH_UdmfOptions* options1 = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetIntention(options1, testIntention);
    OH_UdmfOptions_SetKey(options1, key);
    
    unsigned dataSize = 1;
    OH_UdmfData* dataArray1 = nullptr;
    OH_Udmf_GetUnifiedDataByOptions(options1, &dataArray1, &dataSize);
    
    unsigned int dataSize1 = 1;
    OH_UdmfData* dataArray2 = nullptr;
    int ret = OH_Udmf_DeleteUnifiedData(options1, &dataArray2, &dataSize1);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_ERR ? g_err : 1, &result);
    OH_UdmfOptions_Destroy(options);
    OH_UdmfOptions_Destroy(options1);
    OH_UdsFileUri_Destroy(fileUri);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(udmfUnifiedData);
    return result;
}

napi_value TestUdmfOptionsGetVisibilityProcess(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetVisibility(options, UDMF_OWN_PROCESS);
    Udmf_Visibility getVisibility = OH_UdmfOptions_GetVisibility(options);
    napi_value result;
    if (getVisibility == UDMF_OWN_PROCESS) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestUdmfOptionsGetVisibilityAll(napi_env env, napi_callback_info info)
{
    OH_UdmfOptions* options = OH_UdmfOptions_Create();
    OH_UdmfOptions_SetVisibility(options, UDMF_ALL);
    Udmf_Visibility getVisibility = OH_UdmfOptions_GetVisibility(options);
    napi_value result;
    if (getVisibility == UDMF_ALL) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestUdmfProgressInfoGetStatus(napi_env env, napi_callback_info info)
{
    const char* destUri = "file://com.acts.actsudmftest/data/storage/el2/distributedfiles/";
    OH_Udmf_DataProgressListener dataProgressListener = DataProgressCallback;
    OH_UdmfDataLoadInfo *info2 = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetType(info2, "general.file");
    unsigned int recordCount = 100;
    OH_UdmfDataLoadInfo_SetRecordCount(info2, recordCount);
    OH_UdmfGetDataParams* params = OH_UdmfGetDataParams_Create();
    OH_UdmfGetDataParams_SetDestUri(params, destUri);
    OH_UdmfGetDataParams_SetFileConflictOptions(params, Udmf_FileConflictOptions::UDMF_OVERWRITE);
    OH_UdmfGetDataParams_SetProgressIndicator(params, Udmf_ProgressIndicator::UDMF_DEFAULT);
    OH_UdmfGetDataParams_SetAcceptableInfo(params, info2);
    OH_UdmfGetDataParams_SetDataProgressListener(params, dataProgressListener);
    OH_UdmfGetDataParams_Destroy(params);
    napi_value result;
    int ret = -1;
    if (params) {
        ret = 0;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestUDMFSkip(napi_env env, napi_callback_info info)
{
    OH_UdmfGetDataParams *param = OH_UdmfGetDataParams_Create();
    Udmf_ProgressIndicator progress = Udmf_ProgressIndicator::UDMF_NONE;
    OH_UdmfGetDataParams_SetProgressIndicator(param, progress);
    OH_UdmfGetDataParams_SetDestUri(param, "file://com.acts.actsudmftest/data/storage/el2/distributedfiles/");
    Udmf_FileConflictOptions opt = Udmf_FileConflictOptions::UDMF_SKIP;
    OH_UdmfGetDataParams_SetFileConflictOptions(param, opt);

    OH_Udmf_DataProgressListener dataProgressListener = [](OH_Udmf_ProgressInfo *progressInfo, OH_UdmfData *data) {
        if (data == nullptr) {
            return;
        }
        unsigned int count = 0;
        OH_UdmfData_GetRecords(data, &count);
    };
    OH_UdmfGetDataParams_SetDataProgressListener(param, dataProgressListener);
    int ret = -1;
    if (param) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
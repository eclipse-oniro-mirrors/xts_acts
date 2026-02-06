/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
 
#include "include/AudioResourceManagerTest.h"
const std::string FileRecourceManager::resourceManagerTag = "[Sample_rawfile]";
long FileRecourceManager::len = 0;
std::unique_ptr<uint8_t[]> FileRecourceManager::data = nullptr;
std::unique_ptr<uint8_t[]> FileRecourceManager::dataCopy = nullptr;
    
napi_value FileRecourceManager::CreateJsArrayValue(napi_env env, std::unique_ptr<uint8_t[]> &data, long length)
{
    // 创建js外部ArrayBuffer
    napi_value buffer;
    napi_status status = napi_create_external_arraybuffer(env, data.get(), length,
        [](napi_env env, void *data, void *hint) {
            delete[] static_cast<char*>(data);
        }, nullptr, &buffer);
    // 检测ArrayBuffer是否创建成功
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, globalResmgr, resourceManagerTag.c_str(),
            "Failed to create external array buffer");
        return nullptr;
    }
    // 创建js TypedArray  将ArrayBuffer绑定到TypedArray
    napi_value result = nullptr;
    status = napi_create_typedarray(env, napi_uint8_array, length, buffer, 0, &result);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, globalResmgr, resourceManagerTag.c_str(),
            "Failed to create media typed array");
        return nullptr;
    }
    data.release();
    return result;
}
    
napi_value FileRecourceManager::GetRawFileContent(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, globalResmgr, resourceManagerTag.c_str(), "GetFileContent Begin");
    size_t argc = 2;
    napi_value argv[2] = { nullptr };
    // 获取参数信息
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // argv[0]即为函数第一个参数Js资源对象，OH_ResourceManager_InitNativeResourceManager转为Native对象
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    napi_get_value_string_utf8(env, argv[1], NULL, 0, &strSize); // 不写内容进去

    if (strSize == 0 || strSize > MAX_ALLOWED_SIZE) {
        napi_throw_error(env, NULL, "字符串长度不合法");
        return NULL;
    }

    // 为缓冲区分配足够大小
    char *strBuf = (char *)malloc(strSize + 1);
    napi_status status = napi_get_value_string_utf8(env, argv[1], strBuf, strSize + 1, &strSize);
    if (status != napi_ok) {
        napi_throw_error(env, NULL, "无法获取字符串值");
        return NULL;
    }
    std::string filename(strBuf, strSize);

    // 获取rawfile指针对象
    RawFile *rawFile = OH_ResourceManager_OpenRawFile(mNativeResMgr, filename.c_str());
    if (rawFile != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, globalResmgr, resourceManagerTag.c_str(),
            "OH_ResourceManager_OpenRawFile success");
    }
    // 获取rawfile大小并申请内存
    FileRecourceManager::len = OH_ResourceManager_GetRawFileSize(rawFile);
    OH_LOG_Print(LOG_APP, LOG_INFO, globalResmgr, resourceManagerTag.c_str(),
        "OH_ResourceManager_GetRawFileSize success, %{public}d", FileRecourceManager::len);
    FileRecourceManager::data = std::make_unique<uint8_t[]>(FileRecourceManager::len);
    FileRecourceManager::dataCopy = std::make_unique<uint8_t[]>(FileRecourceManager::len);
    OH_ResourceManager_ReadRawFile(rawFile, FileRecourceManager::dataCopy.get(), FileRecourceManager::len);

    // 一次性读取rawfile全部内容
    int res = OH_ResourceManager_ReadRawFile(rawFile, FileRecourceManager::data.get(), FileRecourceManager::len);
    if (res > 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, globalResmgr, resourceManagerTag.c_str(),
                     "OH_ResourceManager_ReadRawFile success, %{public}p", FileRecourceManager::data.get());
    }

    // 关闭打开的指针对象
    OH_ResourceManager_CloseRawFile(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    // 转为js对象
    return CreateJsArrayValue(env, FileRecourceManager::data, FileRecourceManager::len);
}

napi_value FileRecourceManager::GetFileList(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, globalResmgr, resourceManagerTag.c_str(), "NDKTest GetFileList Begin");
    size_t argc = 2;
    napi_value argv[2] = { nullptr };
    // 获取参数信息
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // argv[0]即为函数第一个参数Js资源对象，OH_ResourceManager_InitNativeResourceManager转为Native对象
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);

    // 获取函数argv[1]，此为rawfile相对路径
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string dirName(strBuf, strSize);

    // 获取对应的rawDir指针对象
    RawDir* rawDir = OH_ResourceManager_OpenRawDir(mNativeResMgr, dirName.c_str());

    // 获取rawDir下文件及文件夹数量
    int count = OH_ResourceManager_GetRawFileCount(rawDir);

    // 遍历获取文件名称，并保存
    std::vector<std::string> tempArray;
    for (int i = 0; i < count; i++) {
        std::string filename = OH_ResourceManager_GetRawFileName(rawDir, i);
        tempArray.emplace_back(filename);
    }

    // 转为js数组
    napi_value fileList;
    napi_create_array(env, &fileList);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, fileList, i, jsString);
    }

    // 关闭打开的指针对象
    OH_ResourceManager_CloseRawDir(rawDir);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return fileList;
}
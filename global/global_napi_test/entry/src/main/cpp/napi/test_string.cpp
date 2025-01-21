/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "rawfile/raw_file_manager.h"
#include <fstream>
#include <memory>
#include <vector>

#include "hilog/log.h"
#include "node_api.h"

namespace OHOS {
    namespace Global {
        namespace Resource {
#define GET_PARAMS(env, info, num)    \
    size_t argc = num;                 \
    napi_value argv[num] = {nullptr};  \
    napi_value thisVar = nullptr;      \
    void *data = nullptr;              \
    napi_get_cb_info(env, info , &argc, argv, &thisVar, &data)

            void NdkAsyncContext::SetErrorMsg(const std::string &msg)
            {
                errMsg_ = msg;
                success_ = false;
            }

            napi_async_execute_callback TestRawFileExecute()
            {
                return [](napi_env env, void* data) {
                    NdkAsyncContext *asyncContext = static_cast<NdkAsyncContext*>(data);

                    // test OH_ResourceManager_OpenRawDir
                    RawDir* rawDir = OH_ResourceManager_OpenRawDir(asyncContext->ndk_, asyncContext->path_.c_str());

                    // test OH_ResourceManager_GetRawFileCount
                    int count = OH_ResourceManager_GetRawFileCount(rawDir);

                    // test OH_ResourceManager_GetRawFileName
                    for (int i = 0; i< count; i++) {
                        std::string tempFileName = OH_ResourceManager_GetRawFileName(rawDir, i);
                    }

                    // test OH_ResourceManager_OpenRawFile
                    std::string fileName = OH_ResourceManager_GetRawFileName(rawDir, 0);
                    asyncContext->path_ = fileName;
                    RawFile* rawFile = OH_ResourceManager_OpenRawFile(asyncContext->ndk_, fileName.c_str());

                    // test OH_ResourceManager_GetRawFileSize
                    asyncContext->len_ = OH_ResourceManager_GetRawFileSize(rawFile);

                    // // test OH_ResourceManager_SeekRawFile

                    // // test OH_ResourceManager_GetRawFileOffset

                    // test OH_ResourceManager_GetRawFileDescriptor
                    RawFileDescriptor descriptor;
                    bool getFd = OH_ResourceManager_GetRawFileDescriptor(rawFile, descriptor);

                    // test OH_ResourceManager_ReadRawFile
                    asyncContext->mediaData = std::make_unique<char[]>(asyncContext->len_);
//                    HiLog::Error(LABEL, "ReadRawFile:%{public}d", OH_ResourceManager_ReadRawFile(rawFile, asyncContext->mediaData.get(), asyncContext->len_));

                    // test OH_ResourceManager_ReleaseRawFileDescriptor
                    OH_ResourceManager_ReleaseRawFileDescriptor(descriptor);

                    // test OH_ResourceManager_CloseRawFile
                    OH_ResourceManager_CloseRawFile(rawFile);

                    // test OH_ResourceManager_CloseRawDir
                    OH_ResourceManager_CloseRawDir(rawDir);

                    // test OH_ResourceManager_ReleaseNativeResourceManager
                    OH_ResourceManager_ReleaseNativeResourceManager(asyncContext->ndk_);

                    asyncContext->createValueFunc_ = [](napi_env env, NdkAsyncContext &context) -> napi_value {
                        napi_value buffer;
                        napi_status status = napi_create_external_arraybuffer(env, context.mediaData.get(), context.len_,
                                [](napi_env env, void *data, void *hint) {
                                    delete[] static_cast<char*>(data);
                                }, nullptr, &buffer);
                        if (status != napi_ok) {
                            context.SetErrorMsg("Failed to create media external array buffer");
                            return nullptr;
                        }

                        napi_value result = nullptr;
                        status = napi_create_typedarray(env, napi_uint8_array, context.len_, buffer, 0, &result);
                        if (status != napi_ok) {
                            context.SetErrorMsg("Failed to create media typed array");
                            return nullptr;
                        }
                        context.mediaData.release();
                        return result;
                    };
                };
            }

            auto completeFunc = [](napi_env env, napi_status status, void* data) {
                NdkAsyncContext* asyncContext = static_cast<NdkAsyncContext*>(data);

                napi_value finalResult = nullptr;
                if (asyncContext->createValueFunc_ != nullptr) {
                    finalResult = asyncContext->createValueFunc_(env, *asyncContext);
                }

                napi_value result[] = { nullptr, nullptr };
                if (asyncContext->success_) {
                    napi_get_undefined(env, &result[0]);
                    result[1] = finalResult;
                } else {
                    napi_value message = nullptr;
                    napi_create_string_utf8(env, asyncContext->errMsg_.c_str(), NAPI_AUTO_LENGTH, &message);
                    napi_create_error(env, nullptr, message, &result[0]);
                    napi_get_undefined(env, &result[1]);
                }
                do {
                    if (asyncContext->deferred_) {
                        if (asyncContext->success_) {
                            if (napi_resolve_deferred(env, asyncContext->deferred_, result[1]) != napi_ok) {
                            }
                        } else {
                            if (napi_reject_deferred(env, asyncContext->deferred_, result[0]) != napi_ok) {
                            }
                        }
                    } else {
                        napi_value callback = nullptr;
                        napi_status status = napi_get_reference_value(env, asyncContext->callbackRef_, &callback);
                        if (status != napi_ok) {
                            break;
                        }
                        napi_value userRet = nullptr;
                        status = napi_call_function(env, nullptr, callback, sizeof(result) / sizeof(napi_value), result, &userRet);
                        if (status != napi_ok) {
                            break;
                        }
                        status = napi_delete_reference(env, asyncContext->callbackRef_);
                        if (status != napi_ok) {
                            break;
                        }
                    }
                } while (false);
                napi_delete_async_work(env, asyncContext->work_);
                delete asyncContext;
            };

            napi_value GetResourceManager(napi_env env, napi_callback_info info)
            {
                GET_PARAMS(env, info, 3);

                std::unique_ptr<NdkAsyncContext> asyncContext = std::make_unique<NdkAsyncContext>();
                for (size_t i = 0; i < argc; i++) {
                    napi_valuetype valueType;
                    napi_typeof(env, argv[i], &valueType);
                    if (i == 0 && valueType == napi_string) {
                        size_t len = 0;
                        napi_status status = napi_get_value_string_utf8(env, argv[0], nullptr, 0, &len);
                        if (status != napi_ok) {
                            return nullptr;
                        }
                        std::vector<char> buf(len + 1);
                        status = napi_get_value_string_utf8(env, argv[0], buf.data(), len + 1, &len);
                        if (status != napi_ok) {
                            return nullptr;
                        }
                        asyncContext->path_ = buf.data();
                    } else if (i == 1 && valueType == napi_object) {
                        // test OH_ResourceManager_InitNativeResourceManager
                        asyncContext->ndk_ = OH_ResourceManager_InitNativeResourceManager(env, argv[i]);
                    } else if (i == 2 && valueType == napi_function) {
                        napi_create_reference(env, argv[i], 1, &asyncContext->callbackRef_);
                        break;
                    } else {
                        // self resorucemanager with promise
                    }
                }

                napi_value result = nullptr;
                if (asyncContext->callbackRef_ == nullptr) {
                    napi_create_promise(env, &asyncContext->deferred_, &result);
                } else {
                    napi_get_undefined(env, &result);
                }

                napi_value resource = nullptr;
                napi_create_string_utf8(env, "testRawFile", NAPI_AUTO_LENGTH, &resource);
                napi_status status = napi_create_async_work(env, nullptr, resource, TestRawFileExecute(), completeFunc,
                        static_cast<void*>(asyncContext.get()), &asyncContext->work_);
                if (status != napi_ok) {
                    return result;
                }
                status = napi_queue_async_work(env, asyncContext->work_);
                if (status != napi_ok) {
                    return result;
                }

                asyncContext.release();
                return result;
            }

            EXTERN_C_START
            static napi_value Init(napi_env env, napi_value exports)
            {
                napi_property_descriptor desc[] = {
                    { "testRawFile", nullptr, GetResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr }
                };
                napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
                return exports;
            }
            EXTERN_C_END

            static napi_module demoModule = {
        .nm_version =1,
        .nm_flags = 0,
        .nm_filename = nullptr,
        .nm_register_func = Init,
        .nm_modname = "resmgrndk",
        .nm_priv = ((void*)0),
        .reserved = { 0 },
    };
    extern "C" __attribute__((constructor)) void RegisterModule(void)
    {
        napi_module_register(&demoModule);
    }
}
}
}
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

#ifndef MYAPPLICATION_AUDIO_RESOURCEMANAGER_H
#define MYAPPLICATION_AUDIO_RESOURCEMANAGER_H

#include <string>
#include <vector>
#include <cstdlib>
#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"
#include "rawfile/raw_file.h"
#include "rawfile/raw_dir.h"
#include "hilog/log.h"

class FileRecourceManager {
    public:
        static const int globalResmgr = 0xFF00;
        static const std::string resourceManagerTag;
        static std::unique_ptr<uint8_t[]> data;
        static std::unique_ptr<uint8_t[]> dataCopy;
        static long len;

        static constexpr size_t MAX_ALLOWED_SIZE = 1024;
    
    public:
        static napi_value CreateJsArrayValue(napi_env env, std::unique_ptr<uint8_t[]> &data, long length);
        static napi_value GetRawFileContent(napi_env env, napi_callback_info info);
        static napi_value GetFileList(napi_env env, napi_callback_info info);
};



#endif //MYAPPLICATION_AUDIO_RESOURCEMANAGER_H
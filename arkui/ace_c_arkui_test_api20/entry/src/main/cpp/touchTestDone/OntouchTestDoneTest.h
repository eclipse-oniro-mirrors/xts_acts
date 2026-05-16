/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef NATIVE_XCOMPONENT_ONTOUCH_TESTDONE_H
#define NATIVE_XCOMPONENT_ONTOUCH_TESTDONE_H
#include <string>
#include <unordered_map>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include "../common/common.h"

namespace ArkUICapiTest {
const int MAX_SIZE = 11;
class OntouchTestDoneTest {
public:
    ~OntouchTestDoneTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
private:
    static OntouchTestDoneTest manager_;

    std::unordered_map<std::string, OH_NativeXComponent *> nativeXComponentMap_;
};
} // namespace ArkUICapiTest
#endif // NATIVE_XCOMPONENT_ONTOUCH_TESTDONE_H
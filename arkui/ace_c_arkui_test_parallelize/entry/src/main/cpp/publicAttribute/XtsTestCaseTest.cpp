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

#include "../common/common.h"
#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <hilog/log.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_type.h>
#include "../framework/NodeXtsTest.h"
#include "PublicAttributeTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

static napi_value CreateNativeNodePublic(napi_env env, napi_callback_info info)
{
    return ArkUICApiDemo::CreateCNodeTree(env, info, ArkUICApiAttributeDemo::RunOnUIThread,ArkUICApiAttributeDemo::RunOnSubThread );
}

static napi_value DisposeNativeNodePublic(napi_env env, napi_callback_info info)
{
    return ArkUICApiDemo::DisposeCNodeTree(env, info);
}
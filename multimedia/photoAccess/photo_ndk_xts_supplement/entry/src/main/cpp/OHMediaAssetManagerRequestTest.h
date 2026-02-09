/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef IMAGENDKSUPPLEMENT_OHMEDIAASSETMANAGERREQUESTTEST_H
#define IMAGENDKSUPPLEMENT_OHMEDIAASSETMANAGERREQUESTTEST_H

#include "napi/native_api.h"
#include "multimedia/media_library/media_asset_base_capi.h"
#include "multimedia/media_library/media_asset_capi.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/media_library/media_access_helper_capi.h"
#include "multimedia/media_library/media_asset_change_request_capi.h"
#include "multimedia/media_library/media_asset_manager_capi.h"
#include "multimedia/media_library/moving_photo_capi.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value TestRequestImageForPath(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif

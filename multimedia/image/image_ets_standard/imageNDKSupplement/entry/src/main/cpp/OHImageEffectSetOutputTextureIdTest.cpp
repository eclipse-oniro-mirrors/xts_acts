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

#include "OHImageEffectSetOutputTextureIdTest.h"
#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include <GLES3/gl3.h>
#include "render_texture.h"
#include <cstdint>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <hilog/log.h>

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectSetInputTextureIdNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define IMAGE_EFFECT_NAME "imageEdit"
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920

napi_value OHImageEffectSetOutputTextureId(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    std::shared_ptr<OH_ImageEffect> imageEffectPtr(imageEffect, [](OH_ImageEffect *imageEffect) {
        if (imageEffect != nullptr) {
            OH_ImageEffect_Release(imageEffect);
        }
    });
    std::shared_ptr<RenderTexture> output =
        std::make_shared<RenderTexture>(IMAGE_EFFECT_1920, IMAGE_EFFECT_1080, GL_RGBA8);
    output->Init();
    ImageEffect_ErrorCode code = OH_ImageEffect_SetOutputTextureId(imageEffect, output->GetName());
    int32_t textureId = 0;
    int32_t index;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetOutputTextureId(nullptr, textureId);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetOutputTextureId(imageEffect, textureId);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
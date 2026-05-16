/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "../../../common/common.h"
#include <arkui/drawable_descriptor.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {

namespace {
constexpr uint32_t K_ANIMATED_DRAWABLE_PIXELMAP_FRAME_COUNT = 2;
} // namespace

/*
 * 测试接口: DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME（DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME 并断言等于 0。
 */
static napi_value TestArkUICapi_003(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME（DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME 并断言等于 1。
 */
static napi_value TestArkUICapi_004(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_DrawableDescriptor_SetAnimationStopMode
 * 预期效果: 在合法动图 DrawableDescriptor 上设置停止模式成功。
 * 实际测试: 按文档用 CreateEmptyPixelMap×2 + CreateFromAnimatedPixelMap 建描述符，SetAnimationStopMode 后释放全链路。
 */
static napi_value TestArkUICapi_005(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    if (((opts)) == nullptr) {
        return nullptr;
    }

    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm0 = nullptr;
    OH_PixelmapNative *pm1 = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm0);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm1);
    if (((pm0)) == nullptr) {
        return nullptr;
    }

    if (((pm1)) == nullptr) {
        return nullptr;
    }

    OH_PixelmapNative *frames[K_ANIMATED_DRAWABLE_PIXELMAP_FRAME_COUNT] = {pm0, pm1};
    auto *dd = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(
        frames, K_ANIMATED_DRAWABLE_PIXELMAP_FRAME_COUNT);
    if (((dd)) == nullptr) {
        return nullptr;
    }

    auto rc = OH_ArkUI_DrawableDescriptor_SetAnimationStopMode(
        dd, DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (rc), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_DrawableDescriptor_Dispose(dd);
    (void)OH_PixelmapNative_Destroy(&pm0);
    (void)OH_PixelmapNative_Destroy(&pm1);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

struct TwoFrameAnimatedDd {
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    OH_PixelmapNative *pm0 = nullptr;
    OH_PixelmapNative *pm1 = nullptr;
    ArkUI_DrawableDescriptor *dd = nullptr;
};

static void DisposeTwoFrameAnimatedDd(TwoFrameAnimatedDd *fixture)
{
    if (fixture->dd != nullptr) {
        OH_ArkUI_DrawableDescriptor_Dispose(fixture->dd);
        fixture->dd = nullptr;
    }
    if (fixture->pm0 != nullptr) {
        (void)OH_PixelmapNative_Destroy(&fixture->pm0);
    }
    if (fixture->pm1 != nullptr) {
        (void)OH_PixelmapNative_Destroy(&fixture->pm1);
    }
    if (fixture->opts != nullptr) {
        (void)OH_PixelmapInitializationOptions_Release(fixture->opts);
        fixture->opts = nullptr;
    }
}

static bool BuildTwoFrameAnimatedDd(TwoFrameAnimatedDd *fixture)
{
    (void)OH_PixelmapInitializationOptions_Create(&fixture->opts);
    if (fixture->opts == nullptr) {
        return false;
    }
    (void)OH_PixelmapInitializationOptions_SetWidth(fixture->opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(fixture->opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(fixture->opts, PIXEL_FORMAT_BGRA_8888);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(fixture->opts, &fixture->pm0);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(fixture->opts, &fixture->pm1);
    if (fixture->pm0 == nullptr || fixture->pm1 == nullptr) {
        DisposeTwoFrameAnimatedDd(fixture);
        return false;
    }
    OH_PixelmapNative *frames[K_ANIMATED_DRAWABLE_PIXELMAP_FRAME_COUNT] = {fixture->pm0, fixture->pm1};
    fixture->dd = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(
        frames, K_ANIMATED_DRAWABLE_PIXELMAP_FRAME_COUNT);
    if (fixture->dd == nullptr) {
        DisposeTwoFrameAnimatedDd(fixture);
        return false;
    }
    return true;
}

/*
 * 测试接口: OH_ArkUI_DrawableDescriptor_GetAnimationStopMode
 * 预期效果: Get 读到与 Set 一致的动图停止模式。
 * 实际测试: 双帧 PixelMap 建动图描述符，Set LAST_FRAME 后 Get 断言一致，再释放。
 */
static napi_value TestArkUICapi_006(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    TwoFrameAnimatedDd fixture = {};
    if (!BuildTwoFrameAnimatedDd(&fixture)) {
        return nullptr;
    }

    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (OH_ArkUI_DrawableDescriptor_SetAnimationStopMode(
                fixture.dd, DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME)),
            (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            DisposeTwoFrameAnimatedDd(&fixture);
            return napiAssertErr;
        }
    }

    DrawableDescriptor_AnimationStopMode mode = DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME;
    auto rc = OH_ArkUI_DrawableDescriptor_GetAnimationStopMode(fixture.dd, &mode);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (rc), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            DisposeTwoFrameAnimatedDd(&fixture);
            return napiAssertErr;
        }
    }

    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(mode)),
            (static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME)));
        if (napiAssertErr != nullptr) {
            DisposeTwoFrameAnimatedDd(&fixture);
            return napiAssertErr;
        }
    }

    DisposeTwoFrameAnimatedDd(&fixture);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

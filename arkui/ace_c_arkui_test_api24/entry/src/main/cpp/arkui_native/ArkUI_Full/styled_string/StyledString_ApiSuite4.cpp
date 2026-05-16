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
#include <arkui/styled_string.h>
#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_text_typography.h>
#include <cstring>
#include <vector>

namespace ArkUICapiTest {

namespace {
ArkUI_StyledString_Descriptor* XtsPlainTextDescriptor(const char* utf8)
{
    if (utf8 == nullptr) {
        return nullptr;
    }
    const auto n = static_cast<size_t>(std::strlen(utf8));
    std::vector<const OH_ArkUI_SpanStyle*> slots(n, nullptr);
    return OH_ArkUI_StyledString_Descriptor_CreateWithString(
        utf8, (n == 0U) ? nullptr : slots.data(), static_cast<int32_t>(n));
}
} // namespace

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetPadding(const OH_ArkUI_ImageAttachment *, ArkUI_Margin *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_438(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_Margin marginOut1{};
    auto ec = OH_ArkUI_ImageAttachment_GetPadding(obj, &marginOut1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetBorderRadiuses(OH_ArkUI_ImageAttachment *, float, float, float, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_439(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetBorderRadiuses(obj, 0.0f, 0.0f, 0.0f, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_ImageAttachment_GetBorderRadiuses(const OH_ArkUI_ImageAttachment *, float *, float *, float *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_440(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    float v2 = 0.0f;
    float v3 = 0.0f;
    float v4 = 0.0f;
    auto ec = OH_ArkUI_ImageAttachment_GetBorderRadiuses(obj, &v1, &v2, &v3, &v4);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetColorFilter(OH_ArkUI_ImageAttachment *, const float *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_441(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_ImageAttachment_SetColorFilter(obj, &v1, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetColorFilter(const OH_ArkUI_ImageAttachment *, float **, uint32_t, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: colorFilter 传调用方可写缓冲区（容量 16），断言返回 ARKUI_ERROR_CODE_NO_ERROR。
 */
static napi_value TestArkUICapi_442(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float buffer[16] = { 0.0f };
    float* holder1 = buffer;
    float** outPtr1 = &holder1;
    uint32_t v3 = 0U;
    constexpr uint32_t kFilterFloatCount = static_cast<uint32_t>(sizeof(buffer) / sizeof(buffer[0]));
    auto ec = OH_ArkUI_ImageAttachment_GetColorFilter(obj, outPtr1, kFilterFloatCount, &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetDrawingColorFilter(OH_ArkUI_ImageAttachment *, const OH_Drawing_ColorFilter *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_443(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_Drawing_ColorFilter *cf = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    if (cf == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetDrawingColorFilter(obj, cf);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            OH_Drawing_ColorFilterDestroy(cf);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    OH_Drawing_ColorFilterDestroy(cf);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetDrawingColorFilter(const OH_ArkUI_ImageAttachment *, OH_Drawing_ColorFilter *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_444(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_Drawing_ColorFilter *cfSet = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    if (cfSet == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetDrawingColorFilter(obj, cfSet);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            OH_Drawing_ColorFilterDestroy(cfSet);
            return napiAssertErr;
        }
    }

    OH_Drawing_ColorFilter *cfGet = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    if (cfGet == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(obj);
        OH_Drawing_ColorFilterDestroy(cfSet);
        return nullptr;
    }

    auto ec2 = OH_ArkUI_ImageAttachment_GetDrawingColorFilter(obj, cfGet);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec2), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            OH_Drawing_ColorFilterDestroy(cfGet);
            OH_Drawing_ColorFilterDestroy(cfSet);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    OH_Drawing_ColorFilterDestroy(cfGet);
    OH_Drawing_ColorFilterDestroy(cfSet);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetSyncLoad(OH_ArkUI_ImageAttachment *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_445(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetSyncLoad(obj, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetSyncLoad(const OH_ArkUI_ImageAttachment *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_446(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_ImageAttachment_GetSyncLoad(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_SetSupportSvg(OH_ArkUI_ImageAttachment *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_447(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_ImageAttachment_SetSupportSvg(obj, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_ImageAttachment_GetSupportSvg(const OH_ArkUI_ImageAttachment *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ImageAttachment_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_448(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ImageAttachment_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_ImageAttachment_GetSupportSvg(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ImageAttachment_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ImageAttachment_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorChangeEvent_GetRangeBefore(const OH_ArkUI_TextEditorChangeEvent *, uint32_t *, uint32_t *)
 * 预期效果: 空 changeEvent 时返回参数非法类错误码（API 24 起返回 ArkUI_ErrorCode）。
 * 实际测试: 传 nullptr 校验错误码。
 */
static napi_value TestArkUICapi_449(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    uint32_t v1 = 0U;
    uint32_t v2 = 0U;
    auto ec = OH_ArkUI_TextEditorChangeEvent_GetRangeBefore(
        static_cast<const OH_ArkUI_TextEditorChangeEvent *>(nullptr), &v1, &v2);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorChangeEvent_GetReplacementStyledString(const OH_ArkUI_TextEditorChangeEvent *,
 *     ArkUI_StyledString_Descriptor *)
 * 预期效果: 空 changeEvent 时返回参数非法类错误码（API 24 起返回 ArkUI_ErrorCode）。
 * 实际测试: changeEvent 传 nullptr，descriptor 为合法对象，避免部分实现先解引用输出再判空。
 */
static napi_value TestArkUICapi_450(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *desc = XtsPlainTextDescriptor("x");
    if (desc == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorChangeEvent_GetReplacementStyledString(
        static_cast<const OH_ArkUI_TextEditorChangeEvent *>(nullptr),
        desc);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(desc);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(desc);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorChangeEvent_GetPreviewStyledString(const OH_ArkUI_TextEditorChangeEvent *,
 *     ArkUI_StyledString_Descriptor *)
 * 预期效果: 空 changeEvent 时返回参数非法类错误码（API 24 起返回 ArkUI_ErrorCode）。
 * 实际测试: changeEvent 传 nullptr，descriptor 为合法对象，避免部分实现先解引用输出再判空。
 */
static napi_value TestArkUICapi_451(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *desc = XtsPlainTextDescriptor("x");
    if (desc == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorChangeEvent_GetPreviewStyledString(
        static_cast<const OH_ArkUI_TextEditorChangeEvent *>(nullptr),
        desc);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(desc);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(desc);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinate(ArkUI_TextLayoutManager *, double, double,
 *     OH_Drawing_PositionAndAffinity **)
 * 预期效果: layoutManager 为 nullptr 时返回 PARAM_INVALID。
 * 实际测试: 首参传 nullptr，断言 ARKUI_ERROR_CODE_PARAM_INVALID。
 */
static napi_value TestArkUICapi_452(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Drawing_PositionAndAffinity* holder3 = nullptr;
    OH_Drawing_PositionAndAffinity** outPtr3 = &holder3;
    auto ec = OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinate(nullptr, 0.0, 0.0, outPtr3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange(ArkUI_TextLayoutManager *, OH_Drawing_Range *,
 *     OH_Drawing_Range **, OH_Drawing_Range **)
 * 预期效果: layoutManager 为 nullptr 时返回 PARAM_INVALID。
 * 实际测试: 首参传 nullptr，断言 ARKUI_ERROR_CODE_PARAM_INVALID。
 */
static napi_value TestArkUICapi_453(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Drawing_Range* holder2 = nullptr;
    OH_Drawing_Range** outPtr2 = &holder2;
    OH_Drawing_Range* holder3 = nullptr;
    OH_Drawing_Range** outPtr3 = &holder3;
    auto ec = OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange(
        nullptr,
        static_cast<OH_Drawing_Range *>(nullptr),
        outPtr2,
        outPtr3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange(ArkUI_TextLayoutManager *, OH_Drawing_Range *,
 *     OH_Drawing_Range **, OH_Drawing_Range **)
 * 预期效果: layoutManager 为 nullptr 时返回 PARAM_INVALID。
 * 实际测试: 首参传 nullptr，断言 ARKUI_ERROR_CODE_PARAM_INVALID。
 */
static napi_value TestArkUICapi_454(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Drawing_Range* holder2 = nullptr;
    OH_Drawing_Range** outPtr2 = &holder2;
    OH_Drawing_Range* holder3 = nullptr;
    OH_Drawing_Range** outPtr3 = &holder3;
    auto ec = OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange(
        nullptr,
        static_cast<OH_Drawing_Range *>(nullptr),
        outPtr2,
        outPtr3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

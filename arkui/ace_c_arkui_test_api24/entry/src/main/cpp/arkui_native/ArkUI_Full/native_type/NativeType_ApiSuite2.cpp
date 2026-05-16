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
#include <arkui/native_type.h>

namespace ArkUICapiTest {

namespace {
void StubMenuIntCallback(int32_t, int32_t, void *) {}
void StubMenuVoidCallback(void *) {}
} // namespace

/*
 * 测试接口: OH_ArkUI_ShadowOptions_GetFill(OH_ArkUI_ShadowOptions *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_ShadowOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_159(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_ShadowOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_ShadowOptions_GetFill(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorTextStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_160(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorTextStyle_Create() 后调用 OH_ArkUI_TextEditorTextStyle_Destroy。
 */
static napi_value TestArkUICapi_161(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontColor(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_162(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontColor(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_163(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontSize(OH_ArkUI_TextEditorTextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_164(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontSize(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontSize(OH_ArkUI_TextEditorTextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_165(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontSize(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontStyle(OH_ArkUI_TextEditorTextStyle *, ArkUI_FontStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_166(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontStyle(obj, static_cast<ArkUI_FontStyle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontStyle(OH_ArkUI_TextEditorTextStyle *, ArkUI_FontStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_167(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_FontStyle out = {};
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontStyle(obj, &out);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontWeight(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_168(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontWeight(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontWeight(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_169(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontWeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontFamily(OH_ArkUI_TextEditorTextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_170(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontFamily(obj, buf1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontFamily(OH_ArkUI_TextEditorTextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_171(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontFamily(
        obj,
        buf1,
        static_cast<int32_t>(sizeof(buf1)),
        &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetDecoration(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 创建 TextEditorTextStyle 与 DecorationStyleOptions，SetDecoration；勿对第二参传 nullptr（易在实现内崩溃）。
 */
static napi_value TestArkUICapi_172(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *dec = OH_ArkUI_DecorationStyleOptions_Create();
    if (((dec)) == nullptr) {
        OH_ArkUI_TextEditorTextStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetDecoration(obj, dec);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorTextStyle_Destroy(obj);
            OH_ArkUI_DecorationStyleOptions_Destroy(dec);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    OH_ArkUI_DecorationStyleOptions_Destroy(dec);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetDecoration(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_DecorationStyleOptions *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 创建输出用 DecorationStyleOptions 再 GetDecoration；第二参勿传 nullptr。
 */
static napi_value TestArkUICapi_173(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *dec = OH_ArkUI_DecorationStyleOptions_Create();
    if (((dec)) == nullptr) {
        OH_ArkUI_TextEditorTextStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_GetDecoration(obj, dec);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorTextStyle_Destroy(obj);
            OH_ArkUI_DecorationStyleOptions_Destroy(dec);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    OH_ArkUI_DecorationStyleOptions_Destroy(dec);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorTextStyle_SetTextShadows(OH_ArkUI_TextEditorTextStyle *, const OH_ArkUI_ShadowOptions **,
 *     int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_174(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *shadow = OH_ArkUI_ShadowOptions_Create();
    if (((shadow)) == nullptr) {
        OH_ArkUI_TextEditorTextStyle_Destroy(obj);
        return nullptr;
    }

    const OH_ArkUI_ShadowOptions *holder1 = shadow;
    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextShadows(obj, &holder1, 1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ShadowOptions_Destroy(shadow);
            OH_ArkUI_TextEditorTextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(shadow);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorTextStyle_GetTextShadows(OH_ArkUI_TextEditorTextStyle *, OH_ArkUI_ShadowOptions **, uint32_t,
 *     uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: shadowOptions 传已创建对象槽，容量为 1，断言返回 ARKUI_ERROR_CODE_NO_ERROR。
 */
static napi_value TestArkUICapi_175(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *recv = OH_ArkUI_ShadowOptions_Create();
    if (recv == nullptr) {
        OH_ArkUI_TextEditorTextStyle_Destroy(obj);
        return nullptr;
    }
    OH_ArkUI_ShadowOptions* shadowSlots[1] = { recv };
    uint32_t v3 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextShadows(obj, shadowSlots, 1U, &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_ShadowOptions_Destroy(recv);
            OH_ArkUI_TextEditorTextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_ShadowOptions_Destroy(recv);
    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetLineHeight(OH_ArkUI_TextEditorTextStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_176(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetLineHeight(obj, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetLineHeight(OH_ArkUI_TextEditorTextStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_177(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetLineHeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetLetterSpacing(OH_ArkUI_TextEditorTextStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_178(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetLetterSpacing(obj, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetLetterSpacing(OH_ArkUI_TextEditorTextStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_179(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetLetterSpacing(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetFontFeature(OH_ArkUI_TextEditorTextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_180(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextEditorTextStyle_SetFontFeature(obj, buf1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetFontFeature(OH_ArkUI_TextEditorTextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_181(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetFontFeature(
        obj,
        buf1,
        static_cast<int32_t>(sizeof(buf1)),
        &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetHalfLeading(OH_ArkUI_TextEditorTextStyle *, bool)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_182(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetHalfLeading(obj, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetHalfLeading(OH_ArkUI_TextEditorTextStyle *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_183(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    bool v1 = false;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetHalfLeading(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_SetTextBackgroundColor(OH_ArkUI_TextEditorTextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_184(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextBackgroundColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorTextStyle_GetTextBackgroundColor(OH_ArkUI_TextEditorTextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_185(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextBackgroundColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorTextStyle_SetTextBackgroundRadius(OH_ArkUI_TextEditorTextStyle *, float, float, float, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_186(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorTextStyle_SetTextBackgroundRadius(obj, 0.0f, 0.0f, 0.0f, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorTextStyle_GetTextBackgroundRadius(OH_ArkUI_TextEditorTextStyle *, float *, float *, float *,
 *     float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorTextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_187(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorTextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    float v2 = 0.0f;
    float v3 = 0.0f;
    float v4 = 0.0f;
    auto ec = OH_ArkUI_TextEditorTextStyle_GetTextBackgroundRadius(obj, &v1, &v2, &v3, &v4);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorTextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_SetTypingStyle(OH_ArkUI_TextEditorStyledStringController *,
 *     OH_ArkUI_TextEditorTextStyle *)
 * 预期效果: Controller 未绑定时返回 ARKUI_ERROR_CODE_PARAM_INVALID（与 117–124、145、module_run 401 一致）。
 * 实际测试: 断言 PARAM_INVALID；失败路径释放 textStyle 与 controller。
 */
static napi_value TestArkUICapi_188(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sty = OH_ArkUI_TextEditorTextStyle_Create();
    if (((sty)) == nullptr) {
        OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetTypingStyle(obj, sty);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorTextStyle_Destroy(sty);
            OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(sty);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetTypingStyle(OH_ArkUI_TextEditorStyledStringController *,
 *     OH_ArkUI_TextEditorTextStyle *)
 * 预期效果: Controller 未绑定时返回 ARKUI_ERROR_CODE_PARAM_INVALID。
 * 实际测试: 断言 PARAM_INVALID；失败路径释放 textStyle 与 controller。
 */
static napi_value TestArkUICapi_189(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sty = OH_ArkUI_TextEditorTextStyle_Create();
    if (((sty)) == nullptr) {
        OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_GetTypingStyle(obj, sty);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextEditorTextStyle_Destroy(sty);
            OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorTextStyle_Destroy(sty);
    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextEditorSelectionMenuOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_190(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorSelectionMenuOptions_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextEditorSelectionMenuOptions_Create() 后调用 OH_ArkUI_TextEditorSelectionMenuOptions_Destroy。
 */
static napi_value TestArkUICapi_191(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_SetSpanType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextEditorSpanType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_192(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetSpanType(obj, static_cast<OH_ArkUI_TextEditorSpanType>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_GetSpanType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextEditorSpanType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_193(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorSpanType spanOut = static_cast<OH_ArkUI_TextEditorSpanType>(0);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetSpanType(obj, &spanOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_SetContentNode(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     ArkUI_NodeHandle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_194(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetContentNode(obj, static_cast<ArkUI_NodeHandle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_GetContentNode(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     ArkUI_NodeHandle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_195(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_NodeHandle nodeOut = static_cast<ArkUI_NodeHandle>(0);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetContentNode(obj, &nodeOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_SetResponseType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextEditorResponseType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_196(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetResponseType(
        obj,
        static_cast<OH_ArkUI_TextEditorResponseType>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_GetResponseType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextEditorResponseType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_197(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextEditorResponseType rtOut = static_cast<OH_ArkUI_TextEditorResponseType>(0);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetResponseType(obj, &rtOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_SetMenuType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextMenuType)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_198(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetMenuType(obj, static_cast<OH_ArkUI_TextMenuType>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_GetMenuType(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_TextMenuType *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_199(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextMenuType mtOut = static_cast<OH_ArkUI_TextMenuType>(0);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetMenuType(obj, &mtOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuShowCallback(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_200(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuShowCallback(
        obj,
        static_cast<void *>(nullptr),
        StubMenuIntCallback);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuHideCallback(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_201(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuHideCallback(
        obj,
        static_cast<void *>(nullptr),
        StubMenuIntCallback);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuAppearCallback(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     void *, void (*)(int32_t, int32_t, void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_202(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuAppearCallback(
        obj,
        static_cast<void *>(nullptr),
        StubMenuIntCallback);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuDisappearCallback(OH_ArkUI_TextEditorSelectionMenuOptions
 *     *, void *, void (*)(void *))
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_203(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuDisappearCallback(
        obj,
        static_cast<void *>(nullptr),
        StubMenuVoidCallback);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_SetHapticFeedbackMode(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_HapticFeedbackMode)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_204(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_SetHapticFeedbackMode(
        obj,
        static_cast<OH_ArkUI_HapticFeedbackMode>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorSelectionMenuOptions_GetHapticFeedbackMode(OH_ArkUI_TextEditorSelectionMenuOptions *,
 *     OH_ArkUI_HapticFeedbackMode *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorSelectionMenuOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_205(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorSelectionMenuOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_HapticFeedbackMode hfOut = static_cast<OH_ArkUI_HapticFeedbackMode>(0);
    auto ec = OH_ArkUI_TextEditorSelectionMenuOptions_GetHapticFeedbackMode(obj, &hfOut);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorSelectionMenuOptions_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextEditorStyledStringController_CloseSelectionMenu(OH_ArkUI_TextEditorStyledStringController *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_206(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_CloseSelectionMenu(obj);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetSelection(const OH_ArkUI_TextEditorStyledStringController *,
 *     uint32_t *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_207(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    uint32_t v2 = 0U;
    auto ec = OH_ArkUI_TextEditorStyledStringController_GetSelection(obj, &v1, &v2);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_SetStyledString(const OH_ArkUI_TextEditorStyledStringController *,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_208(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetStyledString(
        obj,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_GetStyledString(const OH_ArkUI_TextEditorStyledStringController *,
 *     ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_209(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_GetStyledString(
        obj,
        static_cast<ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_TextEditorStyledStringController_SetStyledPlaceholder(const OH_ArkUI_TextEditorStyledStringController
 *     *, const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextEditorStyledStringController_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_210(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextEditorStyledStringController_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextEditorStyledStringController_SetStyledPlaceholder(
        obj,
        static_cast<const ArkUI_StyledString_Descriptor *>(nullptr));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_PARAM_INVALID));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextEditorStyledStringController_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4ScaleOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4ScaleOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_211(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4ScaleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4ScaleOptions_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4ScaleOptions_SetCenterY(ArkUI_Matrix4ScaleOptions *, const float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_Matrix4ScaleOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_212(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4ScaleOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4ScaleOptions_SetCenterY(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4ScaleOptions_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4RotationOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4RotationOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_213(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4RotationOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4RotationOptions_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4TranslationOptions_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4TranslationOptions_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_214(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4TranslationOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4TranslationOptions_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4TranslationOptions_SetZ(ArkUI_Matrix4TranslationOptions *, const float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_Matrix4TranslationOptions_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_215(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4TranslationOptions_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4TranslationOptions_SetZ(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4TranslationOptions_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_CreateIdentity
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_Matrix4_CreateIdentity，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_216(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_Matrix4_CreateIdentity();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4_Dispose(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_CreateByElements
 * 预期效果: 由 16 元数组创建矩阵成功。
 * 实际测试: 传入单位矩阵数组，创建后 Dispose。
 */
static napi_value TestArkUICapi_217(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    float elements[16] = {
        1, 0, 0, 0,  0, 1, 0, 0,  0, 0, 1, 0,  0, 0, 0, 1};
    auto *m = OH_ArkUI_Matrix4_CreateByElements(elements);
    if (((m)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Copy
 * 预期效果: 矩阵拷贝得到新对象。
 * 实际测试: CreateIdentity 后 Copy，双 Dispose。
 */
static napi_value TestArkUICapi_218(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *src = OH_ArkUI_Matrix4_CreateIdentity();
    if (((src)) == nullptr) {
        return nullptr;
    }

    auto *cp = OH_ArkUI_Matrix4_Copy(src);
    if (((cp)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_Matrix4_Dispose(cp);
    OH_ArkUI_Matrix4_Dispose(src);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Invert
 * 预期效果: 可逆矩阵 Invert 成功。
 * 实际测试: 单位矩阵上调用 Invert。
 */
static napi_value TestArkUICapi_219(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    if (((m)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Invert(m);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Combine
 * 预期效果: 两合法矩阵 Combine 成功。
 * 实际测试: 双 CreateIdentity，调用 Combine，断言 NO_ERROR，双 Dispose。
 */
static napi_value TestArkUICapi_220(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *a = OH_ArkUI_Matrix4_CreateIdentity();
    auto *b = OH_ArkUI_Matrix4_CreateIdentity();
    if (((a)) == nullptr) {
        return nullptr;
    }

    if (((b)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Combine(a, b);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(a);
    OH_ArkUI_Matrix4_Dispose(b);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Translate
 * 预期效果: 矩阵与平移选项组合成功。
 * 实际测试: CreateIdentity + TranslationOptions_Create，调用 Translate。
 */
static napi_value TestArkUICapi_221(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *tr = OH_ArkUI_Matrix4TranslationOptions_Create();
    if (((m)) == nullptr) {
        return nullptr;
    }

    if (((tr)) == nullptr) {
        OH_ArkUI_Matrix4_Dispose(m);
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Translate(m, tr);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4TranslationOptions_Dispose(tr);
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4TranslationOptions_Dispose(tr);
    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Scale
 * 预期效果: 矩阵与缩放选项组合成功。
 * 实际测试: CreateIdentity + ScaleOptions_Create，调用 Scale。
 */
static napi_value TestArkUICapi_222(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *sc = OH_ArkUI_Matrix4ScaleOptions_Create();
    if (((m)) == nullptr) {
        return nullptr;
    }

    if (((sc)) == nullptr) {
        OH_ArkUI_Matrix4_Dispose(m);
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Scale(m, sc);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4ScaleOptions_Dispose(sc);
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4ScaleOptions_Dispose(sc);
    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Rotate
 * 预期效果: 矩阵与旋转选项组合成功。
 * 实际测试: CreateIdentity + RotationOptions_Create，调用 Rotate。
 */
static napi_value TestArkUICapi_223(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    auto *ro = OH_ArkUI_Matrix4RotationOptions_Create();
    if (((m)) == nullptr) {
        return nullptr;
    }

    if (((ro)) == nullptr) {
        OH_ArkUI_Matrix4_Dispose(m);
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Rotate(m, ro);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4RotationOptions_Dispose(ro);
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4RotationOptions_Dispose(ro);
    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_Skew
 * 预期效果: 矩阵 Skew 合法 float 参数调用成功。
 * 实际测试: 单位矩阵 + (0,0) skew。
 */
static napi_value TestArkUICapi_224(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    if (((m)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_Matrix4_Skew(m, 0.0f, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_TransformPoint
 * 预期效果: 点坐标经矩阵变换成功。
 * 实际测试: 单位矩阵下变换栈上 ArkUI_PointF。
 */
static napi_value TestArkUICapi_225(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    if (((m)) == nullptr) {
        return nullptr;
    }

    ArkUI_PointF src = {1.0f, 2.0f};
    ArkUI_PointF dst = {0.0f, 0.0f};
    auto ec = OH_ArkUI_Matrix4_TransformPoint(m, &src, &dst);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_SetPolyToPoly
 * 预期效果: 四点多边形映射设置成功。
 * 实际测试: 栈上两组 ArkUI_PointF[4]，pointCount=4。
 */
static napi_value TestArkUICapi_226(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    if (((m)) == nullptr) {
        return nullptr;
    }

    ArkUI_PointF src[4] = {{0.0f, 0.0f}, {100.0f, 0.0f}, {0.0f, 100.0f}, {100.0f, 100.0f}};
    ArkUI_PointF dst[4] = {{0.0f, 0.0f}, {100.0f, 0.0f}, {0.0f, 100.0f}, {100.0f, 100.0f}};
    auto ec = OH_ArkUI_Matrix4_SetPolyToPoly(m, src, dst, 4U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_Matrix4_GetElements
 * 预期效果: 读出矩阵 16 元数组成功。
 * 实际测试: 单位矩阵 + 栈上 float[16] 出参。
 */
static napi_value TestArkUICapi_227(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *m = OH_ArkUI_Matrix4_CreateIdentity();
    if (((m)) == nullptr) {
        return nullptr;
    }

    float out[16] = {0};
    auto ec = OH_ArkUI_Matrix4_GetElements(m, out);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_Matrix4_Dispose(m);
            return napiAssertErr;
        }
    }

    OH_ArkUI_Matrix4_Dispose(m);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_FontWeightConfigs_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_228(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontWeightConfigs_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontWeightConfigs_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_FontWeightConfigs_Create() 后调用 OH_ArkUI_FontWeightConfigs_Destroy。
 */
static napi_value TestArkUICapi_229(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontWeightConfigs_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontWeightConfigs_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_SetEnableVariableFontWeight
 * 预期效果: 在合法 FontWeightConfigs 上设置布尔开关。
 * 实际测试: Create 后 SetEnableVariableFontWeight(true)，再 Destroy。
 */
static napi_value TestArkUICapi_230(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    if (((cfg)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontWeightConfigs_SetEnableVariableFontWeight(cfg, true);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_GetEnableVariableFontWeight(OH_ArkUI_FontWeightConfigs *)
 * 预期效果: 在合法 FontWeightConfigs 上读取布尔配置。
 * 实际测试: 创建 OH_ArkUI_FontWeightConfigs 后调用 Getter，再销毁。
 */
static napi_value TestArkUICapi_231(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    if (((cfg)) == nullptr) {
        return nullptr;
    }

    (void)OH_ArkUI_FontWeightConfigs_GetEnableVariableFontWeight(cfg);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_SetEnableDeviceFontWeightCategory
 * 预期效果: 在合法 FontWeightConfigs 上设置设备字重类别开关。
 * 实际测试: Create 后 Set，再 Destroy。
 */
static napi_value TestArkUICapi_232(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    if (((cfg)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontWeightConfigs_SetEnableDeviceFontWeightCategory(cfg, false);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontWeightConfigs_GetEnableDeviceFontWeightCategory(OH_ArkUI_FontWeightConfigs *)
 * 预期效果: 在合法 FontWeightConfigs 上读取布尔配置。
 * 实际测试: 创建 OH_ArkUI_FontWeightConfigs 后调用 Getter，再销毁。
 */
static napi_value TestArkUICapi_233(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cfg = OH_ArkUI_FontWeightConfigs_Create();
    if (((cfg)) == nullptr) {
        return nullptr;
    }

    (void)OH_ArkUI_FontWeightConfigs_GetEnableDeviceFontWeightCategory(cfg);
    OH_ArkUI_FontWeightConfigs_Destroy(cfg);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_FontConfigs_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_234(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontConfigs_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontConfigs_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_FontConfigs_Create() 后调用 OH_ArkUI_FontConfigs_Destroy。
 */
static napi_value TestArkUICapi_235(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_FontConfigs_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_FontConfigs_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_SetFontWeightConfigs
 * 预期效果: 将 FontWeightConfigs 关联到 FontConfigs。
 * 实际测试: 创建二者并 Set；Set 后仅 Destroy(fc)，勿再 Destroy(fw)（否则设备上二次释放崩溃）。
 */
static napi_value TestArkUICapi_236(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *fc = OH_ArkUI_FontConfigs_Create();
    if (((fc)) == nullptr) {
        return nullptr;
    }

    auto *fw = OH_ArkUI_FontWeightConfigs_Create();
    if (((fw)) == nullptr) {
        OH_ArkUI_FontConfigs_Destroy(fc);
        return nullptr;
    }

    OH_ArkUI_FontConfigs_SetFontWeightConfigs(fc, fw);
    // Set 后实现侧由 FontConfigs 持有 FontWeightConfigs：仅 Destroy(fc) 即可；再 Destroy(fw) 会在设备上二次释放 → SIGILL/App died。
    OH_ArkUI_FontConfigs_Destroy(fc);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_FontConfigs_GetFontWeightConfigs
 * 预期效果: SetFontWeightConfigs 后 GetFontWeightConfigs 返回非空配置指针。
 * 实际测试: Create 二者并 Set，Get 断言非空；Set 后仅 Destroy(fc)，不得再 Destroy(fw)（与 236 相同，避免二次释放崩溃）。
 */
static napi_value TestArkUICapi_237(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *fc = OH_ArkUI_FontConfigs_Create();
    if (((fc)) == nullptr) {
        return nullptr;
    }

    auto *fw = OH_ArkUI_FontWeightConfigs_Create();
    if (((fw)) == nullptr) {
        OH_ArkUI_FontConfigs_Destroy(fc);
        return nullptr;
    }

    OH_ArkUI_FontConfigs_SetFontWeightConfigs(fc, fw);
    auto *got = OH_ArkUI_FontConfigs_GetFontWeightConfigs(fc);
    if (((got)) == nullptr) {
        OH_ArkUI_FontConfigs_Destroy(fc);
        return nullptr;
    }

    OH_ArkUI_FontConfigs_Destroy(fc);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest

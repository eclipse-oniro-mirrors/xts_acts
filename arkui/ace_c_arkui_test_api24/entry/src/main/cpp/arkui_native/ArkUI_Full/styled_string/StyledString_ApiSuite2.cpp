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

namespace ArkUICapiTest {

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontFamily(const OH_ArkUI_TextStyle *, char *, int32_t, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_280(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_TextStyle_GetFontFamily(obj, buf1, static_cast<int32_t>(sizeof(buf1)), &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontSize(OH_ArkUI_TextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_281(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontSize(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontSize(const OH_ArkUI_TextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_282(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextStyle_GetFontSize(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontWeight(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_283(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontWeight(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontWeight(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_284(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetFontWeight(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontStyle(OH_ArkUI_TextStyle *, ArkUI_FontStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_285(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontStyle(obj, static_cast<ArkUI_FontStyle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetFontStyle(const OH_ArkUI_TextStyle *, ArkUI_FontStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_286(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_FontStyle outFs = static_cast<ArkUI_FontStyle>(0);
    auto ec = OH_ArkUI_TextStyle_GetFontStyle(obj, &outFs);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetStrokeWidth(OH_ArkUI_TextStyle *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_287(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetStrokeWidth(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetStrokeWidth(const OH_ArkUI_TextStyle *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_288(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_TextStyle_GetStrokeWidth(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetStrokeColor(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_289(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetStrokeColor(obj, 0U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetStrokeColor(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_290(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetStrokeColor(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetSuperscript(OH_ArkUI_TextStyle *, OH_ArkUI_SuperscriptStyle)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_291(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetSuperscript(obj, static_cast<OH_ArkUI_SuperscriptStyle>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_GetSuperscript(const OH_ArkUI_TextStyle *, OH_ArkUI_SuperscriptStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_292(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SuperscriptStyle outSs = static_cast<OH_ArkUI_SuperscriptStyle>(0);
    auto ec = OH_ArkUI_TextStyle_GetSuperscript(obj, &outSs);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_TextStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_SpanStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_293(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_SpanStyle_Create() 后调用 OH_ArkUI_SpanStyle_Destroy。
 */
static napi_value TestArkUICapi_294(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetStyledKey(const OH_ArkUI_SpanStyle *, OH_ArkUI_StyledStringKey *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_295(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_StyledStringKey outKey = static_cast<OH_ArkUI_StyledStringKey>(0);
    auto ec = OH_ArkUI_SpanStyle_GetStyledKey(obj, &outKey);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetStart(OH_ArkUI_SpanStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_296(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetStart(obj, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetStart(const OH_ArkUI_SpanStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_297(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_SpanStyle_GetStart(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLength(OH_ArkUI_SpanStyle *, int32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_298(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLength(obj, 0);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLength(const OH_ArkUI_SpanStyle *, int32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_299(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_SpanStyle_GetLength(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetTextStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_TextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_300(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_TextStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetTextStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_TextStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetTextStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_TextStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_301(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_TextStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetTextStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetTextStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_TextStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetParagraphStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_ParagraphStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_302(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_ParagraphStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetParagraphStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ParagraphStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_ParagraphStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetParagraphStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_ParagraphStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_303(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_ParagraphStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetParagraphStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ParagraphStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetParagraphStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ParagraphStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_ParagraphStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetGestureStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_GestureStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_304(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_GestureStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetGestureStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_GestureStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_GestureStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetGestureStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_GestureStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_305(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_GestureStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetGestureStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_GestureStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetGestureStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_GestureStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_GestureStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetTextShadowStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_TextShadowStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_306(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_TextShadowStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetTextShadowStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextShadowStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_TextShadowStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetTextShadowStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_TextShadowStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_307(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_TextShadowStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetTextShadowStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextShadowStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetTextShadowStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_TextShadowStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_TextShadowStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetDecorationStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_DecorationStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_308(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_DecorationStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetDecorationStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_DecorationStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_DecorationStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetDecorationStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_DecorationStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_309(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_DecorationStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetDecorationStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_DecorationStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetDecorationStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_DecorationStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_DecorationStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetBaselineOffsetStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_BaselineOffsetStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_310(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_BaselineOffsetStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetBaselineOffsetStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BaselineOffsetStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_BaselineOffsetStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetBaselineOffsetStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_BaselineOffsetStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_311(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_BaselineOffsetStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetBaselineOffsetStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BaselineOffsetStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetBaselineOffsetStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BaselineOffsetStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_BaselineOffsetStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLetterSpacingStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_LetterSpacingStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_312(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_LetterSpacingStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLetterSpacingStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LetterSpacingStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_LetterSpacingStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLetterSpacingStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_LetterSpacingStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_313(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_LetterSpacingStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetLetterSpacingStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LetterSpacingStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetLetterSpacingStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LetterSpacingStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_LetterSpacingStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetLineHeightStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_LineHeightStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_314(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_LineHeightStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetLineHeightStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LineHeightStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_LineHeightStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetLineHeightStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_LineHeightStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_315(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_LineHeightStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetLineHeightStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LineHeightStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetLineHeightStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_LineHeightStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_LineHeightStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetUrlStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_UrlStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_316(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_UrlStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetUrlStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UrlStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_UrlStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetUrlStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_UrlStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_317(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_UrlStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetUrlStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UrlStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetUrlStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UrlStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_UrlStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetBackgroundColorStyle(OH_ArkUI_SpanStyle *, const OH_ArkUI_BackgroundColorStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_318(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_BackgroundColorStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetBackgroundColorStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BackgroundColorStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_BackgroundColorStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetBackgroundColorStyle(const OH_ArkUI_SpanStyle *, OH_ArkUI_BackgroundColorStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_319(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_BackgroundColorStyle_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetBackgroundColorStyle(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BackgroundColorStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetBackgroundColorStyle(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_BackgroundColorStyle_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_BackgroundColorStyle_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetUserDataSpan(OH_ArkUI_SpanStyle *, const OH_ArkUI_UserDataSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_320(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_UserDataSpan_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetUserDataSpan(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UserDataSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_UserDataSpan_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetUserDataSpan(const OH_ArkUI_SpanStyle *, OH_ArkUI_UserDataSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_321(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_UserDataSpan_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    int32_t userSlot = 0;
    {
        auto ecData = OH_ArkUI_UserDataSpan_SetUserData(sub, static_cast<void*>(&userSlot));
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecData), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UserDataSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetUserDataSpan(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UserDataSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetUserDataSpan(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_UserDataSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_UserDataSpan_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetCustomSpan(OH_ArkUI_SpanStyle *, const OH_ArkUI_CustomSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_322(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_CustomSpan_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetCustomSpan(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_CustomSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_CustomSpan_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetCustomSpan(const OH_ArkUI_SpanStyle *, OH_ArkUI_CustomSpan *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_323(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_CustomSpan_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetCustomSpan(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_CustomSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetCustomSpan(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_CustomSpan_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_CustomSpan_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_SetImageAttachment(OH_ArkUI_SpanStyle *, const OH_ArkUI_ImageAttachment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_324(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_ImageAttachment_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_SpanStyle_SetImageAttachment(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ImageAttachment_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_ImageAttachment_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_SpanStyle_GetImageAttachment(const OH_ArkUI_SpanStyle *, OH_ArkUI_ImageAttachment *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_SpanStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_325(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_SpanStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *sub = OH_ArkUI_ImageAttachment_Create();
    if (sub == nullptr) {
        OH_ArkUI_SpanStyle_Destroy(obj);
        return nullptr;
    }

    {
        auto ecSet = OH_ArkUI_SpanStyle_SetImageAttachment(obj, sub);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ecSet), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ImageAttachment_Destroy(sub);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_SpanStyle_GetImageAttachment(obj, sub);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(obj);
            OH_ArkUI_ImageAttachment_Destroy(sub);
            return napiAssertErr;
        }
    }

    OH_ArkUI_SpanStyle_Destroy(obj);
    OH_ArkUI_ImageAttachment_Destroy(sub);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_326(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Create() 后调用 OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy。
 */
static napi_value TestArkUICapi_327(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetX(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_328(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetX(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetX(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_329(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetX(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTop(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_330(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetTop(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetTop(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_331(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetTop(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBottom(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_332(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetBottom(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBottom(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_333(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetBottom(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBaseline(OH_ArkUI_LeadingMarginSpanDrawInfo *, float)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_334(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetBaseline(obj, 0.0f);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBaseline(const OH_ArkUI_LeadingMarginSpanDrawInfo *, float *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_335(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    float v1 = 0.0f;
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetBaseline(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTextDirection(OH_ArkUI_LeadingMarginSpanDrawInfo *, ArkUI_TextDirection)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_336(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_SetTextDirection(obj, static_cast<ArkUI_TextDirection>(0));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_LeadingMarginSpanDrawInfo_GetTextDirection(const OH_ArkUI_LeadingMarginSpanDrawInfo *,
 *     ArkUI_TextDirection *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_LeadingMarginSpanDrawInfo_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_337(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_LeadingMarginSpanDrawInfo_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    ArkUI_TextDirection tdOut1 = static_cast<ArkUI_TextDirection>(0);
    auto ec = OH_ArkUI_LeadingMarginSpanDrawInfo_GetTextDirection(obj, &tdOut1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}
} // namespace ArkUICapiTest

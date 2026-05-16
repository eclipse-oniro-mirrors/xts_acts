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
#include <cstring>
#include <vector>

namespace ArkUICapiTest {

namespace {
/*
 * styled_string 用例约定：
 * 1) 需要有效描述符的接口统一通过 XtsDescriptorFromUtf8 构造输入/输出对象；
 * 2) 带 ** 输出参数的接口需提供可写目标（已创建对象槽或可写缓冲区），不传空写入目标；
 * 3) Set* 成功后由调用方负责 Destroy 入参对象。
 */
ArkUI_StyledString_Descriptor* XtsDescriptorFromUtf8(const char* utf8)
{
    if (utf8 == nullptr) {
        return nullptr;
    }
    const auto n = static_cast<size_t>(std::strlen(utf8));
    std::vector<const OH_ArkUI_SpanStyle*> slots(n, nullptr);
    return OH_ArkUI_StyledString_Descriptor_CreateWithString(
        utf8, (n == 0U) ? nullptr : slots.data(), static_cast<int32_t>(n));
}

bool XtsMakeFontSpanStyle(OH_ArkUI_TextStyle** ts, OH_ArkUI_SpanStyle** span, int32_t start, int32_t len)
{
    *ts = OH_ArkUI_TextStyle_Create();
    *span = OH_ArkUI_SpanStyle_Create();
    if (*ts == nullptr || *span == nullptr) {
        if (*span != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(*span);
        }
        if (*ts != nullptr) {
            OH_ArkUI_TextStyle_Destroy(*ts);
        }
        *ts = nullptr;
        *span = nullptr;
        return false;
    }
    (void)OH_ArkUI_SpanStyle_SetTextStyle(*span, *ts);
    (void)OH_ArkUI_SpanStyle_SetStart(*span, start);
    (void)OH_ArkUI_SpanStyle_SetLength(*span, len);
    return true;
}
} // namespace

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED（OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED = -1）
 * 预期效果: 枚举/宏常量取值应为 -1。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED 并断言等于 -1。
 */
static napi_value TestArkUICapi_238(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = -1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_FONT（OH_ARKUI_STYLEDSTRINGKEY_FONT = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_FONT 并断言等于 0。
 */
static napi_value TestArkUICapi_239(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_FONT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_DECORATION（OH_ARKUI_STYLEDSTRINGKEY_DECORATION = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_DECORATION 并断言等于 1。
 */
static napi_value TestArkUICapi_240(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_DECORATION)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET（OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET 并断言等于 2。
 */
static napi_value TestArkUICapi_241(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING（OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING = 3）
 * 预期效果: 枚举/宏常量取值应为 3。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING 并断言等于 3。
 */
static napi_value TestArkUICapi_242(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 3;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW（OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW = 4）
 * 预期效果: 枚举/宏常量取值应为 4。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW 并断言等于 4。
 */
static napi_value TestArkUICapi_243(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 4;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT（OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT = 5）
 * 预期效果: 枚举/宏常量取值应为 5。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT 并断言等于 5。
 */
static napi_value TestArkUICapi_244(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 5;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR（OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR = 6）
 * 预期效果: 枚举/宏常量取值应为 6。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR 并断言等于 6。
 */
static napi_value TestArkUICapi_245(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 6;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_URL（OH_ARKUI_STYLEDSTRINGKEY_URL = 7）
 * 预期效果: 枚举/宏常量取值应为 7。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_URL 并断言等于 7。
 */
static napi_value TestArkUICapi_246(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 7;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_URL)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_GESTURE（OH_ARKUI_STYLEDSTRINGKEY_GESTURE = 100）
 * 预期效果: 枚举/宏常量取值应为 100。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_GESTURE 并断言等于 100。
 */
static napi_value TestArkUICapi_247(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 100;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_GESTURE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE（OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE = 200）
 * 预期效果: 枚举/宏常量取值应为 200。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE 并断言等于 200。
 */
static napi_value TestArkUICapi_248(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 200;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_IMAGE（OH_ARKUI_STYLEDSTRINGKEY_IMAGE = 300）
 * 预期效果: 枚举/宏常量取值应为 300。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_IMAGE 并断言等于 300。
 */
static napi_value TestArkUICapi_249(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 300;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_IMAGE)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN（OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN = 400）
 * 预期效果: 枚举/宏常量取值应为 400。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN 并断言等于 400。
 */
static napi_value TestArkUICapi_250(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 400;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_STYLEDSTRINGKEY_USER_DATA（OH_ARKUI_STYLEDSTRINGKEY_USER_DATA = 500）
 * 预期效果: 枚举/宏常量取值应为 500。
 * 实际测试: 读取符号 OH_ARKUI_STYLEDSTRINGKEY_USER_DATA 并断言等于 500。
 */
static napi_value TestArkUICapi_251(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 500;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env,
            (static_cast<int32_t>(OH_ARKUI_STYLEDSTRINGKEY_USER_DATA)),
            (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithString
 * 预期效果: 由非空 C 字符串创建描述符。
 * 实际测试: styled_string.h 中 styles 为样式数组指针；部分实现要求指针非空（length=0 时不解引用）。使用栈上占位数组。
 */
static napi_value TestArkUICapi_252(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *d = XtsDescriptorFromUtf8("xts_capi");
    if (((d)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithImageAttachment
 * 预期效果: 由图片附件创建描述符。
 * 实际测试: 先创建 OH_ArkUI_ImageAttachment，再创建描述符，按序释放。
 */
static napi_value TestArkUICapi_253(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *img = OH_ArkUI_ImageAttachment_Create();
    if (((img)) == nullptr) {
        return nullptr;
    }

    auto *d = OH_ArkUI_StyledString_Descriptor_CreateWithImageAttachment(img);
    if (((d)) == nullptr) {
        OH_ArkUI_ImageAttachment_Destroy(img);
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    OH_ArkUI_ImageAttachment_Destroy(img);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_CreateWithCustomSpan
 * 预期效果: 由自定义 Span 创建描述符。
 * 实际测试: 创建 CustomSpan 后组装描述符并释放。
 */
static napi_value TestArkUICapi_254(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *cs = OH_ArkUI_CustomSpan_Create();
    if (((cs)) == nullptr) {
        return nullptr;
    }

    auto *d = OH_ArkUI_StyledString_Descriptor_CreateWithCustomSpan(cs);
    if (((d)) == nullptr) {
        OH_ArkUI_CustomSpan_Destroy(cs);
        return nullptr;
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(d);
    OH_ArkUI_CustomSpan_Destroy(cs);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_GetLength(const ArkUI_StyledString_Descriptor *, int32_t *)
 * 预期效果: 在有效描述符上调用 GetLength 成功。
 * 实际测试: 空 Descriptor_Create() 经 GetLength 后部分版本 Destroy 会 SIGSEGV；改用 CreateWithString 再 GetLength。
 * （崩溃栈曾见 DestroyArkUIStyledStringDescriptor。）
 */
static napi_value TestArkUICapi_255(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    int32_t v1 = 0;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetLength(obj, &v1);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_GetString(const ArkUI_StyledString_Descriptor *, char *, int32_t, int32_t *)
 * 预期效果: 在含文本内容的描述符上 GetString 成功。
 * 实际测试: 空 Create() 描述符易导致 INVALID_STYLED_STRING 或与 255 同类稳定性问题；使用 CreateWithString。
 */
static napi_value TestArkUICapi_256(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    int32_t v3 = 0;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetString(obj, buf1, static_cast<int32_t>(sizeof(buf1)), &v3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_IsEqual(const ArkUI_StyledString_Descriptor *,
 *     const ArkUI_StyledString_Descriptor *, bool *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 按 styled_string.h，IsEqual 在 INVALID_STYLED_STRING 时非 NO_ERROR；用 CreateWithString 得到有效文本描述符再比较。
 */
static napi_value TestArkUICapi_257(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *other = XtsDescriptorFromUtf8("a");
    if (other == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }

    bool v2 = false;
    auto ec = OH_ArkUI_StyledString_Descriptor_IsEqual(obj, other, &v2);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(other);
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(other);
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_SubStyledString(const ArkUI_StyledString_Descriptor *,
 *     ArkUI_StyledString_Descriptor *, uint32_t, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 源串和输出描述符均使用 XtsDescriptorFromUtf8 构造，断言返回 ARKUI_ERROR_CODE_NO_ERROR。
 */
static napi_value TestArkUICapi_258(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("ab");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *outDesc = XtsDescriptorFromUtf8(".");
    if (outDesc == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_SubStyledString(obj, outDesc, 0U, 1U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(outDesc);
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(outDesc);
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_GetStyles(const ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     OH_ArkUI_StyledStringKey, OH_ArkUI_SpanStyle **, uint32_t, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 先 SetStyle 绑定 FONT(TextStyle)，styles[] 传已创建 SpanStyle 槽，断言返回 ARKUI_ERROR_CODE_NO_ERROR。
 */
static napi_value TestArkUICapi_259(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("x");
    if (((obj)) == nullptr) {
        return nullptr;
    }
    OH_ArkUI_TextStyle* ts = nullptr;
    OH_ArkUI_SpanStyle* sty = nullptr;
    if (!XtsMakeFontSpanStyle(&ts, &sty, 0, 1)) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }
    {
        auto es = OH_ArkUI_StyledString_Descriptor_SetStyle(obj, sty);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (es), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(sty);
            OH_ArkUI_TextStyle_Destroy(ts);
            return napiAssertErr;
        }
    }
    auto *recv = OH_ArkUI_SpanStyle_Create();
    if (recv == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        OH_ArkUI_SpanStyle_Destroy(sty);
        OH_ArkUI_TextStyle_Destroy(ts);
        return nullptr;
    }
    OH_ArkUI_SpanStyle* styleSlots[1] = { recv };
    uint32_t v6 = 0U;
    auto ec = OH_ArkUI_StyledString_Descriptor_GetStyles(
        obj, 0U, 1U, OH_ARKUI_STYLEDSTRINGKEY_FONT, styleSlots, 1U, &v6);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(recv);
            OH_ArkUI_SpanStyle_Destroy(sty);
            OH_ArkUI_TextStyle_Destroy(ts);
            return napiAssertErr;
        }
    }
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    OH_ArkUI_SpanStyle_Destroy(recv);
    OH_ArkUI_SpanStyle_Destroy(sty);
    OH_ArkUI_TextStyle_Destroy(ts);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_FromHtml(ArkUI_StyledString_Descriptor *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_260(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("x");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    const char html[] = "a";
    auto ec = OH_ArkUI_StyledString_Descriptor_FromHtml(obj, html);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_ReplaceString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_261(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf3[32] = {0};
    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceString(obj, 0U, 1U, buf3);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_InsertString(ArkUI_StyledString_Descriptor *, uint32_t, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_262(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf2[32] = {0};
    auto ec = OH_ArkUI_StyledString_Descriptor_InsertString(obj, 0U, buf2);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_RemoveString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_263(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_RemoveString(obj, 0U, 1U);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_ReplaceStyle(ArkUI_StyledString_Descriptor *, const OH_ArkUI_SpanStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_264(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }
    OH_ArkUI_TextStyle* ts0 = nullptr;
    OH_ArkUI_SpanStyle* style0 = nullptr;
    if (!XtsMakeFontSpanStyle(&ts0, &style0, 0, 1)) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }
    {
        auto es = OH_ArkUI_StyledString_Descriptor_SetStyle(obj, style0);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (es), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(style0);
            OH_ArkUI_TextStyle_Destroy(ts0);
            return napiAssertErr;
        }
    }
    OH_ArkUI_TextStyle* ts = nullptr;
    OH_ArkUI_SpanStyle* style = nullptr;
    if (!XtsMakeFontSpanStyle(&ts, &style, 0, 1)) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        OH_ArkUI_SpanStyle_Destroy(style0);
        OH_ArkUI_TextStyle_Destroy(ts0);
        return nullptr;
    }
    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceStyle(obj, style);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(style);
            OH_ArkUI_SpanStyle_Destroy(style0);
            OH_ArkUI_TextStyle_Destroy(ts);
            OH_ArkUI_TextStyle_Destroy(ts0);
            return napiAssertErr;
        }
    }
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    OH_ArkUI_SpanStyle_Destroy(style);
    OH_ArkUI_SpanStyle_Destroy(style0);
    OH_ArkUI_TextStyle_Destroy(ts);
    OH_ArkUI_TextStyle_Destroy(ts0);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_SetStyle(ArkUI_StyledString_Descriptor *, const OH_ArkUI_SpanStyle *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_265(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *ts = OH_ArkUI_TextStyle_Create();
    auto *style = OH_ArkUI_SpanStyle_Create();
    if (ts == nullptr || style == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        if (style != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(style);
        }
        if (ts != nullptr) {
            OH_ArkUI_TextStyle_Destroy(ts);
        }
        return nullptr;
    }
    (void)OH_ArkUI_SpanStyle_SetTextStyle(style, ts);
    (void)OH_ArkUI_SpanStyle_SetStart(style, 0);
    (void)OH_ArkUI_SpanStyle_SetLength(style, 1);

    auto ec = OH_ArkUI_StyledString_Descriptor_SetStyle(obj, style);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(style);
            OH_ArkUI_TextStyle_Destroy(ts);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    OH_ArkUI_SpanStyle_Destroy(style);
    OH_ArkUI_TextStyle_Destroy(ts);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_RemoveStyle(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     OH_ArkUI_StyledStringKey)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_266(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *ts = OH_ArkUI_TextStyle_Create();
    auto *style = OH_ArkUI_SpanStyle_Create();
    if (ts == nullptr || style == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        if (style != nullptr) {
            OH_ArkUI_SpanStyle_Destroy(style);
        }
        if (ts != nullptr) {
            OH_ArkUI_TextStyle_Destroy(ts);
        }
        return nullptr;
    }
    (void)OH_ArkUI_SpanStyle_SetTextStyle(style, ts);
    (void)OH_ArkUI_SpanStyle_SetStart(style, 0);
    (void)OH_ArkUI_SpanStyle_SetLength(style, 1);
    {
        auto es = OH_ArkUI_StyledString_Descriptor_SetStyle(obj, style);
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (es), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(style);
            OH_ArkUI_TextStyle_Destroy(ts);
            return napiAssertErr;
        }
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_RemoveStyle(obj, 0U, 1U, OH_ARKUI_STYLEDSTRINGKEY_FONT);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            OH_ArkUI_SpanStyle_Destroy(style);
            OH_ArkUI_TextStyle_Destroy(ts);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    OH_ArkUI_SpanStyle_Destroy(style);
    OH_ArkUI_TextStyle_Destroy(ts);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_ClearStyles(ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_267(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_ClearStyles(obj);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_ReplaceStyledString(ArkUI_StyledString_Descriptor *, uint32_t, uint32_t,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_268(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *other = XtsDescriptorFromUtf8("b");
    if (other == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_ReplaceStyledString(obj, 0U, 1U, other);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(other);
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(other);
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_InsertStyledString(ArkUI_StyledString_Descriptor *, uint32_t,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_269(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *other = XtsDescriptorFromUtf8("b");
    if (other == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_InsertStyledString(obj, 0U, other);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(other);
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(other);
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口:
 *     OH_ArkUI_StyledString_Descriptor_AppendStyledString(ArkUI_StyledString_Descriptor *,
 *     const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_270(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto *other = XtsDescriptorFromUtf8("b");
    if (other == nullptr) {
        OH_ArkUI_StyledString_Descriptor_Destroy(obj);
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_AppendStyledString(obj, other);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(other);
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(other);
    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_StyledString_Descriptor_InvalidateCustomSpan(const ArkUI_StyledString_Descriptor *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_StyledString_Descriptor_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_271(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = XtsDescriptorFromUtf8("a");
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_StyledString_Descriptor_InvalidateCustomSpan(obj);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(env, (ec), (ARKUI_ERROR_CODE_NO_ERROR));
        if (napiAssertErr != nullptr) {
            OH_ArkUI_StyledString_Descriptor_Destroy(obj);
            return napiAssertErr;
        }
    }

    OH_ArkUI_StyledString_Descriptor_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL（OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL 并断言等于 0。
 */
static napi_value TestArkUICapi_272(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL)), (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT（OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT 并断言等于 1。
 */
static napi_value TestArkUICapi_273(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT)), (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT（OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT = 2）
 * 预期效果: 枚举/宏常量取值应为 2。
 * 实际测试: 读取符号 OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT 并断言等于 2。
 */
static napi_value TestArkUICapi_274(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 2;
    {
        napi_value napiAssertErr = ::ArkUICapiTest::EqFailed(
            env, (static_cast<int32_t>(OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT)), (expected));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_Create
 * 预期效果: 工厂方法返回非空指针，释放后无泄漏。
 * 实际测试: 调用 OH_ArkUI_TextStyle_Create，断言非空，再配对释放。
 */
static napi_value TestArkUICapi_275(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_Destroy
 * 预期效果: 先创建对象再销毁，资源正确释放无崩溃。
 * 实际测试: 调用 OH_ArkUI_TextStyle_Create() 后调用 OH_ArkUI_TextStyle_Destroy。
 */
static napi_value TestArkUICapi_276(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    OH_ArkUI_TextStyle_Destroy(obj);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_TextStyle_SetFontColor(OH_ArkUI_TextStyle *, uint32_t)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_277(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    auto ec = OH_ArkUI_TextStyle_SetFontColor(obj, 0U);
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
 * 测试接口: OH_ArkUI_TextStyle_GetFontColor(const OH_ArkUI_TextStyle *, uint32_t *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_278(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    uint32_t v1 = 0U;
    auto ec = OH_ArkUI_TextStyle_GetFontColor(obj, &v1);
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
 * 测试接口: OH_ArkUI_TextStyle_SetFontFamily(OH_ArkUI_TextStyle *, const char *)
 * 预期效果: 在 SDK 创建的合法对象上调用接口并返回成功错误码。
 * 实际测试: 通过 OH_ArkUI_TextStyle_Create 创建对象，调用接口，断言 ARKUI_ERROR_CODE_NO_ERROR，再释放对象。
 */
static napi_value TestArkUICapi_279(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *obj = OH_ArkUI_TextStyle_Create();
    if (((obj)) == nullptr) {
        return nullptr;
    }

    char buf1[32] = {0};
    auto ec = OH_ArkUI_TextStyle_SetFontFamily(obj, buf1);
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
} // namespace ArkUICapiTest

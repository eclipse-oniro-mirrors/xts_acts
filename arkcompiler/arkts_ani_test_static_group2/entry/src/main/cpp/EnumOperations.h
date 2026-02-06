/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_ENUMOPERATIONS_H
#define ARKTS_ANI_TEST_ENUMOPERATIONS_H
#include "Common.h"

ani_int test_Enum_GetEnumItemByName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);

    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);

    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_size redIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
    ASSERT_EQ(redIndex, 0U);

    ani_size greenIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(green, &greenIndex), ANI_OK);
    ASSERT_EQ(greenIndex, 1U);

    ani_size blueIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(blue, &blueIndex), ANI_OK);
    ASSERT_EQ(blueIndex, 2U);

    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr int32_t loopCount = 3;
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red{};
    ani_enum_item green{};
    ani_enum_item blue{};
    for (int32_t times = 0; times < loopCount; times++) {
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);
    }

    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string itemName;

    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_size redIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
    ASSERT_EQ(redIndex, 0U);
    ani_size greenIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(green, &greenIndex), ANI_OK);
    ASSERT_EQ(greenIndex, 1U);
    ani_size blueIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(blue, &blueIndex), ANI_OK);
    ASSERT_EQ(blueIndex, 2U);
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);

    ani_size res {};
    ASSERT_EQ(env->EnumItem_GetIndex(nullptr, &res), ANI_INVALID_ARGS);
    ASSERT_EQ(env->EnumItem_GetIndex(red, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->EnumItem_GetIndex(nullptr, red, &res), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr int32_t loopCount = 3;
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red2 {};
    std::string itemName {};
    ani_string redName {};
    ani_enum_item red {};
    ani_boolean isRedEqual = ANI_FALSE;
  
    for (int32_t times = 0; times < loopCount; times++) {
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red2), ANI_OK);
        ASSERT_EQ(env->EnumItem_GetName(red2, &redName), ANI_OK);
        GetStdString(env, redName, itemName);
        ASSERT_STREQ(itemName.data(), "RED");
        ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, itemName.c_str(), &red), ANI_OK);
        ASSERT_EQ(env->Reference_Equals(red, red2, &isRedEqual), ANI_OK);
        ASSERT_EQ(isRedEqual, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr int32_t loopCount = 3;
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ani_enum fromRed {};
    ani_size redIndex = 5U;
    ani_enum_item red2 {};
    ani_boolean isRedEqual = ANI_FALSE;

    for (int32_t times = 0; times < loopCount; times++) {
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
        ASSERT_EQ(env->EnumItem_GetEnum(red, &fromRed), ANI_OK);
        ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
        ASSERT_EQ(redIndex, 0U);
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(fromRed, redIndex, &red2), ANI_OK);
        ASSERT_EQ(env->Reference_Equals(red, red2, &isRedEqual), ANI_OK);
        ASSERT_EQ(isRedEqual, ANI_TRUE);
        ASSERT_EQ(env->Reference_Equals(aniEnum, fromRed, &isRedEqual), ANI_OK);
        ASSERT_EQ(isRedEqual, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr int32_t loopCount = 3;
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ani_enum_item green {};
    ani_enum_item blue {};
    for (int32_t times = 0; times < loopCount; times++) {
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
        ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.OneItem", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item oneItem {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &oneItem), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.OneItem", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item one {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "ONE", &one), ANI_OK);

    ani_size oneIndex = 5U;
    ASSERT_EQ(env->EnumItem_GetIndex(one, &oneIndex), ANI_OK);
    ASSERT_EQ(oneIndex, 0U);
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);

    ani_enum fromRed {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromRed), ANI_OK);
    ani_enum fromGreen {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromGreen), ANI_OK);
    ani_enum fromBlue {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromBlue), ANI_OK);

    ani_int redValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(red, &redValInt), ANI_OK);
    ASSERT_EQ(redValInt, 0U);
    ani_int greenValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(green, &greenValInt), ANI_OK);
    ASSERT_EQ(greenValInt, 1U);
    ani_int blueValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(blue, &blueValInt), ANI_OK);
    ASSERT_EQ(blueValInt, 2U);

    std::string itemName {};
    ani_string redName {};
    ASSERT_EQ(env->EnumItem_GetName(red, &redName), ANI_OK);
    GetStdString(env, redName, itemName);
    ASSERT_STREQ(itemName.data(), "RED");

    ani_string greenName {};
    ASSERT_EQ(env->EnumItem_GetName(green, &greenName), ANI_OK);
    GetStdString(env, greenName, itemName);
    ASSERT_STREQ(itemName.data(), "GREEN");
    ani_string blueName {};
    ASSERT_EQ(env->EnumItem_GetName(blue, &blueName), ANI_OK);
    GetStdString(env, blueName, itemName);
    ASSERT_STREQ(itemName.data(), "BLUE");

    ani_size redIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
    ASSERT_EQ(redIndex, 0U);
    ani_size greenIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(green, &greenIndex), ANI_OK);
    ASSERT_EQ(greenIndex, 1U);
    ani_size blueIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(blue, &blueIndex), ANI_OK);
    ASSERT_EQ(blueIndex, 2U);
    return ANI_TRUE;
}

ani_int test_Enum_GetEnumItemByIndex_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);

    ani_enum fromRed{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromRed), ANI_OK);
    ani_enum fromGreen{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromGreen), ANI_OK);
    ani_enum fromBlue{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromBlue), ANI_OK);

    ani_int redValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(red, &redValInt), ANI_OK);
    ASSERT_EQ(redValInt, 0U);

    ani_int greenValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(green, &greenValInt), ANI_OK);
    ASSERT_EQ(greenValInt, 1U);

    ani_int blueValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(blue, &blueValInt), ANI_OK);
    ASSERT_EQ(blueValInt, 2U);

    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);

    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);

    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);

    ani_enum fromRed {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromRed), ANI_OK);

    ani_enum fromGreen {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromGreen), ANI_OK);

    ani_enum fromBlue {};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromBlue), ANI_OK);

    ani_boolean isRedEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(aniEnum, fromRed, &isRedEqual), ANI_OK);
    ASSERT_EQ(isRedEqual, ANI_TRUE);

    ani_boolean isGreenEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(aniEnum, fromGreen, &isGreenEqual), ANI_OK);
    ASSERT_EQ(isGreenEqual, ANI_TRUE);

    ani_boolean isBlueEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(aniEnum, fromBlue, &isBlueEqual), ANI_OK);
    ASSERT_EQ(isBlueEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);

    ani_enum fromRed {};
    ASSERT_EQ(env->EnumItem_GetEnum(nullptr, &fromRed), ANI_INVALID_ARGS);
    ASSERT_EQ(env->EnumItem_GetEnum(red, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->EnumItem_GetEnum(nullptr, red, &fromRed), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.OneItem", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item one {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "ONE", &one), ANI_OK);
    ani_enum fromone {};
    ASSERT_EQ(env->EnumItem_GetEnum(one, &fromone), ANI_OK);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnumString {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorString", &aniEnumString), ANI_OK);
    ASSERT_NE(aniEnumString, nullptr);
    ani_enum_item redString {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumString, "REDSTR", &redString), ANI_OK);

    ani_size redStrIndex = 5U;
    ASSERT_EQ(env->EnumItem_GetIndex(redString, &redStrIndex), ANI_OK);
    ASSERT_EQ(redStrIndex, 0U);

    ani_string redStrName {};
    std::string itemName {};
    ASSERT_EQ(env->EnumItem_GetName(redString, &redStrName), ANI_OK);
    GetStdString(env, redStrName, itemName);
    ASSERT_STREQ(itemName.data(), "REDSTR");

    ani_string redStrValStr {};
    std::string enumVal {};
    ASSERT_EQ(env->EnumItem_GetValue_String(redString, &redStrValStr), ANI_OK);
    GetStdString(env, redStrValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "str_red");
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.EnumOperations.A", &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);
    ani_object obj {};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);  // NOLINT(cppcoreguidelines-pro-type-vararg)
    ani_enum enm {};
    ASSERT_EQ(env->EnumItem_GetEnum(static_cast<ani_enum_item>(obj), &enm), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);

    ani_enum fromRed{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromRed), ANI_OK);
    ani_enum fromGreen{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromGreen), ANI_OK);
    ani_enum fromBlue{};
    ASSERT_EQ(env->EnumItem_GetEnum(red, &fromBlue), ANI_OK);

    ani_int redValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(red, &redValInt), ANI_OK);
    ASSERT_EQ(redValInt, 0U);
    ani_int greenValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(green, &greenValInt), ANI_OK);
    ASSERT_EQ(greenValInt, 1U);
    ani_int blueValInt = 0U;
    ASSERT_EQ(env->EnumItem_GetValue_Int(blue, &blueValInt), ANI_OK);
    ASSERT_EQ(blueValInt, 2U);

    return ANI_TRUE;
}

ani_int test_EnumItem_GetValue_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string enumVal;
    ani_enum aniEnum{};
    ani_size sz{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);
    ani_string redValStr{};
    ASSERT_EQ(env->EnumItem_GetValue_String(red, &redValStr), ANI_OK);

    ASSERT_EQ(env->String_GetUTF8Size(redValStr, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(redValStr, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "0"), ANI_OK);

    ani_string greenValStr{};
    ASSERT_EQ(env->EnumItem_GetValue_String(green, &greenValStr), ANI_OK);

    ASSERT_EQ(env->String_GetUTF8Size(greenValStr, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(greenValStr, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "1"), ANI_OK);

    ani_string blueValStr{};
    ASSERT_EQ(env->EnumItem_GetValue_String(blue, &blueValStr), ANI_OK);

    ASSERT_EQ(env->String_GetUTF8Size(blueValStr, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(blueValStr, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "2"), ANI_OK);

    return ANI_TRUE;
}

ani_int test_EnumItem_GetName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    std::string enumVal;
    ani_size sz{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_string redName{};
    ASSERT_EQ(env->EnumItem_GetName(red, &redName), ANI_OK);
    ASSERT_EQ(env->String_GetUTF8Size(redName, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(redName, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "RED"), ANI_OK);

    ani_string greenName{};
    ASSERT_EQ(env->EnumItem_GetName(green, &greenName), ANI_OK);
    ASSERT_EQ(env->String_GetUTF8Size(greenName, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(greenName, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "GREEN"), ANI_OK);

    ani_string blueName{};
    ASSERT_EQ(env->EnumItem_GetName(blue, &blueName), ANI_OK);
    ASSERT_EQ(env->String_GetUTF8Size(blueName, &sz), ANI_OK);
    enumVal.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(blueName, 0, sz, enumVal.data(), enumVal.size(), &sz), ANI_OK);
    enumVal.resize(sz);
    ASSERT_EQ(std::strcmp(enumVal.data(), "BLUE"), ANI_OK);

    return ANI_TRUE;
}

ani_int test_EnumItem_GetIndex([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_size redIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
    ASSERT_EQ(redIndex, 0U);
    ani_size greenIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(green, &greenIndex), ANI_OK);
    ASSERT_EQ(greenIndex, 1U);
    ani_size blueIndex{};
    ASSERT_EQ(env->EnumItem_GetIndex(blue, &blueIndex), ANI_OK);
    ASSERT_EQ(blueIndex, 2U);

    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_enum aniEnumInt {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindInt", &aniEnumInt), ANI_OK);
    ASSERT_NE(aniEnumInt, nullptr);
    ani_enum_item redInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "REDINT", &redInt), ANI_OK);
    ani_enum_item greenInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "GREENINT", &greenInt), ANI_OK);
    ani_enum_item blueInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "BLUEINT", &blueInt), ANI_OK);

    ani_enum aniEnumStr {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindString", &aniEnumStr), ANI_OK);
    ASSERT_NE(aniEnumStr, nullptr);
    ani_enum_item redStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "REDSTR", &redStr), ANI_OK);
    ani_enum_item greenStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "GREENSTR", &greenStr), ANI_OK);
    ani_enum_item blueStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "BLUESTR", &blueStr), ANI_OK);

    ani_enum aniEnumBig {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindBig", &aniEnumBig), ANI_OK);
    ASSERT_NE(aniEnumBig, nullptr);
    ani_enum_item zero {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumBig, "ZERO", &zero), ANI_OK);
    ani_enum_item nine {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumBig, "NINE", &nine), ANI_OK);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "red", &red), ANI_NOT_FOUND);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "green", &green), ANI_NOT_FOUND);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "blue", &blue), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "REDINT", &red), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREENINT", &green), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUEINT", &blue), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "REDSTR", &red), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREENSTR", &green), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUESTR", &blue), ANI_NOT_FOUND);

    ani_enum aniEnumBig {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindBig", &aniEnumBig), ANI_OK);
    ASSERT_NE(aniEnumBig, nullptr);
    ani_enum_item minus {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumBig, "MINUSONE", &minus), ANI_NOT_FOUND);
    ani_enum_item ten {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumBig, "TEN", &ten), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blue), ANI_OK);

    ani_enum aniEnumInt {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindInt", &aniEnumInt), ANI_OK);
    ASSERT_NE(aniEnumInt, nullptr);
    ani_enum_item redInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumInt, 0U, &redInt), ANI_OK);
    ani_enum_item greenInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumInt, 1U, &greenInt), ANI_OK);
    ani_enum_item blueInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumInt, 2U, &blueInt), ANI_OK);

    ani_enum aniEnumStr {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindString", &aniEnumStr), ANI_OK);
    ASSERT_NE(aniEnumStr, nullptr);
    ani_enum_item redStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumStr, 0U, &redStr), ANI_OK);
    ani_enum_item greenStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumStr, 1U, &greenStr), ANI_OK);
    ani_enum_item blueStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumStr, 2U, &blueStr), ANI_OK);

    ani_enum aniEnumBig {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindBig", &aniEnumBig), ANI_OK);
    ASSERT_NE(aniEnumBig, nullptr);
    ani_enum_item zero {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumBig, 0U, &zero), ANI_OK);
    ani_enum_item nine {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumBig, 9U, &nine), ANI_OK);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item item {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 3U, &item), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 4U, &item), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, -1, &item), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 42U, &item), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, -1 * 42U, &item), ANI_NOT_FOUND);

    ani_enum aniEnumBig {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFindBig", &aniEnumBig), ANI_OK);
    ASSERT_NE(aniEnumBig, nullptr);
    ani_enum_item minus {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumBig, -1, &minus), ANI_NOT_FOUND);
    ani_enum_item ten {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnumBig, 10U, &ten), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item redName {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &redName), ANI_OK);
    ani_enum_item redIndex {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &redIndex), ANI_OK);
    ani_boolean isRedEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(redName, redIndex, &isRedEqual), ANI_OK);
    ASSERT_EQ(isRedEqual, ANI_TRUE);

    ani_enum_item greenName {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &greenName), ANI_OK);
    ani_enum_item greenIndex {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 1U, &greenIndex), ANI_OK);
    ani_boolean isGreenEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(greenName, greenIndex, &isGreenEqual), ANI_OK);
    ASSERT_EQ(isGreenEqual, ANI_TRUE);

    ani_enum_item blueName {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blueName), ANI_OK);
    ani_enum_item blueIndex {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 2U, &blueIndex), ANI_OK);
    ani_boolean isBlueEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(blueName, blueIndex, &isBlueEqual), ANI_OK);
    ASSERT_EQ(isBlueEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ToFind", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(nullptr, "RED", &red), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, nullptr, &red), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Enum_GetEnumItemByName(nullptr, aniEnum, "RED", &red), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "", &red), ANI_NOT_FOUND);

    ASSERT_EQ(env->Enum_GetEnumItemByIndex(nullptr, 0U, &red), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, -1U, &red), ANI_NOT_FOUND);
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->Enum_GetEnumItemByIndex(nullptr, aniEnum, 0U, &red), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_Item_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string itemName;

    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);

    ani_string redName {};
    ASSERT_EQ(env->EnumItem_GetName(red, &redName), ANI_OK);
    GetStdString(env, redName, itemName);
    ASSERT_STREQ(itemName.data(), "RED");
    ani_string greenName {};
    ASSERT_EQ(env->EnumItem_GetName(green, &greenName), ANI_OK);
    GetStdString(env, greenName, itemName);
    ASSERT_STREQ(itemName.data(), "GREEN");
    ani_string blueName {};
    ASSERT_EQ(env->EnumItem_GetName(blue, &blueName), ANI_OK);
    GetStdString(env, blueName, itemName);
    ASSERT_STREQ(itemName.data(), "BLUE");

    ani_enum aniEnumInt {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorInt", &aniEnumInt), ANI_OK);
    ASSERT_NE(aniEnumInt, nullptr);
    ani_enum_item redInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "REDINT", &redInt), ANI_OK);
    ani_enum_item greenInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "GREENINT", &greenInt), ANI_OK);
    ani_enum_item blueInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "BLUEINT", &blueInt), ANI_OK);

    ani_string redIntName {};
    ASSERT_EQ(env->EnumItem_GetName(redInt, &redIntName), ANI_OK);
    GetStdString(env, redIntName, itemName);
    ASSERT_STREQ(itemName.data(), "REDINT");
    ani_string greenIntName {};
    ASSERT_EQ(env->EnumItem_GetName(greenInt, &greenIntName), ANI_OK);
    GetStdString(env, greenIntName, itemName);
    ASSERT_STREQ(itemName.data(), "GREENINT");
    ani_string blueIntName {};
    ASSERT_EQ(env->EnumItem_GetName(blueInt, &blueIntName), ANI_OK);
    GetStdString(env, blueIntName, itemName);
    ASSERT_STREQ(itemName.data(), "BLUEINT");
    return ANI_TRUE;
}

ani_int test_EnumItem_GetEnum_Item_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string itemName;

    ani_enum aniEnumStr {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorString", &aniEnumStr), ANI_OK);
    ASSERT_NE(aniEnumStr, nullptr);
    ani_enum_item redStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "REDSTR", &redStr), ANI_OK);
    ani_enum_item greenStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "GREENSTR", &greenStr), ANI_OK);
    ani_enum_item blueStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "BLUESTR", &blueStr), ANI_OK);

    ani_string redStrName {};
    ASSERT_EQ(env->EnumItem_GetName(redStr, &redStrName), ANI_OK);
    GetStdString(env, redStrName, itemName);
    ASSERT_STREQ(itemName.data(), "REDSTR");
    ani_string greenStrName {};
    ASSERT_EQ(env->EnumItem_GetName(greenStr, &greenStrName), ANI_OK);
    GetStdString(env, greenStrName, itemName);
    ASSERT_STREQ(itemName.data(), "GREENSTR");
    ani_string blueStrName {};
    ASSERT_EQ(env->EnumItem_GetName(blueStr, &blueStrName), ANI_OK);
    GetStdString(env, blueStrName, itemName);
    ASSERT_STREQ(itemName.data(), "BLUESTR");
    return ANI_TRUE;
}

ani_int test_EnumItem_Invalid_Arg_Enum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);

    ani_string res {};
    ASSERT_EQ(env->EnumItem_GetName(nullptr, &res), ANI_INVALID_ARGS);
    ASSERT_EQ(env->EnumItem_GetName(red, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->EnumItem_GetName(nullptr, red, &res), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_EnumItem_Name_Combine_Scenes([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);

    ani_size redIndex {};
    ASSERT_EQ(env->EnumItem_GetIndex(red, &redIndex), ANI_OK);
    ASSERT_EQ(redIndex, 0U);

    ani_enum_item red2 {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, redIndex, &red2), ANI_OK);

    ani_boolean isRedEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(red, red2, &isRedEqual), ANI_OK);
    ASSERT_EQ(isRedEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_EnumItem_Name_Test_One_Item([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.OneItem", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item one {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "ONE", &one), ANI_OK);

    ani_string fromone {};
    std::string itemName {};
    ASSERT_EQ(env->EnumItem_GetName(one, &fromone), ANI_OK);
    GetStdString(env, fromone, itemName);
    ASSERT_STREQ(itemName.data(), "ONE");
    return ANI_TRUE;
}


ani_int test_EnumItem_Name_Get_Value_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);
    ani_int redValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(red, &redValInt), ANI_OK);
    ASSERT_EQ(redValInt, 0U);
    ani_int greenValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(green, &greenValInt), ANI_OK);
    ASSERT_EQ(greenValInt, 1U);
    ani_int blueValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(blue, &blueValInt), ANI_OK);
    ASSERT_EQ(blueValInt, 2U);

    ani_enum aniEnumInt {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorInt", &aniEnumInt), ANI_OK);
    ASSERT_NE(aniEnumInt, nullptr);
    ani_enum_item redInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "REDINT", &redInt), ANI_OK);
    ani_enum_item greenInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "GREENINT", &greenInt), ANI_OK);
    ani_enum_item blueInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "BLUEINT", &blueInt), ANI_OK);
    ani_int redIntValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(redInt, &redIntValInt), ANI_OK);
    ASSERT_EQ(redIntValInt, 5U);
    ani_int greenIntValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(greenInt, &greenIntValInt), ANI_OK);
    ASSERT_EQ(greenIntValInt, 77U);
    ani_int blueIntValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(blueInt, &blueIntValInt), ANI_OK);
    ASSERT_EQ(blueIntValInt, 9999U);
    return ANI_TRUE;
}

ani_int test_EnumItem_Get_Wrong_Value_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnumStr {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorString", &aniEnumStr), ANI_OK);
    ASSERT_NE(aniEnumStr, nullptr);
    ani_enum_item redStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "REDSTR", &redStr), ANI_OK);
    ani_enum_item greenStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "GREENSTR", &greenStr), ANI_OK);
    ani_enum_item blueStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "BLUESTR", &blueStr), ANI_OK);
    ani_int redStrValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(redStr, &redStrValInt), ANI_INVALID_ARGS);
    ani_int greenStrValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(greenStr, &greenStrValInt), ANI_INVALID_ARGS);
    ani_int blueStrValInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(blueStr, &blueStrValInt), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_EnumItem_Get_Value_String_1([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string enumVal;

    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);
    ani_enum_item green {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "GREEN", &green), ANI_OK);
    ani_enum_item blue {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "BLUE", &blue), ANI_OK);
    ani_string redValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(red, &redValStr), ANI_OK);
    GetStdString(env, redValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "0");
    ani_string greenValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(green, &greenValStr), ANI_OK);
    GetStdString(env, greenValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "1");
    ani_string blueValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(blue, &blueValStr), ANI_OK);
    GetStdString(env, blueValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "2");

    ani_enum aniEnumInt {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorInt", &aniEnumInt), ANI_OK);
    ASSERT_NE(aniEnumInt, nullptr);
    ani_enum_item redInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "REDINT", &redInt), ANI_OK);
    ani_enum_item greenInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "GREENINT", &greenInt), ANI_OK);
    ani_enum_item blueInt {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumInt, "BLUEINT", &blueInt), ANI_OK);
    ani_string redIntValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(redInt, &redIntValStr), ANI_OK);
    GetStdString(env, redIntValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "5");
    ani_string greenIntValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(greenInt, &greenIntValStr), ANI_OK);
    GetStdString(env, greenIntValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "77");
    ani_string blueIntValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(blueInt, &blueIntValStr), ANI_OK);
    GetStdString(env, blueIntValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "9999");
    return ANI_TRUE;
}

ani_int test_EnumItem_Get_Value_String_2([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string enumVal;

    ani_enum aniEnumStr {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.ColorString", &aniEnumStr), ANI_OK);
    ASSERT_NE(aniEnumStr, nullptr);
    ani_enum_item redStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "REDSTR", &redStr), ANI_OK);
    ani_enum_item greenStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "GREENSTR", &greenStr), ANI_OK);
    ani_enum_item blueStr {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnumStr, "BLUESTR", &blueStr), ANI_OK);
    ani_string redStrValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(redStr, &redStrValStr), ANI_OK);
    GetStdString(env, redStrValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "str_red");
    ani_string greenStrValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(greenStr, &greenStrValStr), ANI_OK);
    GetStdString(env, greenStrValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "str_green");
    ani_string blueStrValStr {};
    ASSERT_EQ(env->EnumItem_GetValue_String(blueStr, &blueStrValStr), ANI_OK);
    GetStdString(env, blueStrValStr, enumVal);
    ASSERT_STREQ(enumVal.data(), "str_blue");
    return ANI_TRUE;
}

ani_int test_EnumItem_Get_Invalid_Arg_Enum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.Color", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);
    ani_enum_item red {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &red), ANI_OK);

    ani_int redInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(nullptr, &redInt), ANI_INVALID_ARGS);
    ASSERT_EQ(env->EnumItem_GetValue_Int(red, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->EnumItem_GetValue_Int(nullptr, red, &redInt), ANI_INVALID_ARGS);

    ani_string redString {};
    ASSERT_EQ(env->EnumItem_GetValue_String(nullptr, &redString), ANI_INVALID_ARGS);
    ASSERT_EQ(env->EnumItem_GetValue_String(red, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->EnumItem_GetValue_String(nullptr, red, &redString), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_EnumItem_Get_Value_One_Item([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.EnumOperations.OneItem", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item one {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "ONE", &one), ANI_OK);

    ani_int fromone = 5;
    ASSERT_EQ(env->EnumItem_GetValue_Int(one, &fromone), ANI_OK);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_ENUMOPERATIONS_H

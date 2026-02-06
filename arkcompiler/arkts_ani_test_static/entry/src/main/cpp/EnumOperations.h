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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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

ani_int test_EnumItem_GetEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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

ani_int test_EnumItem_GetValue_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum{};
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/EnumOperations/Color;", &aniEnum), ANI_OK);
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
#endif // ARKTS_ANI_TEST_ENUMOPERATIONS_H

/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "UnitDateTimeTest.h"

using namespace std;
using namespace testing::ext;
namespace OHOS {
using namespace I18N;
using namespace testing;

class DateTimeTest : public ::testing::TestWithParam<LocaleInfo> {
public:
    static const int32_t AMPMMAXINDEX = 2;
    static const int32_t AMINDEX = 0;
    static const int32_t PMINDEX = 1;
};

class DateTimeLocaleRecallTest : public testing::Test {
public:
    static const int32_t INDEX_NEG_ONE = -1;

public:
    static const int32_t INDEX_MAX_WEEK = 7;

public:
    static const int32_t INDEX_MAX_MONTH = 12;
};

class DateTimeApplyPatternTest : public testing::Test {};

/* *
 * get locale index
 *
 * expectResult return locale index
 */
static int GetLocaleIndex(LocaleInfo locale, vector<LocaleInfo> locales)
{
    for (unsigned int index = 0; index < locales.size(); index++) {
        if (locale == locales[index]) {
            return index;
        }
    }
    return -1;
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_Format_0100, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    enum AvailableDateTimeFormatPattern patternFormats[] = {
    HOUR12_MINUTE_SECOND, HOUR24_MINUTE_SECOND, HOUR_MINUTE_SECOND,
    HOUR12_MINUTE, HOUR24_MINUTE, HOUR_MINUTE,
    ABBR_MONTH_WEEKDAY_DAY, ABBR_MONTH_DAY, YEAR_ABBR_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_WIDE_MONTH_ABBR_WEEKDAY_DAY, YEAR_SHORT_MONTH_WIDE_WEEKDAY_DAY, YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, YEAR_WIDE_MONTH_DAY, FULL,
    MEDIUM, SHORT
    };
    int length = sizeof(patternFormats) / sizeof(patternFormats[0]);
    for (int i = 0; i < length; i++) {
        DateTimeFormat *datetime = new DateTimeFormat(patternFormats[i], localeInfo);
        ASSERT_TRUE(datetime != nullptr);
        time_t cal = 3600 * 3 + 3600 * 24 * 6;
        I18nStatus status = I18nStatus::ISUCCESS;
        string appendTo = "";
        datetime->Format(cal, "+1:45", appendTo, status);
        EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][i]);
        delete datetime;
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_Format_0200, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    enum AvailableDateTimeFormatPattern patternFormats[] = {
    HOUR12_MINUTE_SECOND, HOUR24_MINUTE_SECOND, HOUR_MINUTE_SECOND,
    HOUR12_MINUTE, HOUR24_MINUTE, HOUR_MINUTE,
    ABBR_MONTH_WEEKDAY_DAY, ABBR_MONTH_DAY, YEAR_ABBR_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_WIDE_MONTH_ABBR_WEEKDAY_DAY, YEAR_SHORT_MONTH_WIDE_WEEKDAY_DAY, YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, YEAR_WIDE_MONTH_DAY, FULL,
    MEDIUM, SHORT
    };
    int length = sizeof(patternFormats) / sizeof(patternFormats[0]);
    for (int i = 0; i < length; i++) {
        DateTimeFormat *datetime = new DateTimeFormat(patternFormats[i], localeInfo);
        ASSERT_TRUE(datetime != nullptr);
        time_t cal = 3600 * 3 + 3600 * 24 * 6;
        I18nStatus status = I18nStatus::ISUCCESS;
        string appendTo = "";
        datetime->Format(cal, "+0:00", appendTo, status);
        EXPECT_EQ(appendTo, testing::g_dateTimeFormat[localeIndex][i]);
        delete datetime;
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_Format_0300, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    enum AvailableDateTimeFormatPattern patternFormats[] = {
    HOUR12_MINUTE_SECOND, HOUR24_MINUTE_SECOND, HOUR_MINUTE_SECOND,
    HOUR12_MINUTE, HOUR24_MINUTE, HOUR_MINUTE,
    ABBR_MONTH_WEEKDAY_DAY, ABBR_MONTH_DAY, YEAR_ABBR_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_WIDE_MONTH_ABBR_WEEKDAY_DAY, YEAR_SHORT_MONTH_WIDE_WEEKDAY_DAY, YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY,
    YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, YEAR_WIDE_MONTH_DAY, FULL,
    MEDIUM, SHORT
    };
    int length = sizeof(patternFormats) / sizeof(patternFormats[0]);
    for (int i = 0; i < length; i++) {
        DateTimeFormat *datetime = new DateTimeFormat(patternFormats[i], localeInfo);
        ASSERT_TRUE(datetime != nullptr);
        time_t cal = 3600 * 3 + 3600 * 24 * 6;
        I18nStatus status = I18nStatus::ISUCCESS;
        string appendTo = "";
        datetime->Format(cal, "-1:45", appendTo, status);
        EXPECT_EQ(appendTo, testing::g_dateTimeFormatNegative[localeIndex][i]);
        delete datetime;
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0100, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    auto index = OHOS::DateTimeLocaleRecallTest::INDEX_NEG_ONE;
    std::string formatWeekName = datetime->GetWeekName(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(formatWeekName, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0200, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    auto index = OHOS::DateTimeLocaleRecallTest::INDEX_MAX_WEEK;
    std::string formatWeekName = datetime->GetWeekName(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(formatWeekName, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0300, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int weekindex = 0; weekindex < DateTimeLocaleRecallTest::INDEX_MAX_WEEK; weekindex++) {
        std::string formatWeekName = datetime->GetWeekName(weekindex, DateTimeDataType::FORMAT_ABBR);
        EXPECT_EQ(formatWeekName, g_formatAbbrDayNames[localeIndex][weekindex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0400, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int weekindex = 0; weekindex < DateTimeLocaleRecallTest::INDEX_MAX_WEEK; weekindex++) {
        std::string formatWeekName = datetime->GetWeekName(weekindex, DateTimeDataType::FORMAT_WIDE);
        EXPECT_EQ(formatWeekName, g_formatWideDayNames[localeIndex][weekindex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0500, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int weekindex = 0; weekindex < DateTimeLocaleRecallTest::INDEX_MAX_WEEK; weekindex++) {
        std::string formatWeekName = datetime->GetWeekName(weekindex, DateTimeDataType::STANDALONE_ABBR);
        EXPECT_EQ(formatWeekName, g_standaloneAbbrDayNames[localeIndex][weekindex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetWeekName_0600, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int weekindex = 0; weekindex < DateTimeLocaleRecallTest::INDEX_MAX_WEEK; weekindex++) {
        std::string formatWeekName = datetime->GetWeekName(weekindex, DateTimeDataType::STANDALONE_WIDE);
        EXPECT_EQ(formatWeekName, g_standaloneWideDayNames[localeIndex][weekindex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0100, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    auto index = DateTimeLocaleRecallTest::INDEX_NEG_ONE;
    std::string formatMonthName = datetime->GetMonthName(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(formatMonthName, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0200, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    auto index = DateTimeLocaleRecallTest::INDEX_MAX_MONTH;
    std::string formatMonthName = datetime->GetMonthName(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(formatMonthName, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0300, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int monthIndex = 0; monthIndex < DateTimeLocaleRecallTest::INDEX_MAX_MONTH; monthIndex++) {
        std::string formatMonthName = datetime->GetMonthName(monthIndex, DateTimeDataType::FORMAT_ABBR);
        EXPECT_EQ(formatMonthName, g_formatAbbrMonthNames[localeIndex][monthIndex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0400, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int monthIndex = 0; monthIndex < DateTimeLocaleRecallTest::INDEX_MAX_MONTH; monthIndex++) {
        std::string formatMonthName = datetime->GetMonthName(monthIndex, DateTimeDataType::FORMAT_WIDE);
        EXPECT_EQ(formatMonthName, g_formatWideMonthNames[localeIndex][monthIndex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0500, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int monthIndex = 0; monthIndex < DateTimeLocaleRecallTest::INDEX_MAX_MONTH; monthIndex++) {
        std::string formatMonthName = datetime->GetMonthName(monthIndex, DateTimeDataType::STANDALONE_ABBR);
        EXPECT_EQ(formatMonthName, g_standaloneAbbrMonthNames[localeIndex][monthIndex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetMonthName_0600, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    for (int monthIndex = 0; monthIndex < DateTimeLocaleRecallTest::INDEX_MAX_MONTH; monthIndex++) {
        std::string formatMonthName = datetime->GetMonthName(monthIndex, DateTimeDataType::STANDALONE_WIDE);
        EXPECT_EQ(formatMonthName, g_standaloneWideMonthNames[localeIndex][monthIndex]);
    }
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetAmPmMarkers_0100, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    std::string infoAmPm = datetime->GetAmPmMarker(-1, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(infoAmPm, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetAmPmMarkers_0200, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    int index = DateTimeTest::AMPMMAXINDEX;
    std::string infoAmPm = datetime->GetAmPmMarker(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(infoAmPm, "");
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetAmPmMarkers_0300, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    int index = DateTimeTest::AMINDEX;
    std::string infoAmPm = datetime->GetAmPmMarker(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(infoAmPm, g_amPmMarkers[localeIndex][0]);
}

HWTEST_P(DateTimeTest, GLOBAL_DateTimeFormat_GetAmPmMarkers_0400, Function | MediumTest | Level0)
{
    LocaleInfo localeInfo = GetParam();
    int localeIndex = GetLocaleIndex(localeInfo, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(HOUR12_MINUTE_SECOND, localeInfo);
    int index = DateTimeTest::PMINDEX;
    std::string infoAmPm = datetime->GetAmPmMarker(index, DateTimeDataType::FORMAT_ABBR);
    EXPECT_EQ(infoAmPm, g_amPmMarkers[localeIndex][1]);
}

INSTANTIATE_TEST_CASE_P(AllDateTimeTest, DateTimeTest,
    Values(LocaleInfo("ar", "", ""), LocaleInfo("ar", "AE"), LocaleInfo("ar", "EG"), LocaleInfo("as", "Latn", "IN"),
    LocaleInfo("de", "DE"), LocaleInfo("en", "", ""), LocaleInfo("en", "GB"), LocaleInfo("en", "Qaag", ""),
    LocaleInfo("en", "US"), LocaleInfo("es", "ES"), LocaleInfo("es", "US"), LocaleInfo("fr", "FR"),
    LocaleInfo("it", "IT"), LocaleInfo("ka", "GE"), LocaleInfo("mai", "Deva", ""), LocaleInfo("my", "MM"),
    LocaleInfo("pa", "Guru", ""), LocaleInfo("pt", "BR"), LocaleInfo("pt", "PT"), LocaleInfo("sr", "Cyrl", ""),
    LocaleInfo("th", "TH"), LocaleInfo("zh", "", ""), LocaleInfo("zh", "Hans", "CN"), LocaleInfo("zh", "Hans", "HK"),
    LocaleInfo("zh", "Hans", "MO"), LocaleInfo("zh", "Hant", "TW")));


/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0100
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0100, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR12_MINUTE_SECOND;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][0]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0200
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0200, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR24_MINUTE_SECOND;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][1]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0300
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0300, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR_MINUTE_SECOND;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][2]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0400
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0400, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR12_MINUTE;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][3]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0500
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0500, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR24_MINUTE;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][4]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0600
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0600, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::HOUR_MINUTE;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][5]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0700
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0700, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::ABBR_MONTH_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][6]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0800
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0800, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::ABBR_MONTH_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][7]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_0900
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_0900, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_ABBR_MONTH_ABBR_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][8]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1000
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1000, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_WIDE_MONTH_ABBR_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][9]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1100
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1100, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_SHORT_MONTH_WIDE_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][10]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1200
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1200, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][11]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1300
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1300, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_ABBR_MONTH_WIDE_WEEKDAY_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][12]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1400
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1400, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(MEDIUM, *locale);
    auto pattern = AvailableDateTimeFormatPattern::YEAR_WIDE_MONTH_DAY;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][13]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1500
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1500, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(MEDIUM, *locale);
    auto pattern = AvailableDateTimeFormatPattern::FULL;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][14]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1600
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1600, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(YEAR_SHORT_MONTH_ABBR_WEEKDAY_DAY, *locale);
    auto pattern = AvailableDateTimeFormatPattern::MEDIUM;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][15]);
}

/**
 * @tc.name   GLOBAL_DateTimeFormat_ApplyPattern_1700
 * @tc.number SUB_GLOBAL_GLOBALIZATIONBUSINESS_DATETIMEFORMAT_APPLYPATTERN_1700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DateTimeApplyPatternTest, GLOBAL_DateTimeFormat_ApplyPattern_1700, Function | MediumTest | Level0)
{
    LocaleInfo *locale = new LocaleInfo("en", "US");
    int localeIndex = GetLocaleIndex(*locale, g_locales);
    DateTimeFormat *datetime = new DateTimeFormat(MEDIUM, *locale);
    auto pattern = AvailableDateTimeFormatPattern::SHORT;
    datetime->ApplyPattern(pattern);
    time_t cal = 3600 * 3 + 3600 * 24 * 6;
    I18nStatus status = I18nStatus::ISUCCESS;
    string appendTo = "";
    datetime->Format(cal, "+1:45", appendTo, status);
    EXPECT_EQ(appendTo, testing::g_dataTimeFormatPositive[localeIndex][16]);
}
} // namespace OHOS
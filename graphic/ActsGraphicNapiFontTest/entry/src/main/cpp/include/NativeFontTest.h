/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVEFONTTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVEFONTTEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Font test constants
constexpr double DEFAULT_FONT_SIZE = 30.0;
constexpr double DEFAULT_MAX_WIDTH = 2160.0;
constexpr float INDENT_FIRST = 1.2f;
constexpr float INDENT_SECOND = 3.4f;
constexpr int INDENT_COUNT = 2;
constexpr int INDENT_INDEX = 1;
constexpr int TEST_BITMAP_WIDTH = 20;
constexpr int TEST_BITMAP_HEIGHT = 40;
constexpr double TEST_POSITION_X = 10.0;
constexpr double TEST_POSITION_Y = 15.0;
constexpr int PLACEHOLDER_WIDTH = 20;
constexpr int PLACEHOLDER_HEIGHT = 40;
constexpr int PLACEHOLDER_BASELINE_OFFSET = 10;
constexpr int RANGE_START = 1;
constexpr int RANGE_END = 2;
constexpr int COORDINATE_X = 1;
constexpr int COORDINATE_Y = 0;
constexpr double EXPECTED_WIDTH_LEFT_ALIGN = 522.772095;
constexpr double EXPECTED_WIDTH_RIGHT_ALIGN = 386.828308;
constexpr double EXPECTED_WIDTH_CENTER_ALIGN = 393.414185;
constexpr double EXPECTED_WIDTH_CENTER_WITH_DIR = 414.388336;
constexpr float TEXT_PATH_COORDINATE_X = 12.0f;
constexpr float TEXT_PATH_COORDINATE_Y = 150.0f;
constexpr double TEXT_TAB_LOCATION_DEFAULT = 0.0;
constexpr double TEXT_TAB_LOCATION_NEGATIVE = -100.0;
constexpr double TEXT_TAB_LOCATION_NEGATIVE_ONE = -1.0;
constexpr float TEXT_PATH_NEGATIVE_COORD = -1.0f;
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

namespace OHOS {
namespace Rosen {
namespace Drawing {
int NativeFontTestFontMeasureText015();
int NativeFontTestFontMeasureText016();
int NativeFontTestFontMeasureText017();
int NativeDrawingRegisterFontTest001();
int NativeDrawingRegisterFontTest002();
int OHDrawingFontCollectionTest001();
int OHDrawingTypographyLargeValueTest016();
int OHDrawingTypographyLargeValueTest026();
int OHDrawingTypographyLargeValueTest027();
int OHDrawingTypographyLargeValueTest042();
int OHDrawingTypographyLargeValueTestWithIndent();
int OHDrawingCreateTextTab001();
int OHDrawingCreateTextTab002();
int OHDrawingCreateTextTab003();
int TypographyTest001();
int TypographyTest002();
int TypographyTest003();
int TypographyTest004();
int TypographyTest005();
int FontGetTextPath001();
int FontGetTextPath002();
int FontGetTextPath003();
int FontGetTextPath004();
int FontGetTextPath005();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVEFONTTEST_H

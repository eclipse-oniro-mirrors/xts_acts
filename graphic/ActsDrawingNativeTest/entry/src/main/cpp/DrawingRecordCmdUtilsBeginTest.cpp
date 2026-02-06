/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingRecordCmdUtilsBeginTest.h"
#include <random>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int32_t TEST_RECORD_WIDTH_0 = 0;
constexpr int32_t TEST_RECORD_HEIGHT_NEGATIVE_1 = -1;
constexpr int32_t TEST_RECORD_WIDTH_1 = 1;
constexpr int32_t TEST_RECORD_HEIGHT_1 = 1;
constexpr int TEST_LOOP_COUNT_10 = 10;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingRecordCmdUtilsBeginRecordingTestSetUp()
{
    std::cout << "DrawingRecordCmdUtilsBeginRecordingTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsBeginRecordingTest errorCodeReset before each test case." << std::endl;
}

void DrawingRecordCmdUtilsBeginRecordingTestTearDown()
{
    std::cout << "DrawingRecordCmdUtilsBeginRecordingTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsBeginRecordingTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRecordCmdUtilsBeginRecordingAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04100
 * @tc.desc   test for testRecordCmdUtilsBeginRecordingAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRecordCmdUtilsBeginRecordingAbnormal()
{
    DrawingRecordCmdUtilsBeginRecordingTestSetUp();

    // 1. The first and fourth parameters of the OH-Drawing-RecordCmdUtelsBeginRecording interface are not empty
    // with width and height being 0 and -1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate();
    drawingErrorCode = OH_Drawing_RecordCmdUtilsBeginRecording(nullptr,
                                                               TEST_RECORD_WIDTH_0,
                                                               TEST_RECORD_HEIGHT_NEGATIVE_1,
                                                               canvass);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. free memory
    OH_Drawing_RecordCmdUtilsDestroy(recordcmd1);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingRecordCmdUtilsBeginRecordingTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRecordCmdUtilsBeginRecordingCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04200
 * @tc.desc   test for testRecordCmdUtilsBeginRecordingCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestRecordCmdUtilsBeginRecordingCalls()
{
    DrawingRecordCmdUtilsBeginRecordingTestSetUp();

    // 1. Call OH-Drawing-RecordCmdUtelsBeginRecording 10 times
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        drawingErrorCode = OH_Drawing_RecordCmdUtilsBeginRecording(nullptr,
                                                                   TEST_RECORD_WIDTH_1,
                                                                   TEST_RECORD_HEIGHT_1,
                                                                   canvass);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 2. free memory
    OH_Drawing_RecordCmdUtilsDestroy(recordcmd1);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingRecordCmdUtilsBeginRecordingTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

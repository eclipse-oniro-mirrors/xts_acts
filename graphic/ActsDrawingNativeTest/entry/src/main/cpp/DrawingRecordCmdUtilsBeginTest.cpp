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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_10 10


namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestRecordCmdUtilsBeginRecordingAbnormal()
{
    DrawingRecordCmdUtilsBeginRecordingTestSetUp();
    // 1. The first and fourth parameters of the OH-Drawing-RecordCmdUtelsBeginRecording interface are not empty
    //with width and height being 0 and -1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate();
    drawingErrorCode = OH_Drawing_RecordCmdUtilsBeginRecording(nullptr, 0, -DRAWING_NUMBER_1, canvass);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. free memory
    OH_Drawing_RecordCmdUtilsDestroy(recordcmd1);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingRecordCmdUtilsBeginRecordingTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        drawingErrorCode =
            OH_Drawing_RecordCmdUtilsBeginRecording(nullptr, DRAWING_NUMBER_1, DRAWING_NUMBER_1, canvass);
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

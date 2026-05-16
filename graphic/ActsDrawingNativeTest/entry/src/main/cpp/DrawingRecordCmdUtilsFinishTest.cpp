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

#include "include/DrawingRecordCmdUtilsFinishTest.h"
#include <random>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1


namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingRecordCmdUtilsFinishRecordingTestSetUp()
{
    std::cout << "DrawingRecordCmdUtilsFinishRecordingTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsFinishRecordingTest errorCodeReset before each test case." << std::endl;
}

void DrawingRecordCmdUtilsFinishRecordingTestTearDown()
{
    std::cout << "DrawingRecordCmdUtilsFinishRecordingTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsFinishRecordingTest errorCodeReset after each test case." << std::endl;
}

int TestRecordCmdUtilsFinishRecordingNormal()
{
    DrawingRecordCmdUtilsFinishRecordingTestSetUp();
    // 1. None of the OH_Drawing_RecordCmdUtilsFinishRecording parameters are empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd *recordCmd;
    OH_Drawing_RecordCmd **recordCmds = &recordCmd;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordcmdutil1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording(recordcmdutil1, recordCmds);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    DrawingRecordCmdUtilsFinishRecordingTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdUtilsFinishRecordingNull()
{
    DrawingRecordCmdUtilsFinishRecordingTestSetUp();
    // 1. OH-Drawing-RecordCmdUtelsFinishRecording, RecordCmd or RecordCmdUtils parameter is empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_RecordCmd** recordCmds = &recordCmd;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    OH_Drawing_RecordCmdUtilsBeginRecording(recordcmdutil1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording(nullptr, recordCmds);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RecordCmdUtilsBeginRecording(recordcmdutil1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording(recordcmdutil1, nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingRecordCmdUtilsFinishRecordingTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

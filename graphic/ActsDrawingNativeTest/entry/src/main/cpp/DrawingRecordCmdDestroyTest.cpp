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

#include "include/DrawingRecordCmdDestroyTest.h"
#include <iomanip>
#include <random>
#include <sstream>
#include <thread>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_0XFF 0xFF


namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int CIRCLE_X_OFFSET = 10;
constexpr int CIRCLE_RADIUS = 200;
constexpr int32_t TEST_RECORD_WIDTH = 2;
constexpr int32_t TEST_RECORD_HEIGHT = 5;
constexpr float PEN_WIDTH = 1.0f;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingRecordCmdDestroyTestSetUp()
{
    std::cout << "DrawingRecordCmdDestroyTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdDestroyTest errorCodeReset before each test case." << std::endl;
}

void DrawingRecordCmdDestroyTestTearDown()
{
    std::cout << "DrawingRecordCmdDestroyTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdDestroyTest errorCodeReset after each test case." << std::endl;
}
void drawCircle(OH_Drawing_Canvas* canvas, int position)
{
    int x = CIRCLE_X_OFFSET;
    int radius = CIRCLE_RADIUS;
    OH_Drawing_Point* point = OH_Drawing_PointCreate(x * position + radius, x + radius);
    OH_Drawing_CanvasDrawCircle(canvas, point, radius);
    OH_Drawing_PointDestroy(point);
}
OH_Drawing_RecordCmd* threadFunctionTest1()
{
    int32_t width = TEST_RECORD_WIDTH;
    int32_t height = TEST_RECORD_HEIGHT;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    float penWidth = PEN_WIDTH; // pen width 1
    // 创建一个画笔Pen对象，Pen对象用于形状的边框线绘制
    OH_Drawing_Pen* cPen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetAntiAlias(cPen, true);
    OH_Drawing_PenSetColor(cPen, OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF, 0, 0));
    OH_Drawing_PenSetWidth(cPen, penWidth);
    OH_Drawing_PenSetJoin(cPen, LINE_ROUND_JOIN);
    // 将Pen画笔设置到canvas中
    OH_Drawing_CanvasAttachPen(canvas, cPen);
    // 创建一个画刷Brush对象，Brush对象用于形状的填充
    OH_Drawing_Brush* cBrush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(cBrush, OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, 0, DRAWING_NUMBER_0XFF, 0));
    // 将Brush画刷设置到canvas中
    OH_Drawing_CanvasAttachBrush(canvas, cBrush);
    drawCircle(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_BrushDestroy(cBrush);
    OH_Drawing_PenDestroy(cPen);
    cBrush = nullptr;
    cPen = nullptr;
    return recordCmd;
}

int TestRecordCmdDestroyNormal()
{
    DrawingRecordCmdDestroyTestSetUp();

    // 1. The OH-Drawing-RecordCmdDestroy parameter is not empty
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmd* picture = nullptr;
    std::thread thread([&picture]() { picture = threadFunctionTest1(); });
    thread.join();
    drawingErrorCode = OH_Drawing_RecordCmdDestroy(picture);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);

    DrawingRecordCmdDestroyTestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestRecordCmdDestroyNULL()
{
    DrawingRecordCmdDestroyTestSetUp();

    // 1. The OH-Drawing-RecordCmdDestroy parameter is not empty
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmd* picture = nullptr;
    drawingErrorCode = OH_Drawing_RecordCmdDestroy(picture);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingRecordCmdDestroyTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

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

#include "gtest/gtest.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "drawing_record_cmd.h"
#include <random>
#include <thread>
#include <iomanip>
#include <sstream>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingCanvasDrawRecordCmdTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingCanvasDrawRecordCmdTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingCanvasDrawRecordCmdTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingCanvasDrawRecordCmdTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingCanvasDrawRecordCmdTest errorCodeReset after each test case." << std::endl;
    }
};
void drawCircle1(OH_Drawing_Canvas *canvas, int position)
{
    int x = 10;
    int radius = 200;
    OH_Drawing_Point *point = OH_Drawing_PointCreate(x * position + radius, x + radius);
    OH_Drawing_CanvasDrawCircle(canvas, point, radius);
    OH_Drawing_PointDestroy(point);
}
OH_Drawing_RecordCmd *threadFunctionTest6()
{
    int32_t width = 2;
    int32_t height = 5;
    OH_Drawing_RecordCmd *recordCmd = nullptr;
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    float penWidth = 1.0f; // pen width 1
    // 创建一个画笔Pen对象，Pen对象用于形状的边框线绘制
    OH_Drawing_Pen *cPen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetAntiAlias(cPen, true);
    OH_Drawing_PenSetColor(cPen, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_PenSetWidth(cPen, penWidth);
    OH_Drawing_PenSetJoin(cPen, LINE_ROUND_JOIN);
    // 将Pen画笔设置到canvas中
    OH_Drawing_CanvasAttachPen(canvas, cPen);
    // 创建一个画刷Brush对象，Brush对象用于形状的填充
    OH_Drawing_Brush *cBrush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(cBrush, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0x00));
    // 将Brush画刷设置到canvas中
    OH_Drawing_CanvasAttachBrush(canvas, cBrush);
    drawCircle1(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_BrushDestroy(cBrush);
    OH_Drawing_PenDestroy(cPen);
    cBrush = nullptr;
    cPen = nullptr;
    return recordCmd;
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0500
 * @tc.name: testCanvasDrawRecordCmdNormal
 * @tc.desc: test for testCanvasDrawRecordCmdNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdNormal, Function | SmallTest | Level0) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_RecordCmd *picture = nullptr;
    std::thread thread([&picture]() { picture = threadFunctionTest6(); });
    thread.join();
    if (picture != nullptr) {
        OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmd(canvas, picture);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0500
 * @tc.name: testCanvasDrawRecordCmdABNormal
 * @tc.desc: test for testCanvasDrawRecordCmdABNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdABNormal, Function | SmallTest | Level0) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_RecordCmd *picture = nullptr;
    std::thread thread([&picture]() { picture = threadFunctionTest6(); });
    thread.join();
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmd(canvas, nullptr);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    std::thread thread1([&picture]() { picture = threadFunctionTest6(); });
    thread1.join();
    if (picture != nullptr) {
        OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmd(nullptr, picture);
        EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
}
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0600
 * @tc.name: testCanvasDrawRecordCmdNestingNormal
 * @tc.desc: test for testCanvasDrawRecordCmdNestingNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdNestingNormal, Function | SmallTest | Level0) {
    OH_Drawing_Canvas *canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = 100;
    int32_t height = 100;
    OH_Drawing_RecordCmd *recordCmd = nullptr; //beginRecording-draw-finishRecording
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    drawCircle1(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    canvas = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmd *recordCmd1 = nullptr; //beginRecording-finishRecording
    OH_Drawing_Canvas *canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils1, width, height, &canvas1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils1, &recordCmd1);
    canvas1 = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils1);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd1);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmd *recordCmd2 = nullptr; //beginRecording-draw-nesting-draw-finishRecording
    OH_Drawing_Canvas *canvas2 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils2 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils2, width, height, &canvas2);
    drawCircle1(canvas2, width);
    OH_Drawing_ErrorCode result3 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas2, recordCmd1);
    drawCircle1(canvas2, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils2, &recordCmd2);
    canvas2 = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils2);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmd *recordCmd3 = nullptr; //beginRecording-nesting-nesting-finishRecording
    OH_Drawing_Canvas *canvas3 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils3 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils3, width, height, &canvas3);
    OH_Drawing_ErrorCode result4 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas3, recordCmd2);
    OH_Drawing_ErrorCode result5 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas3, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils3, &recordCmd3);
    canvas3 = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils3);
    EXPECT_EQ(result4, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result5, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmdDestroy(recordCmd);
    OH_Drawing_RecordCmdDestroy(recordCmd1);
    OH_Drawing_RecordCmdDestroy(recordCmd2);
    OH_Drawing_RecordCmdDestroy(recordCmd3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0601
 * @tc.name: testCanvasDrawRecordCmdNestingAbNormal
 * @tc.desc: test for testCanvasDrawRecordCmdNestingAbNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdNestingAbNormal, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = 100;
    int32_t height = 100;
    OH_Drawing_RecordCmd *recordCmd = nullptr;
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    drawCircle1(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    canvas = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(nullptr, recordCmd);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, nullptr);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RecordCmdDestroy(recordCmd);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0602
 * @tc.name: testCanvasDrawRecordCmdNestingAbNormal1
 * @tc.desc: test for testCanvasDrawRecordCmdNestingAbNormal1.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdNestingAbNormal1, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas0 = OH_Drawing_CanvasCreate();
    int32_t width = 100;
    int32_t height = 100;
    OH_Drawing_RecordCmd *recordCmd = nullptr;
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils, width, height, &canvas);
    OH_Drawing_ErrorCode result1 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    canvas = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_RecordCmd *recordCmd1 = nullptr;
    OH_Drawing_Canvas *canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordCmdUtils1 = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmdUtilsBeginRecording(recordCmdUtils1, width, height, &canvas);
    OH_Drawing_ErrorCode result2 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas1, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils1, &recordCmd1);
    OH_Drawing_ErrorCode result3 = OH_Drawing_CanvasDrawRecordCmdNesting(canvas0, recordCmd1);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils1, &recordCmd1);
    canvas1 = nullptr;
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils1);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    OH_Drawing_RecordCmdDestroy(recordCmd);
    OH_Drawing_RecordCmdDestroy(recordCmd1);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

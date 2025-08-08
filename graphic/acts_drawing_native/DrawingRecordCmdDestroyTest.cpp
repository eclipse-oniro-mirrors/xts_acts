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
#include "utils/scalar.h"
#include <random>
#include <thread>
#include <iomanip>
#include <sstream>
using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingRecordCmdDestroyTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingRecordCmdDestroyTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdDestroyTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingRecordCmdDestroyTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdDestroyTest errorCodeReset after each test case." << std::endl;
    }
};
void drawCircle(OH_Drawing_Canvas *canvas, int position)
{
    int x = 10;
    int radius = 200;
    OH_Drawing_Point *point = OH_Drawing_PointCreate(x * position + radius, x + radius);
    OH_Drawing_CanvasDrawCircle(canvas, point, radius);
    OH_Drawing_PointDestroy(point);
}
OH_Drawing_RecordCmd *threadFunctionTest1()
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
    drawCircle(canvas, width);
    OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    OH_Drawing_RecordCmdUtilsDestroy(recordCmdUtils);
    OH_Drawing_BrushDestroy(cBrush);
    OH_Drawing_PenDestroy(cPen);
    cBrush = nullptr;
    cPen = nullptr;
    return recordCmd;
}


/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0400
 * @tc.name: testRecordCmdDestroyNormal
 * @tc.desc: test for testRecordCmdDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingRecordCmdDestroyTest, testRecordCmdDestroyNormal, TestSize.Level0) {
    // 1. The OH-Drawing-RecordCmdDestroy parameter is not empty
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmd *picture = nullptr;
    std::thread thread([&picture, this]() { picture = threadFunctionTest1(); });
    thread.join();
    drawingErrorCode = OH_Drawing_RecordCmdDestroy (picture);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0400
 * @tc.name: testRecordCmdDestroyNULL
 * @tc.desc: test for testRecordCmdDestroyNULL.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingRecordCmdDestroyTest, testRecordCmdDestroyNULL, TestSize.Level0) {
    // 1. The OH-Drawing-RecordCmdDestroy parameter is not empty
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmd *picture = nullptr;
    drawingErrorCode = OH_Drawing_RecordCmdDestroy (picture);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

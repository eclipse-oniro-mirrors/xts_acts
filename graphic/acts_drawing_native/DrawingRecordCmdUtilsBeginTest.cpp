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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingRecordCmdUtilsBeginRecordingTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingRecordCmdUtilsBeginRecordingTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdUtilsBeginRecordingTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingRecordCmdUtilsBeginRecordingTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdUtilsBeginRecordingTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0102
 * @tc.name: testRecordCmdUtilsBeginRecordingAbnormal
 * @tc.desc: test for testRecordCmdUtilsBeginRecordingAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingRecordCmdUtilsBeginRecordingTest, testRecordCmdUtilsBeginRecordingAbnormal, TestSize.Level3) {
    // 1. The first and fourth parameters of the OH-Drawing-RecordCmdUtelsBeginRecording interface are not empty
    //with width and height being 0 and -1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate ();
    drawingErrorCode = OH_Drawing_RecordCmdUtilsBeginRecording (nullptr, 0, -1, canvass);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. free memory
    OH_Drawing_RecordCmdUtilsDestroy (recordcmd1);
    OH_Drawing_CanvasDestroy (canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0103
 * @tc.name: testRecordCmdUtilsBeginRecordingCalls
 * @tc.desc: test for testRecordCmdUtilsBeginRecordingCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingRecordCmdUtilsBeginRecordingTest, testRecordCmdUtilsBeginRecordingCalls, TestSize.Level2) {
    // 1. Call OH-Drawing-RecordCmdUtelsBeginRecording 10 times
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    for (int i = 0; i < 10; i++)
    {
        drawingErrorCode = OH_Drawing_RecordCmdUtilsBeginRecording (nullptr, 1, 1, canvass);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 2. free memory
    OH_Drawing_RecordCmdUtilsDestroy (recordcmd1);
    OH_Drawing_CanvasDestroy (canvas);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

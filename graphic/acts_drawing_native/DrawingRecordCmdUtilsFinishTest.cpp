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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingRecordCmdUtilsFinishRecordingTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingRecordCmdUtilsFinishRecordingTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdUtilsFinishRecordingTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingRecordCmdUtilsFinishRecordingTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingRecordCmdUtilsFinishRecordingTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testRecordCmdUtilsFinishRecordingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0300
 * @tc.desc   test for testRecordCmdUtilsFinishRecordingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingRecordCmdUtilsFinishRecordingTest, testRecordCmdUtilsFinishRecordingNormal, Function | SmallTest | Level0) {
    // 1. None of the OH_Drawing_RecordCmdUtilsFinishRecording parameters are empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd *recordCmd;
    OH_Drawing_RecordCmd **recordCmds = &recordCmd;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil1, recordCmds);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
}

/**
 * @tc.name   testRecordCmdUtilsFinishRecordingNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0301
 * @tc.desc   test for testRecordCmdUtilsFinishRecordingNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingRecordCmdUtilsFinishRecordingTest, testRecordCmdUtilsFinishRecordingNull, Function | SmallTest | Level3) {
    // 1. OH-Drawing-RecordCmdUtelsFinishRecording, RecordCmd or RecordCmdUtils parameter is empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_RecordCmd** recordCmds = &recordCmd;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording (nullptr, recordCmds);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    drawingErrorCode = OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil1, nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

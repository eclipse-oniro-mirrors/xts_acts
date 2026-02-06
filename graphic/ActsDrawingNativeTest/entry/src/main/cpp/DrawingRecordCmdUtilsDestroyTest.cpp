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

#include "include/DrawingRecordCmdUtilsDestroyTest.h"
#include <random>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingRecordCmdUtilsDestroyTestSetUp()
{
    std::cout << "DrawingRecordCmdUtilsDestroyTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsDestroyTest errorCodeReset before each test case." << std::endl;
}

void DrawingRecordCmdUtilsDestroyTestTearDown()
{
    std::cout << "DrawingRecordCmdUtilsDestroyTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingRecordCmdUtilsDestroyTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRecordCmdUtilsDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_01000
 * @tc.desc   test for testRecordCmdUtilsDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRecordCmdUtilsDestroyNormal()
{
    DrawingRecordCmdUtilsDestroyTestSetUp();

    // 1. OH_Drawing_RecordCmdUtilsCreate
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_RecordCmdUtils* recordcmd1 = OH_Drawing_RecordCmdUtilsCreate();
    // add assert
    EXPECT_NE(recordcmd1, nullptr);
    // 2. OH_Drawing_RecordCmdUtilsDestroy
    drawingErrorCode = OH_Drawing_RecordCmdUtilsDestroy(recordcmd1);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);

    DrawingRecordCmdUtilsDestroyTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

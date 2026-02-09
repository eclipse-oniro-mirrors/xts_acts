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

#include "include/DrawingNativePathTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativePathPart4TestSetUp()
{
    std::cout << "DrawingNativePathPart4Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart4Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathPart4TestTearDown()
{
    std::cout << "DrawingNativePathPart4Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart4Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalOne
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_4900
 * @tc.desc   test for testPathIsInverseFillTypeNormalOne
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsInverseFillTypeNormalOne()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_200, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_300, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_600, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_700, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalTwo
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5000
 * @tc.desc   test for testPathIsInverseFillTypeNormalTwo
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsInverseFillTypeNormalTwo()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_200, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_300, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_600, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_700, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalThree
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5100
 * @tc.desc   test for testPathIsInverseFillTypeNormalThree
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsInverseFillTypeNormalThree()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_200, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_300, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_600, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_700, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalFour
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5200
 * @tc.desc   test for testPathIsInverseFillTypeNormalFour
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsInverseFillTypeNormalFour()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_200, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_300, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_600, PATH_CIRCLE_Y_200, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, PATH_CIRCLE_X_700, PATH_CIRCLE_Y_300, PATH_CIRCLE_RADIUS_100, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInverseFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5300
 * @tc.desc   test for testPathIsInverseFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsInverseFillTypeNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. 创建有效的路径对象，作为后续测试的基础资源
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值设为false，用于后续结果校验
    bool isInverseFillType = false;
    // 3. 预设路径填充类型为正向缠绕填充（PATH_FILL_TYPE_WINDING），确保路径本身状态正常
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 测试场景1：传入nullptr作为路径对象入参，调用获取反向填充状态接口
    // 预期：接口返回无效参数错误码，且输出参数isInverseFillType保持初始值false
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(nullptr, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);                   // 验证输出参数未被修改
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER); // 验证接口返回正确的错误码
    // 5. 测试场景2：传入有效的路径对象，但反向填充状态输出参数为nullptr
    // 预期：接口返回无效参数错误码，且初始状态值isInverseFillType仍为false
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathIsInverseFillType(path, nullptr);
    EXPECT_EQ(isInverseFillType, false);                    // 验证初始状态值未被修改
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER); // 验证接口返回正确的错误码
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathToggleInverseFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5400
 * @tc.desc   test for testPathToggleInverseFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathToggleInverseFillTypeNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. 创建路径对象（基础资源初始化）
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false
    bool isInverseFillType = false;
    // 3. 设置路径填充类型为「非反向缠绕填充」（WINDING为默认正向填充规则）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 获取路径当前反向填充状态，验证返回值和错误码
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false); // 验证状态：非反向填充
    EXPECT_EQ(code, OH_DRAWING_SUCCESS); // 验证接口调用成功
    // 5. 测试空指针入参的异常场景：调用切换反向填充接口，传入nullptr
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(nullptr);
    EXPECT_EQ(isInverseFillType, false);                    // 状态未被修改，仍为false
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER); // 验证返回无效参数错误码
    // 6. 销毁路径对象，释放内存资源（防止内存泄漏）
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false); // 验证状态：非反向填充
    EXPECT_EQ(code, OH_DRAWING_SUCCESS); // 验证接口调用成功
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInverseFillTypeCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5500
 * @tc.desc   test for testPathIsInverseFillTypeCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsInverseFillTypeCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. 创建路径对象：基础资源初始化，用于循环校验接口稳定性
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false，用于循环校验
    bool isInverseFillType = false;
    // 3. 设置路径填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 循环10次调用获取反向填充状态接口，验证接口返回结果的稳定性
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(isInverseFillType, false);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathToggleInverseFillTypeCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5600
 * @tc.desc   test for testPathToggleInverseFillTypeCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathToggleInverseFillTypeCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. 创建路径对象：基础资源初始化，用于循环切换填充状态测试
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false
    bool isInverseFillType = false;
    // 3. 设置路径初始填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 校验初始反向填充状态：确认未切换前为非反向填充
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 5. 循环10次调用切换反向填充状态接口，验证状态交替切换的稳定性
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
        code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        // 验证状态按预期交替：第偶数次循环（0/2/4...）切换后为true，奇数次（1/3/5...）切回false
        EXPECT_EQ(isInverseFillType, (i % 2 == 0));
    }
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
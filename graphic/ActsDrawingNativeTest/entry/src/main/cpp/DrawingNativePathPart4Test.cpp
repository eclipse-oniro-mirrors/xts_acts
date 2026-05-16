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
#include <cstdint>
#include "include/log_common.h"

#define MAX_ALLOWED_SIZE (1024 * 1024 * 1024)
#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_18 18

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestPathGetPointDataNormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_Point2D points[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetPointData(path, points, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(count, DRAWING_NUMBER_2);
    EXPECT_EQ(points[0].x, 0);
    EXPECT_EQ(points[0].y, 0);
    EXPECT_EQ(points[1].x, 100.0f);
    EXPECT_EQ(points[1].y, 100.0f);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPointDataNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_Point2D points[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetPointData(nullptr, points, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_PathGetPointData(path, nullptr, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathGetPointData(path, points, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPointDatAbnormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_1;
    OH_Drawing_Point2D points[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetPointData(path, points, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPointDataMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_Point2D points[count];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetPointData(path, points, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(count, DRAWING_NUMBER_2);
    }
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetVerbDataNormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    OH_Drawing_PathQuadTo(path, 10.0f, 10.0f, 50.0f, 50.0f);
    // 5. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    // 6. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_PathIteratorVerb verbs[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetVerbData(path, verbs, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(count, DRAWING_NUMBER_6);
    EXPECT_EQ(verbs[0], MOVE);
    EXPECT_EQ(verbs[DRAWING_NUMBER_1], LINE);
    EXPECT_EQ(verbs[DRAWING_NUMBER_2], QUAD);
    EXPECT_EQ(verbs[DRAWING_NUMBER_3], CONIC);
    EXPECT_EQ(verbs[DRAWING_NUMBER_4], CUBIC);
    EXPECT_EQ(verbs[DRAWING_NUMBER_5], CLOSE);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetVerbDataNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    OH_Drawing_PathQuadTo(path, 10.0f, 10.0f, 50.0f, 50.0f);
    // 5. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    // 6. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_PathIteratorVerb verbs[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetVerbData(nullptr, verbs, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_PathGetVerbData(path, nullptr, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathGetVerbData(path, verbs, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetVerbDataAbnormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    OH_Drawing_PathQuadTo(path, 10.0f, 10.0f, 50.0f, 50.0f);
    // 5. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    // 6. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_1;
    OH_Drawing_PathIteratorVerb verbs[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetVerbData(path, verbs, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetVerbDataMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    OH_Drawing_PathQuadTo(path, 10.0f, 10.0f, 50.0f, 50.0f);
    // 5. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    // 6. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    OH_Drawing_PathIteratorVerb verbs[count];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetVerbData(path, verbs, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetConicWeightNormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    float conicWeights[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetConicWeightData(path, conicWeights, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(count, DRAWING_NUMBER_1);
    EXPECT_EQ(conicWeights[0], 0.5f);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetConicWeightNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    float conicWeights[count];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetConicWeightData(nullptr, conicWeights, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_PathGetConicWeightData(path, nullptr, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathGetConicWeightData(path, conicWeights, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetConicWeightAbnormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    OH_Drawing_PathClose(path);
    uint32_t count = 0;
    float conicWeights[1];
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetConicWeightData(path, conicWeights, &count);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(count, DRAWING_NUMBER_1);
    EXPECT_EQ(conicWeights[0], 0.5f);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetConicWeightMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 5.0f, 5.0f);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 0.5f);
    OH_Drawing_PathClose(path);
    uint32_t count = DRAWING_NUMBER_10;
    float conicWeights[count];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetConicWeightData(path, conicWeights, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(count, DRAWING_NUMBER_1);
        EXPECT_EQ(conicWeights[0], 0.5f);
    }
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathConvertToSvgStringNormal1()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    char str[20] = {0};
    size_t strSize = sizeof(str);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathConvertToSvgString(path, str, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(strSize, DRAWING_NUMBER_18);
    EXPECT_EQ(strcmp(str, "M0 0L100 100L0 0Z"), 0);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathConvertToSvgStringNormal2()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    size_t strSize = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathConvertToSvgString(path, nullptr, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    if (strSize == 0 || strSize > MAX_ALLOWED_SIZE) {
        OH_Drawing_PathDestroy(path);
        return -DRAWING_NUMBER_1;
    }
    char *str = (char *)malloc(sizeof(char) * strSize);
    if (str == nullptr) {
        OH_Drawing_PathDestroy(path);
        return -DRAWING_NUMBER_1;
    }
    errorCode = OH_Drawing_PathConvertToSvgString(path, str, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(strSize, DRAWING_NUMBER_18);
    EXPECT_EQ(strcmp(str, "M0 0L100 100L0 0Z"), 0);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathConvertToSvgStringNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    char str[DRAWING_NUMBER_10] = {0};
    size_t strSize = sizeof(str);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathConvertToSvgString(nullptr, str, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_PathConvertToSvgString(path, nullptr, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathConvertToSvgString(path, str, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathConvertToSvgStringAbnormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    char str[DRAWING_NUMBER_1] = {0};
    size_t strSize = sizeof(str);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathConvertToSvgString(path, str, &strSize);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathConvertToSvgStringMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_PathClose(path);
    char str[DRAWING_NUMBER_18] = {0};
    size_t strSize = sizeof(str);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathConvertToSvgString(path, str, &strSize);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLastPointNormal()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_Point2D point[1] = {};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetLastPoint(path, point);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(point[0].x, 100.0f);
    EXPECT_EQ(point[0].y, 100.0f);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLastPointNull()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point2D point[1] = {};
    // 2. Create an empty path
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetLastPoint(path, point);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(point[0].x, 0);
    EXPECT_EQ(point[0].y, 0);
    // 3. Passing in a nullptr
    errorCode = OH_Drawing_PathGetLastPoint(nullptr, point);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_PathGetLastPoint(path, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLastPointMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_Point2D point[1] = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetLastPoint(path, point);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(point[0].x, 100.0f);
        EXPECT_EQ(point[0].y, 100.0f);
    }
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEqualNormal()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathMoveTo(other, 0, 0);
    OH_Drawing_PathLineTo(other, 100.0f, 100.0f);
    bool equal = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEqual(path, other, &equal);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(equal, true);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEqualNull()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathMoveTo(other, 0, 0);
    OH_Drawing_PathLineTo(other, 100.0f, 100.0f);
    bool equal = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEqual(nullptr, other, &equal);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(equal, false);
    errorCode = OH_Drawing_PathIsEqual(path, nullptr, &equal);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(equal, false);
    errorCode = OH_Drawing_PathIsEqual(path, other, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(equal, false);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEqualMultipleCalls()
{
    DrawingNativePathPart4TestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathMoveTo(other, 0, 0);
    OH_Drawing_PathLineTo(other, 100.0f, 100.0f);
    bool equal = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEqual(path, other, &equal);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(equal, true);
    }
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart7TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart7TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset after each test case." << std::endl;
}

// Helper function to create and initialize PixelMap
static OH_Drawing_PixelMap* CreateTestPixelMap(OH_Pixelmap_InitializationOptions** createOps,
    OH_PixelmapNative** pixelMapNative,
    void** buffer)
{
    uint32_t imageWidth = TEST_CANVAS_COORD_200;
    uint32_t imageHeight = TEST_CANVAS_COORD_200;
    OH_PixelmapInitializationOptions_Create(createOps);
    OH_PixelmapInitializationOptions_SetWidth(*createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(*createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(*createOps, TEST_PIXELMAP_ALPHA_PREMUL);
    
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;
    *buffer = malloc(bufferSize);
    if (*buffer == nullptr) {
        return nullptr;
    }
    
    for (uint32_t i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)(*buffer))[i] = 0xFFFF00FF;
    }
    
    OH_PixelmapNative_CreatePixelmap((uint8_t*)(*buffer), bufferSize, *createOps, pixelMapNative);
    return OH_Drawing_PixelMapGetFromOhPixelMapNative(*pixelMapNative);
}

// Helper function to clean up resources
static void CleanupPixelMapResources(OH_Drawing_PixelMap* pixelMap,
    OH_PixelmapNative* pixelMapNative,
    OH_Pixelmap_InitializationOptions* createOps,
    void* buffer)
{
    if (pixelMap != nullptr) {
        OH_Drawing_PixelMapDissolve(pixelMap);
    }
    if (pixelMapNative != nullptr) {
        OH_PixelmapNative_Release(pixelMapNative);
    }
    if (createOps != nullptr) {
        OH_PixelmapInitializationOptions_Release(createOps);
    }
    if (buffer != nullptr) {
        free(buffer);
    }
}

// Helper function to create canvas and brush
static void CreateCanvasAndBrush(OH_Drawing_Canvas** canvas, OH_Drawing_Brush** brush)
{
    *canvas = OH_Drawing_CanvasCreate();
    *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(*canvas, *brush);
}

// Helper function to destroy canvas and brush
static void DestroyCanvasAndBrush(OH_Drawing_Canvas* canvas, OH_Drawing_Brush* brush)
{
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20300
 * @tc.desc   test for testCanvasDrawPixelMapMeshNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPixelMapMeshNormal()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    EXPECT_NE(pixelMap, nullptr);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_2;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_2;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_2;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_2;
    std::vector<float> vertices = {
        TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180, TEST_CANVAS_COORD_180,
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_20, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_180, TEST_CANVAS_COORD_150, TEST_CANVAS_COORD_410, TEST_CANVAS_COORD_180,
        TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_360, TEST_CANVAS_COORD_190, TEST_CANVAS_COORD_340,
        TEST_CANVAS_COORD_410, TEST_CANVAS_COORD_360
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE,
        TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE,
        TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits parameters normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                                       pixelMap,
                                                                       meshWidth,
                                                                       meshHeight,
                                                                       vertices.data(),
                                                                       vertices.size(),
                                                                       vertOffest,
                                                                       colors.data(),
                                                                       colors.size(),
                                                                       colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20400
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull01()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_2;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_2;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE, TEST_COLOR_WHITE_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(nullptr, pixelMap, meshWidth,
        meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, nullptr, meshWidth, meshHeight,
        vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        static_cast<uint32_t>(TEST_MATRIX_VALUE_0), meshHeight, vertices.data(), vertices.size(),
        vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20500
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull02()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_2;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_2;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE, TEST_COLOR_WHITE_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth,
        static_cast<uint32_t>(TEST_MATRIX_VALUE_0), vertices.data(), vertices.size(),
        vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        nullptr, vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), static_cast<size_t>(TEST_MATRIX_VALUE_0), vertOffest,
        colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20600
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull03()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth,
        meshHeight, vertices.data(), vertices.size(), static_cast<size_t>(TEST_MATRIX_VALUE_0),
        colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), vertices.size(), vertOffest, nullptr, colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), vertices.size(), vertOffest, colors.data(),
        static_cast<size_t>(TEST_MATRIX_VALUE_0), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20700
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshNull04()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE, TEST_COLOR_WHITE_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                                       pixelMap,
                                                                       meshWidth,
                                                                       meshHeight,
                                                                       vertices.data(),
                                                                       vertices.size(),
                                                                       vertOffest,
                                                                       colors.data(),
                                                                       colors.size(),
                                                                       static_cast<size_t>(TEST_MATRIX_VALUE_0));
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20800
 * @tc.desc   test for testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshBindAndUnbind()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_CanvasAttachPen(canvas, pen);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth,
        meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachPen(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PenDestroy(pen);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20900
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal01()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                                       pixelMap,
                                                                       TEST_PIXELMAP_NEGATIVE_1,
                                                                       meshHeight,
                                                                       vertices.data(),
                                                                       vertices.size(),
                                                                       vertOffest,
                                                                       colors.data(),
                                                                       colors.size(),
                                                                       colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                  pixelMap,
                                                  meshWidth,
                                                  TEST_PIXELMAP_NEGATIVE_1,
                                                  vertices.data(),
                                                  vertices.size(),
                                                  vertOffest,
                                                  colors.data(),
                                                  colors.size(),
                                                  colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21000
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal02()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                                       pixelMap,
                                                                       meshWidth,
                                                                       meshHeight,
                                                                       vertices.data(),
                                                                       TEST_PIXELMAP_NEGATIVE_1,
                                                                       vertOffest,
                                                                       colors.data(),
                                                                       colors.size(),
                                                                       colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                  pixelMap,
                                                  meshWidth,
                                                  meshHeight,
                                                  vertices.data(),
                                                  vertices.size(),
                                                  vertOffest,
                                                  colors.data(),
                                                  TEST_PIXELMAP_NEGATIVE_1,
                                                  colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21100
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal03()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                                       pixelMap,
                                                                       meshWidth,
                                                                       meshHeight,
                                                                       vertices.data(),
                                                                       vertices.size(),
                                                                       TEST_PIXELMAP_NEGATIVE_1,
                                                                       colors.data(),
                                                                       colors.size(),
                                                                       colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                  pixelMap,
                                                  meshWidth,
                                                  meshHeight,
                                                  vertices.data(),
                                                  vertices.size(),
                                                  vertOffest,
                                                  colors.data(),
                                                  colors.size(),
                                                  TEST_PIXELMAP_NEGATIVE_1);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21200
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshAbnormal04()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    if (pixelMap == nullptr) {
        CleanupPixelMapResources(nullptr, pixelMapNative, createOps, buffer);
        return 0;
    }
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits a number greater than the actual quantity.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth,
        meshHeight, vertices.data(), TEST_PIXELMAP_VERTICES_SIZE_11, vertOffest,
        colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
        vertices.data(), vertices.size(), vertOffest, colors.data(),
        TEST_PIXELMAP_COLORS_SIZE_6, colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21300
 * @tc.desc   test for testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapMeshMultipleCalls()
{
    DrawingNativeCanvasPart7TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &buffer);
    uint32_t meshWidth = TEST_PIXELMAP_MESH_WIDTH_1;
    uint32_t meshHeight = TEST_PIXELMAP_MESH_HEIGHT_1;
    uint32_t vertOffest = TEST_PIXELMAP_VERT_OFFSET_1;
    uint32_t colorOffest = TEST_PIXELMAP_COLOR_OFFSET_1;
    std::vector<float> vertices = {
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_50, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_410, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_180,
        TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_180
    };
    std::vector<uint32_t> colors = {
        TEST_COLOR_RED_VERTEX, TEST_COLOR_GREEN, TEST_CANVAS_COLOR_BLUE,
        TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_BLACK_OPAQUE
    };
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;
    CreateCanvasAndBrush(&canvas, &brush);
    OH_Drawing_ErrorCode errorCode;
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh is called 10 times.
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas,
                                                      pixelMap,
                                                      meshWidth,
                                                      meshHeight,
                                                      vertices.data(),
                                                      vertices.size(),
                                                      vertOffest,
                                                      colors.data(),
                                                      colors.size(),
                                                      colorOffest);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    DestroyCanvasAndBrush(canvas, brush);
    CleanupPixelMapResources(pixelMap, pixelMapNative, createOps, buffer);

    DrawingNativeCanvasPart7TestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
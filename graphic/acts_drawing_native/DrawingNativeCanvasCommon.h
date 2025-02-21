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
#ifndef DRAWING_NATIVE_CANVAS_COMMON_H
#define DRAWING_NATIVE_CANVAS_COMMON_H

#include "image/pixelmap_native.h"
#include "gtest/gtest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeCanvasTest : public testing::Test {};
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

OH_PixelmapNative *GET_OH_PixelmapNative();

#endif // DRAWING_NATIVE_CANVAS_COMMON_H
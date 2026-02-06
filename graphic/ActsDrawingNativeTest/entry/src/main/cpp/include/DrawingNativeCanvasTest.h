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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_CANVAS_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_CANVAS_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Canvas Destroy related functions
int TestCanvasDestroyNormal();
int TestCanvasDestroyNull();

// Canvas Bind related functions
int TestCanvasBindNormal();
int TestCanvasBindNull();
int TestCanvasBindDestroyBitmap();
int TestCanvasBindMultipleCalls();
int TestCanvasBindBoundaryMultipleCallsBoundary();

// Canvas Attach/Detach Pen related functions
int TestCanvasAttachPenDetachPenNormal();
int TestCanvasAttachPenDetachPenNull();
int TestCanvasAttachPenDetachPenMultipleCalls();
int TestCanvasAttachPenOnly();
int TestCanvasDetachPenOnly();
int TestCanvasAttachPenDetachPenBoundary();

// Canvas Attach/Detach Brush related functions
int TestCanvasAttachBrushDetachBrushNormal();
int TestCanvasAttachBrushDetachBrushNull();
int TestCanvasAttachBrushDetachBrushMultipleCalls();
int TestCanvasAttachBrushOnly();
int TestCanvasDetachBrushOnly();
int TestCanvasAttachBrushDetachBrushBoudary();

// Canvas Save related functions
int TestCanvasSaveNormal();
int TestCanvasSavetestCanvasGetSaveCountNull();
int TestCanvasSavetestCanvasGetSaveCountMultipleCalls();
int TestCanvasSavetestCanvasGetSaveCountInputDestroyed();
int TestCanvasGetSaveCountWhenNoSave();

// Canvas SaveLayer related functions
int TestCanvasSaveLayerNormal();
int TestCanvasSaveLayerNull();
int TestCanvasSaveLayerAbnormal();
int TestCanvasSaveLayerRestore();
int TestCanvasSaveLayerMultipleCalls();

// Canvas Restore related functions
int TestCanvasRestoreNormal();
int TestCanvasRestoreNull();
int TestCanvasRestoreMultipleCalls();
int TestCanvasRestoreBeforeSave();
int TestCanvasRestoreInputDestroyed();
int TestCanvasRestoreExceededSaveSavelayerTimes();

// Canvas RestoreToCount related functions
int TestCanvasRestoreToCountNormal();
int TestCanvasRestoreToCountNull();
int TestCanvasRestoreToCountAbnormal();
int TestCanvasRestoreToCountMaximum();
int TestCanvasRestoreToCountExceeded();
int TestCanvasRestoreToCountInputDestroyed();

// Canvas DrawLine related functions
int TestCanvasDrawLineNormal();
int TestCanvasDrawLineNull();
int TestCanvasDrawLineAbnormal();
int TestCanvasDrawLineMaximum();
int TestCanvasDrawLineInputDestroyed();

// Canvas DrawPath related functions
int TestCanvasDrawPathNormal();
int TestCanvasDrawPathNull();
int TestCanvasDrawPathInputDestroyed();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_CANVAS_TEST_H

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import RoundRectTest from './CanvasRenderingContext2D/RoundRectTest.test';
import StartImageAnalyzerErrorCodeTest from './CanvasRenderingContext2D/StartImageAnalyzerErrorCodeTest';
import CircleResourceTest from './Circle/CircleResourceTest';
import EllipseResourceTest from './Ellipse/EllipseResourceTest';
import LineResourceTest from './Line/LineResourceTest';
import PathResourceTest from './Path/PathResourceTest';
import PolygonResourceTest from './Polygon/PolygonResourceTest';
import PolylineResourceTest from './Polyline/PolylineResourceTest';
import RectResourceTest from './Rect/RectResourceTest';
import ShapeResourceTest from './Shape/ShapeResourceTest';

import ImageBitmapWidthHeightTest from './CanvasRenderingContext2D/ImageBitmapWidthHeightTest.test';
import ImageDataWidthHeightDataTest from './CanvasRenderingContext2D/ImageDataWidthHeightDataTest.test';
import CanvasWidthHeightCanvasTest from './CanvasRenderingContext2D/CanvasWidthHeightCanvasTest.test';
import OffCanvasWidthHeightTest from './CanvasRenderingContext2D/OffCanvasWidthHeightTest.test';

import CanvasRenderingContext2DFillStyleTest from './CanvasRenderingContext2D/CanvasRenderingContext2DFillStyleTest.test';
import CanvasRenderingContext2DFilterTest from './CanvasRenderingContext2D/CanvasRenderingContext2DFilterTest.test';
import CanvasRenderingContext2DGlobalAlphaTest from './CanvasRenderingContext2D/CanvasRenderingContext2DGlobalAlphaTest.test';
import CanvasRenderingContext2DGlobalCompositeOperationTest from './CanvasRenderingContext2D/CanvasRenderingContext2DGlobalCompositeOperationTest.test';
import CanvasRenderingContext2DImageSmoothingEnabledTest from './CanvasRenderingContext2D/CanvasRenderingContext2DImageSmoothingEnabledTest.test';
import CanvasRenderingContext2DImageSmoothingQualityTest from './CanvasRenderingContext2D/CanvasRenderingContext2DImageSmoothingQualityTest.test';
import CanvasRenderingContext2DLetterSpacingTest from './CanvasRenderingContext2D/CanvasRenderingContext2DLetterSpacingTest.test';
import CanvasRenderingContext2DStrokeStyleTest from './CanvasRenderingContext2D/CanvasRenderingContext2DStrokeStyleTest.test';

import CanvasRenderingContext2DDirectionTest from './CanvasRenderingContext2D/CanvasRenderingContext2DDirectionTest.test';
import CanvasRenderingContext2DFontTest from './CanvasRenderingContext2D/CanvasRenderingContext2DFontTest.test';
import CanvasRenderingContext2DLineCapTest from './CanvasRenderingContext2D/CanvasRenderingContext2DLineCapTest.test';
import CanvasRenderingContext2DLineDashOffsetTest from './CanvasRenderingContext2D/CanvasRenderingContext2DLineDashOffsetTest.test';
import CanvasRenderingContext2DLineJoinTest from './CanvasRenderingContext2D/CanvasRenderingContext2DLineJoinTest.test';
import CanvasRenderingContext2DLineWidthTest from './CanvasRenderingContext2D/CanvasRenderingContext2DLineWidthTest.test';
import CanvasRenderingContext2DMiterLimitTest from './CanvasRenderingContext2D/CanvasRenderingContext2DMiterLimitTest.test';
import CanvasRenderingContext2DShadowBlurTest from './CanvasRenderingContext2D/CanvasRenderingContext2DShadowBlurTest.test';
import CanvasRenderingContext2DShadowColorTest from './CanvasRenderingContext2D/CanvasRenderingContext2DShadowColorTest.test';
import CanvasRenderingContext2DShadowOffsetXTest from './CanvasRenderingContext2D/CanvasRenderingContext2DShadowOffsetXTest.test';
import CanvasRenderingContext2DShadowOffsetYTest from './CanvasRenderingContext2D/CanvasRenderingContext2DShadowOffsetYTest.test';
import CanvasRenderingContext2DTextAlignTest from './CanvasRenderingContext2D/CanvasRenderingContext2DTextAlignTest.test';
import CanvasRenderingContext2DTextBaselineTest from './CanvasRenderingContext2D/CanvasRenderingContext2DTextBaselineTest.test';

export default function testsuite() {
  RoundRectTest();
  StartImageAnalyzerErrorCodeTest();
  CircleResourceTest();
  EllipseResourceTest();
  LineResourceTest();
  PathResourceTest();
  PolygonResourceTest();
  PolylineResourceTest();
  RectResourceTest();
  ShapeResourceTest();

  ImageBitmapWidthHeightTest();
  ImageDataWidthHeightDataTest();
  CanvasWidthHeightCanvasTest();
  OffCanvasWidthHeightTest();

  CanvasRenderingContext2DFillStyleTest();
  CanvasRenderingContext2DFilterTest();
  CanvasRenderingContext2DGlobalAlphaTest();
  CanvasRenderingContext2DGlobalCompositeOperationTest();
  CanvasRenderingContext2DImageSmoothingEnabledTest();
  CanvasRenderingContext2DImageSmoothingQualityTest();
  CanvasRenderingContext2DLetterSpacingTest();
  CanvasRenderingContext2DStrokeStyleTest();

  CanvasRenderingContext2DDirectionTest();
  CanvasRenderingContext2DFontTest();
  CanvasRenderingContext2DLineCapTest();
  CanvasRenderingContext2DLineDashOffsetTest();
  CanvasRenderingContext2DLineJoinTest();
  CanvasRenderingContext2DLineWidthTest();
  CanvasRenderingContext2DMiterLimitTest();
  CanvasRenderingContext2DShadowBlurTest();
  CanvasRenderingContext2DShadowColorTest();
  CanvasRenderingContext2DShadowOffsetXTest();
  CanvasRenderingContext2DShadowOffsetYTest();
  CanvasRenderingContext2DTextAlignTest();
  CanvasRenderingContext2DTextBaselineTest();

}
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import ellipseJsunit from './EllipseTest/EllipseJsunit.test';
import CanvasAPIUnitTest from './CanvasTest/CanvasAPIUnit.test'
import CanvasAPICanvasRenderTest from './CanvasTest/CanvasAPICanvasRender.test'
import CanvasAPITest from './CanvasTest/CanvasAPI.test'
import CanvasShaderTest from './CanvasTest/CanvasShader.test'
import CanvasColorTest from './CanvasTest/CanvasColor.test'
import OffScreenCanvasTest from './OffScreenCanvasTest/OffScreenCanvas.test'
import drawCanvas from './CanvasTest/drawCanvas.test'
import ParticlePropertyJsunit from './ParticleTest/ParticlePropertyJsunit.test'
import canvasJsunit from './CanvasTest/CanvasJsunit.test';
import canvas2Jsunit from './CanvasTest/Canvas2Jsunit.test';
import shapeJsunit from './ShapeTest/ShapeJsunit.test';
import circleJsunit from './CircleTest/CircleJsunit.test';
import lineJsunit from './lineTest/LineJsunit.test';

import pathJsunit from './pathTest/PathJsunit.test';
import polygonJsunit from './polygonTest/PolygonJsunit.test';
import polylineJsunit from './polylineTest/PolylineJsunit.test';
import canvasActualBoundingBoxAscentJsunit from './CanvasTest/canvas.test';

import circleNewJsunit from './CircleTest/circle.test';
import curvesStepsJsunit from './CanvasTest/curves.test';
import ellipseNeJsunit from './EllipseTest/ellipse1.test';
import lineNeJsunit from './lineTest/line.test';
import panelBackgroundMaskJsunit from './panelTest/panel.test';
import pathNewTest from './pathTest/path.test';
import polygonNewJsunit from './polygonTest/polygon.test';
import polyLineNeJsunit from './polylineTest/polyLine.test';
import rectNeJsunit from './RectTest/rect.test';
import RectRadiusTest from './RectTest/RectRadiusTest.test';
import RectCommonShapeMethodTest from './RectTest/RectCommonShapeMethodTest.test';
import Matrix2DTest from './Matrix2D/Matrix2DTest.test';

import CanvasGetLineDashTest from './CanvasReturnTest/CanvasGetLineDashTest';

export default function testsuite() {
  ellipseJsunit();
  CanvasAPIUnitTest();
  CanvasAPICanvasRenderTest();
  CanvasAPITest();
  CanvasShaderTest();
  CanvasColorTest();
  OffScreenCanvasTest();
  drawCanvas();
  ParticlePropertyJsunit();
  canvasJsunit();
  canvas2Jsunit();
  shapeJsunit();
  circleJsunit();
  lineJsunit();
  pathJsunit()
  polygonJsunit()
  polylineJsunit()
  canvasActualBoundingBoxAscentJsunit()
  curvesStepsJsunit()
  ellipseNeJsunit()
  lineNeJsunit()
  panelBackgroundMaskJsunit()
  pathNewTest()
  polygonNewJsunit()
  polyLineNeJsunit()
  rectNeJsunit()
  RectRadiusTest()
  RectCommonShapeMethodTest()
  Matrix2DTest()
  CanvasGetLineDashTest()
  circleNewJsunit()

}
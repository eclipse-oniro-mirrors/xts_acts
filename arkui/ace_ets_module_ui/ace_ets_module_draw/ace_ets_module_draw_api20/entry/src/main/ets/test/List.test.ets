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
import RoundRectTest from './CanvasRenderingContext2D/RoundRectTest.test';
import CanvasGradientTest from './CanvasRenderingContext2D/CanvasGradientTest.test';

import StartImageAnalyzerErrorCodeTest from './CanvasRenderingContext2D/StartImageAnalyzerErrorCodeTest';
import CircleResourceTest from './Circle/CircleResourceTest';
import EllipseResourceTest from './Ellipse/EllipseResourceTest';
import LineResourceTest from './Line/LineResourceTest';
import PathResourceTest from './Path/PathResourceTest';
import PolygonResourceTest from './Polygon/PolygonResourceTest';
import PolylineResourceTest from './Polyline/PolylineResourceTest';
import RectResourceTest from './Rect/RectResourceTest';
import ShapeResourceTest from './Shape/ShapeResourceTest';

import CanvasEllipseTest from './CanvasRenderingContext2D/CanvasEllipseTest';
import Matrix2DMultiplyTest from './CanvasRenderingContext2D/Matrix2DMultiplyTest';
import StartImageAnalyzerErrorCodeTest1 from './CanvasRenderingContext2D/StartImageAnalyzerErrorCodeTest1';
import CanvasRoundRectErrorCodeTest from './CanvasRenderingContext2D/CanvasRoundRectErrorCodeTest';
import AddColorStopErrorCodeTest from './CanvasRenderingContext2D/AddColorStopErrorCodeTest';

export default function testsuite() {
  RoundRectTest(); 
  CanvasGradientTest();

  StartImageAnalyzerErrorCodeTest();
  CircleResourceTest();
  EllipseResourceTest();
  LineResourceTest();
  PathResourceTest();
  PolygonResourceTest();
  PolylineResourceTest();
  RectResourceTest();
  ShapeResourceTest();

  CanvasEllipseTest();
  Matrix2DMultiplyTest();
  StartImageAnalyzerErrorCodeTest1();
  CanvasRoundRectErrorCodeTest();
  AddColorStopErrorCodeTest();

}
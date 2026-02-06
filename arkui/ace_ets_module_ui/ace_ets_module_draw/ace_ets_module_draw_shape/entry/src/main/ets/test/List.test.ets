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

import ellipseJsunit from './Ellipse/EllipseJsunit.test';
import shapeJsunit from './Shape/ShapeJsunit.test';
import circleJsunit from './Circle/CircleJsunit.test';
import lineJsunit from './Line/LineJsunit.test';
import pathJsunit from './Path/PathJsunit.test';
import polygonJsunit from './Polygon/PolygonJsunit.test';
import polylineJsunit from './Polyline/PolylineJsunit.test';
import ellipseNeJsunit from './Ellipse/ellipse1.test';
import lineNeJsunit from './Line/line.test';
import pathNewJsunit from './Path/path.test';
import polygonNewJsunit from './Polygon/polygon.test';
import polyLineNeJsunit from './Polyline/polyLine.test';
import rectNeJsunit from './Rect/rect.test';
import RectRadiusTest from './Rect/RectRadiusTest.test';
import RectCommonShapeMethodTest from './Rect/RectCommonShapeMethodTest.test';

import circleNewTest from './Circle/circleNew.test.ets';
import ellipseNewTest from './Ellipse/ellipseNew.test.ets';
import lineNewTest from './Line/lineNew.test.ets';
import pathNewTest from './Path/pathNew.test.ets';
import polygonNewTest from './Polygon/polygonNew.test.ets';
import polyLineNewTest from './Polyline/polyLineNew.test.ets';
import rectNewTest from './Rect/rectNew.test.ets';

import CircleResourceTest from './Circle/CircleResourceTest';
import EllipseResourceTest from './Ellipse/EllipseResourceTest';
import LineResourceTest from './Line/LineResourceTest';
import PathResourceTest from './Path/PathResourceTest';
import PolygonResourceTest from './Polygon/PolygonResourceTest';
import PolylineResourceTest from './Polyline/PolylineResourceTest';
import RectResourceTest from './Rect/RectResourceTest';
import ShapeResourceTest from './Shape/ShapeResourceTest';

export default function testsuite() {

  ellipseJsunit();
  shapeJsunit();
  circleJsunit();
  lineJsunit();
  pathJsunit()
  polygonJsunit()
  polylineJsunit()
  ellipseNeJsunit()
  lineNeJsunit()
  pathNewJsunit()
  polygonNewJsunit()
  polyLineNeJsunit()
  rectNeJsunit()
  RectRadiusTest()
  RectCommonShapeMethodTest()

  circleNewTest()
  ellipseNewTest()
  lineNewTest()
  pathNewTest()
  polygonNewTest()
  polyLineNewTest()
  rectNewTest()
  
  CircleResourceTest();
  EllipseResourceTest();
  LineResourceTest();
  PathResourceTest();
  PolygonResourceTest();
  PolylineResourceTest();
  RectResourceTest();
  ShapeResourceTest();

}
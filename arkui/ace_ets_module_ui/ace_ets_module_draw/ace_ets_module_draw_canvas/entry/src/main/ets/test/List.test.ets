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

import CanvasAPIUnitTest from './Canvas/CanvasAPIUnit.test'
import CanvasAPICanvasRenderTest from './Canvas/CanvasAPICanvasRender.test'
import CanvasAPITest from './Canvas/CanvasAPI.test'
import CanvasShaderTest from './Canvas/CanvasShader.test'
import CanvasColorTest from './Canvas/CanvasColor.test'
import OffScreenCanvasTest from './Canvas/OffScreenCanvas.test'
import canvasJsunit from './Canvas/CanvasJsunit.test';
import canvas2Jsunit from './Canvas/Canvas2Jsunit.test';
import canvasActualBoundingBoxAscentJsunit from './Canvas/canvas.test';
import curvesStepsJsunit from './Canvas/curves.test';
import Matrix2DTest from './Canvas/Matrix2DTest.test';
import CanvasGetLineDashTest from './Canvas/CanvasGetLineDashTest';

import APICanvasSizeTest from './Canvas/APICanvasSizeTest.test';
import RestoreLayerTest from './Canvas/RestoreLayerTest.test';
import SaveLayerTest from './Canvas/SaveLayerTest.test';
import DrawModifier from './Canvas/DrawModifier.test';

import AttachDetachTest from './Canvas/AttachDetachTest.test';
import AttachDetachRebindTest from './Canvas/AttachDetachRebindTest.test';
import CanvasAttrsTest from './Canvas/CanvasAttrsTest.test';
import CanvasAttrsTabTest from './Canvas/CanvasAttrsTabTest.test';

import RoundRectTest from './Canvas/RoundRectTest.test';
import CanvasGradientTest from './Canvas/CanvasGradientTest.test';
import StartImageAnalyzerErrorCodeTest from './Canvas/StartImageAnalyzerErrorCodeTest';
import CanvasEllipseTest from './Canvas/CanvasEllipseTest';
import Matrix2DMultiplyTest from './Canvas/Matrix2DMultiplyTest';
import StartImageAnalyzerErrorCodeTest1 from './Canvas/StartImageAnalyzerErrorCodeTest1';
import CanvasRoundRectErrorCodeTest from './Canvas/CanvasRoundRectErrorCodeTest';
import AddColorStopErrorCodeTest from './Canvas/AddColorStopErrorCodeTest';
import CanvasParamsUnitTest from './Canvas/CanvasParamsUnitTest.test';
import CanvasParamsImageAnalyzerTest from './Canvas/CanvasParamsImageAnalyzerTest.test';
import CanvasParamsVisibilityTest from './Canvas/CanvasParamsVisibilityTest.test';
import CanvasParamsAntialiasTest from './Canvas/CanvasParamsAntialiasTest.test';

export default function testsuite() {

  CanvasAPIUnitTest();
  CanvasAPICanvasRenderTest();
  CanvasAPITest();
  CanvasShaderTest();
  CanvasColorTest();
  OffScreenCanvasTest();
  canvasJsunit();
  canvas2Jsunit();
  canvasActualBoundingBoxAscentJsunit()
  curvesStepsJsunit()
  Matrix2DTest()
  CanvasGetLineDashTest()

  APICanvasSizeTest();
  RestoreLayerTest();
  SaveLayerTest();
  DrawModifier(); 

  AttachDetachTest(); 
  AttachDetachRebindTest(); 
  CanvasAttrsTest(); 
  CanvasAttrsTabTest();

  RoundRectTest(); 
  CanvasGradientTest();
  StartImageAnalyzerErrorCodeTest();
  CanvasEllipseTest();
  Matrix2DMultiplyTest();
  StartImageAnalyzerErrorCodeTest1();
  CanvasRoundRectErrorCodeTest();
  AddColorStopErrorCodeTest();

  CanvasParamsUnitTest();
  CanvasParamsImageAnalyzerTest();
  CanvasParamsVisibilityTest();
  CanvasParamsAntialiasTest();
}
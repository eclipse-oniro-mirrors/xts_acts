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
import samplingOptionsTest from './SamplingOptions.test';
import maskFilterTest from './MaskFilter.test';
import pathEffectTest from './PathEffect.test';
import shadowLayerTest from './ShadowLayer.test';
import colorFilterTest from './ColorFilter.test';
import penTest from './Pen.test';
import penPart2Test from './PenPart2.test'
import brushTest from './Brush.test';
import fontTest from './Font.test';
import fontPart2Test from './FontPart2.test'
import fontPart3Test from './FontPart3.test'
import latticeTest from './Lattice.test'
import imageFilterTest from './ImageFilter.test'
import typefaceTest from './Typeface.test';
import textBlobTest from './TextBlob.test';
import drawingTsPathTest from './Path.test';
import drawingTsPath2Test from './Path2.test';
import drawingTsPath3Test from './Path3.test';
import drawingTsPath5Test from './Path5.test';
import drawingTsPath6Test from './Path6.test';
import drawingTsCanvasTest from './Canvas.test';
import drawingTsCanvasPart2Test from './CanvasPart2.test';
import drawingTsCanvasPart3Test from './CanvasPart3.test';
import drawingTsCanvasPart4Test from './CanvasPart4.test';
import drawingTsCanvasPart5Test from './CanvasPart5.test';
import drawingTsCanvasPart6Test from './CanvasPart6.test';
import drawingTsCanvasPart7Test from './CanvasPart7.test';
import drawingTsCanvasPart8Test from './CanvasPart8.test';
import drawingTsRegionTest from './Region.test';
import drawingTsRegionPart2Test from "./Region2.test";
import drawingTsMatrixTest from './Matrix.test';
import drawingTsMatrixPart2Test from './MatrixPart2.test';
import roundRectTest from './RoundRect.test';
import shadowEffectTest from './ShaderEffect.test'
import toolTest from './Tool.test'
import typefaceArguments from './TypefaceArguments.test'
import rectUtils from './RectUtils.test'
import BrushPart2 from './BrushPart2.test';
import FontPart4 from './FontPart4.test';
import PathEffect2 from './PathEffect2.test';
import PathIterator from './PathIterator.test';
import PenPart3 from './PenPart3.test';

export default function testsuite() {
  samplingOptionsTest();
  maskFilterTest();
  pathEffectTest();
  shadowLayerTest();
  colorFilterTest();
  penTest();
  penPart2Test();
  brushTest();
  fontTest();
  fontPart2Test();
  fontPart3Test();
  imageFilterTest();
  latticeTest();
  drawingTsMatrixTest();
  drawingTsMatrixPart2Test();
  typefaceTest();
  textBlobTest();
  drawingTsPathTest();
  drawingTsPath2Test();
  drawingTsPath3Test();
  drawingTsPath5Test();
  drawingTsPath6Test();
  drawingTsCanvasTest();
  drawingTsCanvasPart2Test();
  drawingTsCanvasPart3Test();
  drawingTsCanvasPart4Test();
  drawingTsCanvasPart5Test();
  drawingTsCanvasPart6Test();
  drawingTsCanvasPart7Test();
  drawingTsCanvasPart8Test();
  drawingTsRegionTest();
  drawingTsRegionPart2Test();
  roundRectTest();
  shadowEffectTest();
  toolTest();
  typefaceArguments();
  rectUtils();
  BrushPart2();
  FontPart4();
  PathEffect2();
  PathIterator();
  PenPart3();
}
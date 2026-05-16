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
import ShapeUndefinedTest from './ShapeTest/shapeUndefined.test'
import ShapeModifierUndefinedTest from './ShapeTest/shapeModifierUndefined.test'
import PolygonUndefinedTest from './PolygonTest/polygonUndefined.test'
import RectUndefinedTest from './RectTest/rectUndefined.test'
import RectModifierUndefinedTest from './RectTest/rectModifierUndefined.test'
import XComponentUndefinedTest from './XComponentTest/xComponentUndefined.test'
import XComponentModifierUndefinedTest from './XComponentTest/xComponentModifierUndefined.test'
import CommandsUndefinedTest from './PathTest/commandsUndefined.test';
import PointsUndefinedTest from './PolylineTest/pointsUndefined.test';
import CommandsUndefinedModifierTest from './PathTest/commandsUndefinedModifier.test';
import PointsUndefinedModifierTest from './PolylineTest/pointsUndefinedModifier.test';
import VideoUndefinedTest from './VideoTest/videoUndefined.test';
import VideoUndefinedModifierTest from './VideoTest/videoUndefinedModifier.test';

export default function testsuite() {
  XComponentModifierUndefinedTest()
  XComponentUndefinedTest()
  RectModifierUndefinedTest()
  RectUndefinedTest()
  PolygonUndefinedTest()
  ShapeModifierUndefinedTest()
  ShapeUndefinedTest()
  CommandsUndefinedTest()
  CommandsUndefinedModifierTest()
  PointsUndefinedTest()
  PointsUndefinedModifierTest()
  VideoUndefinedTest()
  VideoUndefinedModifierTest()
}

'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  $rawfile,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Circle,
  TextOverflow,
  Polyline,
  PolylineAttribute,
  Image,
  Alignment,
  TextAlign,
  Ellipse,
  Line,
  Path,
  Margin,
  Polygon,
  PolygonAttribute,
  LineCapStyle,
  LineJoinStyle,
  Shape,
  Rect,
  RectOptions,
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RectPage {
  build() {
    Column({ space: 2 } as ColumnOptions) {
      Rect({ width: '90%', height: "30%", radius: 20 } as RectOptions)
        .id("RectRadius_1")

      Rect({ width: '90%', height: "30%" } as RectOptions)
        .id("RectRadius_2")
        .radius(20)
    }
    .width("100%").height("100%")
  }
}


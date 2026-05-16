'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Text,
  TextAttribute,
  Column,
  ColumnAttribute,
  Stack,
  StackAttribute,
  List,
  ListAttribute,
  Row,
  RowAttribute,
  RowOptions,
  Image,
  ImageAttribute,
  MouseButton,
  MouseAction,
  SourceTool,
  Scroll,
  ScrollAttribute,
  Scroller,
  GestureRecognizer,
  ScrollableTargetInfo,
  GestureEvent,
  ScrollDirection,
  BarState,
  EdgeEffect,
  Alignment,
  Button,
  ButtonAttribute,
  TouchEvent,
  TouchType,
  TouchObject,
  BaseEvent,
  EventTarget,
  MouseEvent,
  HoverEvent,
  AxisEvent,
  FocusAxisEvent,
  AxisModel,
  Component,
  DragEvent,
  ClickEvent,
  TouchTestInfo,
  TouchResult,
  TouchTestStrategy,
  HitTestMode,
  PointerStyle,
  Position,
  Area,
  DragItemInfo,
  Summary,
  FontWeight,
  cursorControl,
  ShouldBuiltInRecognizerParallelWithCallback,
  GestureRecognizerJudgeBeginCallback,
  Rectangle,
  UnifiedData,
  Callback,
  OnDragEventCallback,
  DropOptions,
  UniformDataType,
  PreviewConfiguration,
  ModifierKey,
  Entry,
  DragResult,
  PreDragStatus,
  DragBehavior,
  CustomBuilder,
  Builder,
  PanRecognizer,
  Resource,
  KeySource,
  BaseGestureEvent,
  LongPressGestureEvent,
  SwipeGestureEvent,
  PanGestureEvent,
  TapGesture,
  LongPressGesture,
  SwipeGesture,
  PanGesture,
  DragPreviewOptions,
  DragInteractionOptions,
  DragPreviewMode,
  CommonAttribute,
  RadioAttribute,
  AttributeModifier,
  LengthMetrics,
  ColorMetrics,
  FocusPriority,
  KeyEvent,
  FunctionKey,
  HoverEffect,
  Visibility,
  SizeOptions,
  Color,
  Margin,
  EdgeWidths,
  ImageRepeat,
  $r,
  HoverEvent,
  MouseEvent,
  GestureInfo,
  GestureJudgeResult,
  GestureControl,
  GestureType,
  Checkbox,
  Select,
  Toggle,
  ToggleType,
  ToggleOptions,
  Radio,
  $rawfile
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement'


@Entry
@Component
export struct getRectangleByIdExample {
  @State x: number = 120;
  @State y: number = 10;
  @State z: number = 100;

  build() {
    Column() {
      Image('/comment/bg1.png')
        .translate({ x: 20, y: 20, z: 20 })
        .scale({ x: 0.5, y: 0.5, z: 1 })
        .rotate({
          x: 1,
          y: 1,
          z: 1,
          centerX: '50%',
          centerY: '50%',
          angle: 300
        })
        .backgroundColor(Color.Green)
        .width('20%')
        .height('10%')
        .key('image_01')
      Button('getRectangleById')
        .onClick((event: ClickEvent) => {
          // 建议使用this.getUIContext().getComponentSnapshot().createFromBuilder()
          let info = this.getUIContext().getComponentUtils().getRectangleById('image_01')
          AppStorage.setOrCreate<number>('info', (info.size.width));
          let info1 = this.getUIContext().getComponentUtils().getRectangleById('')
          AppStorage.setOrCreate<number>('info1', (info1.size.width));
        })
        .height('5%')
        .id('getRectangleByIdButton')
    }
    .height('100%')
    .width('100%')
  }
}
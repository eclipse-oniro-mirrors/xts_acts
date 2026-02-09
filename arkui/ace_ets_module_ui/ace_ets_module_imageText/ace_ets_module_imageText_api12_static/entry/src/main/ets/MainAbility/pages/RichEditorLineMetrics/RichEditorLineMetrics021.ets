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
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,
  PanGesture,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorLineMetrics021 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetricsWill: string = '';
  @State lineMetricsDid: string = '';
build() {

    Column() {

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .width(200)
        .onReady((): void => {
        })
        .onSelectionChange((value: RichEditorRange): void => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .onWillChange((value: RichEditorChangeValue): boolean => {
          let layoutManager: LayoutManager = this.controller!.getLayoutManager() as LayoutManager;
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onWillChange:' +  JSON.stringify(lineMetrics));
          this.lineMetricsWill = JSON.stringify(lineMetrics);
          return true
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange): void => {
          let layoutManager: LayoutManager = this.controller!.getLayoutManager() as LayoutManager;
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onDidChange:' +  JSON.stringify(lineMetrics));
          this.lineMetricsDid = JSON.stringify(lineMetrics);
        })
        .id('RichEditorLineMetrics021')
      Text('lineMetricsWill' + this.lineMetricsWill).id('lineMetricsWill')
      Text('lineMetricsDid:' + this.lineMetricsDid).id('lineMetricsDid')
    }
  }
}
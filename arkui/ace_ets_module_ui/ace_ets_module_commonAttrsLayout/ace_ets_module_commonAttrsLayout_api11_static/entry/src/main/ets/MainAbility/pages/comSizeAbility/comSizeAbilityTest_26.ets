'use static';
/**
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
  $r,
  Alignment,
  AlphabetIndexer,
  AnimationStatus,
  Builder,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  Checkbox,
  CheckboxGroup,
  Circle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  DataPanel,
  DatePicker,
  Divider,
  Ellipse,
  Entry,
  FontWeight,
  ForEach,
  FormLink,
  Gauge,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  Image,
  ImageAnimator,
  ImageSpan,
  LineJoinStyle,
  List,
  ListItem,
  ListItemGroup,
  Menu,
  MenuItem,
  MenuItemGroup,
  Path,
  Polygon,
  Polyline,
  Position,
  PreDragStatus,
  QRCode,
  Radio,
  Rect,
  Refresh,
  RenderingContextSettings,
  ResourceStr,
  RichEditor,
  RichEditorController,
  RichEditorDeleteValue,
  RichEditorImageSpanResult,
  RichEditorInsertValue,
  RichEditorOptions,
  RichEditorSelection,
  RichEditorTextSpanResult,
  RichEditorUpdateTextSpanStyleOptions,
  RichText,
  Row,
  Scroll,
  Scroller,
  Search,
  Span,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_26 {
  @State text: string = ''
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State message: string = "[-1, -1]"
  @State content: string = ""
  @State span: string = "文本组件"
  private start: Int = -1;
  private end: Int = -1;

  build() {
    Scroll() {
      Column() {
        Row() {
          Button("更新样式:加粗").onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: this.start,
              end: this.end,
              textStyle:
              {
                fontWeight: FontWeight.Bolder
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        }

        Column() {
          RichEditor(this.options)
            .size({ width: 100, height: 100 })
            .offset({ x: 1, y: 1 } as Position)
            .translate({ x: 1, y: 1, z: 1 })
            .scale({
              x: 1,
              y: 1,
              z: 1,
              centerX: 1,
              centerY: 1
            })
            .rotate({
              x: 1,
              y: 1,
              z: 1,
              angle: 0,
              centerX: 1,
              centerY: 1
            })
            .transform(matrix)
            .backgroundColor('blue')
            .onReady((): void => {
              this.controller.addTextSpan(this.span,
                {
                  style:
                  {
                    fontColor: Color.Orange,
                    fontSize: 12
                  }
                })
            })
            .key('RichEditorSpan_localOffset')
            .onSelect((value: RichEditorSelection): void => {
              this.start = value.selection[0];
              this.end = value.selection[1];
              this.message = "[" + this.start + ", " + this.end + "]"
            })
            .aboutToIMEInput((value: RichEditorInsertValue): Boolean => {
              console.log("---------------------- aboutToIMEInput ----------------------")
              console.log("insertOffset:" + value.insertOffset)
              console.log("insertValue:" + value.insertValue)
              return true;
            })
            .onIMEInputComplete((value: RichEditorTextSpanResult): void => {
              console.log("---------------------- onIMEInputComplete ---------------------")
              console.log("spanIndex:" + value.spanPosition.spanIndex)
              console.log("spanRange:[" + value.spanPosition.spanRange[0] + "," + value.spanPosition.spanRange[1] + "]")
              console.log("offsetInSpan:[" + value.offsetInSpan[0] + "," + value.offsetInSpan[1] + "]")
              console.log("value:" + value.value)
            })
            .aboutToDelete((value: RichEditorDeleteValue): Boolean => {
              console.log("---------------------- aboutToDelete --------------------------")
              console.log("offset:" + value.offset)
              console.log("direction:" + value.direction)
              console.log("length:" + value.length)
              value.richEditorDeleteSpans.forEach(item => {
                console.log("---------------------- item --------------------------")
                console.log("spanIndex:" + item.spanPosition.spanIndex)
                console.log("spanRange:[" + item.spanPosition.spanRange[0] + "," + item.spanPosition.spanRange[1] + "]")
                console.log("offsetInSpan:[" + item.offsetInSpan[0] + "," + item.offsetInSpan[1] + "]")
                if (typeof (item as RichEditorImageSpanResult)?.imageStyle != 'undefined') {
                  console.log("image:" + (item as RichEditorImageSpanResult).valueResourceStr)
                } else {
                  console.log("text:" + (item as RichEditorTextSpanResult).value)
                }
                if (typeof (item as RichEditorImageSpanResult)?.imageStyle != 'undefined') {
                  console.log("image:" + (item as RichEditorImageSpanResult).valueResourceStr)
                } else {
                  console.log("text:" + (item as RichEditorTextSpanResult).value)
                }
              })
              return true;
            })
            .onDeleteComplete((): void => {
              console.log("---------------------- onDeleteComplete ------------------------")
            })
            .borderWidth(1)
            .borderColor(Color.Green)
        }
        .key('RichEditor_Father')
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("100%")
        .height("70%")
      }
    }.height('100%')
  }
}
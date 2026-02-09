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
  Entry,
  Component,
  Column,
  Builder,
  Text,
  Color,
  RichEditorController,
  Padding,
  RichEditorOptions,
  Margin,
  HorizontalAlign,
  Row,
  ClickEvent,
  Button,
  Menu,
  MenuItem,
  Span,
  FontWeight,
  RichEditorTextSpanResult,
  RichEditorImageSpanResult,
  RichEditor,
  RichEditorSelection,
  RichEditorInsertValue,
  RichEditorDeleteValue,
  MenuItemOptions,
  RichEditorUpdateTextSpanStyleOptions,
  CopyOptions,
  $r,
  RichEditorSpanType,
  ResponseType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct richeditor2 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  private start: int = -1;
  private end: int = -1;
  @State message: string = "[-1, -1]"
  @State content: string = ""

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "取消", labelInfo: "Ctrl+S" } as MenuItemOptions)
      MenuItem({ content: "确认", labelInfo: "ENTER" } as MenuItemOptions)
    }
  }

  build() {
    Column() {
      Column() {
        Text("selection range:").width("100%")
        Text() {
          Span(this.message)
        }.width("100%")

        Text("selection content:").width("100%")
        Text() {
          Span(this.content)
        }.width("100%")
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")

      // Row() {
      //   Button("更新样式:加粗").onClick((e: ClickEvent) => {
      //     this.controller.updateSpanStyle({
      //       start: this.start,
      //       end: this.end,
      //       textStyle:
      //       {
      //         fontWeight: FontWeight.Bolder
      //       }
      //     } as RichEditorUpdateTextSpanStyleOptions)
      //   })
      //   Button("closeSelectionMenu").onClick((e: ClickEvent) => {
      //     this.controller.closeSelectionMenu();
      //   })
      //
      //   Button("获取选择内容").onClick((e: ClickEvent) => {
      //     this.content = "";
      //     this.controller.getSpans({
      //       start: this.start,
      //       end: this.end
      //     }).forEach(item => {
      //       if (typeof (item as RichEditorImageSpanResult).imageStyle != 'undefined') {
      //         this.content += (item as RichEditorImageSpanResult).valueResourceStr;
      //         this.content += "\n"
      //       } else {
      //         this.content += (item as RichEditorTextSpanResult).value;
      //         this.content += "\n"
      //       }
      //     })
      //   })
      //   Button("删除选择内容").onClick((e: ClickEvent) => {
      //     this.controller.deleteSpans({
      //       start: this.start,
      //       end: this.end
      //     })
      //     this.start = -1;
      //     this.end = -1;
      //     this.message = "[" + this.start + ", " + this.end + "]"
      //   })
      // }
      // .borderWidth(1)
      // .borderColor(Color.Red)
      // .width("100%")
      // .height("10%")

      Column() {
        RichEditor(this.options)
          .copyOptions(CopyOptions.InApp)
          .onReady(() => {
            this.controller.addTextSpan("0123456789",
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller.addImageSpan($r("app.media.icon"),
              {
                imageStyle:
                {
                  size: ["57px", "57px"]
                }
              })
            this.controller.addTextSpan("0123456789",
              {
                style:
                {
                  fontColor: Color.Black,
                  fontSize: 30
                }
              })
          })
          .key('richEditor')
          .bindSelectionMenu(RichEditorSpanType.TEXT, this.SubMenu, ResponseType.RightClick)
          .bindSelectionMenu(RichEditorSpanType.IMAGE, this.SubMenu, ResponseType.RightClick)
          .bindSelectionMenu(RichEditorSpanType.MIXED, this.SubMenu, ResponseType.RightClick)
          .onSelect((value: RichEditorSelection) => {
            this.start = value.selection[0];
            this.end = value.selection[1];
            this.message = "[" + this.start + ", " + this.end + "]"
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            console.log("---------------------- aboutToIMEInput ----------------------")
            console.log("insertOffset:" + value.insertOffset)
            console.log("insertValue:" + value.insertValue)
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.log("---------------------- onIMEInputComplete ---------------------")
            console.log("spanIndex:" + value.spanPosition.spanIndex)
            console.log("spanRange:[" + value.spanPosition.spanRange[0] + "," + value.spanPosition.spanRange[1] + "]")
            console.log("offsetInSpan:[" + value.offsetInSpan[0] + "," + value.offsetInSpan[1] + "]")
            console.log("value:" + value.value)
          })
          .aboutToDelete((value: RichEditorDeleteValue) => {
            console.log("---------------------- aboutToDelete --------------------------")
            console.log("offset:" + value.offset)
            console.log("direction:" + value.direction)
            console.log("length:" + value.length)
            value.richEditorDeleteSpans.forEach(item => {
              console.log("---------------------- item --------------------------")
              console.log("spanIndex:" + item.spanPosition.spanIndex)
              console.log("spanRange:[" + item.spanPosition.spanRange[0] + "," + item.spanPosition.spanRange[1] + "]")
              console.log("offsetInSpan:[" + item.offsetInSpan[0] + "," + item.offsetInSpan[1] + "]")
              if (typeof (item as RichEditorImageSpanResult).imageStyle != 'undefined') {
                console.log("image:" + (item as RichEditorImageSpanResult).valueResourceStr)
              } else {
                console.log("text:" + (item as RichEditorTextSpanResult).value)
              }
            })
            return true;
          })
          .onDeleteComplete(() => {
            console.log("---------------------- onDeleteComplete ------------------------")
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height("30%")
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("70%")
    }
  }
}

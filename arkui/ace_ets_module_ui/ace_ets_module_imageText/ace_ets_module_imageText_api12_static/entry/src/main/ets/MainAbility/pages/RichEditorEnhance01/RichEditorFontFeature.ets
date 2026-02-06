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
  Entry,Grid,GridItem,RichEditorImageSpanResult,RichEditorUpdateTextSpanStyleOptions,RichEditorTextSpanResult,
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
struct RichEditorFontFeature {
  controller: RichEditorController = new RichEditorController();
  controller1: RichEditorController = new RichEditorController();
  @State content: string = ""


build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady((): void => {
          this.controller!.addTextSpan("H2O, difficult \n", {
            style: {
              fontColor: Color.Pink,
              fontFeature: "\"sups\" on",
              fontSize:10
            }
          })
        })
        .width("90%")
        .height('15%')
        .border({ width: 1, radius: 5 })
        .draggable(false)
        .clip(false)
        .margin({top:20} as Margin)
      RichEditor({ controller: this.controller1 } as RichEditorOptions)
        .onReady((): void => {
          this.controller1.addTextSpan("H2O, difficult \n", {
            style: {
              fontColor: Color.Pink,
              fontSize:10
            }
          })
        })
        .width("90%")
        .height('15%')
        .border({ width: 1, radius: 5 })
        .draggable(false)
        .clip(false)
      Row(){
        Text("getSpansAPI").id("RichEditorFontFeatureValue_" + this.content).fontColor(Color.Green).fontSize(10)
        Text("获取FontFeature值为：" + this.content).fontColor(Color.Green).fontSize(10)
      }
      Column({ space: 10 } as ColumnOptions) {
        Button("更新fontFeather为：'subs' 1")
          .height('5%')
          .id("RichEditorFontFeature_UpdateBtn1")
          .onClick((e: ClickEvent) => {
            this.controller!.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontFeature: "\"subs\" 1"
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button("更新fontFeather为：'subs' 1, 'liga' 0")
          .height('5%')
          .id("RichEditorFontFeature_UpdateBtn2")
          .onClick((e: ClickEvent) => {
            this.controller!.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontFeature: "\"subs\" 1, \"liga\" 0"
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Row(){
          Button("getSpans")
            .height('5%')
            .id("RichEditorFontFeature_GetSpansBtn")
            .onClick((e: ClickEvent) => {
              this.controller!.getSpans({
                start: -1,
                end: -1
              })!.forEach(item => {
                if(typeof(item as RichEditorTextSpanResult)?.textStyle != 'undefined'){
                  this.content=""
                  this.content += (item as RichEditorTextSpanResult)?.textStyle.fontFeature;
                  console.info("sddd"+ JSON.stringify((item as RichEditorTextSpanResult)?.textStyle.fontFeature))
                }
              })
            })
        }
      }
    }.height('100%')
  }
}
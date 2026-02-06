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
  Entry,Grid,GridItem,RichEditorUpdateTextSpanStyleOptions,RichEditorTextSpanResult,
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
struct RichEditor_TextStyle {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State start: int = -1;
  @State end: int = -1;
  @State LH:number = 50
  @State LS:number = 20
  @State content_H: string = ""
  @State content_L: string = ""


build() {
    Column() {
      Scroll(){
        Column(){
          Row() {
            Button("行高+50")
              .id("addLineHeightBut")
              .onClick((e: ClickEvent)=>{
              this.LH = this.LH + 50
              this.controller!.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  lineHeight: this.LH
                }
              } as RichEditorUpdateTextSpanStyleOptions)
            })
            Button("行高-50").onClick((e: ClickEvent)=>{
              this.LH = this.LH - 50
              this.controller!.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  lineHeight: this.LH
                }
              } as RichEditorUpdateTextSpanStyleOptions)
            })
            Button("字符间距+20")
              .id("addLetterSpacing")
              .onClick((e: ClickEvent)=>{
              this.LS = this.LS + 20
              this.controller!.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  letterSpacing: this.LS
                }
              } as RichEditorUpdateTextSpanStyleOptions)
            })
            Button("字符间距-20").onClick((e: ClickEvent)=>{
              this.LS = this.LS - 20
              this.controller!.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  letterSpacing: this.LS
                }
              } as RichEditorUpdateTextSpanStyleOptions)
            })
          }
          Row(){
            Button("getSpans")
              .id("RichEditorTextStyle_GetSpansBtn")
              .onClick((e: ClickEvent) => {
              this.controller!.getSpans({
                start: this.start,
                end: this.end
              })!.forEach(item => {
                if(typeof(item as RichEditorTextSpanResult)?.textStyle != 'undefined'){
                  this.content_H=""
                  this.content_L=""
                  this.content_H = "LineHeight_" + (item as RichEditorTextSpanResult)?.textStyle.lineHeight;
                  this.content_L = "LetterSpacing_" + (item as RichEditorTextSpanResult)?.textStyle.letterSpacing;
                }
              })
            })
          }
        }
      }.borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")
      .margin({top: 20} as Margin)

      Scroll(){
        Column({space: 10} as ColumnOptions) {
          Row(){
            Text("getSpans获取到的行高为：")
            Text(this.content_H).id("StyleLineHeight_" + this.content_H).fontSize(15).fontColor(Color.Green)
          }
          Row(){
            Text("getSpans获取到的字符间距为：")
            Text(this.content_L).id("StyleLetterSpacing_" + this.content_L).fontSize(15).fontColor(Color.Green)
          }
          Row(){
            Text("LineHeight:" + this.LH).width("100%")
          }
          Row(){
            Text("LetterSpacing:" + this.LS).width("100%")
          }
        }
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")
      .margin({bottom: 20} as Margin)

      Column() {
        RichEditor(this.options).clip(true).padding(10)
          .onReady((): void => {
            this.controller!.addTextSpan("0123456789",
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 32,
                  lineHeight: this.LH,
                  letterSpacing: this.LS
                }
              })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width(400)
          .height(400)
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("60%")
    }
  }
}
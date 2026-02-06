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
import image from "@ohos.multimedia.image";

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
import common from '@ohos.app.ability.common';
@Entry
@Component
struct RichEditorAttributeStrings006 {

  @State spans: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  imagePixelMap: image.PixelMap | undefined = undefined;


  onPageShow() {

     this.getPixmapFromMedia($r('app.media.icon')).then((createPixelMap: image.PixelMap)=>{
       this.imagePixelMap = createPixelMap
     });
  }

  private async getPixmapFromMedia(resource: Resource): Promise<image.PixelMap> {
    let unit8Array = await AppStorage.get<common.Context>('applicationContext')?.resourceManager?.getMediaContent(resource.id)!
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await (imageSource?.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    }) as Promise<image.PixelMap>)
    await (imageSource?.release() as Promise<void>)
    return createPixelMap
  }

build() {
    Column() {

      Button('toStyledString 0,2').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: 0,
          end: 2});
        this.spans = str!.getString();
      }).id('toStyledString')

      Button('toStyledString 100,200').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: 100,
          end: 200});
        this.spans = str!.getString();
      }).id('toStyledString100')

      Button('toStyledString -1,-1').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: -1,
          end: -1});
        this.spans = str!.getString();
      }).id('toStyledString1')

      Button('toStyledString -1,0').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: -1,
          end: 0});
        this.spans = str!.getString();
      }).id('toStyledString2')

      Button('toStyledString -100,100').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: -100,
          end: 100});
        this.spans = str!.getString();
      }).id('toStyledString3')

      Text('spans:' + this.spans).id('spans')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.addTextSpan('0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings006')
    }
  }
}
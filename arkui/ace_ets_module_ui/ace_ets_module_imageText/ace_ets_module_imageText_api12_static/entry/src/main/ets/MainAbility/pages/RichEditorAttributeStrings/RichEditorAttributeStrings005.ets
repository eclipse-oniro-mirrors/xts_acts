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
import { LengthMetrics } from '@ohos.arkui.node'
import image from "@ohos.multimedia.image";
import { MyCustomSpan } from '../../common/MyCustomSpan'

import {
  Entry,ImageAttachmentLayoutStyle,SizeOptions,ImageAttachmentInterface,ImageSpanAlignment,ImageFit,
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
  PanGesture,RichEditorImageSpanResult,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct RichEditorAttributeStrings005 {

  @State spans: string = '';
  @State imageSpan: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  imagePixelMap: image.PixelMap | undefined = undefined;
  fontStyle: TextStyle = { fontColor: Color.Blue } as TextStyle;
  customSpan: MyCustomSpan = new MyCustomSpan('Hello', 20, 80);
  styleStr: MutableStyledString = new MutableStyledString(this.customSpan);
  mutableStyledString: MutableStyledString = new MutableStyledString('aaa',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle
    }]);

  onPageShow() {
    this.getPixmapFromMedia($r('app.media.icon')).then((createPixelMap:image.PixelMap)=>{
      this.imagePixelMap =createPixelMap
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

      Button('fromStyledString').onClick((e: ClickEvent) => {
        let array = this.controller!.fromStyledString(this.mutableStyledString);
        array!.forEach(item => {
          this.spans = (item as RichEditorTextSpanResult).value;
        })
      }).id('fromStyledString')

      Button('image fromStyledString').onClick((e: ClickEvent) => {
        if (this.imagePixelMap !== undefined) {
          let imageStyledString = new MutableStyledString(new ImageAttachment({
            value: this.imagePixelMap as image.PixelMap,
            size: { width: '30px', height: '30px' } as SizeOptions,
            layoutStyle: { borderRadius: LengthMetrics.vp(10) } as ImageAttachmentLayoutStyle,
            verticalAlign: ImageSpanAlignment.TOP,
            objectFit: ImageFit.Contain
          } as ImageAttachmentInterface))
          let array = this.controller!.fromStyledString(imageStyledString);
          array!.forEach(item => {
            if (typeof (item as RichEditorImageSpanResult).imageStyle != 'undefined') {
              this.imageSpan = 'imageSpan index:' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range: ' +
              (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' + (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' +
              (item as RichEditorImageSpanResult).imageStyle.size[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle.size[1];
            }
          })
        }
      }).id('imageFromStyledString')

      Button('cusFromStyledString').onClick((e: ClickEvent) => {
        console.log('JSON.stringify(array)JSON.stringify(array)',JSON.stringify(this.styleStr))
        let array = this.controller.fromStyledString(this.styleStr);
        this.spans = JSON.stringify(array);
      }).id('cusFromStyledString')


      Text('spans:' + this.spans).id('spans')
      Text('' + this.imageSpan).id('imageSpan')

      RichEditor(this.options as RichEditorOptions)
        .onReady((): void => {
          this.controller!.addTextSpan('0123',
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
        .id('RichEditorAttributeStrings005')
    }
  }
}
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
import CommonFunc from '../../common/Common'
import common from '@ohos.app.ability.common';
import {
  Entry,BorderRadiuses,StyledStringValue,ImageAttachmentInterface,ImageSpanAlignment,ImageFit,
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
struct RichEditorSetStyledString006 {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State selection: string = '';
  @State content: string = '';
  @State lengthStr: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: CommonFunc.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = { fontColor: Color.Blue } as TextStyle;
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('init属性',
    [{ start: 0, length: 6, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);
  styledString: StyledString = new StyledString('属性字符串',
    [{ start: 0, length: 5, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle2
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;

  onPageShow() {
    console.info('aboutToAppear initial imagePixelMap');
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
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
      Button('image Top').onClick((e: ClickEvent) => {
        if (this.imagePixelMap !== undefined) {
          let imageStyledString = new MutableStyledString(new ImageAttachment({
            value: this.imagePixelMap as image.PixelMap,
            size: { width: 20, height: 20 },
            layoutStyle: { borderRadius: LengthMetrics.vp(10) },
            verticalAlign: ImageSpanAlignment.TOP,
            objectFit: ImageFit.Contain
          } as ImageAttachmentInterface))
          this.richEditorStyledString = this.controller!.getStyledString()!;
          this.richEditorStyledString.appendStyledString(imageStyledString);
          this.controller!.setStyledString(this.richEditorStyledString as StyledString);
          this.controller!.setCaretOffset(this.richEditorStyledString.length);
        }
      }).id('image_top')

      Button('get content').onClick((e: ClickEvent) => {
        let imageArray = this.richEditorStyledString.getStyles(11, 1, StyledStringKey.IMAGE)!;
        for (let i = 0; i < imageArray.length; ++i) {
          if (imageArray[i].styledKey === 300) {
            let attachment = imageArray[i].styledValue as ImageAttachment;
            if (attachment.size !== undefined) {
              this.content += 'width:' + attachment.size?.width + ';height:' + attachment.size?.height;
            }
            this.content += ';verticalAlign:' + attachment.verticalAlign;
            this.content += ';objectFit:' + attachment.objectFit;
            if (attachment.layoutStyle !== undefined) {
              let radius = attachment?.layoutStyle?.borderRadius as BorderRadiuses
              this.content += JSON.stringify(radius);
            }
          }
        }
        console.log('RichEditorController this.content:' + this.content);
      }).id('get_content')

      Text('content:' + this.content).id('content')
      Text('lengthStr:' + this.lengthStr).id('lengthStr')

      Button('get length').onClick((e: ClickEvent) => {
        this.lengthStr = this.controller!.getStyledString()!.length + '';
      }).id('get_length')

      Button('update style').onClick((e: ClickEvent) => {
        this.richEditorStyledString = this.controller!.getStyledString()!;
        this.richEditorStyledString.setStyle({
          start: 11,
          length: 1,
          styledKey: StyledStringKey.IMAGE,
          styledValue: new ImageAttachment({
            value: this.imagePixelMap as image.PixelMap,
            size: { width: 30, height: 30 },
            layoutStyle: { borderRadius: LengthMetrics.vp(20) },
            verticalAlign: ImageSpanAlignment.CENTER,
            objectFit: ImageFit.Contain
          } as ImageAttachmentInterface) as StyledStringValue
        })
        this.controller!.setStyledString(this.richEditorStyledString as StyledString);
        this.content = '';
      }).id('update_style')

      Button('remove').onClick((e: ClickEvent) => {
        this.richEditorStyledString = this.controller!.getStyledString()!;
        this.richEditorStyledString.removeStyles(6, 6);
        this.controller!.setStyledString(this.richEditorStyledString as StyledString);
      }).id('remove')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorSetStyledString006')

      Column() {
        Row() {
          Button('add text').onClick((e: ClickEvent) => {
            this.richEditorStyledString = this.controller!.getStyledString()!;
            this.richEditorStyledString.appendStyledString(this.styledString);
            this.controller.setStyledString(this.richEditorStyledString as StyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('add_text')
        }

      }
      .width('100%')
    }
  }
}
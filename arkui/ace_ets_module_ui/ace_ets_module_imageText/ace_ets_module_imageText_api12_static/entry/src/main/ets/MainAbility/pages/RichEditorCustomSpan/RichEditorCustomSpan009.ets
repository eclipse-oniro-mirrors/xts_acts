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
import CommonFunc from '../../common/Common'

import {
  Entry,
  Component,ImageAttachmentInterface,ImageSpanAlignment,ImageFit,
  Column,
  Row,SpanStyle,
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
struct RichEditorCustomSpan009 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);

  customSpan2: MyCustomSpan = new MyCustomSpan('123', 80);

  imagePixelMap: image.PixelMap | undefined = undefined;
  @State length: string = '';
  @State stylesInfo: string = '';

  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: CommonFunc.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = { fontColor: Color.Blue } as TextStyle
  fontStyleAttr1: TextStyle = { fontColor: Color.Red } as TextStyle
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{ start: 0, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;

   onPageShow() {
    console.info('aboutToAppear initial imagePixelMap');
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
  }

  private async getPixmapFromMedia(resource: Resource): Promise<image.PixelMap> {
    let unit8Array = await  AppStorage.get<common.Context>('applicationContext')?.resourceManager?.getMediaContent(resource.id)!
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
          }as ImageAttachmentInterface ))
          this.richEditorStyledString = this.controller!.getStyledString()!;
          this.richEditorStyledString.appendStyledString(imageStyledString);
          this.controller!.setStyledString(this.richEditorStyledString);
          this.controller!.setCaretOffset(this.richEditorStyledString.length);
        }
      }).id('imageTop')

      Button('get content').onClick((e: ClickEvent) => {
        let richEditorStyledString = this.controller!.getStyledString()!;
        this.length = richEditorStyledString!.getString().length + '';
      }).id('getContent')
      Button('getStyles')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller!.getStyledString()!;
          let styles:SpanStyle[] = richEditorStyledString!.getStyles(0, richEditorStyledString.length) as SpanStyle[];
          this.stylesInfo += JSON.stringify(styles);
          for (let i = 0; i < styles!.length; i++) {
            if (styles[i as int].styledKey === 0) {
              let fontAttr = styles[i as int].styledValue as TextStyle;
              this.stylesInfo += fontAttr.fontColor;
            }
          }
        })
        .id('getStyles')
      Button('removeString').onClick((e: ClickEvent) => {
        let richEditorStyledString = this.controller!.getStyledString()!;
        richEditorStyledString.removeString(4, 1);
        richEditorStyledString.removeString(2, 2);
        this.controller!.setStyledString(richEditorStyledString);
      }).id('removeString')

      Button('replaceStyle').onClick((e: ClickEvent) => {
        let richEditorStyledString = this.controller!.getStyledString()!;
        richEditorStyledString.replaceStyle({
          start: 0,
          length: 2,
          styledKey: StyledStringKey.FONT,
          styledValue: this.fontStyleAttr1
        });
        richEditorStyledString.replaceStyle({
          start: 3,
          length: 1,
          styledKey: StyledStringKey.CUSTOM_SPAN,
          styledValue: this.customSpan2
        });
        this.controller!.setStyledString(richEditorStyledString);
      }).id('replaceStyle')

      Text('length:' + this.length).id('length')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorCustomSpan009')

      Column() {
        Row() {
          Button('add custom').onClick((e: ClickEvent) => {
            this.richEditorStyledString = this.controller!.getStyledString()!;
            this.richEditorStyledString.appendStyledString(this.style1);
            this.controller!.setStyledString(this.richEditorStyledString);
            this.controller!.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom')
        }

      }
      .width('100%')
    }
  }
}
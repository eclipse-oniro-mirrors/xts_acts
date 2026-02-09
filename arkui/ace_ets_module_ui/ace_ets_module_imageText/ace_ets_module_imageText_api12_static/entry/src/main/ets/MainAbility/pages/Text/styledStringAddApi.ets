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
import image from '@ohos.multimedia.image'
import {
  ImageSpanAlignment,ImageFit,ImageAttachmentInterface,
  Entry, Component, Resource, Color, RichEditor, Button, FontWeight, FontStyle, StyleOptions, TextStyleInterface,StyledStringKey,TextRange,
  Column, Text, TextStyle,StyledString, ClickEvent, $r, CustomSpan, CustomSpanMeasureInfo, CustomSpanMetrics, DrawContext, CustomSpanDrawInfo,
  MutableStyledString, TextController, Row, RichEditorStyledStringController, RichEditorStyledStringOptions, StyledStringChangedListener, StyledStringChangeValue
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
@Entry
@Component
struct Index {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State selection: string = '';
  @State content: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  controller3: TextController = new TextController();
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  } as TextStyleInterface)
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue } as TextStyleInterface);
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Italic
  } as TextStyleInterface)
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('初始属性字符串',
    [{ start: 0, length: 5, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 } as StyleOptions]);
  styledString: StyledString = new StyledString('插入属性字符串',
    [{ start: 2, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;
  // 文本内容变化回调
  contentChangedListener: StyledStringChangedListener = {
    onWillChange: (value: StyledStringChangeValue) => {
      if (value.previewText) {
        this.range = '[ ' + value.range.start + ' , ' + value.range.end + ' ]' + value.previewText?.getString();
      }
      this.replaceString = value.replacementString.getString();
      return true;
    },
    onDidChange: (rangeBefore: TextRange, rangeAfter: TextRange):void => {
      this.rangeBefore = '[ ' + rangeBefore.start + ' , ' + rangeBefore.end + ' ]';
      this.rangeAfter = '[ ' + rangeAfter.start + ' , ' + rangeAfter.end + ' ]';
    }
  } as StyledStringChangedListener

  onPageShow() {
    this.controller3.setStyledString(this.mutableStyledString)
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
  }

  private async getPixmapFromMedia(resource: Resource):Promise<image.PixelMap> {
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
      Column() {
        Text('选中区信息')
          .fontSize(20)
          .width('100%')
        Text('selection range: ' + this.selection).width('100%')
        Text('selection content: ' + this.content).width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('10%')

      Column() {
        Text('onWillChange回调信息')
          .fontSize(20)
          .width('100%')
        Text('range: ' + this.range).width('100%')
        Text(this.replaceString).width('100%').key('styledStringText')
        Text('onWillChange回调信息')
          .fontSize(20)
          .width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('20%')

      RichEditor(this.options)
        .onReady(():void => {
          // 注册文本变化回调
          this.controller!.onContentChanged(this.contentChangedListener);
          // 设定组件展示的属性字符串
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .key('styledStringAddApi')
        .width('100%')

      Text(undefined, { controller: this.controller3 }).fontSize(30)

      Button('change')
        .key('styledStringAddApiBt')
        .onClick((event: ClickEvent) => {
          this.mutableStyledString.replaceStyledString(0,5,this.styledString)
          this.controller3.setStyledString(this.mutableStyledString)
        })

    }
  }
}
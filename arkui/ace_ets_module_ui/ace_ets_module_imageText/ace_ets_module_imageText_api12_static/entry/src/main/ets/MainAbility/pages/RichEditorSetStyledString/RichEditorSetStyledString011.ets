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

import {
  Entry,PasteEvent,CopyEvent,CutEvent,
  Component,ImageSpanAlignment,ImageFit,ImageAttachmentInterface,
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
struct RichEditorSetStyledString011 {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State selection: string = '';
  @State onPasteCall: boolean = false;
  @State onCopyCall: boolean = false;
  @State onCut: boolean = false;
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })

  styledString: StyledString = new StyledString('ab',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle2
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;

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

      Text('onPasteCall:' + this.onPasteCall).id('onPasteCall')
      Text('onCopyCall:' + this.onCopyCall).id('onCopyCall')
      Text('onCut:' + this.onCut).id('onCut')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.styledString);
        })
        .onPaste((event?: PasteEvent): void => {
          this.onPasteCall = true;
        })
        .onCopy((event: CopyEvent): void => {
          this.onCopyCall = true;
        })
        .onCut((event: CutEvent): void => {
          this.onCut = true;
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorSetStyledString011')
    }
  }
}
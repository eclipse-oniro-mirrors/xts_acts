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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ImageRenderMode,
  ImageInterpolation,
  CopyOptions,
  RowOptions,
  $rawfile,
  BorderStyle,
  ImageFit,
  ImageRepeat,
  ColorFilter,
  ResourceColor
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ImageExample2 {
  @State renderMode: ImageRenderMode | undefined = ImageRenderMode.Original
  @State widthS: number = 75;
  @State heightS: number = 75
  @State interpolation: ImageInterpolation | undefined = ImageInterpolation.None
  @State fillColor: ResourceColor = Color.Red
  @State copyOption: CopyOptions = CopyOptions.None
  @State is_draggable: boolean = false
  messageManager: MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined> = new MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined>()
  messageManagerResourceColor: MessageManager<ResourceColor> = new MessageManager<ResourceColor>()

  onPageShow() {
    console.info('Image2 onPageShow')
    AppStorage.setOrCreate<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined>>("messageManager", this.messageManager);
    AppStorage.setOrCreate<MessageManager<ResourceColor>>("messageManagerResourceColor", this.messageManagerResourceColor);
    // 此段代码导致unknow 注释
    let callback: Callback<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined> = (message: Message<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'renderMode') {
        if (message.value) {
          this.renderMode = message.value as ImageRenderMode
        } else {
          this.renderMode = undefined
        }
      }
      if (message.name == 'widthS') {
        this.widthS = message.value as Double
      }
      if (message.name == 'heightS') {
        this.heightS = message.value as Double
      }
      if (message.name == 'interpolation') {
        console.log('ImageInterpolation==============' + message.value)
        if (message.value) {
          this.interpolation = message.value as ImageInterpolation
        } else {
          this.interpolation = undefined
        }
      }
      if (message.name == 'draggable') {
        this.is_draggable = message.value as Boolean
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value as CopyOptions
      }
    }
    this.messageManager.registerCallback(callback)

    let callbackResourceColor: Callback<ResourceColor> = (message: Message<ResourceColor>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'fillColor') {
        this.fillColor = message.value as ResourceColor
      }
    }
    this.messageManagerResourceColor.registerCallback(callbackResourceColor)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('renderMode').fontSize(12).fontColor('0xcccccc').width('96%').height(30)
      Row({ space: 50 } as RowOptions) {
        Image($rawfile('bm.jpg'))
          .renderMode(this.renderMode)
          .width(100)
          .height(100)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .interpolation(this.interpolation)
          .matchTextDirection(false)
          .fitOriginalSize(false)
          .fillColor(this.fillColor)
          .autoResize(true)
          .syncLoad(false)
          .copyOption(CopyOptions.InApp)
          .colorFilter(new ColorFilter([2, 4, 5]))
          .overlay('Original', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .draggable(this.is_draggable)
          .key("image1")
        Image($rawfile('bm.jpg'))
          .renderMode(ImageRenderMode.Template)
          .width(100)
          .height(100)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .overlay('Template', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }

      Text('alt').fontSize(12).fontColor('0xcccccc').width('96%').height(30)
      Image('')
        .alt($rawfile('bm.jpg'))
        .width(100)
        .height(100)
        .border({ width: 1 })
        .borderStyle(BorderStyle.Dashed)

      Text('sourceSize').fontSize(12).fontColor('0xcccccc').width('96%')
      Row({ space: 50 } as RowOptions) {
        Image($rawfile('bm.jpg'))
          .sourceSize({
            width: 75,
            height: 75
          })
          .objectFit(ImageFit.ScaleDown)
          .width('25%')
          .aspectRatio(1)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .overlay('w:150 h:150', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .sourceSize({
            width: 200,
            height: 200
          })
          .objectFit(ImageFit.ScaleDown)
          .width('25%')
          .aspectRatio(1)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .overlay('w:200 h:200', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }

      Text('objectRepeat').fontSize(12).fontColor('0xcccccc').width('96%').height(30)
      Row({ space: 5 } as RowOptions) {
        Image($rawfile('bm.jpg'))
          .width(120)
          .height(125)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.XY)
          .objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.XY', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .width(110)
          .height(125)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.Y)
          .objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.Y', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .width(110)
          .height(125)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.X)
          .objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.X', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }
    }.height(150).width('100%').padding({ right: 10 } as Padding)
  }
}
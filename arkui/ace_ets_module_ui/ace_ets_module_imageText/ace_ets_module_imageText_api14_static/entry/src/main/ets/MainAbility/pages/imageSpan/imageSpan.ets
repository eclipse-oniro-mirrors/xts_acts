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
  Text,
  ImageSpan,
  ColumnOptions,
  RowOptions,
  TextAttribute,
  Column,
  Component,
  ColorFilter,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Padding,
  ImageRenderMode,
  ImageInterpolation,
  Row,
  Color,
  $rawfile
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageExample2 {
  @State renderMode: ImageRenderMode = ImageRenderMode.Original
  @State widthS: number = 75;
  @State heightS: number = 75
  @State interpolation: ImageInterpolation = ImageInterpolation.None
  @State fillColor: Color = Color.Red
  @State isDraggable: boolean = false
  messageManager: MessageManager<ImageRenderMode | number | ImageInterpolation | Color | boolean> =
    new MessageManager<ImageRenderMode | number | ImageInterpolation | Color | boolean>()

  onPageShow() {
    console.info('Image2 onPageShow')

    AppStorage.setOrCreate("messageManager", this.messageManager);

    let callback: Callback<ImageRenderMode | number | ImageInterpolation | Color | boolean> =
      (message: Message<ImageRenderMode | number | ImageInterpolation | Color | boolean>): void => {
        if (message.name == 'renderMode') {
          this.renderMode = message.value as ImageRenderMode
        }
        if (message.name == 'widthS') {
          this.widthS = message.value as number
        }
        if (message.name == 'heightS') {
          this.heightS = message.value as number
        }
        if (message.name == 'interpolation') {
          this.interpolation = message.value as ImageInterpolation
        }
        if (message.name == 'fillColor') {
          this.fillColor = message.value as Color
        }
        if (message.name == 'draggable') {
          this.isDraggable = message.value as boolean
        }
        if (message.name == 'copyOption') {
        }
      }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row({ space: 50 } as RowOptions) {
        Text() {
          ImageSpan($rawfile('bm.jpg')).colorFilter(new ColorFilter([2, 4, 5]))
            .key("imageSpan1")
        }
      }
    }.height(150).width('100%').padding({ right: 10 } as Padding)
  }
}
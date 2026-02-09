'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  $r,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GestureEvent,
  HorizontalAlign,
  Image,
  LongPressGesture,
  Margin,
  Padding,
  Row,
  SourceTool,
  Text
} from '@ohos.arkui.component'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct SnapshotExample {
  @State pixmap: image.PixelMap | '' = ''
  @State value: string = ''

  build() {
    Column() {
      Row() {
        Text(this.value).key('text')
        Image(this.pixmap)
          .width(200)
          .height(200)
          .border({ color: Color.Black, width: 2 })
          .margin(5)
          .key('componentSnapshot')
        Image($r('app.media.icon'))
          .autoResize(true)
          .width(200)
          .height(200)
          .margin(5)
          .id('root')
      }

      Button('click to generate UI snapshot')
        .onClick((e: ClickEvent) => {
          try {
            let pixelmap = componentSnapshot.getSync('root', {
              scale: 2, waitUntilRenderFinished: true, region: {
                left: 200,
                right: 200,
                top: 100,
                bottom: 200
              }
            })
            this.pixmap = pixelmap ?? ''
            this.value = 'suc'
          } catch (error) {
            error = error as BusinessError;
            console.error('getSync errorCode: ' + error.code + ' message: ' + error.message)
          }
        }).margin(10)
        .id('button1')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
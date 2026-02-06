'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Alignment,
  Button,
  ButtonType,
  Checkbox,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  ForEach,
  Image,
  KeyEvent,
  KeyProcessingMode,
  KeyType,
  Row,
  Scroll,
  Scroller,
  Text,
  TextArea,
  TextClock,
  TextInput
} from '@ohos.arkui.component'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct SnapshotExample {
  scroller: Scroller = new Scroller()
  @State pixmap: image.PixelMap | '' = ''
  @State pixmap1: image.PixelMap | '' = ''
  private arr: number[] = [0,1,2,3,4]

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row() {
        Column() {
          Text('ABCDE12345')
          TextArea().width(150).height(60)
          Button('Button ABCDE')
          Row() {
            Checkbox()
            Text('√')
            Text('|')
            Checkbox()
            Text('×')
          }.align(Alignment.Start)
        }
        .align(Alignment.Start)
        .key('root')
        .width(200)
        .height(200)
        .borderRadius(6)
        .borderWidth(2)
        .borderColor(Color.Green)

        Column() {
          TextClock()
          Button('Button ABCDE').type(ButtonType.Normal)
          Row() {
            Checkbox()
            Text('√')
          }.align(Alignment.Start)

          TextInput()
        }
        .align(Alignment.Start)
        .key('root2')
        .width(200)
        .height(200)
        .borderRadius(6)
        .borderWidth(2)
        .borderColor(Color.Green)
      }

      Column({ space: 10 } as ColumnOptions) {
        Button('SnapshotRegion')
          .id('SnapshotRegion')
          .onClick((e: ClickEvent) => {
            this.getUIContext()
              .getComponentSnapshot()
              .get('root', (error: BusinessError<void> | null, pixmap: image.PixelMap | undefined) => {
                this.pixmap = pixmap as image.PixelMap ?? ''
                if (error) {
                  console.log('error SnapshotRegion:' + JSON.stringify(error))
                  return;
                }
              }, {
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  left: 100,
                  right: 200,
                  top: 100,
                  bottom: 200
                } as componentSnapshot.SnapshotRegion
              } as componentSnapshot.SnapshotOptions)
          })
        Button('SnapshotRegion1')
          .id('SnapshotRegion1')
          .onClick((e: ClickEvent) => {
            this.getUIContext()
              .getComponentSnapshot()
              .get('root', (error: BusinessError<void> | null, pixmap1: image.PixelMap | undefined) => {
                this.pixmap1 = pixmap1 as image.PixelMap ?? ''
                if (error) {
                  console.log('error SnapshotRegion1:' + JSON.stringify(error))
                  return;
                }
              }, {
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  left: 0,
                  right: 200,
                  top: 100,
                  bottom: 200
                } as componentSnapshot.SnapshotRegion
              } as componentSnapshot.SnapshotOptions)
          })

        Button('LocalizedSnapshotRegion')
          .id('LocalizedSnapshotRegion')
          .onClick((e: ClickEvent) => {
            this.getUIContext()
              .getComponentSnapshot()
              .get('root2', (error: BusinessError<void> | null, pixmap: image.PixelMap | undefined) => {
                this.pixmap = pixmap as image.PixelMap ?? ''
                console.log('test start get pixmap')
                if (error) {
                  console.log('error LocalizedSnapshotRegion:' + JSON.stringify(error))
                  return;
                }
              }, {
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  start: 100,
                  end: 200,
                  top: 100,
                  bottom: 200
                } as componentSnapshot.LocalizedSnapshotRegion
              } as componentSnapshot.SnapshotOptions)
          })

        Button('LocalizedSnapshotRegion1')
          .id('LocalizedSnapshotRegion1')
          .onClick((e: ClickEvent) => {
            this.getUIContext()
              .getComponentSnapshot()
              .get('root2', (error: BusinessError<void> | null, pixmap1: image.PixelMap | undefined) => {
                this.pixmap1 = pixmap1 as image.PixelMap ?? ''
                if (error) {
                  console.log('error LocalizedSnapshotRegion1:' + JSON.stringify(error))
                  return;
                }
              }, {
                scale: 1, waitUntilRenderFinished: true,
                region: {
                  start: 0,
                  end: 200,
                  top: 150,
                  bottom: 200
                } as componentSnapshot.LocalizedSnapshotRegion
              } as componentSnapshot.SnapshotOptions)
          })
      }

      Scroll(this.scroller) {
        Column({ space: 5 } as ColumnOptions) {
          ForEach(this.arr, (item: number) => {
            Image(this.pixmap).margin(5).key('image1')
            Image(this.pixmap1).margin(5).key('image2')
          }, (item: number) => String(item))
        }
      }.height('50%')
    }
  }
}
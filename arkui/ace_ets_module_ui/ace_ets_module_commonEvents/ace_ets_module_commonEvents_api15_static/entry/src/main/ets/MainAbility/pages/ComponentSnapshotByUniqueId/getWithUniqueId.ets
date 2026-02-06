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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { ComponentSnapshot, Router, UIContext } from '@ohos.arkui.UIContext';
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
  NodeContainer,
  Padding,
  Row,
  SourceTool,
  Text
} from '@ohos.arkui.component'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';

class MyNodeController extends NodeController {
  public node: FrameNode | null = null;
  public imageNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node?.commonAttribute.width('100%').height('100%')

    let image = typeNode.createImageNode(uiContext);
    image.initialize($r('app.media.apple')).width('100%').height('100%').autoResize(true)
    this.imageNode = image;

    this.node?.appendChild(image);
    return this.node;
  }
}

@Entry
@Component
struct SnapshotExample {
  @State pixmap: image.PixelMap | string = "";
  @State text: string = 'text'
  @State snapshotScale: number = 1
  @State snapshotWait: boolean = false
  uiContext: UIContext = this.getUIContext()
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text(this.text).id('resultText')
      Row() {
        Image(this.pixmap).width(200).height(200).border({ color: Color.Black, width: 2 }).margin(5)
        NodeContainer(this.myNodeController).width(200).height(200).margin(5)
      }

      Button('Scale: ' + this.snapshotScale)
        .id('snapshotScale')
        .margin(10)
        .onClick((e: ClickEvent) => {
          console.log('test start snapshotScale')
          this.snapshotScale += 0.5
        })

      Button('snapshotWait: ' + this.snapshotWait)
        .id('snapshotWait')
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.snapshotWait = !this.snapshotWait
        })

      Button('UniqueId get snapshot')
        .id('UniqueId_getSnapshot')
        .onClick((e: ClickEvent) => {
          console.log('test click start 00 ')
          try {
            console.log('test click start 01 ')
            const str: ComponentSnapshot = this.uiContext.getComponentSnapshot()
            console.log('test click start 02 ')
            const num: Int = this.myNodeController.imageNode?.getUniqueId() as Int
            console.log('test click start 02: ' + num)
            str!.getWithUniqueId(num,
              {
                scale: this.snapshotScale,
                waitUntilRenderFinished: this.snapshotWait
              } as componentSnapshot.SnapshotOptions)!
              .then((pixmap: image.PixelMap) => {
                console.log('test click start 11 ')
                this.pixmap = pixmap
                this.text = 'UniqueId_getSnapshot_success'
                console.log('test click start 22 ' + this.text)
              })
              .catch((err: Error) => {
                console.log('error: ' + err)
              })
          } catch (error) {
            console.error('UniqueId get snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)

      Button('UniqueId getSync snapshot')
        .id('UniqueId_getSyncSnapshot')
        .onClick((e: ClickEvent) => {
          try {
            this.pixmap = this.getUIContext()
              .getComponentSnapshot()
              .getSyncWithUniqueId(this.myNodeController.imageNode?.getUniqueId() as Int,
                {
                  scale: this.snapshotScale,
                  waitUntilRenderFinished: this.snapshotWait
                } as componentSnapshot.SnapshotOptions)
            this.text = 'UniqueId_getSyncSnapshot_success'
          } catch (error) {
            console.error('UniqueId getSync snapshot Error: ' + JSON.stringify(error))
          }
        }).margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
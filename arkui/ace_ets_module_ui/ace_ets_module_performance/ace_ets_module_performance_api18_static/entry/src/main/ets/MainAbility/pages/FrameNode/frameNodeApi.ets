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

import { NodeController, BuilderNode, Size, FrameNode} from '@ohos.arkui.node'
import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions, ImageAnalyzerType,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
  WrappedBuilder, Padding, wrapBuilder, CustomBuilderT,
} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

class Params {
  public text: string = 'this is a text'
}

@Builder
function buttonBuilder(params: Params) {
  Column() {
    Button(params.text)
      .fontSize(20)
      .borderRadius(8)
  }
}

class MyNodeController extends NodeController {
  private buttonNode: BuilderNode<Params> | null = null
  private rootNode: FrameNode | null = null
  private wrapBuilder = wrapBuilder<CustomBuilderT<Params>>(buttonBuilder)
  makeNode(uiContext: UIContext): FrameNode|null {
    if (this.buttonNode == null) {
      this.buttonNode = new BuilderNode<Params>(uiContext)
      this.rootNode = new FrameNode(uiContext)
      let child : FrameNode = new FrameNode(uiContext)
      this.rootNode?.appendChild(child)
      this.buttonNode?.build(this.wrapBuilder, { text : 'This is a Button' } as Params)
    }
    return this.buttonNode!.getFrameNode();
  }

  onAttach(): void {
    console.log('onAttach')
  }

  onDetach(): void {
    console.log('onDetach')
  }

  onBind(containerId: number): void {
    this.rootNode?.reuse()
    AppStorage.setOrCreate<Int>('reuse', 1)
  }

  onUnbind(containerId: number): void {
    this.rootNode?.recycle()
    AppStorage.setOrCreate<Int>('recycle', 1)
  }

  getFrameNode(): FrameNode | null {
    return this.rootNode
  }
}

@Entry
@Component
struct frameNodeApi {
  @State buttonShow: boolean = true
  @State buttonIndex: Int = 0
  public buttonController : MyNodeController = new MyNodeController()
  private buttonNull: null = null
  private buttonControllerArray : Array<MyNodeController | null> = [this.buttonController, this.buttonNull]

  build() {
    Column() {
      Button('Bind')
        .onClick((e:ClickEvent) => {
          this.buttonIndex++
          AppStorage.setOrCreate<Int>('reuse', 1)
          AppStorage.setOrCreate<Int>('recycle', 1)
        })
        .margin(5)
        .id('frameNodeApi_Bind')

      Button('onAttach')
        .onClick((e:ClickEvent) => {
          this.buttonShow = !this.buttonShow
        })
        .margin(5)
        .id('frameNodeApi_onAttach')

      if (this.buttonShow) {
        NodeContainer(this.buttonControllerArray[(this.buttonIndex % this.buttonControllerArray.length) as Int]!)
      }
    }
    .padding({ left: 35, right: 35} as Padding)
    .height('100%')
    .width('100%')
  }
}

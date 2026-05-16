/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { NodeController, BuilderNode, FrameNode, UIContext } from "@kit.ArkUI"

class Params {
  text: string = ''
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 36})
  }
}

class TextNodeController extends NodeController {
  private textNode: BuilderNode<[Params]> | null = null;
  private message: string = 'DEFAULT';

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.textNode = new BuilderNode(context);
    this.textNode.build(wrapBuilder<[Params]>(buildText), new Params(this.message),{nestingBuilderSupported:false})

    return this.textNode.getFrameNode();
  }
}

@Entry
@Component
struct RichEditorApi13 {
  @State message: string = 'Hello World'
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }

  @State a:TextDataDetectorType=TextDataDetectorType.DATE_TIME

  @Builder panel(){
    Text('aaaaaa')
  }

  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan(this.message, { style: { fontColor: Color.Orange, fontSize: 30 } })
          })
          .bindSelectionMenu(RichEditorSpanType.BUILDER, this.panel, ResponseType.LongPress, {
          })
          .borderWidth(1)
          .borderColor(Color.Red)
          .width(200)
          .height(200)
          .id('RichEditorApi13')

      }.width('100%').backgroundColor(Color.White)
    }.height('100%')
  }
}

@Component
struct xComponent11{
  private surfaceId : string =''
  xcomponentController: XComponentController = new XComponentController()

  build() {
    Column(){
      XComponent({
        id: 'xcomponent2',
        type: XComponentType.COMPONENT,
        controller: this.xcomponentController
      }).id('xcomponent_2')
        .onLoad(() => {
          this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('200px')
        .height('200px')
    }
  }
}
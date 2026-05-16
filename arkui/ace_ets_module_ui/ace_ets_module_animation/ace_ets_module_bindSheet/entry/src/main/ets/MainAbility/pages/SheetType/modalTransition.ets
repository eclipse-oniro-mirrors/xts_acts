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

import { NodeController, FrameNode, UIContext, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute
      .width("100%")
      .height("100%")
      .overlay("This is a NodeContainer.\nShow BindSheet, Please Onclick NodeContainer")
      .backgroundColor(Color.Pink)

    return this.rootNode;
  }
}

@Entry
@Component
struct Index05 {
  @State txt1: string = ''
  @State isShow1: boolean = false;
  @State modalTransitionArr: ModalTransition = ModalTransition.DEFAULT
  private preferTypeArray: SheetType[]=[
    SheetType.BOTTOM,
    SheetType.CENTER,
    SheetType.POPUP,
    SheetType.SIDE,
    SheetType.CONTENT_COVER,
  ]
  @State  preferTypeIndex: number = 4


  @Builder
  myBuilder1() {
    Column() {
      Text(String(this.modalTransitionArr))
        .id('text')
      Button("content1")
        .margin(10)
        .fontSize(20)

      Button("content2")
        .margin(10)
        .fontSize(20)
      Button("Close Page 1")
        .id('close')
        .fontSize(20)
        .margin({ top: 10, bottom: 5 })
        .onClick(()=>{
          this.isShow1 = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Row(){
      Column(){
        Button("002、preferType=" + this.preferTypeArray[this.preferTypeIndex] +
          ", index=" + this.preferTypeIndex)
          .onClick((event: ClickEvent) => {
            if (this.preferTypeIndex >= this.preferTypeArray.length - 1) {
              this.preferTypeIndex = 0;
            } else {
              this.preferTypeIndex = this.preferTypeIndex + 1;
            }
          })

        Button("DEFAULT")
          .id('DEFAULT')
          .border({ width: 2, color: Color.Blue })
          .onClick(() => {
            this.isShow1 = true;
          })
          .bindSheet(this.isShow1, this.myBuilder1(), {
            preferType:this.preferTypeArray[this.preferTypeIndex],
            modalTransition: this.modalTransitionArr
          })

        Button("NONE")
          .id('NONE')
          .border({ width: 2, color: Color.Blue })
          .onClick(() => {
            this.isShow1 = true;
            this.modalTransitionArr = ModalTransition.NONE
          })

        Button("ALPHA")
          .id('ALPHA')
          .border({ width: 2, color: Color.Blue })
          .onClick(() => {
            this.isShow1 = true;
            this.modalTransitionArr = ModalTransition.ALPHA
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}
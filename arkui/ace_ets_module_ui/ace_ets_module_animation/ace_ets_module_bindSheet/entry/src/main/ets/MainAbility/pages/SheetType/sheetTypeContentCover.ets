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
  private preferTypeArray: SheetType[]=[
    SheetType.BOTTOM,
    SheetType.CENTER,
    SheetType.POPUP,
    SheetType.SIDE,
    SheetType.CONTENT_COVER,
  ]
  @State  preferTypeIndex: number = 4

  @State enableOutsideInteractiveState:boolean = false;
  @State dismissState:boolean = false;

  private page1WidthArr:number[] = [400, 300];
  @State page1WidthIndex:number = 0;

  private modalTransitionArr:ModalTransition[] =
    [
      ModalTransition.NONE,
      ModalTransition.DEFAULT,
      ModalTransition.ALPHA,
    ];
  @State modalTransitionIndex:number = 1;

  @Builder
  myBuilder1() {
    Column() {
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
        Button("000、ModalTransition=" + this.modalTransitionArr[this.modalTransitionIndex] + ", index=" +
        this.modalTransitionIndex)
          .onClick((event: ClickEvent) => {
            if (this.modalTransitionIndex >= this.modalTransitionArr.length - 1) {
              this.modalTransitionIndex = 0;
            } else {
              this.modalTransitionIndex = this.modalTransitionIndex + 1;
            }
          })
        Button("sheetTypeContentCover")
          .id('sheetTypeContentCover')
          .border({ width: 2, color: Color.Blue })
          .onClick(() => {
            this.isShow1 = true;
          })
          .bindSheet(this.isShow1, this.myBuilder1(), {
            uiContext: this.getUIContext(),
            preferType:this.preferTypeArray[this.preferTypeIndex],
            modalTransition: this.modalTransitionArr[this.modalTransitionIndex],
            onDisappear: ()=>{
              this.txt1 = JSON.stringify( this.preferTypeArray[this.preferTypeIndex])
              this.isShow1 = false;
              console.log("[TEST INFO] [Page1] onDisappear");
            }
          })
        Text(this.txt1)
        .id('text1')
      }
      .width('100%')
    }
    .height('100%')
  }
}

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
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { ComponentContent } from '@kit.ArkUI';

@Entry
@Component
struct SheetTest {
  @State showSheet: boolean = false;
  @State showSheet2: boolean = false;
  @State enableFloatingDragBar: (boolean | undefined | null)[] = [true, false]
  @State enableFloatingDragBarIndex: number = 0
  @State enableOutsideInteractive: boolean [] = [true, false]
  @State enableOutsideInteractiveIndex: number = 0
  @State widthList: (PX | VP | FP | LPX | Percentage | Resource | undefined)[] =
    [undefined, 100, 200, '30%', '80%', '200%']
  @State widthIndex: number = 0
  @State showClose: boolean[] = [true, false]
  @State showCloseIndex: number = 0
  @State dragBar: boolean[] = [true, false]
  @State dragBarIndex: number = 0
  @State detents: [(SheetSize | Length), (SheetSize | Length)?, (SheetSize | Length)?] [] = [
    [200,400,600],
    [200,200,200],
    [SheetSize.MEDIUM, SheetSize.LARGE, SheetSize.FIT_CONTENT],
  ]
  @State txt1: string = ''
  @State detentsIndex: number = 0
  @State paddingList: (Length | undefined)[] = [undefined, 5, 10, 15]
  @State paddingIndex: number = 0

  private changeOrientation(isLandscape: boolean) {
    let context = getContext(this) as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  @Builder
  SheetBuilder() {
    Column() {
      Text('this is Sheet')
      TextInput({ placeholder: 'input your word...' }).backgroundColor(Color.Blue)
        .margin({ top: 20 })
      Button("close modal 1")
      .id('close')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.showSheet = false;
        })
    }
    .backgroundColor(Color.Pink)
    .width('100%')
    .height('100%')
  }

  build() {
    Column({ space: 10 }) {
      Scroll() {

        Row({ space: 5 }) {

          Button('enableFloatingDragBar: ' + this.enableFloatingDragBar[this.enableFloatingDragBarIndex])
            .onClick(() => {
              this.enableFloatingDragBarIndex++
              if (this.enableFloatingDragBarIndex > this.enableFloatingDragBar.length - 1) {
                this.enableFloatingDragBarIndex = 0
              }
            })


          Button('enableOutsideInteractive： ' + this.enableOutsideInteractive[this.enableOutsideInteractiveIndex])
            .onClick(() => {
              this.enableOutsideInteractiveIndex++
              if (this.enableOutsideInteractiveIndex > this.enableOutsideInteractive.length - 1) {
                this.enableOutsideInteractiveIndex = 0
              }
            })
          Button("横屏").onClick(() => {
            this.changeOrientation(true)
          })
          Button("竖屏").onClick(() => {
            this.changeOrientation(false)
          })
          Column() {
            Text('detents: ' + this.detents[this.detentsIndex])
            Button('detents')
              .onClick(() => {
                this.detentsIndex++
                if (this.detentsIndex > this.detents.length - 1) {
                  this.detentsIndex = 0

                }
              })
          }

          Button('title padding: ' + this.paddingList[this.paddingIndex])
            .onClick(() => {
              this.paddingIndex++
              if (this.paddingIndex > this.paddingList.length - 1) {
                this.paddingIndex = 0
              }
            })

          Button('width: ' + this.widthList[this.widthIndex])
            .onClick(() => {
              this.widthIndex++
              if (this.widthIndex > this.widthList.length - 1) {
                this.widthIndex = 0
              }
            })

          Button('showClose: ' + this.showClose[this.showCloseIndex])
            .onClick(() => {
              this.showCloseIndex++
              if (this.showCloseIndex > this.showClose.length - 1) {
                this.showCloseIndex = 0
              }
            })

          Button('dragBar: ' + this.dragBar[this.dragBarIndex])
            .onClick(() => {
              this.dragBarIndex++
              if (this.dragBarIndex > this.dragBar.length - 1) {
                this.dragBarIndex = 0
              }
            })
        }
      }.scrollable(ScrollDirection.Horizontal)

      Column({ space: 10 }) {
        Button('Open Sheet').width(200).height(50)
          .id("dragbar")
          .onClick(() => {
            this.showSheet = !this.showSheet;
          })
          .bindSheet($$this.showSheet, this.SheetBuilder(), {
            detents: this.detents[this.detentsIndex], // 设置底部样式半模态，DragBar为悬浮模式
            preferType: SheetType.BOTTOM,
            showClose: this.showClose[this.showCloseIndex],
            dragBar: this.dragBar[this.dragBarIndex],
            blurStyle: BlurStyle.Thin,
            maskColor: Color.Green,
            width: this.widthList[this.widthIndex],
            shadow: ShadowStyle.OUTER_DEFAULT_XS,
            uiContext: this.getUIContext(),
            mode: SheetMode.EMBEDDED,
            scrollSizeMode: ScrollSizeMode.FOLLOW_DETENT,
            keyboardAvoidMode: SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE,
            enableHoverMode: true,
            hoverModeArea: HoverModeAreaType.TOP_SCREEN,
            radius: undefined,
            detentSelection: 200,
            title: { title: "SideSheet", subtitle: "默认宽度" },
            enableOutsideInteractive: this.enableOutsideInteractive[this.enableOutsideInteractiveIndex],
            enableFloatingDragBar: this.enableFloatingDragBar[this.enableFloatingDragBarIndex], //新接口
            onAppear: () => {
              console.log('BindSheep onAppear.');
            },
            onDisappear: () => {
              let arr = JSON.stringify(this.enableFloatingDragBar[this.enableFloatingDragBarIndex])
              if( arr == "true"){
                this.txt1 = '0'
              }else {
                this.txt1 = '1'
              }
              console.log('BindSheep onDisappear.');
            },
            onHeightDidChange: (height: number)=>{
              console.log("SideSheet height change:" + height);
            },
          })
        Text(this.txt1)
          .id('text1')
      }
      .width('100%')
      .height('100%')
    }
  }
}
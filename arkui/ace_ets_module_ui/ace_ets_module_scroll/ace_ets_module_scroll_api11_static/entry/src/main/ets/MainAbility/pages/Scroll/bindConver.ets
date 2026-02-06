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
import {
  Entry,
  Component,
  Column,
  Builder,
  Button,
  Progress,
  FlexAlign,
  FontStyle,
  CapsuleStyleOptions,
  ModalTransition,
  ClickEvent,
  $$,
  SheetSize,
  Color,
  ProgressType,
  ContentCoverOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ModalTransitionExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;
  @State showDragBar: boolean = true;

  @Builder
  myBuilder2() {
    Column() {
      Button("close modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  myBuilder() {
    Column() {
      Button("sheetSize")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow2 = true;
        })
        .bindSheet($$(this.isShow), () => {this.myBuilder}, {
          height: SheetSize.MEDIUM,
          dragBar: this.showDragBar,
          backgroundColor: Color.Green,
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          }
        })
        .bindSheet($$(this.isShow), () => {this.myBuilder}, {
          height: SheetSize.LARGE,
          dragBar: this.showDragBar,
          backgroundColor: Color.Green,
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          }
        })
      Button("transition modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow2 = true;
        })
        .bindContentCover($$(this.isShow2), () => {this.myBuilder2}, {
          modalTransition: ModalTransition.NONE,
          backgroundColor: Color.Orange,
          onAppear: () => {
            console.log("BindContentCover onAppear.")
          },
          onDisappear: () => {
            console.log("BindContentCover onDisappear.")
          }
        } as ContentCoverOptions)

      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow = false;
        })
      Progress({ value: 100, total: 100, type: ProgressType.Capsule }).width(100).height(50)
        .style({
          borderColor: Color.Blue,
          borderWidth: 1,
          content: 'Installing...',
          enableSmoothEffect: false,
          font: { size: 13, style: FontStyle.Normal },
          fontColor: Color.Gray,
          enableScanEffect: false,
          showDefaultPercentage: false
        } as CapsuleStyleOptions)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .key('buttonAdd')
        .fontSize(20)
        .margin(10)
        .bindContentCover($$(this.isShow), () => {this.myBuilder},
          { modalTransition: ModalTransition.NONE } as ContentCoverOptions)
        .bindContentCover($$(this.isShow), () => {this.myBuilder}, {
          modalTransition: ModalTransition.NONE,
          backgroundColor: Color.Pink,
          onAppear: () => {
            console.log("BindContentCover onAppear.")
          },
          onDisappear: () => {
            console.log("BindContentCover onDisappear.")
          }
        } as ContentCoverOptions)
      Button("transition modal 2")
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$(this.isShow), () => {this.myBuilder}, {
          height: this.sheetHeight,
          dragBar: this.showDragBar,
          backgroundColor: Color.Green,
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#ff49c8ab")
    .width('100%')
    .height('100%')
  }
}
'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Column,
  Row,
  Text,
  Button,
  DragEvent,
  DragItemInfo,
  Visibility,
  Color,
  FlexAlign,
  Builder,
  Entry,
  Component,
  ColumnOptions,
  RowOptions,
  DragResult,
  Margin
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { DragController, UIContext, Router } from '@ohos.arkui.UIContext';
import dragController from '@ohos.arkui.dragController';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct AutoHideComponentUniqueIdsPage {
  PAGE_TAG: string = 'AutoHideComponentUniqueIdsPage';
  @State dragResult: string = 'Ready';
  @State currentTestType: int = 0;
  @State hideStatusText1: string = 'Visible';
  @State hideStatusText2: string = 'Visible';
  @State hideStatusText3: string = 'Visible';
  @State visibility1: Visibility = Visibility.Visible;
  @State visibility2: Visibility = Visibility.Visible;
  @State visibility3: Visibility = Visibility.Visible;
  @State testTypeLabel: string = 'onDragStart: single number';
  @State component1UniqueId: int = 1001;
  @State component2UniqueId: int = 1002;
  @State component3UniqueId: int = 1003;

  aboutToAppear(): void {
    console.info('[AutoHideComponentUniqueIdsPage] aboutToAppear');
  }

  updateHideStatusByTestType(): void {
    if (this.currentTestType == 0 || this.currentTestType == 4) {
      this.hideStatusText2 = 'Hidden';
      this.visibility2 = Visibility.None;
    } else if (this.currentTestType == 1 || this.currentTestType == 5) {
      this.hideStatusText2 = 'Hidden';
      this.hideStatusText3 = 'Hidden';
      this.visibility2 = Visibility.None;
      this.visibility3 = Visibility.None;
    } else if (this.currentTestType == 2 || this.currentTestType == 6) {
      console.info('[AutoHideComponentUniqueIdsPage] Empty array - no components hidden');
    } else if (this.currentTestType == 3) {
      this.hideStatusText1 = 'Hidden';
      this.hideStatusText2 = 'Hidden';
      this.visibility1 = Visibility.None;
      this.visibility2 = Visibility.None;
    }
  }

  restoreVisibility(): void {
    this.visibility1 = Visibility.Visible;
    this.visibility2 = Visibility.Visible;
    this.visibility3 = Visibility.Visible;
    this.hideStatusText1 = 'Visible';
    this.hideStatusText2 = 'Visible';
    this.hideStatusText3 = 'Visible';
  }

  resetState(): void {
    this.dragResult = 'Ready';
    this.restoreVisibility();
  }

  @Builder
  dragPreviewBuilder1(): void {
    Column() {
      Text('Dragging')
    }
    .width('8%')
    .height('5%')
    .backgroundColor(Color.Orange)
    .borderRadius('1%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  executeDragBuilder(): void {
    Column() {
      Text('ExDrag')
    }
    .width('8%')
    .height('5%')
    .backgroundColor('#E4B500')
    .borderRadius('1%')
    .justifyContent(FlexAlign.Center)
  }

  build(): void {
    Column() {
      Column({ space: 10 } as ColumnOptions) {
        Text(this.testTypeLabel)
          .id('testTypeLabel')

        Row({ space: '1%' } as RowOptions) {
          Text('C1:')
          Text(this.hideStatusText1)
            .id('hideStatusText1')
          Text('C2:')
          Text(this.hideStatusText2)
            .id('hideStatusText2')
          Text('C3:')
          Text(this.hideStatusText3)
            .id('hideStatusText3')
        }
      }
      .width('90%')
      .margin({ top: '2%', bottom: '2%' } as Margin)
      .justifyContent(FlexAlign.Center)

      Row({ space: '2%' } as RowOptions) {
        Column() {
          Text('Drag1')
        }
        .width('12%')
        .height('8%')
        .backgroundColor(Color.Blue)
        .borderRadius('1%')
        .id('dragSource1')
        .visibility(this.visibility1)
        .justifyContent(FlexAlign.Center)
        .onDragStart((event: DragEvent): DragItemInfo => {
          console.info('[AutoHideComponentUniqueIdsPage] onDragStart source1, testType=' +
          this.currentTestType.toString());
          this.updateHideStatusByTestType();
          if (this.currentTestType == 0) {
            event.autoHideComponentUniqueIds = this.component2UniqueId;
          } else if (this.currentTestType == 1) {
            event.autoHideComponentUniqueIds = [this.component2UniqueId, this.component3UniqueId];
          } else if (this.currentTestType == 2) {
            event.autoHideComponentUniqueIds = [];
          } else if (this.currentTestType == 3) {
            event.autoHideComponentUniqueIds = [this.component1UniqueId, this.component2UniqueId];
          }
          return {
            builder: this.dragPreviewBuilder1
          };
        })

        Column() {
          Text('Drag2')
        }
        .width('12%')
        .height('8%')
        .backgroundColor(Color.Green)
        .borderRadius('1%')
        .id('dragSource2')
        .visibility(this.visibility2)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('Drag3')
        }
        .width('12%')
        .height('8%')
        .backgroundColor('#800080')
        .borderRadius('1%')
        .id('dragSource3')
        .visibility(this.visibility3)
        .justifyContent(FlexAlign.Center)
      }
      .width('90%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: '3%', bottom: '3%' } as Margin)

      Column() {
        Text('Drop')
      }
      .width('30%')
      .height('6%')
      .backgroundColor(Color.Gray)
      .borderRadius('1%')
      .id('dropTarget')
      .justifyContent(FlexAlign.Center)
      .onDrop((event: DragEvent): void => {
        console.info('[AutoHideComponentUniqueIdsPage] onDrop');
        this.dragResult = 'Drop Success';
        this.restoreVisibility();
      })
      .margin({ top: '2%', bottom: '2%' } as Margin)

      Text('Result: ' + this.dragResult)
        .id('dragResultText')
        .margin({ bottom: '2%' } as Margin)

      Row({ space: '1%' } as RowOptions) {
        Button('T1')
          .width('15%')
          .id('btnTest1')
          .onClick(() => {
            this.currentTestType = 0;
            this.testTypeLabel = 'onDragStart: single number (1002)';
            this.resetState();
          })

        Button('T2')
          .width('15%')
          .id('btnTest2')
          .onClick(() => {
            this.currentTestType = 1;
            this.testTypeLabel = 'onDragStart: number array [1002, 1003]';
            this.resetState();
          })

        Button('T3')
          .width('15%')
          .id('btnTest3')
          .onClick(() => {
            this.currentTestType = 2;
            this.testTypeLabel = 'onDragStart: empty array []';
            this.resetState();
          })

        Button('T4')
          .width('15%')
          .id('btnTest4')
          .onClick(() => {
            this.currentTestType = 3;
            this.testTypeLabel = 'onDragStart: include self [1001, 1002]';
            this.resetState();
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: '2%' } as Margin)

      Button('ExecuteDrag')
        .width('35%')
        .id('btnExecuteDrag')
        .margin({ bottom: '2%' } as Margin)
        .onClick(() => {
          console.info('[AutoHideComponentUniqueIdsPage] ExecuteDrag button clicked, testType=' +
          this.currentTestType.toString());
          this.updateHideStatusByTestType();
          try {
            let dragInfo: dragController.DragInfo = {
              pointerId: 0,
              extraParams: 'executeDragTest'
            };

            if (this.currentTestType == 4) {
              dragInfo.autoHideComponentUniqueIds = this.component2UniqueId;
            } else if (this.currentTestType == 5) {
              dragInfo.autoHideComponentUniqueIds = [this.component2UniqueId, this.component3UniqueId];
            } else if (this.currentTestType == 6) {
              dragInfo.autoHideComponentUniqueIds = [];
            }

            console.info('[AutoHideComponentUniqueIdsPage] executeDrag dragInfo autoHideComponentUniqueIds: ' +
            JSON.stringify(dragInfo.autoHideComponentUniqueIds));

            this.getUIContext().getDragController().executeDrag(
              this.executeDragBuilder,
              dragInfo
            );
            this.dragResult = 'ExecuteDrag Success';
          } catch (error) {
            console.error(`[${this.PAGE_TAG}] executeDrag error: ${JSON.stringify(error)}`);
            this.dragResult = 'Error';
          }
        })

      Row({ space: '1%' } as RowOptions) {
        Button('E1')
          .width('20%')
          .id('btnExTest1')
          .onClick(() => {
            this.currentTestType = 4;
            this.testTypeLabel = 'executeDrag: single number (1002)';
            this.resetState();
          })

        Button('E2')
          .width('20%')
          .id('btnExTest2')
          .onClick(() => {
            this.currentTestType = 5;
            this.testTypeLabel = 'executeDrag: number array [1002, 1003]';
            this.resetState();
          })

        Button('E3')
          .width('20%')
          .id('btnExTest3')
          .onClick(() => {
            this.currentTestType = 6;
            this.testTypeLabel = 'executeDrag: empty array []';
            this.resetState();
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: '2%' } as Margin)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
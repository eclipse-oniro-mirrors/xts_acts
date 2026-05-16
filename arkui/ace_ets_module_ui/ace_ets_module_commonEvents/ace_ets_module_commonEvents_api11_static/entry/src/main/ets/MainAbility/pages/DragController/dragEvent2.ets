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
  Row,
  Flex,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  TextArea,
  CopyOptions,
  Visibility,
  DragEvent,
  TextAlign,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Padding,
  Margin,
  List,
  ForEach,
  ListItem,
  FlexOptions,
  Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct Drag2Example {
  @State numbers: string[] = ['one', 'two', 'three', 'four', 'five', 'six'];
  @State text: string = '';
  @State bool: boolean = false;
  @State bool1: boolean = false;
  @State appleVisible: Visibility = Visibility.Visible;
  @State orangeVisible: Visibility = Visibility.Visible;
  @State bananaVisible: Visibility = Visibility.Visible;
  @State select: number = 0;
  @State currentIndex: number = 0;
  @State id1: Int = 1;

  @Builder
  pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
    }
  }


  build() {
    Column() {
      Text('There are three Text elements here')
        .fontSize(12)
        .fontColor(0xCCCCCC)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(5)
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Text('apple')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('apple')
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.appleVisible)
          .onDragStart((event:DragEvent, extraParams?:String|undefined):CustomBuilder => {
            console.log('Ting--onDragStart--apple')
            this.bool = true
            this.text = 'apple'
            this.appleVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
        Text('orange')
          .width('25%')
          .height(35)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.orangeVisible)
          .onDragStart((event:DragEvent, extraParams?:String|undefined):CustomBuilder => {
            console.log('Ting--onDragStart--orange')
            this.bool = true
            this.text = 'orange'
            this.orangeVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
        Text('banana')
          .width('25%')
          .height(35)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.bananaVisible)
          .onDragStart((event:DragEvent, extraParams?:String|undefined):CustomBuilder => {
            console.log('Ting--onDragStart--banana')
            this.bool = true
            this.text = 'banana'
            this.bananaVisible = Visibility.Hidden
            return this.pixelMapBuilder;
          })
      }
      .border({ width: 1 })
      .width('90%')
      .padding({ top: 10, bottom: 10 } as Padding)
      .margin(10)

      Text('This is a List element')
        .fontSize(12)
        .fontColor(0xCCCCCC)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(15)

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.numbers, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(80)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }.key('listItem')
          .onDragStart((event:DragEvent, extraParams?:String|undefined):CustomBuilder => {
            console.log('Ting--onDragStart--ListItem');
            console.log('ListItem onDragStarts, ' + extraParams);
            this.bool1 = true;
            this.text = this.numbers[JSON.parseJsonElement(extraParams!).getInteger("selectedIndex")];
            this.select = JSON.parseJsonElement(extraParams!).getInteger("selectedIndex");
            return this.pixelMapBuilder;
          })
        }, (item: string) => item)
      }
      // .editMode(true) //Error line
      .restoreId(this.id1)
      .height('50%')
      .width('90%')
      .border({ width: 1 })
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .onDragEnter((event: DragEvent, extraParams?: string):void => {
        console.log('Ting--onDragEnter')
        console.log('List onDragEnter, ' + extraParams + ',' + event.getWindowX() + ',' + event.getWindowY())
      })
      .onDragMove((event: DragEvent, extraParams?: string) => {
        console.log('Ting--onDragMove')
        console.log('List onDragMove, ' + extraParams)
      })
      .onDragLeave((event: DragEvent, extraParams?: string) => {
        console.log('Ting--onDragLeave')
        console.log('List onDragLeave, ' + extraParams)
      })
      .onDrop((event: DragEvent, extraParams?: string) => {
        if (this.bool) {
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("insertIndex"), 0, this.text)
          this.bool = false
        } else if (this.bool1) {
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("selectedIndex"), 1)
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("insertIndex"), 0, this.text)
          this.bool = false
          this.bool1 = false
        }
        console.log('Ting--onDrop')
      })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 20 } as Padding)
    .margin({ top: 20 } as Margin)
  }
}

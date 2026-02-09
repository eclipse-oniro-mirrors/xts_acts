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
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  Axis,
  EdgeEffect,
  Stack,
  Padding,
  Alignment,
  ForEach,
  ListItem,
  TextAlign,
} from '@ohos.arkui.component'
import { State, StorageLink, AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ListExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[];
  @StorageLink('listDirection') listDirection: Axis = Axis.Vertical;
  @StorageLink('editMode') editMode: boolean = false;
  @StorageLink('edgeEffect') edgeEffect: EdgeEffect = EdgeEffect.None;
  @StorageLink('chainAnimation') chainAnimation: boolean = false;
  @StorageLink('strokeWidth') strokeWidth: number | string = 2.000000;
  @StorageLink('color') color: string = '#FFFFFF';
  @StorageLink('startMargin') startMargin: number | string = 20.000000;
  @StorageLink('endMargin') endMargin: number | string = 20.000000;

  onPageShow() {
    console.info('[list] page show called');
    AppStorage.setOrCreate<Axis>('listDirection', Axis.Vertical);
    AppStorage.setOrCreate<boolean>('editMode', false);
    AppStorage.setOrCreate<EdgeEffect>('edgeEffect', EdgeEffect.None);
    AppStorage.setOrCreate<boolean>('chainAnimation', false);
    AppStorage.setOrCreate<number | string>('strokeWidth', 2.000000);
    AppStorage.setOrCreate<string>('color', '#FFFFFF');
    AppStorage.setOrCreate('startMargin', 20.000000);
    AppStorage.setOrCreate<number | string>('endMargin', 20.000000);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: int) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: number) => item.toString())
        }
        .key('list')
        .listDirection(this.listDirection)
        .divider({
          strokeWidth: this.strokeWidth,
          color: this.color,
          startMargin: this.startMargin,
          endMargin: this.endMargin
        })
        .edgeEffect(this.edgeEffect)
        .chainAnimation(this.chainAnimation)
        .multiSelectable(true)
        .onScrollIndex((firstIndex: int, lastIndex: int, center: int): void => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
          console.info('scrollOffset:' + scrollOffset)
          console.info('scrollState:' + scrollState)
        })
        .width('90%')
      }.width('100%')

      Button('edit list')
        .onClick((e: ClickEvent) => {
          this.editMode = !this.editMode
        }).margin({ top: 5, left: 20 } as Margin)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}
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
import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import {
  Entry,
  Text,
  TextAttribute,
  Column,

  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  ColumnOptions,
  Grid,
  Margin,
  GridItem,
  TextAlign,
  ComputedBarAttribute
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct GridFrictionPage {
  @State numberData: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();
  @State friction: number = 1000;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Grid_lanes page show called');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'friction') {
        this.friction = Number(message.value);
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid(this.scroller) {
        ForEach(this.numberData, (day: string) => {
          ForEach(this.numberData, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('30%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .width('90%')
      .height('10%')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .key('grid_friction_default')

      Grid(this.scroller) {
        ForEach(this.numberData, (day: string) => {
          ForEach(this.numberData, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((first: int,last: int):void => {
        console.info(String(first))
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return { totalOffset: (index / 5) * (80 + 10) - 10 + offset, totalLength: 80 * 5 + 10 * 4 } as ComputedBarAttribute
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .scrollBar(BarState.Off)
      .onClick((e:ClickEvent) => { 
        this.scroller.scrollPage({ next: true })
      })
      .friction(this.friction)
      .key('Grid_GridFriction')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}

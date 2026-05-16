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
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Visibility,
  List,
  ListItem,
  TextClock,
  TextClockController,
  Scroller,
  ShadowOptions,
  Edge,
  TextClockOptions,
  ForEach
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct TextClockLongPage {
  @State accumulateTime: long = 0
  @State textShadow: string = '';
  @State fontFeature: string = '';
  @State visible: Visibility = Visibility.Visible
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  // 导入对象
  controller: TextClockController = new TextClockController()
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      List({ scroller: this.scroller }) {
        ListItem() {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock({ timeZoneOffset: -8, controller: this.controller } as TextClockOptions)
              .textShadow({
                radius: 2,
                color: Color.Black,
                offsetX: 2,
                offsetY: 2
              } as ShadowOptions)
              .fontFeature('\"ss01\" 1')
              .format('hh:mm')
              .onDateChange((value: long) => {
                this.accumulateTime = value
              })
              .key('textClock')
              .id('textClock')
              .visibility(this.visible)
              .fontSize(20)
          }
          .width('100%')
          .height('10%')
        }

        ListItem() {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock({ timeZoneOffset: -8, controller: this.controller })
              .format('aa hh:mm:ss')
              .onDateChange((value: long) => {
                this.accumulateTime = value
              })
              .visibility(this.visible)
              .fontSize(20)
          }
          .width('100%')
          .height('10%')
        }

        ListItem() {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
            Button("start")
              .onClick((e: ClickEvent) => {
                // 启动文本时钟
                let strJson = inspector.getInspectorByKey('textClock');
                this.textShadow =
                  JSON.parseJsonElement(strJson).getElement('$attrs').getString('textShadow').slice(0, 5)
                this.fontFeature = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFeature')
                this.controller.start()
              }).height('5%').fontSize(10).id('start')
            Button("stop")
              .onClick((e: ClickEvent) => {
                // 停止文本时钟
                this.controller.stop()
              }).height('5%').fontSize(10).id('stop')
            Button("show")
              .onClick((e: ClickEvent) => {
                // 显示控价
                this.visible = Visibility.Visible
              }).height('5%').fontSize(10).id('show')
            Button("hide")
              .onClick((e: ClickEvent) => {
                // 隐藏控件
                this.visible = Visibility.Hidden
              }).height('5%').fontSize(10).id('hide')
          }
          .width('100%')
        }

        ListItem() {
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
            Button('滚动到底部').onClick((e: ClickEvent) => {
              this.scroller.scrollEdge(Edge.Bottom)
            }).height('5%').fontSize(10).id('TextClockLongBottom')
          }
        }

        ListItem() {
          Text('监控onDateChange事件：' + this.accumulateTime)
            .width("100%").textAlign(TextAlign.Center).id('accumulateTime1')
        }.height('10%')

        ListItem() {
          Text(this.textShadow + ":" + this.fontFeature).width("100%").textAlign(TextAlign.Center)
        }.height('10%').id('textShadowOrFontFeature')

        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('ListItem' + item).width("100%").textAlign(TextAlign.Center)
          }.height('10%')
        }, (item: number, index: int) => String(item))
        ListItem() {
          Text('监控onDateChange事件：' + this.accumulateTime)
            .width("100%").textAlign(TextAlign.Center).id('accumulateTime2')
        }.height('10%')
      }
    }
  }
}
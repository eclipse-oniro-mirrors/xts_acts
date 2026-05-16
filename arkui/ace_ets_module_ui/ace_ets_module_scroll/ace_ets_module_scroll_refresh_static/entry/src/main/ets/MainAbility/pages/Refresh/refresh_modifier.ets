/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Alignment,
  WaterFlow,
  Refresh,
  Button,
  List,
  RefreshStatus,
  ForEach,
  LazyForEach,
  ListItemAlign,
  ListItem,
  ScrollState,
  Text,
  Scroller,
  TextAlign,
  BarState,
  Scroll,
  EdgeEffect,
  Color,
  ClickEvent,
  PanGesture,
  FlexAlign,
  HorizontalAlign,
  ColumnOptions
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, RefreshAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'

// ===================== Modifier 定义 =====================
@Observed
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  public changeIndex: int = 0;
  public changeList: (boolean | undefined)[] = [
    true,
    false,
    undefined,
  ]

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.pullToRefresh(this.changeList[this.changeIndex])
  }
}

// xxx.ets
@Entry
@Component
struct RefreshExample {
  @State promptText: string = 'Refreshing...';
  @State isRefreshing: boolean = false;
  @State radio: number | undefined = undefined;
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6'];
  @State change5: boolean = true;
  @State refreshModifier: RefreshModifier = new RefreshModifier()
  @State count: number = 0;
  @State change: boolean = true;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row() {
        Button('true')
          .onClick(() => {
            this.refreshModifier.changeIndex = 0;
          })
          .id('valueTrue')
        Button('false')
          .onClick(() => {
            this.refreshModifier.changeIndex = 1;
          })
          .id('valueFalse')
        Button('unde')
          .onClick(() => {
            this.refreshModifier.changeIndex = 2;
          })
          .id('valueUnde')
      }

      Row() {
        Button('Button')
          .onClick(() => {
            console.info('sssssss  tree-had');
            let json = JSON.stringify(inspector.getInspectorByKey('noRefresh'))
            let chunkSize = 2000;
            for (let i = 0; i < json.length; i += chunkSize) {
              console.info(json.slice(i, i + chunkSize));
            }
            console.info('dddddddddd  tree-had');
          })
      }

      Refresh({ refreshing: this.isRefreshing, promptText: this.promptText }) {
        Column() {
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + 'item1')
                  .onClick((event: ClickEvent) => {
                    console.log('yyy, item:');
                    this.isRefreshing = false
                  })
                  .width('70%')
                  .height('10%')
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .width('100%')
          .height('100%')
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.On)
        }
      }
      .pullToRefresh(true)
      .pullDownRatio(0.9)
      .attributeModifier(this.refreshModifier)
      .onStateChange(this.change5 ? (refreshStatus: RefreshStatus) => {
        this.change = false;
        console.info('yyy, Refresh onStatueChange state is ' + refreshStatus);
      } : undefined)
      .onOffsetChange(this.change ? (value: number) => {
        this.count = value;
        console.info('yyy, Refresh onOffsetChange offset:' + value);
      } : undefined)
      .key('noRefresh')
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false;
        }, 6000)
        console.info('onRefreshing test');
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
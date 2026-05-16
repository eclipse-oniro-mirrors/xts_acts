'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  Button,
  Text,
  Row,
  RowOptions,
  List,
  ListItem,
  ListScroller,
  ForEach,
  ChildrenMainSize,
  Color,
  BarState,
  TextAlign
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ChildrenMainSizeIndex {
  private arr: number[] = [] as number[];
  private scroller: ListScroller = new ListScroller();
  @State listSpace: number = 10;
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(100);
  @State get: string = 'get';
  @State set: string = 'set';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('ChildrenMainSizeIndex aboutToAppear error: ' + error);
    }
    for (let i = 0; i < 10; i++) {
      this.arr.push(i);
    }
    this.listChildrenSize.splice(0, 5, [300, 300, 300, 300, 300]);
  }

  build() {
    Column() {
      Text(this.get)
        .id('get')
        .key('get')
        .height('5%');
      Text(this.set)
        .id('set')
        .key('set')
        .height('5%');

      List({ space: this.listSpace, initialIndex: 4, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item-' + item)
              .height(item < 5 ? 300 : this.listChildrenSize.childDefaultSize)
              .width('90%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF);
          }
        }, (item: number) => item.toString());
      }
      .backgroundColor(Color.Gray)
      .layoutWeight(1)
      .scrollBar(BarState.On)
      .childrenMainSize(this.listChildrenSize);

      Row({ space: 10 } as RowOptions) {
        Button('item size - 100')
          .id('get_childDefaultSize')
          .onClick(() => {
            this.listChildrenSize.childDefaultSize -= 100;
            if (this.listChildrenSize.childDefaultSize === 0) {
              this.get = 'get childDefaultSize:0';
            }
          })
          .height('50%')
          .width('45%');
        Button('item size + 50')
          .id('set_childDefaultSize')
          .onClick(() => {
            this.listChildrenSize.childDefaultSize += 50;
            if (this.listChildrenSize.childDefaultSize === 150) {
              this.set = 'set childDefaultSize(150)';
            }
          })
          .height('50%')
          .width('45%');
      }
      .height('20%');
    }
    .width('100%')
    .height('100%');
  }
}

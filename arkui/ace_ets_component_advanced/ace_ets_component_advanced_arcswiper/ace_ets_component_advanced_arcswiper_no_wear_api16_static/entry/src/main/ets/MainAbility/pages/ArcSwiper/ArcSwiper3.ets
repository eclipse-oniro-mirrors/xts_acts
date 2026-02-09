'use static';
/*
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
  ArcSwiperAttribute,
  ArcSwiper,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController,
  ArcSwiperContentTransitionProxy
} from '@ohos.arkui.ArcSwiper'
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base';
import {
  Builder,
  Entry,
  Component,
  Scroller,
  FontStyle,
  Color,
  BlurStyle,
  Column,
  Stack,
  Row,
  Text,
  Divider,
  Alignment,
  wrapBuilder,
  Scroll,
  ColumnOptions,
  List,
  ListItem,
  LazyForEach,
  EdgeEffect,
  IDataSource,
  DataChangeListener,
  TextAlign,
  CrownSensitivity
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { Context } from '@ohos.abilityAccessCtrl'

class MyDataSource implements IDataSource<int> {
  private list: int[] = []

  constructor(list: int[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): int {
    let RealIndex = index.toInt()
    return this.list[RealIndex]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct Index {
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private data: MyDataSource = new MyDataSource([])
  scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    let list: int[] = []
    for (let i = 1; i <= 5; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 } as ColumnOptions) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            ArcSwiper(this.arcSwiperController) {
              LazyForEach(this.data, (item: int) => {
                Text(item.toString())
                  .width('90%')
                  .height('90%')
                  .backgroundColor(Color.Red)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: int) => item!.toString())
            }
            .key('arcSwiperTest003')
            .index(1)
            .duration(800)
            .vertical(false)
            .disableSwipe(false)
            .effectMode(EdgeEffect.None)
            .digitalCrownSensitivity(CrownSensitivity.HIGH)
            .disableTransitionAnimation(false)
            .indicator(new ArcDotIndicator()
              .arcDirection(ArcDirection.NINE_CLOCK_DIRECTION)
              .itemColor('rgb(255, 100, 255)')
              .selectedItemColor('rgb(255, 100, 255)')
              .backgroundColor('rgb(255, 100, 255)')
            )
          }
        }
      }
    }
  }
}

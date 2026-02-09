'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {DataReloadOperation, DataOperationType,  Entry, Text, TextAttribute, Column, Component, Stack, WaterFlow, LazyForEach, FlowItem, DataOperation, Color, TextAlign, DataChangeListener, IDataSource, Button, ButtonAttribute, ClickEvent, Image, Search, Row, Column, SearchController, ColumnOptions} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

class WaterFlowDataSource implements IDataSource<string> {
  private dataArray: number[] = []
  private listeners: DataChangeListener[] = []

  constructor() {
    for (let i = 0; i < 200; i++) {
      this.dataArray.push(i);
    }
  }

  reloadData(): void {
    this.dataArray.splice(0, this.dataArray.length)
    for (let i = 300; i < 400; i++) {
      this.dataArray.push(i)
    }
    this.notifyDataSetChange([{ type: DataOperationType.RELOAD } as DataReloadOperation] as DataOperation[])
  }

  notifyDataSetChange(dataOperations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(dataOperations)
    })
  }

  totalCount(): int {
    return this.dataArray.length;
  }

  getData(index: int): string {
    let intIndex:int = index as int
    return `${this.dataArray[intIndex]}`
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}


@Component
struct ViewHolder {
  item: number = 0
  @Link disappearCount: number

  aboutToAppear(): void {
    console.info(`ViewHolder: aboutToAppear(${this.item})`)
  }

  aboutToDisappear(): void {
    console.info(`ViewHolder: aboutToDisappear(${this.item})`)
    this.disappearCount++
  }

  build() {
    Column() {
      Text('N' + this.item).fontSize(12).height('16')
    }
  }
}

@Entry
@Component
struct WaterFlowDemo {
  @State disAppearCount: number = 0
  colors: Array<string> = new Array<string>('0xFFC0CB', '0xDA70D6', '0x6B8E23', '0x6A5ACD', '0x00FFFF', '0x00FF7F');
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()

  aboutToAppear(){
    let uiContext = this.getUIContext();
    let LazyForEachReload = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("LazyForEachReload",  LazyForEachReload);
  }
  build() {
    Stack() {
      WaterFlow() {
        LazyForEach(this.dataSource, (item: string) => {
          FlowItem() {
            ViewHolder({ item: Number(item), disappearCount: this.disAppearCount })
          }
          .width('100%')
          .height('25%')
          .backgroundColor(this.colors[(Number(item)%5 as int)])
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('100%')
      .cachedCount(4)

      Row() {
        Button('reload').id('reload').width('80%').onClick((e: ClickEvent) => {
          this.dataSource.reloadData()
        })

        Text(`${this.disAppearCount}`)
          .id('text_disappear_count')
          .fontSize(24)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
          .width('20%')
      }
    }
  }
}
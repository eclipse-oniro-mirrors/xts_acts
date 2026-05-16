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

import { Entry, Component, ForEach, TextAlign, Column, LazyForEachCustomComponentFreezeMode,
  List, ListItem, Text, ColumnOptions, Button, FontWeight,
  Row, Color, LazyForEach, IDataSource, DataChangeListener } from '@ohos.arkui.component';
import { State, Link, Watch } from '@kit.ArkUI';

class BasicDataSource<string> implements IDataSource<string> {
  private listeners: Array<DataChangeListener> = [];
  private originDataArray: Array<string> = [];

  public totalCount(): int {
    return this.originDataArray.length;
  }

  public getData(index: int): string {
    return this.originDataArray[index as int];
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  onDataReloaded(): void {
    this.listeners.forEach((listener: DataChangeListener) => {
      listener.onDataReloaded();
    });
  }

  registerDataChangeListener(listener: DataChangeListener) {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}

class TestDataSource extends BasicDataSource<string> {
  private dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public changeData(index: int, data: string): void {
    this.dataArray[index as int] = data;
    this.notifyDataChange(index);
  }
}

@Entry
@Component
struct LazyForEachCustomComponentFreezeModeStatic {
  @State data: TestDataSource = new TestDataSource();
  @State @Watch('onMessageUpdated') message: number = 0;

  onMessageUpdated(propertyName: string) {
    console.info(`LazyforEach message callback func ${this.message}`);
  }

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column({space:3} as ColumnOptions) {
      Button('change message').onClick(() => {
        this.message++;
      })

      List() {
        LazyForEach<string>(this.data, (item: string, index: int): void => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: LazyForEachCustomComponentFreezeMode.AUTO})
      }
      .cachedCount(5).height(38).width(200)

      List() {
        LazyForEach<string>(this.data, (item: string, index: int): void => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: LazyForEachCustomComponentFreezeMode.DISABLED})
      }
      .cachedCount(5).height(38).width(200)

      List() {
        LazyForEach<string>(this.data, (item: string, index: int): void => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: LazyForEachCustomComponentFreezeMode.ENABLED})
      }
      .cachedCount(5).height(38).width(200)

      List() {
        LazyForEach<string>(this.data, (item: string, index: int): void => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: undefined})
      }
      .cachedCount(5).height(38).width(200)
    }.width('100%').height('100%')
  }
}
@Component
struct FreezeChild {
  @Link @Watch('onMessageUpdated') message: number;
  index: string = '';

  aboutToAppear() {
    console.info(`FreezeChild aboutToAppear index: ${this.index}`);
  }
  aboutToDisappear() {
    console.info(`FreezeChild aboutToDisappear index: ${this.index}`);
  }

  getValue(): number {
    console.info(`FreezeChild getValue index:${this.index} message:${this.message}`)
    return this.message;
  }

  onMessageUpdated(propertyName: string) {
    console.info(`FreezeChild message callback func ${this.message}, index: ${this.index}`);
  }

  build() {
    ListItem() {
      Text('message' + `${this.getValue()}, index: ${this.index}`)
        .height(35)
        .backgroundColor(0xAFEEEE)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
    }
  }
}
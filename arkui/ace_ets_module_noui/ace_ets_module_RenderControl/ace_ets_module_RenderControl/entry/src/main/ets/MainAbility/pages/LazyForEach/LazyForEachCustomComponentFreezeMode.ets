/**
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

import { hilog } from '@kit.PerformanceAnalysisKit';
const DOMAIN = 0x0001;
const TAG = 'FreezeChild';

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      hilog.info(DOMAIN, TAG, 'add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      hilog.info(DOMAIN, TAG, 'remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@Component

struct LazyForEachCustomComponentFreeze {
  private data: MyDataSource = new MyDataSource();
  @State @Watch('onMessageUpdated') message: number = 0;
  @State enum: LazyForEachCustomComponentFreezeMode | undefined  = LazyForEachCustomComponentFreezeMode.ENABLED
  @State str:string = 'hello'

  onMessageUpdated():string {
    hilog.info(DOMAIN, TAG, `LazyforEach message callback func ${this.message}`);
    let str = this.message.toString()
    return str
  }

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column({space:3}) {
      Text(this.str).id('LazyForEachCustomComponentFreezeModeMessageText').height(20)
      Row(){
        Button('changeMessage')
          .id('LazyForEachCustomComponentFreezeModeMessageButton')
          .width(100)
          .height(20)
          .onClick(() => {
            this.message++;
            this.str = this.onMessageUpdated()
          })
        Button('changeUndefined')
          .id('LazyForEachCustomComponentFreezeModeUndefinedButton')
          .width(110)
          .height(20)
          .onClick(() => {
            this.enum = undefined
            this.str = 'undefined'
          })
      }
      Row(){
        Button('changeAuto')
          .id('LazyForEachCustomComponentFreezeModeAutoButton')
          .width(90)
          .height(20)
          .onClick(() => {
            this.enum = LazyForEachCustomComponentFreezeMode.AUTO
            this.str = LazyForEachCustomComponentFreezeMode.AUTO.toString()
          })
        Button('changeEnabled')
          .id('LazyForEachCustomComponentFreezeModeDisabledButton')
          .width(100)
          .height(20)
          .onClick(() => {
            this.enum = LazyForEachCustomComponentFreezeMode.DISABLED
            this.str = LazyForEachCustomComponentFreezeMode.DISABLED.toString()
          })
      }
      List({ space: 3 }) {
        LazyForEach(this.data, (item: string) => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: this.enum})
      }.cachedCount(5).height(65).width(200)
      List({ space: 3 }) {
        LazyForEach(this.data, (item: string) => {
          FreezeChild({ message: this.message, index: item })
        }, (item: string) => item, {customComponentFreezeMode: undefined})
      }.cachedCount(5).height(38).width(200)
    }.width('100%').height('100%')
  }
}
@Reusable
@Component({ freezeWhenInactive: true })
struct FreezeChild {
  @Link @Watch('onMessageUpdated') message: number;
  @State index: string = '0';

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, `FreezeChild aboutToAppear index: ${this.index}`);
  }

  onMessageUpdated() {
    hilog.info(DOMAIN, TAG, `FreezeChild message callback func ${this.message}, index: ${this.index}`);
  }

  aboutToReuse(params: Record<string, Object>): void {
    const message = params['message'] as number;
    const index = params['index'] as string;

    this.message = message;
    this.index = index;
    console.log('aboutToreUse');
  }

  aboutToRecycle(): void {
    console.log('aboutToreCycle');
  }

  build() {
    ListItem() {
      Text('message' + `${this.message}, index: ${this.index}`)
        .height(35)
        .backgroundColor(0xAFEEEE)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
    }

  }
}



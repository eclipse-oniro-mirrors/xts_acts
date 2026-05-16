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
 
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

@Component
export struct CommonComponentV1 {
  @Prop item: string = 'hello'

  aboutToAppear(): void {
    hiTraceMeter.startTrace(`mrh aboutToAppear CommonComponentV1 ${this.item}`, 1);
    hiTraceMeter.finishTrace(`mrh aboutToAppear CommonComponentV1 ${this.item}`, 1);
    console.log('mrh aboutToAppear CommonComponentV1', this.item);
  }
  aboutToDisappear(): void {
    hiTraceMeter.startTrace(`mrh aboutToDisappear CommonComponentV1 ${this.item}`, 1);
    hiTraceMeter.finishTrace(`mrh aboutToDisappear CommonComponentV1 ${this.item}`, 1);
    console.log('mrh aboutToDisappear CommonComponentV1', this.item);
  }
  aboutToReuse(): void {
    console.log('mrh aboutToReuse CommonComponentV1', this.item);
  }
  aboutToRecycle(): void {
    console.log('mrh aboutToRecycle CommonComponentV1', this.item);
  }

  build() {
    Text(`CommonComponentV1 ${this.item}`)
  }
}

@ComponentV2
export struct CommonComponentV2 {
  @Param item: string = 'hello'
  a: number = this.getA();

  getA(): number {
    console.log('mrh construct CommonComponentV2', this.item);
    return 1;
  }

  aboutToAppear(): void {
    console.log('mrh aboutToAppear CommonComponentV2', this.item);
  }
  aboutToDisappear(): void {
    console.log('mrh aboutToDisappear CommonComponentV2', this.item);
  }
  aboutToReuse(): void {
    console.log('mrh aboutToReuse CommonComponentV2', this.item);
  }
  aboutToRecycle(): void {
    console.log('mrh aboutToRecycle CommonComponentV2', this.item);
  }

  build() {
    Stack() {
      Text(`CommonComponentV2 ${this.item}`)
    }
  }
}

@Reusable({memoryOptimizationStrategy: ReusableMemOptStrategy.DEFAULT})
@Component
export struct ReusableComponentV1 {
  @State item: string = 'hello'

  aboutToAppear(): void {
    console.log('mrh aboutToAppear ReusableComponentV1', this.item);
  }
  aboutToDisappear(): void {
    console.log('mrh aboutToDisappear ReusableComponentV1', this.item);
  }
  aboutToReuse(params: ESObject): void {
    this.item = params.item;
    console.log('mrh aboutToReuse ReusableComponentV1', this.item);
  }
  aboutToRecycle(): void {
    console.log('mrh aboutToRecycle ReusableComponentV1', this.item);
  }

  build() {
    Text(`ReusableComponentV1 ${this.item}`)
  }
}

@ReusableV2({memoryOptimizationStrategy: ReusableMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION})
@ComponentV2
export struct ReusableComponentV2 {
  @Param item: string = 'hello'

  aboutToAppear(): void {
    console.log('mrh aboutToAppear ReusableComponentV2', this.item);
  }
  aboutToDisappear(): void {
    console.log('mrh aboutToDisappear ReusableComponentV2', this.item);
  }
  aboutToReuse(): void {
    console.log('mrh aboutToReuse ReusableComponentV2', this.item);
  }
  aboutToRecycle(): void {
    console.log('mrh aboutToRecycle ReusableComponentV2', this.item);
  }

  build() {
    Text(`ReusableComponentV2 ${this.item}`)
  }
}

@Reusable({memoryOptimizationStrategy: undefined})
@Component
export struct ReusableComponentV3 {
  @State item: string = 'hello'

  aboutToAppear(): void {
    console.log('mrh aboutToAppear ReusableComponentV1', this.item);
  }
  aboutToDisappear(): void {
    console.log('mrh aboutToDisappear ReusableComponentV1', this.item);
  }
  aboutToReuse(params: ESObject): void {
    this.item = params.item;
    console.log('mrh aboutToReuse ReusableComponentV1', this.item);
  }
  aboutToRecycle(): void {
    console.log('mrh aboutToRecycle ReusableComponentV1', this.item);
  }

  build() {
    Text(`ReusableComponentV1 ${this.item}`)
  }
}

export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return this.originDataArray.length;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

export class MyDataSource extends BasicDataSource {
  public dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data)
    this.notifyDataAdd(index);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1)
    this.notifyDataDelete(index);
  }

  public changeData(index: number, data: string): void {
    this.dataArray.splice(index, 1, data)
    this.notifyDataChange(index);
  }

  public moveData(from: number, to: number): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  public reloadData() {
    this.notifyDataReload();
  }
}

@Entry
@ComponentV2
struct RepeatReusableMemOptStrategy {
  @Local flag: boolean = true;

  build() {
    Column() {
      Column() {
        ParentCustomNode()
      }
      .height('100%')
      .width('100%')
      .border({width:1})
      .visibility(this.flag ? Visibility.Visible : Visibility.Hidden)

    }
    .height('100%')
  }
}

@ComponentV2
export struct ParentCustomNode {
  @Local data: string[] = [];
  scroller: Scroller = new Scroller();
  scroller1: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  scroller3: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.data.push(`item ${i}`);
    }
  }
  build() {
    Column({space:2}) {
      Button('Scroll_30').onClick(() => {
        this.scroller.scrollToIndex(30)
        this.scroller1.scrollToIndex(30)
        this.scroller2.scrollToIndex(30)
        this.scroller3.scrollToIndex(30)
      })
        .id('changeScroller_30')
        .width(100)
        .height(15)
      List({ space: 2, scroller: this.scroller }) {
        Repeat(this.data)
          .each(() => {})
          .template('a', (item) => {
            ListItem() {
              CommonComponentV2({ item: item.item })
            }
          }, {cachedCount: 50})
          .templateId(()=>'a')
          .key((item: string, index: number)=>item)
          .virtualScroll({
            memoryOptimizationStrategy:RepeatMemOptStrategy.ENABLE_AUTO_CACHE_OPTIMIZATION
          })
      }
      .border({width:2})
      .width(180)
      .height(45)
      .cachedCount(0)

      List({ space: 2, scroller: this.scroller1 }) {
        Repeat(this.data)
          .each(() => {})
          .template('a', (item) => {
            ListItem() {
              CommonComponentV2({ item: item.item })
            }
          }, {cachedCount: 50})
          .templateId(()=>'a')
          .key((item: string, index: number)=>item)
          .virtualScroll({
            memoryOptimizationStrategy:RepeatMemOptStrategy.DEFAULT
          })
      }
      .border({width:2})
      .width(180)
      .height(45)
      .cachedCount(0)

      List({ space: 2, scroller: this.scroller2 }) {
        Repeat(this.data)
          .each(() => {})
          .template('a', (item) => {
            ListItem() {
              CommonComponentV2({ item: item.item })
            }
          }, {cachedCount: 50})
          .templateId(()=>'a')
          .key((item: string, index: number)=>item)
          .virtualScroll({
            memoryOptimizationStrategy:null
          })
      }
      .border({width:2})
      .width(180)
      .height(45)
      .cachedCount(0)
      List({ space: 2, scroller: this.scroller3 }) {
        Repeat(this.data)
          .each(() => {})
          .template('a', (item) => {
            ListItem() {
              CommonComponentV2({ item: item.item })
            }
          }, {cachedCount: 50})
          .templateId(()=>'a')
          .key((item: string, index: number)=>item)
          .virtualScroll({
            memoryOptimizationStrategy:undefined
          })
      }
      .border({width:2})
      .width(180)
      .height(45)
      .cachedCount(0)
    }
    .width('100%')
    .height('100%')
  }
}
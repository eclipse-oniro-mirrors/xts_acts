/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BasicPrefetcher, IDataSourcePrefetching, IPrefetcher } from '@ohos.arkui.Prefetcher';
class MyIDataSourcePrefetching implements IDataSourcePrefetching {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  prefetch(index: number): void | Promise<void> {
    console.log('MyDataSource prefetch')
  }

  cancel?(index: number): Promise<void> | void {
    console.log('MyDataSource cancel')
  }

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSource extends MyIDataSourcePrefetching {
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
struct MyComponent {
  private data: MyDataSource = new MyDataSource();
  private prefetcher: IPrefetcher = new BasicPrefetcher(this.data)
  @State text: string = ''

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Column(){
      Text('add' + this.text)
        .id('Prefetcher1_add')
        .fontSize(9)
        .height('3%')
        .backgroundColor(Color.Pink)
        .onClick(()=>{
          this.data.pushData(`Hello ${this.data.totalCount()}`)
          this.prefetcher.setDataSource(this.data)
          this.text = this.data.totalCount() + ''
        })
      List() {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(9)
                .height('3%')
                .onAppear(() => {
                  console.info("appear:" + item)
                })
              Image($r('app.media.icon')).width('10%').height('10%')
            }
          }
        }, (item: string) => item)
      }
      .width('100%')
      .borderWidth(1)
      .cachedCount(5)
      .onScrollIndex((start: number, end: number) => {
        this.prefetcher.visibleAreaChanged(start, end)
      })
    }
  }
}
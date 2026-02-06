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
import { BasicPrefetcher, IDataSourcePrefetching } from '@ohos.arkui.Prefetcher';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,
  Scroller,
  Color,
  BarState,
  Alignment,
  Margin,
  Reusable,
  NodeContainer,
  ListScroller,
  Builder,
  wrapBuilder,
  Image,
  $r
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  PropRef
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BuilderNode, NodeController, FrameNode } from '@ohos.arkui.node';
class MyIDataSourcePrefetching implements IDataSourcePrefetching<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];


  prefetch(index: int): Promise<void> | undefined {
    console.log('MyDataSource prefetch')
    return undefined;
  }

  cancel(index: int): Promise<void> | undefined {
    console.log('MyDataSource cancel')
    return undefined;
  }

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string {
    return this.originDataArray[index as int];
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
  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index );
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index );
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index );
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSource extends MyIDataSourcePrefetching {
  private dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public addData(index: int, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index );
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
  private prefetcher: BasicPrefetcher<string> = new BasicPrefetcher<string>(this.data)
  @State text: string = ''

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Column(){
      Text('Prefetcher2')
        .fontSize(9)
        .height('3%')
      Text('add' + this.text)
        .id('Prefetcher2_add')
        .fontSize(9)
        .height('3%')
        .backgroundColor(Color.Pink)
        .onClick(():void=>{
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
      .onScrollIndex((start: int, end: int):void => {
        this.prefetcher.visibleAreaChanged(start, end)
      })
    }
  }
}
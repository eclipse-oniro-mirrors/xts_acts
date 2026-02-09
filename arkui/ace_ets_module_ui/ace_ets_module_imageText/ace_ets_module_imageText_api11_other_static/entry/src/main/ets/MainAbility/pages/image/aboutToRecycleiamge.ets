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
  DataChangeListener,
  IDataSource,
  List,
  Reusable,
  LazyForEach,
  ListItem
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

class BasicDataSource implements IDataSource<string | undefined> {
  private listeners: DataChangeListener [] = [];

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string | undefined {
    return undefined;
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
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSourceImag extends BasicDataSource {
  private dataArray: string[] = ['/path/image0', '/path/image1', '/path/image2', '/path/image3'];

  public totalCount(): int {
    return this.dataArray.length
  }

  public getData(index: int): string | undefined {
    return this.dataArray[index];
  }

  public addData(index: Int, data: string): void {
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
struct MyComponentImag {
  private data: MyDataSourceImag = new MyDataSourceImag();

  build() {
    List({ space: 3 }) {
      LazyForEach(this.data, (item: string | undefined) => {
        ListItem() {
          ReusableChildComponent({ item: item })
        }
      }, (item: string | undefined) => String(item))
    }
    .width('100%')
    .height('100%')
  }
}
interface AttContent {
  item :string
}
@Reusable
@Component
struct ReusableChildComponent {
  @State item: string = ''

  aboutToReuse(params:AttContent) {
    this.item = params.item;
  }

  aboutToRecycle() {
    console.log('recycle node');
  }

  build() {
    Row() {
      Image(this.item).width('30%').height(50).key('aboutToRecyclImage')
      Text(this.item).fontSize(20).margin({ left: 10 } as Margin)
    }.margin({ left: 10, right: 10 } as Margin)
  }
}
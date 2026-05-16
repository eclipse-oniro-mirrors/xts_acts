'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
  AlphabetIndexer,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  DataChangeListener,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  IDataSource,
  ItemAlign,
  LazyForEach,
  List,
  ListItem,
  ListItemGroup,
  Margin,
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { redCustomTheme } from '../../themes/CustomTheme1';
import { CustomTheme } from '@ohos.arkui.theme';
import { AppStorage, State, StorageLink } from '@ohos.arkui.stateManagement'

export const lazyForEachThemeProperty: string = `LazyForEachThemeProperty`;

class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string {
    return '';
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
      listener.onDataAdd(index);
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

export class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    let RealIndex: Int = index.toInt()
    return this.dataArray[RealIndex];
  }

  public addData(index: int, data: string): void {
    this.dataArray.splice(index.toInt(), 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

export const dataSystemKey: string = 'LazyForEachDataSystemKey';

export const dataWithThemeKey: string = 'LazyForEachDataWithThemeKey';

export const dataSystemGroupKey: string = 'LazyForEachDataSystemGroupKey';

export const dataWithThemeGroupKey: string = 'LazyForEachDataWithThemeGroupKey';

@Entry
@Component
struct LazyForEachPage {
  @StorageLink(lazyForEachThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme
  count: int = 0
  dataSystem: MyDataSource = new MyDataSource()
  dataWithTheme: MyDataSource = new MyDataSource()
  dataSystemGroup: MyDataSource = new MyDataSource()
  dataWithThemeGroup: MyDataSource = new MyDataSource()

  aboutToAppear() {
    for (let i = 0; i < 1; i++) {
      this.dataSystem.pushData('Item_System_' + i)
      this.dataWithTheme.pushData('Item_WithTheme_Group' + i)
      this.dataSystemGroup.pushData('Item_System_' + i)
      this.dataWithThemeGroup.pushData('Item_WithTheme_Group' + i)
    }
    AppStorage.setOrCreate<MyDataSource | undefined>(dataSystemKey, this.dataSystem)
    AppStorage.setOrCreate<MyDataSource | undefined>(dataWithThemeKey, this.dataWithTheme)
    AppStorage.setOrCreate<MyDataSource | undefined>(dataSystemGroupKey, this.dataSystemGroup)
    AppStorage.setOrCreate<MyDataSource | undefined>(dataWithThemeGroupKey, this.dataWithThemeGroup)
  }

  build() {
    Column() {
      List({ space: '8vp' }) {
        LazyForEach(this.dataSystem, (item: string, index: int) => {
          ListItem() {
            Button(item)
              .key(item)
          }.width('100%')
        }, (item: string) => item)
      }
      .width('100%')

      List({ space: '8vp' }) {
        LazyForEach(this.dataSystemGroup, (item: string) => {
          ListItemGroup() {
            ListItem() {
              Button(item)
                .key(item)
            }.width('100%')
          }
        }, (item: string) => item)
      }
      .width('100%')

      WithTheme({ theme: this.localTheme }) {
        Column() {
          List({ space: '8vp' }) {
            LazyForEach(this.dataWithTheme, (item: string) => {
              ListItem() {
                Button(item)
                  .key(item)
              }.width('100%')
            }, (item: string) => item)
          }
          .width('100%')

          List({ space: '8vp' }) {
            LazyForEach(this.dataWithThemeGroup, (item: string) => {
              ListItemGroup() {
                ListItem() {
                  Button(item)
                    .key(item)
                }.width('100%')
              }
            }, (item: string) => item)
          }
          .width('100%')
        }
        .height('100%')
      }
    }
  }
}
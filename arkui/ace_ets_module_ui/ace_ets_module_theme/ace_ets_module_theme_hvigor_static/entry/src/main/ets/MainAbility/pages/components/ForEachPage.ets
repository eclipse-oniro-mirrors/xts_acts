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
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
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
import { AppStorage, StorageLink } from '@ohos.arkui.stateManagement'

export const forEachThemeProperty: string = `forEachThemeProperty`;

export const dataSystemKey: string = 'ForEachDataSystemKey';

export const dataWithThemeKey: string = 'ForEachDataWithThemeKey';

export const dataSystemGroupKey: string = 'ForEachDataSystemGroupKey';

export const dataWithThemeGroupKey: string = 'ForEachDataWithThemeGroupKey';

export interface DataForeach { title: string }
;

@Entry
@Component
struct ForEachPage {
  @StorageLink(forEachThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  count: int = 0;
  dataSystem: Array<DataForeach> = new Array<DataForeach>();
  dataWithTheme: Array<DataForeach> = new Array<DataForeach>();
  dataSystemGroup: Array<DataForeach> = new Array<DataForeach>();
  dataWithThemeGroup: Array<DataForeach> = new Array<DataForeach>();

  aboutToAppear() {
    for (let i = 0; i < 1; i++) {
      this.dataSystem.push({ title: 'Item_System_' + i });
      this.dataWithTheme.push({ title: 'Item_WithTheme_' + i });
      this.dataSystemGroup.push({ title: 'Item_System_Group_' + i });
      this.dataWithThemeGroup.push({ title: 'Item_WithTheme_Group_' + i });
    }
    AppStorage.setOrCreate<Array<DataForeach>>(dataSystemKey, this.dataSystem);
    AppStorage.setOrCreate<Array<DataForeach>>(dataWithThemeKey, this.dataWithTheme);
    AppStorage.setOrCreate<Array<DataForeach>>(dataSystemGroupKey, this.dataSystemGroup);
    AppStorage.setOrCreate<Array<DataForeach>>(dataWithThemeGroupKey, this.dataWithThemeGroup);
  }

  build() {
    Column() {
      List({ space: '8vp' }) {
        ForEach(this.dataSystem, (item: DataForeach) => {
          ListItem() {
            Button(item.title)
              .key(item.title)
          }.width('100%')
        }, (item: DataForeach) => item.title)
      }
      .width('100%')

      List({ space: '8vp' }) {
        ForEach(this.dataSystemGroup, (item: DataForeach) => {
          ListItemGroup() {
            ListItem() {
              Button(item.title)
                .key(item.title)
            }.width('100%')
          }
        }, (item: DataForeach) => item.title)
      }
      .width('100%')

      WithTheme({ theme: this.localTheme }) {
        Column() {
          List({ space: '8vp' }) {
            ForEach(this.dataWithTheme, (item: DataForeach) => {
              ListItem() {
                Button(item.title)
                  .key(item.title)
              }.width('100%')
            }, (item: DataForeach) => item.title)
          }
          .width('100%')

          List({ space: '8vp' }) {
            ForEach(this.dataWithThemeGroup, (item: DataForeach) => {
              ListItemGroup() {
                ListItem() {
                  Button(item.title)
                    .key(item.title)
                }
              }.width('100%')
            }, (item: DataForeach) => item.title)
          }
          .width('100%')
        }
        .height('100%')
      }
    }
  }
}
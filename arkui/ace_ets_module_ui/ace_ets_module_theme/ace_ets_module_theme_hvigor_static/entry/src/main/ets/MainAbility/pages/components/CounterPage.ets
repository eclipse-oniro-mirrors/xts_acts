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
  Counter,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  Text,
  VerticalAlign,
  WithTheme
} from '@ohos.arkui.component'
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme1';

import { CustomTheme } from '@ohos.arkui.theme';
import { StorageLink } from '@ohos.arkui.stateManagement'

export const counterThemeProperty = 'counterThemeProperty';

export const counterThemeSetProperty = 'counterThemeSetProperty'

export class CounterKeys {
  public static readonly counterSystem = `Counter_System`
  public static readonly counterSystemCustomAttrs = `Counter_System_CustomAttrs`
  public static readonly counterWithTheme = `Counter_WithTheme`
  public static readonly counterWithThemeCustomAttrs = `Counter_WithTheme_CustomAttrs`
}

@Entry
@Component
struct CounterPage {
  @StorageLink(counterThemeProperty) customTheme: CustomTheme | undefined = redCustomTheme
  @StorageLink(counterThemeSetProperty) themeSet: boolean | undefined = true
  value: number = 0;

  build() {
    Row() {
      Column({ space: '8vp' } as ColumnOptions) {
        Counter() {
          Text(this.value.toString())
        }.key(CounterKeys.counterSystem)

        Counter() {
          Text(this.value.toString())
        }
        .foregroundColor(brownCustomTheme.colors?.fontPrimary)
        .key(CounterKeys.counterSystemCustomAttrs)

        WithTheme({ theme: this.themeSet ? this.customTheme : undefined }) {
          Column({ space: '8vp' } as ColumnOptions) {
            Counter() {
              Text(this.value.toString())
            }.key(CounterKeys.counterWithTheme)

            Counter() {
              Text(this.value.toString())
            }
            .foregroundColor(brownCustomTheme.colors?.fontPrimary)
            .key(CounterKeys.counterWithThemeCustomAttrs)
          }
          .width('100%')
        }
      }
    }
    .alignItems(VerticalAlign.Center)
    .height('100%')
  }
}
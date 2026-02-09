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
  ItemAlign,
  Margin,
  Row,
  Scroll,
  Text,
  TimePicker,
  WithTheme
} from '@ohos.arkui.component'
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme1';
import { CustomTheme } from '@ohos.arkui.theme';
import { StorageLink, StoragePropRef } from '@ohos.arkui.stateManagement'

export const timePickerThemeProperty: string = `timePickerThemeProperty`;

export const timePickerThemeSetProperty: string = `timePickerThemeSetProperty`

export const timePickerIsMilitaryProperty: string = `timePickerIsMilitaryProperty`;

export class TimePickerKeys {
  public static readonly timePickerSystem = `TimePicker_System`;
  public static readonly timePickerSystemCustomAttrs = `TimePicker_System_CustomAttrs`
  public static readonly timePickerWithTheme = `TimePicker_WithTheme`;
  public static readonly timePickerWithThemeCustomAttrs = `TimePicker_WithTheme_CustomAttrs`
}

@Entry
@Component
struct TimePickerPage {
  @StoragePropRef(timePickerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(timePickerIsMilitaryProperty) isMilitary: boolean = false;
  @StorageLink(timePickerThemeSetProperty) themeSet: boolean = true

  build() {
    Scroll() {
      Column({ space: '10vp' } as ColumnOptions) {
        TimePicker()
          .useMilitaryTime(this.isMilitary)
          .key(TimePickerKeys.timePickerSystem)
        TimePicker()
          .useMilitaryTime(this.isMilitary)
          .selectedTextStyle({ color: brownCustomTheme.colors?.fontEmphasize })
          .textStyle({ color: brownCustomTheme.colors?.fontPrimary })
          .disappearTextStyle({ color: brownCustomTheme.colors?.fontPrimary })
          .key(TimePickerKeys.timePickerSystemCustomAttrs)
        WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
          Column({ space: '10vp' } as ColumnOptions) {
            TimePicker()
              .useMilitaryTime(this.isMilitary)
              .key(TimePickerKeys.timePickerWithTheme)
            TimePicker()
              .useMilitaryTime(this.isMilitary)
              .selectedTextStyle({ color: brownCustomTheme.colors?.fontEmphasize })
              .textStyle({ color: brownCustomTheme.colors?.fontPrimary })
              .disappearTextStyle({ color: brownCustomTheme.colors?.fontPrimary })
              .key(TimePickerKeys.timePickerWithThemeCustomAttrs)
          }
        }
      }
    }
  }
}

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
  PatternLock,
  PatternLockController,
  QRCode,
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { redCustomTheme } from '../../themes/CustomTheme1';
import { CustomTheme } from '@ohos.arkui.theme';
import { StorageLink } from '@ohos.arkui.stateManagement'

export const patternLockThemeProperty: string = 'PatternLockThemeProperty';

export class PatternLockKeys {
  public static readonly patternLockSystem: string = `PatternLock_System`;
  public static readonly patternLockWithTheme: string = `PatternLock_WithTheme`;
}

@Entry
@Component
struct PatternLockPage {
  @StorageLink(patternLockThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  patternLockController: PatternLockController = new PatternLockController();
  timeZoneOffset: number = 1;

  build() {
    Column() {
      PatternLock(this.patternLockController)
        .key(PatternLockKeys.patternLockSystem)
      WithTheme({ theme: this.localTheme }) {
        PatternLock(this.patternLockController)
          .key(PatternLockKeys.patternLockWithTheme)
      }
    }
    .width('100%')
  }
}
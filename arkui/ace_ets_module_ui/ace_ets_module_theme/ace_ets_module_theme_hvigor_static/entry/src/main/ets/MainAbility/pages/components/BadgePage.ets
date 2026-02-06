'use static';
/*
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
  AlphabetIndexer,
  Badge,
  BadgeParamWithNumber,
  BadgeParamWithString,
  BadgePosition,
  BadgeStyle,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  List,
  ListItem,
  Margin,
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { StorageLink } from '@ohos.arkui.stateManagement'
import { CustomTheme } from '@ohos.arkui.theme';
import { redCustomTheme } from '../../themes/CustomTheme1';

export const badgeThemeProperty = 'badgeThemeProperty';

export class BadgeKeys {
  public static readonly badgeKeysSystem = `Badge_System`;
  public static readonly badgeKeysWithTheme = `Badge_WithTheme`;
}

@Entry
@Component
struct BadgePage {
  @StorageLink(badgeThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Column() {
      List({ space: 12 }) {
        ListItem() {
          Badge({
            value: 'New',
            position: BadgePosition.Right,
            style: { badgeSize: 16 }
          } as BadgeParamWithString) {
            Text('list1')
          }
          .key(BadgeKeys.badgeKeysSystem)
          .width(49.5)
          .height(19)
          .margin({ left: 12 } as Margin)
        }
        .width('100%')
        .height(56)

        ListItem() {
          WithTheme({ theme: this.localTheme }) {
            Badge({
              value: 'New',
              position: BadgePosition.Right,
              style: { badgeSize: 16 } as BadgeStyle
            } as BadgeParamWithString) {
              Text('list2')
            }
            .key(BadgeKeys.badgeKeysWithTheme)
            .width(49.5)
            .height(19)
            .margin({ left: 12 } as Margin)
          }
        }
        .width('100%')
        .height(56)
      }
    }
  }
}
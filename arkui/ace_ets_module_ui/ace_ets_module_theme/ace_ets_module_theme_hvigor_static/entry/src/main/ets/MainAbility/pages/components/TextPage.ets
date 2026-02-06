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
  Text,
  TextController,
  WithTheme
} from '@ohos.arkui.component'
import { redCustomTheme } from '../../themes/CustomTheme1';
import { CustomTheme } from '@ohos.arkui.theme';
import { StorageLink } from '@ohos.arkui.stateManagement'

export const textThemeProperty = 'TextThemeProperty';

export class TextKeys {
  public static readonly textSystem = `Text_System`;
  public static readonly textWithTheme = `Text_WithTheme`;
}

@Entry
@Component
struct TextPage {
  @StorageLink(textThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  textController: TextController = new TextController();
  timeZoneOffset: number = 1;

  build() {
    Column() {
      Text(TextKeys.textSystem)
        .key(TextKeys.textSystem)

      WithTheme({ theme: this.localTheme }) {
        Text(TextKeys.textWithTheme)
          .key(TextKeys.textWithTheme)
      }
    }
    .width('100%')
  }
}

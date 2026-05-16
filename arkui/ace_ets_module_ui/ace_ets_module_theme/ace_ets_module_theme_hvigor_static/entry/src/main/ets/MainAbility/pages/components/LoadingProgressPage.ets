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
  LoadingProgress,
  Margin,
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { CustomTheme } from '@ohos.arkui.theme';
import { redCustomTheme } from '../../themes/CustomTheme1';
import { StorageLink } from '@ohos.arkui.stateManagement'

export const loadingProgressThemeProperty = 'LoadingProgressThemeProperty';

export class LoadingProgressKeys {
  public static readonly loadingProgressSystem: string = `LoadingProgress_System`;
  public static readonly loadingProgressWithTheme: string = `LoadingProgress_WithTheme`;
}

@Entry
@Component
struct LoadingProgressPage {
  @StorageLink(loadingProgressThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Column() {
      LoadingProgress()
        .key(LoadingProgressKeys.loadingProgressSystem)

      WithTheme({ theme: this.localTheme }) {
        LoadingProgress()
          .key(LoadingProgressKeys.loadingProgressWithTheme)
      }
    }
    .width('100%')
  }
}
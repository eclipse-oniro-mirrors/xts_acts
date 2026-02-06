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
  QRCode,
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { redCustomTheme } from '../../themes/CustomTheme1';
import { CustomTheme } from '@ohos.arkui.theme';
import { StorageLink } from '@ohos.arkui.stateManagement'

export const qrCodeThemeProperty: string = 'QRCodeThemeProperty';

export class QRCodeKeys {
  public static readonly qrCodeSystem: string = `QRCode_System`;
  public static readonly qrCodeWithTheme: string = `QRCode_WithTheme`;
}

@Entry
@Component
struct QRCodePage {
  @StorageLink(qrCodeThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  value: string = 'Text';

  build() {
    Column() {
      QRCode(this.value)
        .width('200vp')
        .height('200vp')
        .margin({ top: 50 } as Margin)
        .key(QRCodeKeys.qrCodeSystem)

      WithTheme({ theme: this.localTheme }) {
        QRCode(this.value)
          .width('200vp')
          .height('200vp')
          .margin({ top: 50 } as Margin)
          .key(QRCodeKeys.qrCodeWithTheme)
      }
    }
    .width('100%')
  }
}
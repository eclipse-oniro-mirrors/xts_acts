/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const alphabetIndexerThemeProperty: string = `AlphabetIndexerThemeProperty`;

export class AlphabetIndexerKeys {
  public static readonly alphabetIndexerSystem = `AlphabetIndexer_System`;
  public static readonly alphabetIndexerWithTheme = `AlphabetIndexer_WithTheme`;
}

@Entry
@Component
struct AlphabetIndexerPage {
  @StorageLink(alphabetIndexerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  isCustomTheme: boolean = false;
  private values = [
    'a', 'b', 'c', 'd', 'i', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ];

  build() {
    Row() {
      AlphabetIndexer({
        arrayValue: this.values,
        selected: 1
      })
        .key(AlphabetIndexerKeys.alphabetIndexerSystem)
      WithTheme({ theme: this.localTheme }) {
        Column() {
          AlphabetIndexer({
            arrayValue: this.values,
            selected: 1
          })
            .key(AlphabetIndexerKeys.alphabetIndexerWithTheme)
        }
        .width('100%')
      }
    }
    .height('100%')
  }
}
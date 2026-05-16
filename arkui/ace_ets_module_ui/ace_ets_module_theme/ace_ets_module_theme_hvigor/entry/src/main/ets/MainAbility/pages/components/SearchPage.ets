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

export const searchThemeProperty: string = `SearchThemeProperty`;

export class SearchKeys {
  public static readonly searchSystem = `Search_System`;
  public static readonly searchWithTheme = `Search_WithTheme`;
}
@Entry
@Component
struct SearchPage {
  @StorageLink(searchThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Column() {
      Search({ value: '', placeholder: 'Type to search...' })
        .margin({
          left: '20vp',
          top: '100vp',
          right: '20vp'
        })
        .searchButton('Search')
        .key(SearchKeys.searchSystem)
      WithTheme({ theme: this.localTheme }) {
        Search({ value: '', placeholder: 'Type to search...' })
          .margin({
            left: '20vp',
            top: '100vp',
            right: '20vp'
          })
          .searchButton('Search')
          .key(SearchKeys.searchWithTheme)
      }
    }
    .width('100%')
  }
}
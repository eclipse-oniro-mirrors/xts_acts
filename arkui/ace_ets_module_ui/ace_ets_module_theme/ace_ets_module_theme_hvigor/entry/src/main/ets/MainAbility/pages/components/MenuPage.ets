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

export const menuThemeProperty: string = `MenuThemeProperty`;
export class MenuKeys {
  public static readonly menuSystem: string = `Menu_System`;
  public static readonly menuItemSystem: string = `MenuItem_System`;
  public static readonly menuWithTheme: string = `Menu_WithTheme`;
  public static readonly menuItemWithTheme: string = `MenuItem_WithTheme`;
}
@Entry
@Component
struct ManuPage {
  private count: number = 0;
  @StorageLink(menuThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @State select: boolean = true;

  build() {
    Column({
      space: '10%'
    }) {
      Menu() {
        MenuItemGroup({ header: 'header', footer: 'footer' }) {
          MenuItem({ content: 'Style: ', labelInfo: 'System' })
            .key(MenuKeys.menuItemSystem)
        }
      }
      .key(MenuKeys.menuSystem)
      WithTheme({ theme: this.localTheme }) {
        Menu() {
          MenuItemGroup({ header: 'header', footer: 'footer' }) {
            MenuItem({ content: 'Style: ', labelInfo: 'WithTheme' })
              .key(MenuKeys.menuItemWithTheme)
          }
        }
        .key(MenuKeys.menuWithTheme)
      }
    }
    .margin({
      top: '5%'
    })
    .width('100%')
    .height('100%')
    .padding('4%')
  }
}
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
export const ifThemeProperty: string = `IfThemeProperty`;
export const ifArgumentProperty: string = `IfArgumentProperty`;
export class IfKeys {
  public static readonly ifSystem: string = `If_System`;
  public static readonly elseSystem: string = `Else_System`;
  public static readonly ifWithTheme: string = `If_WithTheme`;
  public static readonly elseWithTheme: string = `Else_WithTheme`;
}

@Entry
@Component
struct IfPage {
  @StorageLink(ifThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme
  @StorageLink(ifArgumentProperty) argument: boolean = true

  build() {
    Column() {
      if (this.argument) {
        Button('If Button')
          .margin({ top: '100vp' })
          .key(IfKeys.ifSystem)
      } else {
        Button('Else Button')
          .buttonStyle(ButtonStyleMode.NORMAL)
          .margin({ top: '100vp' })
          .key(IfKeys.elseSystem)
      }
      WithTheme({ theme: this.localTheme }) {
        if (this.argument) {
          Button('If Button')
            .margin({ top: '100vp' })
            .key(IfKeys.ifWithTheme)
        } else {
          Button('Else Button')
            .buttonStyle(ButtonStyleMode.NORMAL)
            .margin({ top: '100vp' })
            .key(IfKeys.elseWithTheme)
        }
      }
    }
    .width('100%')
  }
}
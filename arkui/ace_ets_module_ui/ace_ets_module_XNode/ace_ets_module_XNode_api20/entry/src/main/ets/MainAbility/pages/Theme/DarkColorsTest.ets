/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { CustomColors, CustomDarkColors, CustomTheme } from '@ohos.arkui.theme'

class AppColors implements CustomColors {
  public fontPrimary?: ResourceColor | undefined = '#FFCCBBFF'
}
class AppDarkColors implements CustomDarkColors {
  public fontPrimary?: ResourceColor | undefined = '#FFEEAAFF'
}

class AppTheme implements CustomTheme {
  public colors: AppColors = new AppColors()
  public darkColors?: AppDarkColors = new AppDarkColors()
}

@Entry
@Component
export struct FontPrimary {
  build() {
    WithTheme({ theme: new AppTheme() , colorMode:ThemeColorMode.DARK}) {
      Row() {
        Column() {
          Text('这是简单文本')
            .id('text_darkColors_id')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .height('80%')
      }
      .height('100%')
    }
  }
}
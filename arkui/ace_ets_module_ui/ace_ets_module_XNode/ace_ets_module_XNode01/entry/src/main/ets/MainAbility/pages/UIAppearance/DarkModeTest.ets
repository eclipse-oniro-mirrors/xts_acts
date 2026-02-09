/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import  uiAppearance  from '@ohos.uiAppearance';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct DarkModeIndex {
  @State darkMode: string = 'false';
  @State fontScale: string = 'false';
  @State fontWeightScale: string = 'false';

  build() {
    Column() {
      Button('test uiAppearance')
        .id('btn_uiAppearance')
        .onClick(() => {
          try {
            let darkMode = uiAppearance.getDarkMode();
            let fontScale = uiAppearance.getFontScale();
            let fontWeightScale = uiAppearance.getFontWeightScale();
            console.info('Get dark-mode ' + darkMode);
            console.info('Get dark-mode ' + fontScale);
            console.info('Get dark-mode ' + fontWeightScale);
            if ( darkMode == uiAppearance.DarkMode.ALWAYS_DARK || darkMode == uiAppearance.DarkMode.ALWAYS_LIGHT) {
              this.darkMode = 'true';
            }
            if ( fontScale != -1) {
              this.fontScale = 'true';
            }
            if ( fontWeightScale != -1) {
              this.fontWeightScale = 'true';
            }
          } catch (error) {
            let message = (error as BusinessError).message;
            console.error('Get dark-mode failed, ' + message);
          }

        })
      Text(`${this.darkMode}`).height('5%').id('darkMode_id')
      Text(`${this.fontScale}`).height('5%').id('fontScale_id')
      Text(`${this.fontWeightScale}`).height('5%').id('fontWeightScale_id')
    }
    .height('100%')
  }
}
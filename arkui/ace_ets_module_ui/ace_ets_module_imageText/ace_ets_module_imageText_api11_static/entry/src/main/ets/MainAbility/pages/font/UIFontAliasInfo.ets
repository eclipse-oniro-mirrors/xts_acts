'use static';
/**
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

import font from '@ohos.font';
import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextDecorationType,
  Margin,
  ClickEvent,
  Button,
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct FontExample {
  @State name: string = ''
  @State weight: string = ''
  @State to: string = ''

  build() {
    Column() {
      Button('getUIFontConfig')
        .id('but')
        .width('60%')
        .height('6%')
        .margin(50)
        .onClick((e:ClickEvent) => {
          let fontConfig = font.getUIFontConfig();
          console.log('font-dir -----------' + String(fontConfig.fontDir.length));
          for (let i = 0; i < fontConfig.fontDir.length; i++) {
            console.log(fontConfig.fontDir[i]);
          }
          console.log('generic-------------' + String(fontConfig.generic.length));
          for (let i = 0; i < fontConfig.generic.length; i++) {
            console.log('family:' + fontConfig.generic[i].family);
            for (let j = 0; j < fontConfig.generic[i].alias.length; j++) {
              console.log(fontConfig.generic[i].alias[j].name + ' ' + fontConfig.generic[i].alias[j].weight);
              this.name += fontConfig.generic[i].alias[j].name + ',';
              this.weight += fontConfig.generic[i].alias[j].weight + ',';
              console.log('----alias----name---' + fontConfig.generic[i].alias[j].name + '----i=' + i + '---j=' + j);
              console.log('----alias----weight---' + fontConfig.generic[i].alias[j].weight + '----i=' + i + '---j=' + j);
            }
            for (let j = 0; j < fontConfig.generic[i].adjust.length; j++) {
              console.log(fontConfig.generic[i].adjust[j].weight + ' ' + fontConfig.generic[i].adjust[j].to);
              this.to += fontConfig.generic[i].adjust[j].to + ',';
              console.log('----adjust----to----' + fontConfig.generic[i].adjust[j].to + '----i=' + i + '---j=' + j);
            }
          }
          console.log('fallback------------' + String(fontConfig.fallbackGroups.length));
          for (let i = 0; i < fontConfig.fallbackGroups.length; i++) {
            console.log('fontSetName:' + fontConfig.fallbackGroups[i].fontSetName);
            for (let j = 0; j < fontConfig.fallbackGroups[i].fallback.length; j++) {
              console.log('language:' + fontConfig.fallbackGroups[i].fallback[j].language + ' family:' +
              fontConfig.fallbackGroups[i].fallback[j].family);
            }
          }
          AppStorage.setOrCreate<string>('UIFontName', this.name);
          AppStorage.setOrCreate<string>('UIFontWeight', this.weight);
          AppStorage.setOrCreate<string>('UIFontTo', this.to);
        })
    }.width('100%')
  }
}

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'
import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  Button,
  Flex,
  TextAlign,
  FlexAlign,
  ResourceStr,
  TipsAnchorType,
  $r,
  Scroll
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TipsExample {
  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('TipsOptionsPageState', `tips1ShowAtAnchor=${TipsAnchorType.TARGET};` +
      `tips2ShowAtAnchor=${TipsAnchorType.TARGET};enableArrow=true`);
  }

  build() {
    Column() {
      Button('Hover Tips')
        .id('tips1')
        .key('tips1')
        .margin({ bottom:20 })
        .bindTips('Tips', {
          appearingTime: 700,
          disappearingTime: 300,
          appearingTimeWithContinuousOperation: 300,
          disappearingTimeWithContinuousOperation: 0,
          enableArrow: true,
          showAtAnchor: TipsAnchorType.TARGET
        })

      Button('Hover Tips')
        .id('tips2')
        .key('tips2')
        .bindTips('Tips', {
          appearingTime: 700,
          disappearingTime: 300,
          appearingTimeWithContinuousOperation: 300,
          disappearingTimeWithContinuousOperation: 0,
          enableArrow: true,
          showAtAnchor: TipsAnchorType.TARGET
        })
    }.width('100%').padding({ top: 5 })
  }
}
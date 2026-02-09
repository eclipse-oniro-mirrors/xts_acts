'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import Log from '../common/Log';
import events_emitter from '@ohos.events.emitter';
import mediaquery from '@ohos.mediaquery'
import {
  Entry,
  Component,
  Flex,
  Text,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  TextOverflow,
  TextAlign,
  Alignment,
  ClickEvent
} from '@ohos.arkui.component';
import { State, StorageLink, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct MediaQueryOff {
  @State color: string = '#000'
  @State text: string = 'Test'
  listener: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(orientation: landscape)');
  @StorageLink('result') result: boolean = true;

  onPortrait(mediaQueryResult: mediaquery.MediaQueryResult) {
    if (mediaQueryResult.matches) {
      this.color = '#FFD700'
      this.text = 'Landscape'
    } else {
      this.color = '#DB7093'
      this.text = 'Portrait'
    }
  }

  offPortrait(mediaQueryResult: mediaquery.MediaQueryResult) {
    console.log(JSON.stringify(mediaQueryResult))
    AppStorage.setOrCreate<boolean>('result', true);
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear MediaQueryOff start`)
    let portraitFunc = (mediaQueryResult: mediaquery.MediaQueryResult): void => this.onPortrait(mediaQueryResult)
    this.listener.onChange(portraitFunc)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear MediaQueryOff end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("mediaQuery-Off")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("offText")
        .onClick(() => {
          this.listener.offChange((mediaQueryResult) => {
            AppStorage.setOrCreate<boolean>('result', true);
          })
        })

      Text("mediaQuery-MatchMediaSync")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("matchMediaSyncText")
        .onClick(() => {
          console.log('test: onClick')
          let result = (this.listener != null)
          AppStorage.setOrCreate<boolean>('result', result);
        })

      Text(this.text)
        .fontSize(50)
        .fontColor(this.color)

    }.width("100%").height("100%")
  }
}

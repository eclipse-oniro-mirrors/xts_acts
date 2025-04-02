/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import uiAppearance from '@ohos.uiAppearance'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct uiAppearanceSetDarkMode {
  xcomponentController: XComponentController = new XComponentController()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear uiAppearanceSetDarkMode start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear uiAppearanceSetDarkMode end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("uiAppearance-setDarkMode1")
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
        .key("uiAppearance-setDarkMode1Text")
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (err) => {
            console.info(`uiAppearance.setDarkMode: ${err}`);
          })
        })

      Text("uiAppearance-getDarkMode")
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
        .key("uiAppearance-getDarkModeText")
        .onClick(() => {
          console.log('uiAppearance.getDarkMode: ' + JSON.stringify(uiAppearance.getDarkMode()))
        })

      Text("uiAppearance-setDarkMode2")
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
        .key("uiAppearance-setDarkMode2Text")
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK)
        })

    }.width("100%").height("100%")
  }
}

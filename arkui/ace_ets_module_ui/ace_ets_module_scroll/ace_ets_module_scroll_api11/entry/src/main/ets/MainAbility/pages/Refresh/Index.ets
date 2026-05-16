/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import uiAppearance from '@ohos.uiAppearance'
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';

// xxx
@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  @State isRefreshingText: boolean = false
  @State counterText: number = 0
  @State promptText1: string | undefined = "pull down and refresh : 0"
  @State promptText2: string | undefined = "*************************"
  @State promptText3: string | undefined = "1234567890987654321"
  @State promptText4: string | undefined = " "
  @State promptText5: string | undefined = "测试是否可以显示汉字"
  @State isRefreshing: boolean = false
  @State counter: number = 0
  timeout: number = 5000

  build() {
    Column({ space: 15 }) {
      Button('DARK')
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
          }).catch((error: BusinessError) => {
            console.error('Set dark-mode failed ')
          })
        })
      Button('LIGHT')
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (error: BusinessError) => {
            console.error('Set light-mode failed ')
          })
        })

      Column() {
        Refresh({ refreshing: $$this.isRefreshingText, offset: 10, friction: 100, promptText: this.promptText1 }) {
          Text('Pull Down and Refresh With Text: ' + this.counterText)
            .margin(10)
        }
        .key("ArkUX_Refresh_Visual_0010")
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.counterText++
            this.isRefreshingText = false
            this.promptText1 = "pull down and refresh: " + this.counterText
          }, this.timeout)
          console.log('onRefreshing test')
        })
      }
      .border({ width: 1, color: Color.Blue })
      .size({ width: "100%", height: 300 })

      Column() {
        Refresh({ refreshing: $$this.isRefreshingText, offset: 10, friction: 100, promptText: this.promptText2 }) {
          Text('Pull Down and Refresh With Text: ' + this.counterText)
            .margin(10)
        }
        .key("ArkUX_Refresh_Visual_0020")
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.counterText++
            this.isRefreshingText = false
            this.promptText2 = "pull down and refresh: " + this.counterText
          }, this.timeout)
          console.log('onRefreshing test')
        })
      }
      .border({ width: 1, color: Color.Blue })
      .size({ width: "100%", height: 300 })

      Column() {
        Refresh({ refreshing: $$this.isRefreshingText, offset: 10, friction: 100, promptText: this.promptText3 }) {
          Text('Pull Down and Refresh With Text: ' + this.counterText)
            .margin(10)
        }
        .key("ArkUX_Refresh_Visual_0030")
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.counterText++
            this.isRefreshingText = false
            this.promptText3 = "pull down and refresh: " + this.counterText
          }, this.timeout)
          console.log('onRefreshing test')
        })
      }
      .border({ width: 1, color: Color.Blue })
      .size({ width: "100%", height: 300 })

      Column() {
        Refresh({ refreshing: $$this.isRefreshing, offset: 10, friction: 100 }) {
          Text('Pull Down and Refresh : ' + this.counter)
            .margin(10)
        }
        .key("ArkUX_Refresh_Visual_0040")
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.counter++
            this.isRefreshing = false
          }, this.timeout)
          console.log('onRefreshing test')
        })
      }
      .border({ width: 1, color: Color.Blue })
      .size({ width: "100%", height: 300 })

      Column() {
        Refresh({ refreshing: $$this.isRefreshingText, offset: 10, friction: 100, promptText: this.promptText5 }) {
          Text('Pull Down and Refresh With Text: ' + this.counterText)
            .margin(10)
        }
        .key("ArkUX_Refresh_Visual_0050")
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.counterText++
            this.isRefreshingText = false
            this.promptText5 = "pull down and refresh: " + this.counterText
          }, this.timeout)
          console.log('onRefreshing test')
        })
      }
      .border({ width: 1, color: Color.Blue })
      .size({ width: "100%", height: 300 })
    }
  }
}

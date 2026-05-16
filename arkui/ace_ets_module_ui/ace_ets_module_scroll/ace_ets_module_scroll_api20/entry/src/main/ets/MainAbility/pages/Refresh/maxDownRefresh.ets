/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
@Entry
@Component
struct maxPullDownRefresh {
  @State isRefreshing: boolean = false
  @State arr: String[] = ['0', '1', '2', '3', '4', '5']
  @State maxPullDownDistanceList: number | null | undefined = null
  @State onState: string = 'start'

  build() {

    Scroll() {
      Column() {
        Text('maxPullDownDistance: ' + this.maxPullDownDistanceList)
          .id('maxPull_text')
          .margin(5)
        Button('reset')
          .id('maxPull_text_reset')
          .height('5%')
          .onClick(() => {
            this.onState = 'start'
          })
        Text(this.onState)
          .id('onState_text')
          .margin(5)
        Row(){
          Button('64')
            .id('maxPull_text_z')
            .height('5%')
            .margin({ right: 5 })
            .onClick(() => {
              this.maxPullDownDistanceList = 64
            })
          Button('-1')
            .id('maxPull_text_fu')
            .height('5%')
            .margin({ right: 5 })
            .onClick(() => {
              this.maxPullDownDistanceList = -1
            })
        }
        Row(){
          Button('null')
            .id('maxPull_text_null')
            .height('5%')
            .margin({ right: 10 })
            .onClick(() => {
              this.maxPullDownDistanceList = null
            })
          Button('undefined')
            .id('maxPull_text_ude')
            .height('5%')
            .margin({ right: 10 })
            .onClick(() => {
              this.maxPullDownDistanceList = undefined
            })
        }

        Refresh({ refreshing: $$this.isRefreshing }) {
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('80%')
                  .height('20%')
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.Off)
        }
        .id('maxPull_down_refresh')
        .maxPullDownDistance(this.maxPullDownDistanceList)
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onOffsetChange((value: number) => {
          console.info('Refresh onOffsetChange offset:' + value)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.isRefreshing = false
          }, 2000)
          this.onState = 'onRefreshing'
          console.log('onRefreshing test')
        })
        .width('80%')
        .height('70%')
        .backgroundColor(0x89CFF0)
        .refreshOffset(64)
        .pullDownRatio(1)
        .pullToRefresh(true)
      }.width('100%')
    }.scrollBar(BarState.On)
  }
}
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct RefreshNullUndefinedExample {
  @State isRefreshing: boolean = false;

  build() {
    Column() {
      // ========== refreshOffset tests ==========
      Text('refreshOffset')
      Row() {
        // Test refreshOffset default value
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_refreshOffset_default')
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        // Test refreshOffset with null
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_refreshOffset_null')
        .refreshOffset(null)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        // Test refreshOffset with undefined
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_refreshOffset_undefined')
        .refreshOffset(undefined)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)
      }
      .width('100%')
      .height('15%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== pullToRefresh tests ==========
      Text('pullToRefresh')
      Row() {
        // Test pullToRefresh with false
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullToRefresh_false')
        .pullToRefresh(false)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        // Test pullToRefresh with null
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullToRefresh_null')
        .pullToRefresh(null)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        // Test pullToRefresh with undefined
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullToRefresh_undefined')
        .pullToRefresh(undefined)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)
      }
      .width('100%')
      .height('15%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== pullUpToCancelRefresh tests ==========
      Text('pullUpToCancelRefresh')
      Row() {
        // Test pullUpToCancelRefresh with true
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullUpToCancelRefresh_true')
        .backgroundColor(0x89CFF0)
        .pullUpToCancelRefresh(true)
        .pullDownRatio(1)

        // Test pullUpToCancelRefresh with false
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullUpToCancelRefresh_false')
        .backgroundColor(0x89CFF0)
        .pullUpToCancelRefresh(false)
        .pullDownRatio(1)

        // Test pullUpToCancelRefresh with null
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullUpToCancelRefresh_null')
        .backgroundColor(0x89CFF0)
        .pullUpToCancelRefresh(null)
        .pullDownRatio(1)

        // Test pullUpToCancelRefresh with undefined
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullUpToCancelRefresh_undefined')
        .backgroundColor(0x89CFF0)
        .pullUpToCancelRefresh(undefined)
        .pullDownRatio(1)
      }
      .width('100%')
      .height('15%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== pullDownRatio tests ==========
      Text('pullDownRatio')
      Row() {
        // Test refreshOffset default value
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullDownRatio_default')
        .backgroundColor(0x89CFF0)

        // Test pullDownRatio with null
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullDownRatio_null')
        .backgroundColor(0x89CFF0)
        .pullDownRatio(null)

        // Test pullDownRatio with undefined
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_pullDownRatio_undefined')
        .backgroundColor(0x89CFF0)
        .pullDownRatio(undefined)
      }
      .width('100%')
      .height('15%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== maxPullDownDistance tests ==========
      Text('maxPullDownDistance')
      Row() {
        // Test maxPullDownDistance default value
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_maxPullDownDistance_default')
        .backgroundColor(0x89CFF0)
        .pullDownRatio(1)

        // Test maxPullDownDistance with null
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_maxPullDownDistance_null')
        .backgroundColor(0x89CFF0)
        .maxPullDownDistance(null)
        .pullDownRatio(1)

        // Test maxPullDownDistance with undefined
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(20)
            .margin(10)
        }
        .id('refresh_maxPullDownDistance_undefined')
        .backgroundColor(0x89CFF0)
        .maxPullDownDistance(undefined)
        .pullDownRatio(1)
      }
      .width('100%')
      .height('15%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
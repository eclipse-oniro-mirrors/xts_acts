/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct refreshOffsetIndex {
  @State isRefreshing: boolean = false;
  @State message: string = 'message'
  @State arr1: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @State changeRefreshOffsetIndex: number = 0;
  @State changeRefreshOffsetList: ( Resource )[] = [
    $r('app.string.refreshOffset_Normal'),$r('app.string.refreshOffset_Error')
  ]

  build() {
    Column() {
      Row(){
        Button('0')
          .onClick(() => {
            this.changeRefreshOffsetIndex = 0
          })
          .id('changeRefreshOffsetValue0')
        Button('1')
          .onClick(() => {
            this.changeRefreshOffsetIndex = 1
          })
          .id('changeRefreshOffsetValue1')
      }
      Row(){
        Refresh({ refreshing: $$this.isRefreshing}) {
          List() {
            ForEach(this.arr1, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('100%').height(100).fontSize(16)
                  .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .width('100%')
          .height('100%')
          .divider({strokeWidth:1,color:Color.Yellow,startMargin:10,endMargin:10})
          .scrollBar(BarState.Off)
        }
        .id('refresh_Offset1')
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onOffsetChange((value: number) => {
          this.message ='onOffsetChange'
          console.info('Refresh onOffsetChange offset:' + value)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.isRefreshing = false
          }, 2000)
          console.log('onRefreshing test')
        })
        .backgroundColor(0x89CFF0)
        .refreshOffset(this.changeRefreshOffsetList[this.changeRefreshOffsetIndex])
        .pullToRefresh(true)
        .pullDownRatio(0.5)
      }
    }
    .width('100%')
  }
}
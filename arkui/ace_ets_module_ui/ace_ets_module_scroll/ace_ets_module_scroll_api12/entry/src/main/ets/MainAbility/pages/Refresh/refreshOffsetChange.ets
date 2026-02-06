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
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

@Entry
@Component
struct RefreshOffsetOffsetExample {
  @State isRefreshing: boolean = false
  @State isRefreshing2: boolean = false
  @State isRefreshing3: boolean = false
  @State isFullScreen: boolean = false
  @State message1: string = 'message'
  @State message2: string = 'message'
  @State message3: string = 'message'
  @State message4: string = 'message'
  @State message5: string = 'message'
  @State refreshValue: number = 0
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6']

  @Builder
  customRefreshComponent() {
    Stack() {
      Row() {
        LoadingProgress().height(32)
        Text('Refreshing...').fontSize(16).margin({ left: 20 })
      }
      .alignItems(VerticalAlign.Center)
    }
    .align(Alignment.Center)
    .clip(true)
    .constraintSize({ minHeight: 32 }) // 设置最小高度约束保证自定义组件高度随刷新区域高度变化时自定义组件高度不会低于minHeight
    .width('100%')
  }

  private changeOrientation() {
    // 获取UIAbility实例的上下文信息
    let context = getContext(this) as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(this.isFullScreen ? window.Orientation.PORTRAIT : window.Orientation.LANDSCAPE)
      this.isFullScreen = !this.isFullScreen
    });
  }

  build() {
    Column() {
      Row() {
        Column() {
          Text(this.message1).id('refresh_mess1_1')
          Text(this.message2).id('refresh_mess1_2')
          Text(this.message3).id('refresh_mess1_3')
          Refresh({ refreshing: $$this.isRefreshing3 }) {
            Scroll() {
              Column() {
                ForEach(this.arr, (item: string) => {
                  Text('' + item)
                    .width('100%')
                    .height('20%')
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0xFFFFFF)
                }, (item: string) => item)
              }
            }
            .width('100%')
            .height('100%')
          }
          .key('Refresh_Offset1')
          .onStateChange((refreshStatus: RefreshStatus) => {
            this.message1 = 'onStateChange:' + refreshStatus.toString()
            console.info('Refresh onStatueChange state is ' + refreshStatus)
          })
          .onOffsetChange((value: number) => {
            if (this.refreshValue <= value) {
              this.message2 = 'onOffsetChange+'
            } else {
              this.message2 = 'onOffsetChange-'
            }
            this.refreshValue = value
            console.info('Refresh onOffsetChange offset:' + value)
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing3 = false
            }, 2000)
            this.message3 = 'onRefreshing'
            console.log('onRefreshing test')
          })
          .backgroundColor(0x89CFF0)
          .refreshOffset(64)
          .pullDownRatio(1)
          .width('30%')
        }

        Column() {
          Text(this.message4).id('refresh_mess2')
          Refresh({ refreshing: $$this.isRefreshing2 }) {
            List() {
              ForEach(this.arr, (item: string) => {
                ListItem() {
                  Text('' + item)
                    .width('100%')
                    .height('20%')
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0xFFFFFF)
                }
              }, (item: string) => item)
            }
            .width('100%')
            .height('100%')
            .edgeEffect(EdgeEffect.Spring)
            .divider({
              strokeWidth: 1,
              color: Color.Yellow,
              startMargin: 10,
              endMargin: 10
            })
          }
          .key('Refresh_Offset2')
          .onStateChange((refreshStatus: RefreshStatus) => {
            console.info('Refresh onStatueChange state is ' + refreshStatus)
          })
          .onOffsetChange((value: number) => {
            this.message4 = 'onOffsetChange'
            console.info('Refresh onOffsetChange offset:' + value)
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing2 = false
            }, 2000)
            console.log('onRefreshing test')
          })
          .backgroundColor(0x89CFF0)
          .refreshOffset(400)
          .pullDownRatio(1)
          .width('30%')
        }

        Column() {
          Text(this.message5).id('refresh_mess3')
          Refresh({ refreshing: $$this.isRefreshing, builder: this.customRefreshComponent() }) {
            Swiper() {
              ForEach(this.arr, (item: string) => {
                Text('' + item)
                  .width('100%')
                  .height('20%')
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }, (item: string) => item)
            }
            .vertical(true)
            .loop(false)
            .width('100%')
            .height('100%')
          }
          .key('Refresh_Offset3')
          .onStateChange((refreshStatus: RefreshStatus) => {
            console.info('Refresh onStatueChange state is ' + refreshStatus)
          })
          .onOffsetChange((value: number) => {
            this.message5 = 'onOffsetChange'
            console.info('Refresh onOffsetChange offset:' + value)
          })
          .onRefreshing(() => {
            setTimeout(() => {
              this.isRefreshing = false
            }, 2000)
            console.log('onRefreshing test')
          })
          .backgroundColor(0x89CFF0)
          .refreshOffset(400)
          .pullDownRatio(1)
          .width('30%')
        }
      }
      .height('75%')

      Button('changeOrientation').id('changeOrientation')
        .height('5%')
        .onClick(() => {
          this.changeOrientation()
        })
    }
  }
}
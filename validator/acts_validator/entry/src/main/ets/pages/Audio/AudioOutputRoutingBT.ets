/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { CustomContainer } from '../common/AudioContainer';
import FirstDialog from '../model/FirstDialog';
import AudioRenderer from '../model/AudioRenderer'
import Logger from '../model/Logger'
import promptAction from '@ohos.promptAction';
import audio from '@ohos.multimedia.audio'
import router from '@ohos.router';

@Entry
@Component
struct audioOutputRouting {
  @State name: string = 'AudioOutputRoutingTest(BT)';
  @State StepTips: string = '请参考提示信息依次执行如下操作';
  @State Vue: boolean = false;
  private tag: string = 'qlw';
  private audioRoutingManager: audio.AudioRoutingManager | undefined = undefined;
  @State yesEnable: boolean = false;
  @State yesEnable1: boolean = false;
  @State playEnable: boolean = false;
  @State stopEnable: boolean = false;
  @State outputDevice: string = '';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageHide() {
    AudioRenderer.releaseRenderer();
    Logger.info(this.tag, `onPageHide releaseRenderer end`);
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/Audio/Audio_index',
            params: { result: 'None', }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Flex({
          direction: FlexDirection.Column,
          alignItems: ItemAlign.Center,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          Scroll() {
            Column() {
              Row() {
                Text(`是否设备支持蓝牙耳机？`)
                  .fontColor(Color.White)
                  .fontSize('18fp')
              }

              Row() {
                Column() {
                  Button(`不支持`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(!this.yesEnable)
                    .opacity(!this.yesEnable ? 1 : 0.4)
                    .onClick(async () => {
                      this.Vue = false
                      this.yesEnable1 = true
                    })
                }

                Column() {
                  Button(`支持`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(!this.yesEnable1)
                    .opacity(!this.yesEnable1 ? 1 : 0.4)
                    .onClick(async () => {
                      this.yesEnable = true
                      this.playEnable = true

                    })
                }
              }

              Row() {
                Text('测试目的:\n当设备连接蓝牙耳机时，是否能够正常播放音频\n测试准备:\n断连任何外设，保持设备常亮\n测试步骤：\n1. 若设备支持蓝牙耳机，点击支持按钮\n2. 连接蓝牙耳机\n3. 按下播放按钮\n4. 按下停止按钮\n5. 断开蓝牙耳机\n测试标准：\n连接蓝牙耳机后音频通过蓝牙耳机播放，则用例pass\n如果设备不支持蓝牙耳机则点击不支持按钮并点击失败按钮')
                  .fontColor(Color.White)
                  .fontSize('18fp')

              }

              Row() {
                Column() {
                  Button(`播放`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(this.playEnable)
                    .opacity(this.playEnable ? 1 : 0.4)
                    .onClick(async () => {
                      this.Vue = true
                      this.stopEnable = true
                      this.playEnable = false
                      await AudioRenderer.createAudioRenderer()
                      await AudioRenderer.startRenderer()

                    })
                }

                Column() {
                  Button(`停止`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(this.stopEnable)
                    .opacity(this.stopEnable ? 1 : 0.4)
                    .onClick(async () => {
                      await AudioRenderer.stopRenderer()
                      await AudioRenderer.releaseRenderer()
                      this.playEnable = true
                      this.stopEnable = false
                    })
                }
              }
            }
          }.scrollBarColor(Color.White) // 滚动条颜色
          .scrollBarWidth(10)
        }
      }
      .width('100%')
      .height('80%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceEvenly)

      CustomContainer({
        title: this.name,
        Url: 'pages/Audio/Audio_index',
        StepTips: this.StepTips,
        name: $name,
        Vue: $Vue,
      })
        .height('10%')
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Audio/Audio_index',
    })
  }
}

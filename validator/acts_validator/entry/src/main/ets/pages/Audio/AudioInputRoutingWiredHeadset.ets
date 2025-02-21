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
import AudioCapturer from '../model/AudioCapturer'
import Logger from '../model/Logger'
import promptAction from '@ohos.promptAction';
import audio from '@ohos.multimedia.audio'
import router from '@ohos.router';
import mediaPlay from '../model/mediaPlay'

@Entry
@Component
struct audioInputRouting {
  @State name: string = 'AudioInputRoutingTest(WiredHeadset)';
  @State StepTips: string = '请参考提示信息依次执行如下操作';
  @State Vue: boolean = false;
  private tag: string = 'qlw';
  @State deviceChange: audio.DeviceChangeAction | undefined = undefined;
  @State audioRoutingManager: audio.AudioRoutingManager | undefined = undefined;
  @State yesEnable: boolean = false;
  @State yesEnable1: boolean = false;
  @State recorderEnable: boolean = false;
  @State stopEnable: boolean = false;
  @State playEnable: boolean = false;
  @State inputDevice: string = '';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageHide() {
    AudioCapturer.releaseCapturer()
    Logger.info(this.tag, `onPageHide releaseCapturer end`)
    mediaPlay.release()
    Logger.info(this.tag, `onPageHide releaseAVplayer end`)
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
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
          Scroll() {
            Column() {
              Row() {
                Text(`是否设备支持3.5mm耳机？`)
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
                      this.recorderEnable = true
                    })
                }
              }

              Row() {
                Text('测试目的:\n当设备连接3.5mm有线耳机时，是否能正常录制和播放\n测试准备：\n断连任何外设，保持设备常亮\n测试步骤：\n1. 若设备支持3.5mm耳机，点击支持按钮\n2. 连接3.5mm有线耳机\n3. 按下录制按钮\n4. 对着耳机mic讲话\n5. 按下停止按钮\n6. 按下播放按钮\n测试标准：\n通过3.5mm耳机可正常录制和播放，则用例pass\n如果设备不支持3.5mm耳机则点击不支持按钮并点击失败按钮')
                  .fontColor(Color.White)
                  .fontSize('18fp')
              }

              Row() {
                Column() {
                  Button(`录制`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(this.recorderEnable)
                    .opacity(this.recorderEnable ? 1 : 0.4)
                    .onClick(async () => {
                      this.stopEnable = true
                      this.recorderEnable = false
                      await AudioCapturer.createAudioCapturer()
                      await AudioCapturer.startCapturer()
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
                      this.recorderEnable = true
                      this.stopEnable = false
                      this.playEnable = true
                      await AudioCapturer.stopCapturer()
                      await AudioCapturer.releaseCapturer()
                    })
                }

                Column() {
                  Button(`播放`)
                    .borderRadius(8)
                    .backgroundColor(0x317aff)
                    .width('30%')
                    .enabled(this.playEnable)
                    .opacity(this.playEnable ? 1 : 0.4)
                    .onClick(async () => {
                      this.playEnable = false
                      await mediaPlay.init()
                      this.Vue = true
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

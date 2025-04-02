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
import router from '@ohos.router';

@Entry
@Component
struct playAudio {
  @State routers: Record<string, string | number> = router.getParams() as Record<string, string | number>;
  @State FillColor: string = '#FF000000';
  @State name: string = this.routers.audioTitle as string;
  @State StepTips: string = '测试目的：用于测试音频播放暂停、拖动滚动条功能\n预期结果：音频播放暂停、拖动滚动条功能正常';
  private tag: string = 'qlw';
  @State Vue: boolean = false;
  @State audioSrc: string = this.routers.audioUrl as string;
  @State isAutoPlay: boolean = true;
  @State showControls: boolean = true;
  controller: VideoController = new VideoController();

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
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
            url: 'pages/Player/PlayAudioList',
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

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Video({
          src: this.audioSrc,
          controller: this.controller
        })
          .width('100%')
          .height('60%')
          .autoPlay(this.isAutoPlay)
          .controls(this.showControls)
          .onFinish(() => {
            this.Vue = true;
          })
      }
      .width('100%')
      .height('80%')
      .onClick(() => {
        this.showControls = !this.showControls;
      })

      CustomContainer({
        title: this.name,
        Url: 'pages/Player/PlayAudioList',
        StepTips: this.StepTips,
        name: $name,
        Vue: $Vue
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
      url: 'pages/Player/PlayAudioList',
    })
  }
}
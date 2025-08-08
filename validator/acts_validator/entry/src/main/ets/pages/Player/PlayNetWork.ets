/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import wf from '@ohos.wifiManager';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct playVideo {
  @State FillColor: string = '#FF000000';
  @State routers: Record<string, string | number> = router.getParams() as Record<string, string | number>
  @State name: string = this.routers.title as string;
  @State StepTips: string = '测试目的：用于测试网络视频播放暂停、拖动滚动条功能\n预期结果：视频播放暂停、拖动滚动条功能正常，视频清晰度/流畅度正常，能正常播放完视频则通过。';
  @State netWorkStepTips: string = '请检查网络是否连接/网络是否可用！';
  @State isNetWork: boolean = false;
  private tag: string = 'qlw';
  @State Vue: boolean = false;
  @State videoSrc: string = this.routers.url as string;
  @State isAutoPlay: boolean = true;
  @State showControls: boolean = true;
  controller: VideoController = new VideoController();

  async aboutToAppear() {
    await this.checkWifiState();
  }

  // 判断是否联网
  async checkWifiState(): Promise<void> {
    if (wf.isWifiActive()) {
      let linkInfo = await wf.getLinkedInfo();
      console.info('checkWifiState= linkInfo=', linkInfo.connState)
      console.info('checkWifiState= ConnState =', wf.ConnState.CONNECTED)
      if (linkInfo.connState === wf.ConnState.CONNECTED) {
        console.info('checkWifiState= linkInfo=', linkInfo.connState)
        console.info('checkWifiState= ConnState =', wf.ConnState.CONNECTED)
        await FirstDialog.ChooseDialog(this.StepTips, this.name);
      } else {
        console.info('checkWifiState= else =', this.isNetWork)
        await FirstDialog.ChooseDialog(this.netWorkStepTips, this.name);
      }
    } else {
      console.info('checkWifiState= else =', this.isNetWork)
      await FirstDialog.ChooseDialog(this.netWorkStepTips, this.name);
    }
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
            url: 'pages/Player/PlayNetWorkList',
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
      }.backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Video({
          src: this.videoSrc,
          controller: this.controller
        })
          .width('100%')
          .height('60%')
          .autoPlay(this.isAutoPlay)
          .controls(this.showControls)
          .onFinish(() => {
            this.Vue = true;
          })
          .onError(() => {
            console.info('onError==')
          })
      }
      .width('100%')
      .height('80%')
      .onClick(() => {
        this.showControls = !this.showControls
      })

      CustomContainer({
        title: this.name,
        Url: 'pages/Player/PlayNetWorkList',
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
      url: 'pages/Player/PlayNetWorkList',
    })
  }
}
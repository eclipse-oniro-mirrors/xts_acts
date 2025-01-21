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
import {CustomContainer} from '../common/AudioContainer';
import FirstDialog from '../model/FirstDialog';
import AudioRenderer from '../model/AudioRenderer'
import Logger from '../model/Logger'
import prompt from '@ohos.prompt';
import audio from '@ohos.multimedia.audio'
import router from '@ohos.router';
@Entry
@Component
struct audioOutputRouting {
  @State name: string = 'AudioOutputRoutingTest(BT)';
  @State StepTips: string = '请参考提示信息依次执行如下操作';
  @State Vue: boolean = false;
  private tag: string = 'qlw'
  @State audioRoutingManager: audio.AudioRoutingManager = undefined
  @State yesEnable: boolean = false
  @State playEnable: boolean = false
  @State stopEnable: boolean = false
  @State outputDevice: string = ''
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
    await this.onDeviceChange()
    await this.getDevices()
  }
  onPageHide() {
    AudioRenderer.releaseRenderer()
    Logger.info(this.tag, `onPageHide releaseRenderer end`)
  }

  async onDeviceChange(){
    this.audioRoutingManager = await audio.getAudioManager().getRoutingManager()
    this.audioRoutingManager.on('deviceChange', audio.DeviceFlag.ALL_DEVICES_FLAG, async(DeviceChangeAction) => {
      Logger.info(this.tag, `deviceChange: ` + JSON.stringify(DeviceChangeAction))
      await this.getDevices()
    })
  }

  async getDevices(){
    let deviceDescriptors = await this.audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
    Logger.info(this.tag, `getDevices: ` + JSON.stringify(deviceDescriptors))
    switch (deviceDescriptors[0].deviceType) {
      case 2:
        this.outputDevice = "Speaker"
        break
      case 3:
        this.outputDevice = "3.5mm有线耳机"
        break
      case 8:
        this.outputDevice = "蓝牙耳机"
        break
      case 22:
        this.outputDevice = "Type C耳机"
        break
      default:
        break
    }
    Logger.info(this.tag, `OutputDeviceList: ${this.outputDevice}`)
  }

  build() {
    Column() {
      Row() {
        Button(){
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp').margin({left:'20vp'})
        }.backgroundColor(Color.Black).size({ width: '40vp', height: '30vp' })
        .onClick(()=>{
          router.back({
            url:'pages/Audio/Audio_index',
            params: {result : 'None',}
          })
        })
        Text(this.name).fontColor(Color.White).fontSize('18fp').margin({left:'-20vp'})
        Text('hello').fontColor(Color.White).visibility(Visibility.Hidden)
      }.backgroundColor(Color.Black).height('10%').width('100%').justifyContent(FlexAlign.SpaceBetween)
      Column() {
        Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Column(){
            Row(){
              Text(`是否设备支持蓝牙耳机？`).fontColor(Color.White).fontSize('18fp')
            }
            Row(){
              Column(){
                Button(`不支持`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(!this.yesEnable)
                  .opacity(!this.yesEnable? 1 : 0.4)
                  .onClick(async () => {
                    this.Vue = true
                  })
              }
              Column(){
                Button(`支持`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .onClick(async () => {
                    this.yesEnable = true
                    this.playEnable = true

                  })
              }
            }
            Row(){
              Text('测试目的:\n当设备连接蓝牙耳机时，音频路由是否正确切换\n测试准备:\n断连任何外设，保持设备常亮\n测试步骤：\n1. 验证设备是否支持蓝牙外设\n2. 按下播放按钮\n3. 连接蓝牙耳机\n4. 拔出蓝牙耳机\n5. 按下停止按钮\n测试标准：\n如果设备不支持蓝牙耳机连接或者插拔蓝牙耳机后接收到路由通知、路由显示正确，且连接蓝牙后音频通过蓝牙耳机播放，则用例pass').fontColor(Color.White).fontSize('18fp')

            }
            Row(){
              Text(`Audio输出路由：${this.outputDevice}`).fontColor(Color.White).fontSize('18fp')
            }
            Row(){
              Column(){
                Button(`播放`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(this.playEnable)
                  .opacity(this.playEnable? 1 : 0.4)
                  .onClick(async () => {
                    this.Vue = true
                    this.stopEnable = true
                    this.playEnable = false
                    await AudioRenderer.createAudioRenderer()
                    await AudioRenderer.startRenderer()

                  })
              }
              Column(){
                Button(`停止`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(this.stopEnable)
                  .opacity(this.stopEnable? 1 : 0.4)
                  .onClick(async () => {
                    await AudioRenderer.stopRenderer()
                    await AudioRenderer.releaseRenderer()
                    this.playEnable = true
                    this.stopEnable = false
                  })
              }
            }
          }

        }
      }.width('100%').height('80%').backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceEvenly)
      CustomContainer({
        title: this.name,
        Url:'pages/Audio/Audio_index',
        StepTips:this.StepTips,
        name:$name,
        Vue: $Vue,
      }).height('10%').width('100%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Audio/Audio_index',
    })
  }
}

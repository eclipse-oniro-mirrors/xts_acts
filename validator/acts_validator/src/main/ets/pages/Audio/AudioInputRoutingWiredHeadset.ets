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
import AudioCapturer from '../model/AudioCapturer'
import Logger from '../model/Logger'
import prompt from '@ohos.prompt';
import audio from '@ohos.multimedia.audio'
import router from '@ohos.router';
import mediaPlay from '../model/mediaPlay'
@Entry
@Component
struct audioInputRouting {
  @State name: string = 'AudioInputRoutingTest(WiredHeadset)';
  @State StepTips: string = '请参考提示信息依次执行如下操作';
  @State Vue: boolean = false;
  private tag: string = 'qlw'
  @State deviceChange: audio.DeviceChangeAction = undefined
  @State audioRoutingManager: audio.AudioRoutingManager = undefined
  @State yesEnable: boolean = false
  @State recorderEnable: boolean = false
  @State stopEnable: boolean = false
  @State playEnable: boolean = false
  @State inputDevice: string = ''
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
    await this.onDeviceChange()
    await this.getDevices()
  }
  onPageHide() {
    AudioCapturer.releaseCapturer()
    Logger.info(this.tag, `onPageHide releaseCapturer end`)
    mediaPlay.release()
    Logger.info(this.tag, `onPageHide releaseAVplayer end`)
  }

  async onDeviceChange(){
    this.audioRoutingManager = await audio.getAudioManager().getRoutingManager()
    this.audioRoutingManager.on('deviceChange', audio.DeviceFlag.ALL_DEVICES_FLAG, async(DeviceChangeAction) => {
      Logger.info(this.tag, `deviceChange: ` + JSON.stringify(DeviceChangeAction))
      await this.getDevices()
    })
  }

  async getDevices(){
    try{
      Logger.info(this.tag, `getDevices test `)
      let deviceDescriptors = await this.audioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG)
      Logger.info(this.tag, `getDevices: ` + JSON.stringify(deviceDescriptors))
      switch (deviceDescriptors[0].deviceType) {
        case 3:
          this.inputDevice = "3.5mm有线耳机"
          break
        case 8:
          this.inputDevice = "蓝牙耳机"
          break
        case 15:
          this.inputDevice = "mic"
          break
        case 22:
          this.inputDevice = "Type C"
          break
        default:
          break
      }
      Logger.info(this.tag, `InputDeviceList: ${this.inputDevice}`)
    }catch(err){
      Logger.info(this.tag, `getDevices err message: ${err.message}, err code: ${err.code} `)
    }
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
        Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
          Column(){
            Row(){
              Text(`是否设备支持3.5mm耳机？`).fontColor(Color.White).fontSize('18fp')
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
                    this.recorderEnable = true
                  })
              }
            }
            Row(){
              Text('测试目的:\n当设备连接3.5mm有线耳机时，是否音频输入路由正确切换\n测试准备\n断连任何外设，保持设备常亮\n测试步骤：\n1. 验证设备是否支持3.5mm有线耳机\n2. 连接3.5mm有线耳机\n3. 按下录制按钮\n4. 对着耳机mic讲话\n5. 按下停止按钮\n6. 按下播放按钮\n测试标准：\n如果设备不支持3.5mm有线耳机输入或者接收到路由通知、路由显示为3.5mm耳机，通过3.5mm耳机可正常录制和播放，则用例pass').fontColor(Color.White).fontSize('18fp')
            }
            Row(){
              Text(`Audio输入路由：${this.inputDevice}`).fontColor(Color.White).fontSize('18fp')
            }
            Row(){
              Column(){
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
              Column(){
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
              Column(){
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

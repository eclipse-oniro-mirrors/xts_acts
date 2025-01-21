/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import audio from '@ohos.multimedia.audio'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import { BusinessError } from '@ohos.base'
import fs from '@ohos.file.fs';
import wantAgent from '@ohos.app.ability.wantAgent'
import ohosWantAgent from '@ohos.wantAgent'
import AVSessionManager from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

let mXComponentController: XComponentController = new XComponentController()

@Entry
@Component
struct Index {
  @State message: string = 'Next Page'
  @State imageLoadSuccess: string = "LoadFalse"
  abilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('EntryAbilityContext') as common.UIAbilityContext
  audioRenderer: audio.AudioRenderer = {} as audio.AudioRenderer
  @State audioStateText: string = 'Error'

  async aboutToAppear() {
    this.audioRenderer = await this.getAudioRenderer()
  }

  async onPageShow() {
    this.audioStateText = this.audioRenderer ? this.audioRenderer.state.toString() : 'Error'
  }

  build() {
    Row() {
      Column() {
        Button(this.message)
          .id('firstButton')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.pushUrl({ url: "pages/SecondPage" })
          })
        Text($r('app.string.Multilingual_Text'))
          .id('multilingualText')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image($rawfile('test.png'))
          .id('image')
          .height('20%')
          .onComplete((event) => {
            this.imageLoadSuccess = "LoadSuccess"
          })
        Text(this.imageLoadSuccess.toString())
          .id('imageLoadSuccess')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        XComponent({
          id: '',
          type: 'surface',
          libraryname: '',
          controller: mXComponentController
        }).onLoad(() => {
          mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 500, surfaceHeight: 500 })
        })
          .width('30%')
          .height('30%')

        Text(mXComponentController.getXComponentSurfaceId())
          .id("surfaceId")

        Button('StartAudio')
          .id('StartAudio')
          .fontSize(20)
          .onClick(async () => {
            let res = await this.startAudio(this.audioRenderer, this.abilityContext)
            this.audioStateText = this.audioRenderer ? this.audioRenderer.state.toString() : 'Error'
          })
        Button('StopAudio')
          .id('StopAudio')
          .fontSize(20)
          .onClick(async () => {
            let res = await this.stopAudio(this.audioRenderer, this.abilityContext)
            this.audioStateText = this.audioRenderer ? this.audioRenderer.state.toString() : 'Error'
          })
        Text(this.audioStateText)
          .id('AudioStateText')
      }
      .width('100%')
    }
    .height('100%')
  }

  async startAudio(audioRenderer: audio.AudioRenderer, abilityContext: common.UIAbilityContext) {
    if (!audioRenderer) {
      return false
    }
    try {
      await audioRenderer.start()
      let type: AVSessionManager.AVSessionType = 'audio';
      let session = await AVSessionManager.createAVSession(abilityContext, 'AVSession', type);
      await session.activate()
    } catch (error) {
      let err: BusinessError = error as BusinessError
      console.error(`Start audioRenderer Fail. Code: ${err.code}, message: ${err.message}`)
      return false
    }
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: 'com.acts.pcs.arktstest',
          abilityName: 'EntryAbility'
        } as Want
      ],
      requestCode: 0,
      operationType: ohosWantAgent.OperationType.START_ABILITIES,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    }
    try {
      let wantAgentObj = await wantAgent.getWantAgent(wantAgentInfo)
      await backgroundTaskManager.startBackgroundRunning(abilityContext,
        backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, wantAgentObj)
    } catch (error) {
      let err: BusinessError = error as BusinessError
      console.error(`Start BackgroundRunning Fail. Code: ${err.code}, message: ${err.message}`)
      return false
    }
    return true
  }

  async stopAudio(audioRenderer: audio.AudioRenderer, abilityContext: common.UIAbilityContext) {
    if (!audioRenderer) {
      return false
    }
    try {
      audioRenderer.stop()
      audioRenderer.release()
    } catch (error) {
      let err: BusinessError = error as BusinessError
      console.error(`Stop audioRenderer Fail. Code: ${err.code}, message: ${err.message}`)
      return false
    }
    try {
      await backgroundTaskManager.stopBackgroundRunning(abilityContext)
    } catch (error) {
      let err: BusinessError = error as BusinessError
      console.error(`Stop BackgroundRunning Fail. Code: ${err.code}, message: ${err.message}`)
      return false
    }
    return true
  }

  async getAudioRenderer() {
    try {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)
      let bufferSize: number = 0
      class Options {
        offset?: number
        length?: number
      }
      let writeDataCallback = (buffer: ArrayBuffer) => {
        let path = '/data/storage/el2/base/haps/entry/files/'
        let filePath = path + '/Believer.wav'
        let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_ONLY)
        let options: Options = {
          offset: bufferSize,
          length: buffer.byteLength
        }
        fs.readSync(file.fd, buffer, options)
        bufferSize += buffer.byteLength
      }
      audioRenderer.on('writeData', writeDataCallback)
      return audioRenderer
    } catch (error) {
      let err: BusinessError = error as BusinessError
      console.error(`Create audioRenderer Fail. Code: ${err.code}, message: ${err.message}`)
      return {} as audio.AudioRenderer
    }
  }
}
/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { Want } from '@kit.AbilityKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'


export default function audioInterrupt() {
  describe('audioInterrupt', () => {
    console.info('audioRenderInterrupt: Create AudioManger Object JS Framework');
    let fdRead: number;
    let readPath: string;
    console.info('AudioFrameworkRenderLog: Create AudioManger Object JS Framework');
    let fdPath: string;
    let filePath: string;
    let audioRen: audio.AudioRenderer;
    let testContext: common.UIAbilityContext;
    let bufferSize: number;

    let sleep = (ms?: number | undefined): Promise<void> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    let driveFn = async () => {
      let dr = Driver.create();
      let button = await dr?.waitForComponent(ON.text('本次允许', MatchPattern.EQUALS), 500);
      if (button == null || button == undefined) {
        button = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      }
      if (button == null || button == undefined) {
        button = await dr?.waitForComponent(ON.text('打开', MatchPattern.EQUALS), 500);
      }
      if (button == null || button == undefined) {
        button = await dr?.waitForComponent(ON.text('本次打开', MatchPattern.EQUALS), 500);
      }
      await button?.click();
      await sleep(3000);
    }
    let getcreateAVSession = async () => {
      let tag = "createNewSession";
      let type: avSession.AVSessionType = "audio";
      let av = await avSession.createAVSession(testContext, tag, type);
      console.info('av is ' + JSON.stringify(av));
    }

    let getFdRead = async (pathName: string, done: Function) => {
      console.info("case0 context is  " + testContext);
      let pathDir = testContext.filesDir;
      filePath = pathDir + '/' + pathName;
      console.log(filePath + 'filePath')
      fdPath = 'fd://';
      await fs.open(filePath).then((file: fs.File) => {
        console.info("file fd: " + file.fd);
        fdPath = fdPath + '' + file.fd;
        fdRead = file.fd;
        console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
        console.info('[fileIO]case open fd success,fdRead is ' + fdRead);
      }, (err: BusinessError) => {
        console.info('[fileIO]case open fd failed');
      }).catch((err: BusinessError) => {
        console.info('[fileIO]case catch open fd failed');
      });
    }

    beforeAll(() => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info('audioRenderInterrupt: beforeAll: Prerequisites at the test suite level');
      getcreateAVSession();
    });
    beforeEach(async () => {
      console.info('audioRenderInterrupt: beforeEach: Prerequisites at the test case level');
      await sleep(100);
    });
    afterEach(async () => {
      console.info('audioRenderInterrupt: afterEach: Test case-level clearance conditions');
      await sleep(100);
    });
    afterAll(() => {
      console.info('audioRenderInterrupt: afterAll: Test suite-level cleanup condition');
    });
    /**
     * @tc.name   SUB_AUDIO_INTERRUPT_001
     * @tc.number SUB_AUDIO_INTERRUPT_001
     * @tc.desc   SUB_AUDIO_INTERRUPT_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_INTERRUPT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      let AudioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      };
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      };
      readPath = 'StarWars10s-2C-48000-4SW.wav';
      await getFdRead(readPath, done);
      await audio.createAudioRenderer(AudioRendererOptions).then(async (data) => {
        audioRen = data;
        console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS');
      }).catch((err: BusinessError) => {
        console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
      });
      console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
      let activated: boolean | undefined = false;
      let InterruptHint: audio.InterruptHint | undefined = 0;
      await sleep(7000);
      let audioManager = audio.getAudioManager();
      let interAudioInterrupt: audio.AudioInterrupt = {
        streamUsage: 1,
        contentType: 0,
        pauseWhenDucked: true
      };
      audioManager.on('interrupt', interAudioInterrupt, (InterruptAction) => {
        console.info('come in MasterHap interrupt');
        if (InterruptAction.actionType != undefined && InterruptAction.actionType != null) {
          console.info('An event to gain the audio focus starts.');
          console.info(`Focus gain event: ${InterruptAction} `);
          activated = InterruptAction.activated;
          InterruptHint = InterruptAction.hint;
          console.info('activated is :' + activated);
          console.info('InterruptHint is :' + InterruptHint);
          console.info('InterruptAction.actionType  is :' + InterruptAction.actionType);
        }
      });
      await audioRen.start().then(() => {
        console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
      }).catch((err: BusinessError) => {
        console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
      });
      console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
      await audioRen.getBufferSize().then(async (data) => {
        console.info('AudioFrameworkRenderLog: getBufferSize :SUCCESS ' + data);
        bufferSize = data;
      }).catch((err: BusinessError) => {
        console.info('AudioFrameworkRenderLog: getBufferSize :ERROR : ' + err.message);
      });
      let ss = fileio.fdopenStreamSync(fdRead, 'r');
      console.info('AudioFrameworkRenderLog:case 2:AudioFrameworkRenderLog: File Path: ' + ss);
      let discardHeader = new ArrayBuffer(44);
      console.info('AudioFrameworkRenderLog:case 2-1:AudioFrameworkRenderLog: File Path: ');
      ss.readSync(discardHeader);
      console.info('AudioFrameworkRenderLog:case 2-2:AudioFrameworkRenderLog: File Path: ');
      let totalSize = fileio.fstatSync(fdRead).size;
      console.info('AudioFrameworkRenderLog:case 3 : AudioFrameworkRenderLog: File totalSize size: ' + totalSize);
      totalSize = totalSize - 44;
      console.info('AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
      let rlen = 0;
      let count = 0;
      while (rlen < totalSize) {
        if (activated == false && InterruptHint == 3) {
          console.info('audio was interrupt');
          break;
        }
        let buf = new ArrayBuffer(bufferSize);
        rlen += ss.readSync(buf);
        console.info('MasterHap:BufferAudioFramework: bytes read from =================== file: ' + rlen +
          totalSize / 3 + count);
        if (rlen >= totalSize / 3 && count == 0) {
          count++;
          let want: Want = {
            bundleName: 'com.example.audiorenderinterrupt',
            abilityName: 'EntryAbility'
          }
        
          testContext.startAbilityForResult(want).then((data) => {
            console.info("==========================>startAbility Success=======================>" +
            JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info("==========================>startAbility Fail=======================>" +
            JSON.stringify(err));
          });
          await driveFn();
        }
        await audioRen.write(buf);
      }
      console.info('AudioFrameworkRenderLog: Renderer after read');
      await audioRen.drain().then(async () => {
        console.info('AudioFrameworkRenderLog: Renderer drained : SUCCESS');
      }).catch((err: BusinessError) => {
        console.error('AudioFrameworkRenderLog: Renderer drain: ERROR : ' + err.message);
      });
      await audioRen.release().then(async () => {
        console.info('AudioFrameworkRenderLog: Renderer release : SUCCESS');
      }).catch((err: BusinessError) => {
        console.info('AudioFrameworkRenderLog: Renderer release :ERROR : ' + err.message);
      });
      expect(activated == false && InterruptHint == 3).assertTrue();
      done();
    });
  })
}
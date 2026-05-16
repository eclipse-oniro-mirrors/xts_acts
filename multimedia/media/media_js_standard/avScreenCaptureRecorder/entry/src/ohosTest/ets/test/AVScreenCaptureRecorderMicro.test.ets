/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import myScreenCaptureNdk from 'libentry.so';

let mediaTestBase = new MediaTestBase()
export default function AVScreenCaptureRecorderMicro() {
  describe('AVScreenCaptureRecorderMicro', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      mediaTestBase.getPermission(['ohos.permission.MICROPHONE']);
      await mediaTestBase.msleepAsync(4000);
      await mediaTestBase.driveFnNoSleep(1);

      mediaTestBase.playPcmPromise();
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await mediaTestBase.msleepAsync(3000);
      mediaTestBase.playPcmPromiseStart();
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (mediaTestBase.avScreenCaptureRecorder != null || mediaTestBase.avScreenCaptureRecorder != undefined) {
        await mediaTestBase.avScreenCaptureRecorder?.release().then(() => {
          console.info('avScreenCaptureRecorder release success');
          console.info(mediaTestBase.TAG + 'this testCase execution completed')
          mediaTestBase.avScreenCaptureRecorder = null;
        }).catch((err: BusinessError) => {
          console.info('avScreenCaptureRecorder release failed, error: ' + err.message);
        })
      }
      await mediaTestBase.msleepAsync(1000);
      mediaTestBase.playPcmPromiseStop();
    })

    afterAll(async () => {
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1100
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1100', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1100 start')

      let mySteps = new Array(
        // create
        mediaTestBase.CREATE_EVENT,
        // init
        mediaTestBase.INIT_EVENT,
        mediaTestBase.SETONCALLBACK_EVENT,
        //setMicEnable
        mediaTestBase.SET_MIC_ENABLE_EVENT,
        // start recorder
        mediaTestBase.STARTRECORDER_EVENT,
        // skip PrivacyMode
        // mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        mediaTestBase.RELEASECORDER_EVENT,
        //create AV
        mediaTestBase.AV_CREATEAVPLAYER,
        mediaTestBase.END_EVENT);

      mediaTestBase.outputName = mediaTestBase.resourceName();
      mediaTestBase.outputFdObject = mediaTestBase.getFd(mediaTestBase.outputName);
      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: mediaTestBase.outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1100 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200 start')
      let result: number = myScreenCaptureNdk.OHAVMuxerByAddTrackH265();
      if (result != 0) {
        console.info('Failed to obtain the default videoProfiles object.Not support AddTrackH265');
        expect(result).not().assertEqual(0);
        done();
        return;
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200 start')

      let mySteps = new Array(
        // create
        mediaTestBase.CREATE_EVENT,
        // init
        mediaTestBase.INIT_EVENT,
        mediaTestBase.SETONCALLBACK_EVENT,
        //setMicEnable
        mediaTestBase.SET_MIC_ENABLE_EVENT,
        // start recorder
        mediaTestBase.STARTRECORDER_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.AV_CREATEAVPLAYER,
        mediaTestBase.END_EVENT);


      mediaTestBase.outputName = mediaTestBase.resourceName();
      mediaTestBase.outputFdObject = mediaTestBase.getFd(mediaTestBase.outputName);

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: mediaTestBase.outputFdObject.fd,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H265_AAC_MP4,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1200 end')
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1300
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1300', 0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1300 start')

      let mySteps = new Array(
        // create
        mediaTestBase.CREATE_EVENT,
        // init
        mediaTestBase.INITWITHERROR_EVENT,
        mediaTestBase.SETONCALLBACK_EVENT,
        //setMicEnable
        mediaTestBase.SET_MIC_ENABLE_EVENT,
        // start recorder
        mediaTestBase.STARTRECORDER_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.AV_CREATEAVPLAYER,
        mediaTestBase.END_EVENT);
      mediaTestBase.outputName = mediaTestBase.resourceName();
      mediaTestBase.outputFdObject = mediaTestBase.getFd(mediaTestBase.outputName);
      let avConfig2: media.AVScreenCaptureRecordConfig = {
        fd: mediaTestBase.outputFdObject.fd,
        frameWidth: undefined,
        frameHeight: undefined,
        videoBitrate: undefined,
        audioSampleRate: undefined,
        audioChannelCount: undefined,
        audioBitrate: undefined,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
      }

      mediaTestBase.toNextStep2(mediaTestBase.avScreenCaptureRecorder, avConfig2, 3000, mySteps, done)
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_1300 end')
    })
  })
}


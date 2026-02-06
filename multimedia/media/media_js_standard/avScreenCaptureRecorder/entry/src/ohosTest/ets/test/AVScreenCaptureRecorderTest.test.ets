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

export default function AVScreenCaptureRecorderTest() {
  describe('AVScreenCaptureRecorderTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.msleepAsync(4000);
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

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        // mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.END_EVENT);

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: -1,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
        strategy: {
          keepCaptureDuringCall: false,
          enableBFrame: false,
        }
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
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
        displayId: 0,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
        fillMode: 0,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0102
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0102', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0102 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        // mediaTestBase.RELEASECORDER_EVENT,
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
        strategy: {
          keepCaptureDuringCall: true,
          enableBFrame: false,
        }
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      if (avConfig?.strategy) {
        expect(avConfig.strategy.keepCaptureDuringCall).assertTrue()
      } else {
        expect(false).assertTrue()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0102 end')
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0103
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0103', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0103 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        // mediaTestBase.RELEASECORDER_EVENT,
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
        strategy: {
          keepCaptureDuringCall: false,
          enableBFrame: true,
        }
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      if (avConfig?.strategy) {
        expect(avConfig.strategy.keepCaptureDuringCall).assertFalse()
      } else {
        expect(false).assertTrue()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0103 end')
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0104
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0104', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0104 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        // mediaTestBase.RELEASECORDER_EVENT,
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
        strategy: {
          keepCaptureDuringCall: true,
          enableBFrame: true,
        }
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      if (avConfig?.strategy) {
        expect(avConfig.strategy.keepCaptureDuringCall).assertTrue()
      } else {
        expect(false).assertTrue()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0104 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200
        * @tc.name      : 02.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 start')
      let result: number = myScreenCaptureNdk.OHAVMuxerByAddTrackH265();
      if (result != 0) {
        console.info('Failed to obtain the default videoProfiles object.Not support AddTrackH265');
        expect(result).not().assertEqual(0);
        done();
        return;
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 start')

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
        // mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.END_EVENT);

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: -1,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H265_AAC_MP4,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201
        * @tc.name      : 02.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201 start')
      let result: number = myScreenCaptureNdk.OHAVMuxerByAddTrackH265();
      if (result != 0) {
        console.info('Failed to obtain the default videoProfiles object.Not support AddTrackH265');
        expect(result).not().assertEqual(0);
        done();
        return;
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201 start')

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
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300
        * @tc.name      : 03.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300 start')
      try {
        await media.reportAVScreenCaptureUserChoice(-1, "-1")
      } catch (error) {
        console.error(`reportAVScreenCaptureUserChoice error, error message: ${error.message}`);
        expect().assertFail()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_FILLMODE_001
        * @tc.name      : 01.AvScreenCaptureRecorder
        * @tc.desc      : AvScreenCaptureRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_FILLMODE_001', Level.LEVEL0, async (done: Function) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_FILLMODE_001 start')

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
        mediaTestBase.SKIPPRIVACYMODE_EVENT,
        // stop recorder
        mediaTestBase.STOPRECORDER_EVENT,
        //release recorder
        //close fd
        // mediaTestBase.RELEASECORDER_EVENT,
        mediaTestBase.END_EVENT);

      let avConfig: media.AVScreenCaptureRecordConfig = {
        fd: -1,
        frameWidth: 640,
        frameHeight: 480,
        videoBitrate: 10000000,
        audioSampleRate: 48000,
        audioChannelCount: 1,
        audioBitrate: 96000,
        preset: media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
        fillMode: 1,
      }

      mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_FILLMODE_001 end')
    })
  })
}


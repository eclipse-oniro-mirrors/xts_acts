/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media'
import MediaTestBase from './MediaTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';

let mediaTestBase = new MediaTestBase()

export default function AVScreenCaptureRecorderTest() {
  describe('AVScreenCaptureRecorderTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.msleepAsync(4000);
      await mediaTestBase.playPcmPromise();
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await mediaTestBase.msleepAsync(3000);
      await mediaTestBase.playPcmPromiseStart();
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (mediaTestBase.avScreenCaptureRecorder != null || mediaTestBase.avScreenCaptureRecorder != undefined) {
        await mediaTestBase.avScreenCaptureRecorder!!.release().then(() => {
          console.info('avScreenCaptureRecorder release success');
          console.info(mediaTestBase.TAG + 'this testCase execution completed')
          mediaTestBase.avScreenCaptureRecorder = null;
        }).catch((err: Error) => {
          console.info('avScreenCaptureRecorder release failed, error: ' + err.message);
        })
      }
      await mediaTestBase.msleepAsync(1000);
      await mediaTestBase.playPcmPromiseStop();
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0100
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 start')

      let mySteps = new Array<string>(
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
      }
      expect(mediaTestBase.avScreenCaptureRecorder).assertNull();
      await mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0101
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0101
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101 start')

      let mySteps = new Array<string>(
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
      }
      expect(avConfig.fd).not().assertNull();
      await mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0101 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0102
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0102
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0102 start')

      let mySteps = new Array<string>(
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
        strategy: {
          enableDeviceLevelCapture: true,
          keepCaptureDuringCall: true,
          enableBFrame: true,
          privacyMaskMode: 1,
        }
      }
      expect(avConfig.fd).not().assertNull();
      await mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0102 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0103
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0103
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0103 start')

      let mySteps = new Array<string>(
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
        strategy: {
          enableDeviceLevelCapture: false,
          keepCaptureDuringCall: false,
          enableBFrame: false,
          privacyMaskMode: 0,
        }
      }
      expect(avConfig.fd).not().assertNull();
      await mediaTestBase.toNextStep(mediaTestBase.avScreenCaptureRecorder, avConfig, 3000, mySteps, done)

      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0103 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0300
     * @tc.desc   AvScreenCaptureRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300 start')
      try {
        await media.reportAVScreenCaptureUserChoice(-1, "-1")
      } catch (error) {
        console.error(`reportAVScreenCaptureUserChoice error, error message: ${error}`);
        expect().assertFail()
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
      done();
    })

     /**
      * @tc.number  SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0301
      * @tc.name    SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0301
      * @tc.desc    AvScreenCaptureRecorder
      *               : 04.AvScreenCaptureRecorder
      * @tc.size    MediumTest
      * @tc.type    Performance test
      * @tc.level   Level 1
     */
    it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_static_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0301 start')
      try {
        let id: int = 0;
        let resultStr: string = await media.getAVScreenCaptureConfigurableParameters(id)
        expect(resultStr).assertEqual("");
      } catch (error: BusinessError) {
        console.error(`getAVScreenCaptureConfigurableParameters error, error code: ${error.code}`);
        console.error(`getAVScreenCaptureConfigurableParameters error, error message: ${error.message}`);
        expect(error.code).assertEqual(202);
      }
      console.info(mediaTestBase.TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0201 end')
      done();
    })
  })
}


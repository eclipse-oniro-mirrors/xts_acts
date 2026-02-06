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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Permissions } from '@ohos.abilityAccessCtrl';
import Common from './Common';

export default function AVRecorderFuncAccTest() {
  describe('AVRecorderFuncAccTest', () => {
    let avRecorder: media.AVRecorder;
    const RECORDER_TIME = 3000;
    const FORMAT_AAC = media.ContainerFormatType.CFT_AAC;
    const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
    let fdObject: ESObject;
    let fdPath: string;
    let commonFun = new Common();

    let TAG = "[AvRecorderLocalTest] ";
    let avProfile: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioSampleRate: 48000,
      audioCodec: ENCORDER_AAC,
      fileFormat: FORMAT_AAC,
    }
    let avConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: avProfile,
      url: 'fd://',
      rotation: 0,
      location: {
        latitude: 30, longitude: 130
      }
    }


    beforeAll(async () => {
      console.info('beforeAll in1');
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA', 'ohos.permission.CAMERA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(2000);
      await commonFun.driveFn(4)
      console.info('beforeAll out');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await commonFun.sleep(3000);
      fdObject = null;
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (avRecorder != null) {
        avRecorder.release().then(() => {
          console.info(TAG + 'this testCase execution completed')
        }, commonFun.failureCallback).catch(commonFun.catchCallback);
      }
      commonFun.closeFd(fdObject?.fdNumber);
      await commonFun.sleep(1000);
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('avRecorderTest=== afterAll case');
    })


    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0100
        * @tc.desc      : Recorder audio 001.pause
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderWithCallBack(avConfig, avRecorder, RECORDER_TIME, done);
      done();
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0100 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0200
        * @tc.desc      : Recorder audio pause->resume
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack2(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0200 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0300
        * @tc.desc      : Local Video recording 3 seconds to stop
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0300 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0400
        * @tc.desc      : Local Video pause->resume->pause
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack4(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0400 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0500
        * @tc.desc      : Local Video pause->stop->reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack5(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0500 end')
      done();
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0600
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0600
       * @tc.desc      : Local Video pause->resume->stop->reset
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack6(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0600 end')
      done();
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0700
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0700
       * @tc.desc      : Local Video stop->reset->pause->resume->stop->reset
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack7(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0700 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0800
        * @tc.desc      : Local Video stop->reset->pause->stop->reset
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack8(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0800 end')
      done();
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0900
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0900
       * @tc.desc      : Local Video start->pause->start(error)
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0900 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack9(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0900 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1000
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1000
        * @tc.desc      : Local Video start->stop->pause(error)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1000 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack10(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1000 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1100
        * @tc.desc      : Local Video audioEncoderMime
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack11(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_1100 end')
      done();
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0100
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0100
       * @tc.desc      : 音频录制，location对应的latitude和longitude为-30和60
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: -30, longitude: 60
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0100 end')
      done();
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0200
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0200
       * @tc.desc      : 音频录制，location对应的latitude和longitude为90和180
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 90, longitude: 180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0200 end')
      done();
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0300
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0300
       * @tc.desc      : 音频录制，location对应的latitude和longitude为60和-90
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 60, longitude: -90
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0300 end')
      done();
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0400
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0400
       * @tc.desc      : 音频录制，location对应的latitude和longitude为0和0
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 0, longitude: 0
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0400 end')
      done();
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0500
       * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0500
       * @tc.desc      : Local Video recorder with designated latitude and longitude
       * @tc.size      : MediumTest
       * @tc.type      : Function test
       * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 0, longitude: 180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0500 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0600
        * @tc.desc      : Local Video recorder with designated latitude and longitude
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: -90, longitude: -180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_FORMAT_API_0600 end')
      done();
    })


    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0100
        * @tc.desc      : Recorder pause->prepare 1000 times
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest01(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0100 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0101
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0101
        * @tc.desc      : Recorder audio 001.pause
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0101', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0101 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest001(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_FUNCTION_0101 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0200
        * @tc.desc      : Recorder audio channel
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest02(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0200 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0300
        * @tc.desc      : Recorder audio channel
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0300 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0400
        * @tc.desc      : Recorder audio resume->prepare
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest04(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0400 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0500
        * @tc.desc      : Recorder audio channel
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest05(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0500 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0600
        * @tc.desc      : Recorder audio pause->start
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest06(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0600 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0700
        * @tc.desc      : Recorder audio resume->start
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest07(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0700 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_0800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_0800
        * @tc.desc      : Recorder audio creatAVRecorder->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_0800', Level.LEVEL0, async (done: Function) => {
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest08(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_0800 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0900
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0900
        * @tc.desc      : Recorder audio prepare->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0900 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest09(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_START_API_0900 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1000
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1000
        * @tc.desc      : Recorder audio start->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1000 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest10(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1000 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1100
        * @tc.desc      : Recorder audio resume->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest11(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1100 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1200
        * @tc.desc      : Recorder audio stop->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest12(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1200 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1300
        * @tc.desc      : Recorder audio reset->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest13(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1300 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1400
        * @tc.desc      : Recorder audio all step->pause
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest14(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1400 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1500
        * @tc.desc      : Recorder audio pause three times
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest15(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PAUSE_API_1500 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1600
        * @tc.desc      : Recorder audio creatAVRecorder->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest16(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1600 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1700
        * @tc.desc      : Recorder audio prepare->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest17(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1700 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1800
        * @tc.desc      : Recorder audio start->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest18(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1800 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1900
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1900
        * @tc.desc      : Recorder audio pause->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1900 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest19(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_1900 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2000
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2000
        * @tc.desc      : Recorder audio stop->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2000 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest20(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2000 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2100
        * @tc.desc      : Recorder audio reset->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest21(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2100 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2200
        * @tc.desc      : Recorder audio all->resume
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest22(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2200 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2300
        * @tc.desc      : Recorder audio resume threee times
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest23(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESUME_API_2300 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2400
        * @tc.desc      : Recorder audio pause->stop
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest24(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2400 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2500
        * @tc.desc      : Recorder audio resume->stop
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest25(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_STOP_API_2500 end')
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2600
        * @tc.desc      : Recorder audio pause->reset
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest26(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2600 end')
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2700
        * @tc.desc      : Recorder audio resume->reset
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest27(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RESET_API_2700 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2800
        * @tc.desc      : Recorder audio pause->release
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest28(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2800 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2900
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2900
        * @tc.desc      : Recorder audio resume->release
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2900 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest29(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_2900 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_3000
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_3000
        * @tc.desc      : Recorder audio release 3 times
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_3000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_3000 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest30(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_RELEASE_API_3000 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3100
        * @tc.desc      : Recorder audio create->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest31(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3100 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3200
        * @tc.desc      : Recorder audio  prepare->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest32(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3200 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3300
        * @tc.desc      : Recorder audio  start->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest33(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3300 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3400
        * @tc.desc      : Recorder audio pause->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest34(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3400 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3500
        * @tc.desc      : Recorder audio resume->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest35(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3500 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3600
        * @tc.desc      : Recorder audio stop->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3600 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3700
        * @tc.desc      : Recorder audio reset->getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest37(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3700 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3800
        * @tc.desc      : Recorder audio getInputSurface 3 times
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest38(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETINPUTSURFACE_API_3800 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0100
        * @tc.desc      : Recorder audio createAVRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.createTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0100 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0200
        * @tc.desc      : Recorder audio AvRecorder.prepare
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.prepareTimeCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0200 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0300
        * @tc.desc      : AvRecorder.getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.getInputSurfaceTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0300 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0400
        * @tc.desc      : AvRecorder.start
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.startTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0400 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0500
        * @tc.desc      : AvRecorder.pause
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.pauseTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0500 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0600
        * @tc.desc      : AvRecorder.resume
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resumeTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0600 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0700
        * @tc.desc      : AvRecorder.stop
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.stopTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0700 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0800
        * @tc.desc      : AvRecorder.reset
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resetTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_CALLBACK_01_0800 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0100
        * @tc.desc      : AvRecorder.createAVRecorder
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.createTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0100 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0200
        * @tc.desc      : AvRecorder.prepare
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.prepareTimePromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0200 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0300
        * @tc.desc      : AvRecorder.getInputSurface
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.getInputSurfaceTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0300 end');
      done();
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0400
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0400
        * @tc.desc      : AvRecorder.start
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0400 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.startTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0400 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0500
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0500
        * @tc.desc      : AvRecorder.pause
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0500 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.pauseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0500 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0600
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0600
        * @tc.desc      : AvRecorder.resume
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0600 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resumeTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0600 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0700
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0700
        * @tc.desc      : AvRecorder.stop
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0700 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.stopTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0700 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0800
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0800
        * @tc.desc      : AvRecorder.reset
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0800 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resetTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0800 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0900
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0900
        * @tc.desc      : AvRecorder.release
        * @tc.size      : MediumTest
        * @tc.type      : Performance test
        * @tc.level     : Level 4
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0900 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.releaseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PERFORMANCE_PROMISE_01_0900 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_001
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_001
        * @tc.desc      : Recorder audio create->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_001', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_001 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest39(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_001 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_002
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_002
        * @tc.desc      : Recorder audio  prepare->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_002', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_002 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest40(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_002 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_003
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_003
        * @tc.desc      : Recorder audio  start->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_003', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_003 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest41(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_003 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_004
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_004
        * @tc.desc      : Recorder audio pause->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_004', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_004 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest42(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_004 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_005
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_005
        * @tc.desc      : Recorder audio resume->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_005', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_005 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest43(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_005 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_006
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_006
        * @tc.desc      : Recorder audio stop->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_006', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_006 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_006 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_007
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_007
        * @tc.desc      : Recorder audio reset->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_007', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_007 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest45(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_007 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0460
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0460
        * @tc.desc      : Recorder audio channel
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0460', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0460 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest46(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_PREPARE_API_0460 end')
      done();
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_008
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_008
        * @tc.desc      : Recorder audio create->getAVRecorderConfig
        * @tc.size      : MediumTest
        * @tc.type      : Reliabilit test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_008', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_008 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest47(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_GETAVRECORDERCONFIG_API_008 end');
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0100
        * @tc.desc      : Recorder audio setmetadata
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0100 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest01(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0100 end')
      done();
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0200
        * @tc.desc      : Recorder audio setmetadata
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0200 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest02(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0200 end')
      done();
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0300
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0300
        * @tc.desc      : Recorder audio setmetadata
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0300 start')
      let fileName: string = commonFun.resourceNameAac();
      expect(fileName).not().assertNull();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest03(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AAC_AUDIO_RECORDER_SETMETADATA_0300 end')
      done();
    })
  })
}


/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import testapi from 'libavrecorderndk.so'
import fs from '@ohos.file.fs'
import Utils from './Utils';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import AVRecorderNdkTestBase from './AVRecorderNdkTestBase';
import camera from '@ohos.multimedia.camera'

const Tag = 'OHAVRecorderNdk_test:';
let avRecorderNdkTestBase = new AVRecorderNdkTestBase();
let fdObject: ESObject;
let fdPath: string;
let videoFrameWidth: number;
let videoFrameHeight: number;
let audioSampleRate: number;
let audioBitrate: number;

export default function OhAVRecorderNDKMp3Test() { // L2
  describe('OhAVRecorderNDKMp3Test', () => {

    beforeAll(async () => {
      console.info(`case to beforeAll `);
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
          'ohos.permission.MICROPHONE'];
      await avRecorderNdkTestBase.getPermission(permissionNames);
      await avRecorderNdkTestBase.msleepAsync(200);
      await avRecorderNdkTestBase.driveFn(3);
      await avRecorderNdkTestBase.msleepAsync(200);

    });
    beforeEach(async () => {
      await avRecorderNdkTestBase.msleepAsync(3000);
      console.info(`case to beforeEach `);
      //-当使用MP3编码格式时，采样率和比特率的映射关系：
      //- 采样率使用16K以下时，对应比特率范围为[8000 - 64000]。
      //- 采样率使用16K~32K时对应的比特率范围为[8000 - 160000]。
      //- 采样率使用32K以上时对应的比特率范围为[32000 - 320000]。

      //audioSampleRate随机数MP3编码支持采样率范围[8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000]
      let audioSampleRateList: Array<number> = [8000, 11025, 12000, 16000]
      let audioSampleRateIndex: number = Math.floor(Math.random() * audioSampleRateList.length)
      audioSampleRate = audioSampleRateList[audioSampleRateIndex]

      //audioBitrate随机数MP3编码格式支持范围[8000, 16000, 32000, 40000, 48000, 56000, 64000, 80000,
      // 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000]
      let audioBitrateList: Array<number> = [8000, 16000, 32000, 40000, 48000, 56000, 64000]
      let audioBitrateIndex: number = Math.floor(Math.random() * audioBitrateList.length)
      audioBitrate = audioBitrateList[audioBitrateIndex]

    });
    afterEach(async () => {
      console.info(`case to afterEach `);
      if (!avRecorderNdkTestBase.isRelease) {
        console.info(`case to releaseAVRecorder isRelease==false`);
        let result = await testapi.releaseAVRecorder();
        expect(result).assertEqual(0);
        await avRecorderNdkTestBase.closeFd(fdObject.fdNumber);
      }
    });
    afterAll(() => {

    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0010
     * @tc.name       : testOhAvRecorder_mp3_success_0010
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0010', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0010 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0010 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00101
     * @tc.name       : testOhAvRecorder_mp3_success_00101
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00101', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00101 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00101 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00102
     * @tc.name       : testOhAvRecorder_mp3_success_00102
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00102', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00102 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //resume err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00102 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00103
     * @tc.name       : testOhAvRecorder_mp3_success_00103
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00103', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00103 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00103 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00104
     * @tc.name       : testOhAvRecorder_mp3_success_00104
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00104', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00104 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resuem recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00104 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00105
     * @tc.name       : testOhAvRecorder_mp3_success_00105
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00105', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00104 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00104 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00106
     * @tc.name       : testOhAvRecorder_mp3_success_00106
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00106', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00106 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resuem recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00106 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00107
     * @tc.name       : testOhAvRecorder_mp3_success_00107
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00107', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00107 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resuem recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00107 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00108
     * @tc.name       : testOhAvRecorder_mp3_success_00108
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00108', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00108 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resuem recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00108 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_00109
     * @tc.name       : testOhAvRecorder_mp3_success_00109
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_00109', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_00109 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,

        //resuem err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,

        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_00109 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_002
     * @tc.name       : testOhAvRecorder_mp3_success_002
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_002 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_002 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0021
     * @tc.name       : testOhAvRecorder_mp3_success_0021
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0021', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0021 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0021 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0022
     * @tc.name       : testOhAvRecorder_mp3_success_0022
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0022', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0022 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //resume err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0022 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0023
     * @tc.name       : testOhAvRecorder_mp3_success_0023
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0023', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0023 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0023 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0024
     * @tc.name       : testOhAvRecorder_mp3_success_0024
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0024', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0024 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0024 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0025
     * @tc.name       : testOhAvRecorder_mp3_success_0025
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0025', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0025 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0025 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0026
     * @tc.name       : testOhAvRecorder_mp3_success_0026
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0026', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0026 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0026 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0027
     * @tc.name       : testOhAvRecorder_mp3_success_0027
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0027', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0027 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait recorder
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //stop err recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0027 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_0028
     * @tc.name       : testOhAvRecorder_mp3_success_0028
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_0028', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_0028 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT
      );
      let loopTimes = 3;
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          //prepare err recorder
          avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        )
      }
      mySteps.push(
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      )
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_0028 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_003
     * @tc.name       : testOhAvRecorder_mp3_success_003
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_003 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_003 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_004
     * @tc.name       : testOhAvRecorder_mp3_success_004
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_004 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        // pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        // resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_004 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_005
     * @tc.name       : testOhAvRecorder_mp3_success_005
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_005', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_005 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,

        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,

        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_005 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_006
     * @tc.name       : testOhAvRecorder_mp3_success_006
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_006', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_006 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,

        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //stop err recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_006 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_mp3_success_007
     * @tc.name       : testOhAvRecorder_mp3_success_007
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_mp3_success_007', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_mp3_success_007 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceMP3Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 9,
        audioCodec: 4,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //start err  recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        // wait 2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //check video
        avRecorderNdkTestBase.CHECK_VIDEO_EVENT,
        //check set mute when interrupted
        avRecorderNdkTestBase.SET_WILL_MUTE_WHEN_INTERRUPTED,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_mp3_success_007 test end `);
    });
  });
}
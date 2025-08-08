/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
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

export default function OhAVRecorderNDKAacTest() { // L2
  describe('OhAVRecorderNDKAacTest', () => {

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

      //audioSampleRate随机数AAC编码支持采样率范围[8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000]
      let audioSampleRateList: Array<number> = [8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000]
      let audioSampleRateIndex: number = Math.floor(Math.random() * audioSampleRateList.length)
      audioSampleRate = audioSampleRateList[audioSampleRateIndex]

      //audioBitrate随机数AAC编码格式支持范围[32000, 40000, 48000, 56000, 64000, 80000]
      let audioBitrateList: Array<number> = [32000, 40000, 48000, 56000, 64000]
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
     * @tc.number     : testOhAvRecorder_aac_success_001
     * @tc.name       : testOhAvRecorder_aac_success_001
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_001 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_001 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_002
     * @tc.name       : testOhAvRecorder_aac_success_002
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_002 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_002 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_003
     * @tc.name       : testOhAvRecorder_aac_success_003
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_003', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_003 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_003 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_004
     * @tc.name       : testOhAvRecorder_aac_success_004
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_004', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_004 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_004 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_005
     * @tc.name       : testOhAvRecorder_aac_success_005
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_005', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_005 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_005 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_006
     * @tc.name       : testOhAvRecorder_aac_success_006
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_006', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_006 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_006 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_007
     * @tc.name       : testOhAvRecorder_aac_success_007
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_007', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_007 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
        //resume err recorder
        avRecorderNdkTestBase.RESUME_RECORDER_ERR_EVENT,
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
      console.info(`testOhAvRecorder_aac_success_007 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_008
     * @tc.name       : testOhAvRecorder_aac_success_008
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_008', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_008 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_008 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_009
     * @tc.name       : testOhAvRecorder_aac_success_009
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_009', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_009 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_009 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_010
     * @tc.name       : testOhAvRecorder_aac_success_010
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_010', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_010 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_010 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_011
     * @tc.name       : testOhAvRecorder_aac_success_011
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_011', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_011 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_011 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_012
     * @tc.name       : testOhAvRecorder_aac_success_012
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_012', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_012 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_012 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_013
     * @tc.name       : testOhAvRecorder_aac_success_013
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_013', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_013 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_013 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_014
     * @tc.name       : testOhAvRecorder_aac_success_014
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_014', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_014 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_014 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_015
     * @tc.name       : testOhAvRecorder_aac_success_015
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_015', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_015 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_015 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_016
     * @tc.name       : testOhAvRecorder_aac_success_016
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_016', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_016 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_016 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_017
     * @tc.name       : testOhAvRecorder_aac_success_017
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_017', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_017 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_017 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_018
     * @tc.name       : testOhAvRecorder_aac_success_018
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_018', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_018 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_018 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_019
     * @tc.name       : testOhAvRecorder_aac_success_019
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_019', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_019 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_019 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_020
     * @tc.name       : testOhAvRecorder_aac_success_020
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_020', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_020 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_020 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_021
     * @tc.name       : testOhAvRecorder_aac_success_021
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_021', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_021 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_021 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_022
     * @tc.name       : testOhAvRecorder_aac_success_022
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_022', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_022 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_022 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_023
     * @tc.name       : testOhAvRecorder_aac_success_023
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_023', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_023 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
      console.info(`testOhAvRecorder_aac_success_023 test end `);
    });

    /**
     * @tc.number     : testOhAvRecorder_aac_success_024
     * @tc.name       : testOhAvRecorder_aac_success_024
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_aac_success_024', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_aac_success_024 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceAACName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 11,
        audioCodec: 3,
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
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_aac_success_024 test end `);
    });
  });
}
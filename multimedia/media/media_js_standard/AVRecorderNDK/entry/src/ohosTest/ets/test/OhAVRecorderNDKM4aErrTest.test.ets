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
import camera from '@ohos.multimedia.camera';

const Tag = 'OHAVRecorderNdk_test:';
let avRecorderNdkTestBase = new AVRecorderNdkTestBase();
let fdObject: ESObject;
let fdPath: string;
let audioSampleRate: number;
let audioBitrate: number;


export default function OhAVRecorderNDKM4aErrTest() { // L2
  describe('OhAVRecorderNDKM4aErrTest', () => {

    beforeAll(async () => {
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
          'ohos.permission.MICROPHONE'];
      await avRecorderNdkTestBase.getPermission(permissionNames);
      await avRecorderNdkTestBase.msleepAsync(200);
      await avRecorderNdkTestBase.driveFn(3);
      await avRecorderNdkTestBase.msleepAsync(200);
    });
    beforeEach(async () => {
      console.info(`case to beforeEach `);
      await avRecorderNdkTestBase.msleepAsync(2000);
        //audioSampleRate随机数
        // [8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000]
        let audioSampleRateList: Array<number> =
          [8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000]
        let audioSampleRateIndex: number = Math.floor(Math.random() * audioSampleRateList.length)
        audioSampleRate = audioSampleRateList[audioSampleRateIndex]

        //audioBitrate随机数AAC编码格式支持比特率范围[32000 - 500000]
        let audioBitrateList: Array<number> = [32000, 40000, 48000, 56000, 64000, 80000,
          96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000, 500000]
        let audioBitrateIndex: number = Math.floor(Math.random() * audioBitrateList.length)
        audioBitrate = audioBitrateList[audioBitrateIndex]

    });
    afterEach(async () => {
      console.info(`case to afterEach `);
        console.info(`case to releaseAVRecorder isRelease==false`);
        let result = await testapi.releaseAVRecorder();
        expect(result).assertEqual(0);
        await avRecorderNdkTestBase.closeFd(fdObject.fdNumber);
    });
    afterAll(() => {

    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0011
     * @tc.number testOhAvRecorder_m4a_errorevent_0011
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0011', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0011 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //stop err recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //pause err recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0011 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0012
     * @tc.number testOhAvRecorder_m4a_errorevent_0012
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0012', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0012 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0012 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0013
     * @tc.number testOhAvRecorder_m4a_errorevent_0013
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0013', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0013 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0013 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0014
     * @tc.number testOhAvRecorder_m4a_errorevent_0014
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0014', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0014 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0014 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0015
     * @tc.number testOhAvRecorder_m4a_errorevent_0015
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0015', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0015 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0015 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0016
     * @tc.number testOhAvRecorder_m4a_errorevent_0016
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0016', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0016 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
      );
      let loopTimes = 3;
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          //prepare recorder
          avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
          //start recorder
          avRecorderNdkTestBase.START_RECORDER_EVENT,
          //prepare err recorder
          avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
          //start err recorder
          avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
          //2s
          avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
          //reset recorder
          avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        )
      }
      mySteps.push(
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      )
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0016 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0021
     * @tc.number testOhAvRecorder_m4a_errorevent_0021
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0021', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0021 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //pause err recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0021 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0022
     * @tc.number testOhAvRecorder_m4a_errorevent_0022
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0022', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0022 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0022 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0023
     * @tc.number testOhAvRecorder_m4a_errorevent_0023
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0023', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0023 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0023 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0024
     * @tc.number testOhAvRecorder_m4a_errorevent_0024
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0024', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0024 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0024 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0025
     * @tc.number testOhAvRecorder_m4a_errorevent_0025
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0025', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0025 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0025 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0026
     * @tc.number testOhAvRecorder_m4a_errorevent_0026
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0026', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0026 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0026 test end `);
    });


    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0027
     * @tc.number testOhAvRecorder_m4a_errorevent_0027
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0027', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0027 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
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
        //start error recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0027 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0031
     * @tc.number testOhAvRecorder_m4a_errorevent_0031
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0031', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0031 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //stop error recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0031 test end `);
    });

    /**
     * @tc.name   testOhAvRecorder_m4a_errorevent_0041
     * @tc.number testOhAvRecorder_m4a_errorevent_0041
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvRecorder_m4a_errorevent_0041', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvRecorder_m4a_errorevent_0041 test start `);
      let fileName: string = avRecorderNdkTestBase.resourceM4AName();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        fileFormat: 6,
        audioSampleRate: audioSampleRate,
        audioBitrate: audioBitrate,
        recorderTimer: 2000
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //stop error recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_m4a_errorevent_0041 test end `);
    });


  });
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import avplayer from 'libavplayerndk.so'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';
import media from '@ohos.multimedia.media';

enum OH_AVErrCode {
  /**
   * @error the operation completed successfully.
   */
  AV_ERR_OK = 0,
  /**
   * @error opertation not be permitted.
   */
  AV_ERR_OPERATE_NOT_PERMIT = 2,
  /**
   * @error invalid argument.
   */
  AV_ERR_INVALID_VAL = 3,

  AV_ERR_INVALID_STATE = 8,
}
const MAX_COUNT = 999999999;
const VIDEO_RESOURCE_TRACK_COUNT = 2;
const FAIL = -1;
const VIDEO_DURATION_MS = 10034;
const SLEEP_TIMES = 3;

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export function getUrl(descriptor: media.AVFileDescriptor): string {
  let fd: string = descriptor.fd.toString();
  let offset: string = descriptor.offset!.toString();
  let length: string = descriptor.length!.toString();
  let url: string = "fd://" + fd + "?offset=" + offset + "&size=" + length;
  console.info('file url: ' + url);
  return url;
}

export async function getFile(filepath: string): Promise<media.AVFileDescriptor> {
  console.info("open file: " + filepath);
  let file = await fs.open(filepath)
  let stat = await fs.stat(filepath)
  let fileDescriptor: media.AVFileDescriptor = {
    fd: file.fd,
    offset: 0,
    length: stat.size
  }
  console.info('file fd: ' + fileDescriptor.fd + ', length: ' + fileDescriptor.length);
  return fileDescriptor;
}

export default function OhAVPlayerNDKTest() {
  describe('OhAVPlayerNDKTest', () => {
    let fileDescriptor: media.AVFileDescriptor;
    let twoAudioFileFd: media.AVFileDescriptor;
    let testContext: common.UIAbilityContext;
    let filePath: string;
    let fileSize: number;
    beforeAll(async () => {
      console.info("====> OhAVPlayerNDKTest beforeAll case");
      testContext = AppStorage.get('testContext') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/H264_AAC.mp4"
      fileDescriptor = await getFile(filePath);
      fileSize = fileDescriptor.length as number;
      twoAudioFileFd = await getFile(testContext.filesDir + "/H264_AAC_2audio.mp4");
      console.info("====> OhAVPlayerNDKTest beforeAll case end");
    });
    beforeEach(async () => {
    });
    afterEach(async () => {
    });
    afterAll(async () => {
      console.info("====> OhAVPlayerNDKTest afterAll case");
      await fs.close(fileDescriptor.fd);
      await fs.close(twoAudioFileFd.fd);
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0001
     * @tc.desc   Test OH_AVPlayer_SetVideoSuperResolutionEnable, input true
     *            testOhAvPlayerNdkSetSuperResolution0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0001', Level.LEVEL0,async (done: Function) => {
      let testResult:avplayer.NdkAVPlayerResult = avplayer.testSetVideoSuperResolution(fileDescriptor, true);
      expect(testResult.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkSuperResolutionState(testResult.userData, true)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0002
     * @tc.desc   Test OH_AVPlayer_SetVideoSuperResolutionEnable, input false
     *            testOhAvPlayerNdkSetSuperResolution0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0002', Level.LEVEL0,async (done: Function) => {
      let testResult:avplayer.NdkAVPlayerResult = avplayer.testSetVideoSuperResolution(fileDescriptor, false);
      expect(testResult.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkSuperResolutionState(testResult.userData, false)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0003
     * @tc.desc   Test OH_AVPlayer_SetVideoSuperResolutionEnable, input null avplayer
     *            testOhAvPlayerNdkSetSuperResolution0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETSUPERRESOLUTION_0003', Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.testSetVideoSuperResolutionError();
      expect(result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0001
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input 320x320
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0001', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 320, 320);
      expect(testResult.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0002
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input 720x480
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0002', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 720, 480);
      expect(testResult.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0003
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input 1920x1080
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0003', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 1920, 1080);
      expect(testResult.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0004
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input invalid videosize 240x240
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0004', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 240, 240);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0005
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0005
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input invalid videosize 8192x8192
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0005', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 8192, 8192);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0007
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0007
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input invalid value -1
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0007', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, -1, -1);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0008
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0008
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input invalid value 0
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0008', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testSetTargetVideoWindowSize(fileDescriptor, 0, 0);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0009
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0009
     * @tc.desc   Test OH_AVPlayer_SetTargetVideoWindowSize, input null avplayer
     *            testOhAvPlayerNdkSetTargetVideoWindowSize0009
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETTARGETVIDEOWINDOWSIZE_0009', Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.testSetTargetVideoWindowSizeError();
      expect(result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0001
     * @tc.desc   Test OH_AVPlayer_GetPlaybackInfo
     *            testOhAvPlayerNdkGetPlaytbackInfo0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0001', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.testGetPlaybackInfo(fileDescriptor);
      await sleep(1000);
      let playbackInfo = avplayer.checkPlaybackInfo(testResult.userData);
      console.info(`SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0001 paybackInfo: ${JSON.stringify(playbackInfo)}`);
      expect(playbackInfo["server_ip_address"]).assertEqual("");
      expect(playbackInfo["average_download_rate"]).assertEqual(0);
      expect(playbackInfo["download_rate"]).assertEqual(0);
      expect(playbackInfo["is_downloading"]).assertEqual(0);
      expect(playbackInfo["buffer_duration"]).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0002
     * @tc.desc   Test OH_AVPlayer_GetPlaybackInfo, input null avplayer
     *            testOhAvPlayerNdkGetPlaytbackInfo0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKINFO_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.testGetPlaybackInfoError();
      expect(result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0001
     * @tc.desc   Test OH_AVPlayer_GetTrackCount
     *            testOhAvPlayerNdkGetTrackCount0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackCount(fileDescriptor, false);
      await sleep(2000);
      expect(avplayer.checkTrackCount(testResult.userData)).assertEqual(VIDEO_RESOURCE_TRACK_COUNT);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0002
     * @tc.desc   Test OH_AVPlayer_GetTrackCount, input null avplayer
     *            testOhAvPlayerNdkGetTrackCount0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKCOUNT_0002', Level.LEVEL0, async (done: Function) => {
      let result = avplayer.testGetTrackCount(fileDescriptor, true);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0001
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video codec mime
     *            testOhAvPlayerNdkGetTrackFormat0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackforamt = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackforamt)}`);
      expect(trackforamt?.['codec_mime']).assertEqual("video/avc");
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0002
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video track_type
     *            testOhAvPlayerNdkGetTrackFormat0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackforamt = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackforamt)}`);
      expect(trackforamt?.['track_type']).assertEqual(media.MediaType.MEDIA_TYPE_VID);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0003
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video bitrate
     *            testOhAvPlayerNdkGetTrackFormat0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackforamt = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackforamt)}`);
      expect(trackforamt?.['bitrate']).assertEqual(1366541);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0004
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video frame_rate
     *            testOhAvPlayerNdkGetTrackFormat0004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0004', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['frame_rate']).assertEqual(6000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0005
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0005
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video height
     *            testOhAvPlayerNdkGetTrackFormat0005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0005', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['height']).assertEqual(480);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0006
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0006
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, video width
     *            testOhAvPlayerNdkGetTrackFormat0006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0006', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 0, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['width']).assertEqual(720);
      done();
    });
   
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0008
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0008
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio codec_mime
     *            testOhAvPlayerNdkGetTrackFormat0008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0008', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['codec_mime']).assertEqual('audio/mp4a-latm');
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0009
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0009
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio track_type
     *            testOhAvPlayerNdkGetTrackFormat0009
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0009', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['track_type']).assertEqual(media.MediaType.MEDIA_TYPE_AUD);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0010
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0010
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio bitrate
     *            testOhAvPlayerNdkGetTrackFormat0010
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0010', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['bitrate']).assertEqual(129507);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0011
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0011
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio channel_count
     *            testOhAvPlayerNdkGetTrackFormat0011
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0011', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['channel_count']).assertEqual(2);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0012
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0012
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio sample_rate
     *            testOhAvPlayerNdkGetTrackFormat0012
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0012', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['sample_rate']).assertEqual(44100);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0013
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0013
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, audio language
     *            testOhAvPlayerNdkGetTrackFormat0013
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0013', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat?.['language']).assertEqual('und');
      done();
    });
    
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0017
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0017
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, input trackIndex -1
     *            testOhAvPlayerNdkGetTrackFormat0017
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0017', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, -1, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat).assertEqual(undefined);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0018
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0018
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, input trackIndex 9999
     *            testOhAvPlayerNdkGetTrackFormat0018
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0018', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testGetTrackFormat(fileDescriptor, 9999, false);
      await sleep(2000);
      let trackFormat = avplayer.checkTrackFormat(testResult!.userData);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat).assertEqual(undefined);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0020
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0020
     * @tc.desc   Test OH_AVPlayer_GetTrackFormat, input null avplayer
     *            testOhAvPlayerNdkGetTrackFormat0020
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETTRACKFORMAT_0020', Level.LEVEL0, async (done: Function) => {
      let trackFormat = avplayer.testGetTrackFormat(fileDescriptor, 0, true);
      console.info(`trackFormat: ${JSON.stringify(trackFormat)}`);
      expect(trackFormat).assertEqual(undefined);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0001
     * @tc.desc   Test OH_AVPlayer_GetCurrentPosition
     *            testOhAvPlayerNdkGetPlaybackPosition0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0001', Level.LEVEL0, async (done: Function) => {
      let testResult: avplayer.NdkAVPlayerResult = avplayer.playVideo(fileDescriptor);
      await sleep(2000);
      expect(avplayer.checkPlaybackPosition(testResult.userData)).assertLarger(0);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0002
     * @tc.desc   Test OH_AVPlayer_GetCurrentPosition, input null avplayer
     *            testOhAvPlayerNdkGetPlaybackPosition0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKPOSITION_0002', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.testGetPlaybackPositionError();
      expect(ret).assertEqual(-1);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_TRACKCHANGE_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_TRACKCHANGE_0001
     * @tc.desc   Test Track Change Callback
     *            testOhAvPlayerNdkTrackChange0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_TRACKCHANGE_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testTrackChange(twoAudioFileFd, 2);
      await sleep(2000);
      expect(avplayer.checkTrackChange(testResult.userData)).assertEqual(2);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0011
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0011
     * @tc.desc   Test OH_AVPlayer_SetMediaSource, create MediaSource by dataSource
     *            testOhAvPlayerNdkSetMediaSource0011
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0011', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithDataSource(1, fileDescriptor);
      
      console.info("====> testOhAvPlayerNdkSetMediaSource0011 testResult:" + (testResult != undefined));
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL)
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0021
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0021
     * @tc.desc   Test OH_AVPlayer_SetMediaSource, create MediaSource by dataSource
     *            testOhAvPlayerNdkSetMediaSource0011
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_SETMEDIASOURCE_0021', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithDataSource(0, fileDescriptor);
      
      console.info("====> testOhAvPlayerNdkSetMediaSource0011 testResult:" + (testResult != undefined));
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK)
      done();
    });
    
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_DESTROY_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_DESTROY_0001
     * @tc.desc   Test OH_AVHttpHeader_Destroy, input null avplayer
     *            testOhAvHttpHeaderNdkDestroy0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_DESTROY_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderDestroyError();
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0001
     * @tc.desc   Test OH_AVHttpHeader_AddRecord, input null AVHttpHeader
     *            testOhAvHttpHeaderNdkAddRecorder0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderAddRecordError(1, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0002
     * @tc.desc   Test OH_AVHttpHeader_AddRecord, input empty string
     *            testOhAvHttpHeaderNdkAddRecorder0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderAddRecordError(0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0003
     * @tc.desc   Test OH_AVHttpHeader_AddRecord, input nullptr value
     *            testOhAvHttpHeaderNdkAddRecorder0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_ADDRECORDER_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderAddRecordError(0, 1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0001
     * @tc.desc   Test OH_AVHttpHeader_GetCount, input 2 record
     *            testOhAvHttpHeaderNdkGetCount0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetCount();
      expect(testResult).assertEqual(2);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0002
     * @tc.desc   Test OH_AVHttpHeader_GetCount, input null AVHttpHeader
     *            testOhAvHttpHeaderNdkGetCount0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetCountError(0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0003
     * @tc.desc   Test OH_AVHttpHeader_GetCount, input null count pointer
     *            testOhAvHttpHeaderNdkAddGetCount0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETCOUNT_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetCountError(1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0001
     * @tc.desc   Test OH_AVHttpHeader_GetRecord
     *            testOhAvHttpHeaderNdkGetRecord0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetRecord(0, 0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0002
     * @tc.desc   Test OH_AVHttpHeader_GetRecord, input null avHttpHeader
     *            testOhAvHttpHeaderNdkGetRecord0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetRecord(1, 0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0003
     * @tc.desc   Test OH_AVHttpHeader_GetRecord, input index -1
     *            testOhAvHttpHeaderNdkGetRecord0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetRecord(0, 1, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0004
     * @tc.desc   Test OH_AVHttpHeader_GetRecord, input empty string
     *            testOhAvHttpHeaderNdkGetRecord0004
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVHTTPHEADER_GETRECORD_0004', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVHttpHeaderGetRecord(0, 0, 1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0001
     * @tc.desc   Test OH_MediaSource_CreateWithUrl, input empty string
     *            testOhAvMediaSourceCreateWithUrl0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithUrl(1, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0002
     * @tc.desc   Test OH_MediaSource_CreateWithUrl, input null string ptr
     *            testOhAvMediaSourceCreateWithUrl0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithUrl(2, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0003
     * @tc.desc   Test OH_MediaSource_CreateWithUrl, input null avHttpHeader
     *            testOhAvMediaSourceCreateWithUrl0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithUrl(0, 1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0004
     * @tc.desc   Test OH_MediaSource_CreateWithUrl
     *            testOhAvMediaSourceCreateWithUrl0004
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_CREATEWITHURL_0004', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceCreateWithUrl(0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0001
     * @tc.desc   Test OH_MediaSource_SetMimeType, intput null mediasource
     *            testOhAvMediaSourceSetMimeType0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(1, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0002
     * @tc.desc   Test OH_MediaSource_SetMimeType, intput empty string
     *            testOhAvMediaSourceSetMimeType0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(0, 1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0003
     * @tc.desc   Test OH_MediaSource_SetMimeType, intput null string
     *            testOhAvMediaSourceSetMimeType0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(0, 2);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0004
     * @tc.desc   Test OH_MediaSource_SetMimeType
     *            testOhAvMediaSourceSetMimeType0004
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMIMETYPE_0004', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0001
     * @tc.desc   Test OH_AVPlayer_SetMediaSource, input null avplayer
     *            testAVPlayerSetMediaSource0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(1, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0002
     * @tc.desc   Test OH_AVPlayer_SetMediaSource, input null mediasource
     *            testAVPlayerSetMediaSource0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(0, 1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0003
     * @tc.desc   Test OH_AVPlayer_SetMediaSource
     *            testAVPlayerSetMediaSource0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCE_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testMediaSourceSetMimeType(0, 0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCELOADER_DESTROY_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCELOADER_DESTROY_0001
     * @tc.desc   Test OH_AVMediaSourceLoader_Destroy, input null avMediaSourceLoader
     *            testAVMediaSourceLoaderDestroyError
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCELOADER_DESTROY_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderDestroyError();
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0001
     * @tc.desc   Test OH_AVMediaSource_SetMediaSourceLoader, input null avMediaSourceLoader
     *            testAVMediaSourceSetMediaSourceLoaderError0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceSetMediaSourceLoaderError(0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0002
     * @tc.desc   Test OH_AVMediaSource_SetMediaSourceLoader, input null avMediaSource
     *            testAVMediaSourceSetMediaSourceLoaderError0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_MEDIASOURCE_SETMEDIASOURCELOADER_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceSetMediaSourceLoaderError(1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETURL_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETURL_0001
     * @tc.desc   Test OH_AVMediaSourceLoadingRequest_GetUrl, input null AVMediaSourceLoadingRequest
     *            testAVMetaSourceLoadingRequestGetUrlError
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETURL_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMetaSourceLoadingRequestGetUrlError();
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0001
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceOpenCallback, input null avMediaSourceLoader
     *            testAVMediaSourceLoaderSetSourceOpenCallbackError0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceOpenCallback(0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0002
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceOpenCallback, input null callback
     *            testAVMediaSourceLoaderSetSourceOpenCallbackError0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceOpenCallback(1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0003
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceOpenCallback, input null userdata
     *            testAVMediaSourceLoaderSetSourceOpenCallbackError0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEOPENCALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceOpenCallback(2);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0001
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceReadCallback, input null avMediaSourceLoader
     *            testAVMediaSourceLoaderSetSourceReadCallback0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceReadCallback(0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0002
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceReadCallback, input null callback
     *            testAVMediaSourceLoaderSetSourceReadCallback0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceReadCallback(1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0003
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceReadCallback, input null userdata
     *            testAVMediaSourceLoaderSetSourceReadCallback0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCEREADCALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceReadCallback(2);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0001
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceCloseCallback, input null avMediaSourceLoader
     *            testAVMediaSourceLoaderSetSourceCloseCallback0001
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceCloseCallback(0);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0002
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceCloseCallback, input null callback
     *            testAVMediaSourceLoaderSetSourceCloseCallback0002
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceCloseCallback(1);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0003
     * @tc.desc   Test OH_AVMediaSourceLoader_SetSourceCloseCallback, input null userdata
     *            testAVMediaSourceLoaderSetSourceCloseCallback0003
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADER_SETSOURCECLOSECALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoaderSetSourceCloseCallback(2);
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETHTTPHEADER_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETHTTPHEADER_0001
     * @tc.desc   Test OH_AVMediaSourceLoadingRequest_GetHttpHeader, input null avMediaSourceLoadingRequest
     *            testAVMediaSourceLoadingRequestGetHttpHeaderError
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_AVMEDIASOURCELOADINGREQUEST_GETHTTPHEADER_0001', Level.LEVEL0, async (done: Function) => {
      let testResult = avplayer.testAVMediaSourceLoadingRequestGetHttpHeaderError();
      expect(testResult).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number testOhAVPlayerSetPlaybackRange001
     * @tc.name   testOhAVPlayerSetPlaybackRange001
     * @tc.desc   test OH_AVPlayer_SetMediaMuted
     *            testOhAVPlayerSetPlaybackRange001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange001 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, 0, 0, true);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange001 test end `);
      done();
    });

    /**
     * @tc.number testOhAVPlayerSetPlaybackRange002
     * @tc.name   testOhAVPlayerSetPlaybackRange002
     * @tc.desc   test OH_AVPlayer_SetMediaMuted
     *            testOhAVPlayerSetPlaybackRange002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange002', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange002 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, 0, 0, false);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange002 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange003
     * @tc.name   testOhAVPlayerSetPlaybackRange003
     * @tc.desc   test OH_AVPlayer_SetMediaMuted
     *            testOhAVPlayerSetPlaybackRange003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange003', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange003 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, 0, -1, true);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange003 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange004
     * @tc.name   testOhAVPlayerSetPlaybackRange004
     * @tc.desc   Set the Playback Range of player.
     *            testOhAVPlayerSetPlaybackRange004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange004', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange004 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, 0, -1, false);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange004 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange005
     * @tc.name   testOhAVPlayerSetPlaybackRange005
     * @tc.desc   Set the Playback Range of player.
     *            testOhAVPlayerSetPlaybackRange005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange005', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange005 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, -1, 0, true);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange005 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange006
     * @tc.name   testOhAVPlayerSetPlaybackRange006
     * @tc.desc   Set the Playback Range of player.
     *            testOhAVPlayerSetPlaybackRange006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange006', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange006 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, 0, -1, false);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange006 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange007
     * @tc.name   testOhAVPlayerSetPlaybackRange007
     * @tc.desc   Set the Playback Range of player.
     *            testOhAVPlayerSetPlaybackRange007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange007', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange007 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, -1, -1, true);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange007 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackRange008
     * @tc.name   testOhAVPlayerSetPlaybackRange008
     * @tc.desc   Set the Playback Range of player.
     *            testOhAVPlayerSetPlaybackRange008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRange008', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRange008 test start `);
      let player = avplayer.OhAVPlayerSetPlaybackRange(fileDescriptor, -1, -1, false);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSetPlaybackRange008 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted001
     * @tc.name   testOhAVPlayerSetMediaMuted001
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted001', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted001 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(0, true, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      console.info(`testOhAVPlayerSetMediaMuted001 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted002
     * @tc.name   testOhAVPlayerSetMediaMuted002
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted002', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted002 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(0, false, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      console.info(`testOhAVPlayerSetMediaMuted002 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted003
     * @tc.name   testOhAVPlayerSetMediaMuted003
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted003', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted003 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(1, true, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      console.info(`testOhAVPlayerSetMediaMuted003 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted004
     * @tc.name   testOhAVPlayerSetMediaMuted004
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted004', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted004 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(1, false, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      console.info(`testOhAVPlayerSetMediaMuted004 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted005
     * @tc.name   testOhAVPlayerSetMediaMuted005
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted005', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted005 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(2, true, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted005 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted006
     * @tc.name   testOhAVPlayerSetMediaMuted006
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted006
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted006', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted006 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(2, false, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted006 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted007
     * @tc.name   testOhAVPlayerSetMediaMuted007
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted007
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted007', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted007 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(5, true, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted007 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted008
     * @tc.name   testOhAVPlayerSetMediaMuted008
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted008
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted008', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted008 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(5, false, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted008 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted009
     * @tc.name   testOhAVPlayerSetMediaMuted009
     * @tc.desc   Set the Muted State of player.
     *            testOhAVPlayerSetMediaMuted009
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted009', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted009 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(6, true, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted009 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetMediaMuted0010
     * @tc.name   testOhAVPlayerSetMediaMuted0010
     * @tc.desc   test OH_AVPlayer_SetMediaMuted
     *            testOhAVPlayerSetMediaMuted010
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMuted0010', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetMediaMuted0010 test start `);
      let player = avplayer.OhAVPlayerSetMediaMuted(6, false, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerSetMediaMuted0010 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerAddURLSubtitleSource001
     * @tc.name   testOhAVPlayerAddURLSubtitleSource001
     * @tc.desc   Set the Subtitle Source of player.
     *            testOhAVPlayerAddURLSubtitleSource001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerAddURLSubtitleSource001', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerAddURLSubtitleSource001 test start `);
      let subtitle = await getFile(`${testContext.filesDir}/srt_3200.srt`);
      let player = avplayer.OhAVPlayerAddURLSubtitleSource(`fd://${subtitle.fd}`, fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await fs.close(subtitle.fd);
      console.info(`testOhAVPlayerAddURLSubtitleSource001 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerAddURLSubtitleSource002
     * @tc.name   testOhAVPlayerAddURLSubtitleSource002
     * @tc.desc   Set the Subtitle Source of player.
     *            testOhAVPlayerAddURLSubtitleSource002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerAddURLSubtitleSource002', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerAddURLSubtitleSource002 test start `);
      let player = avplayer.OhAVPlayerAddURLSubtitleSource("", fileDescriptor);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      console.info(`testOhAVPlayerAddURLSubtitleSource002 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerAddFDSubtitleSource001
     * @tc.name   testOhAVPlayerAddFDSubtitleSource001
     * @tc.desc   Set the Subtitle Source of player.
     *            testOhAVPlayerAddFDSubtitleSource001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerAddFDSubtitleSource001', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerAddFDSubtitleSource001 test start `);
      let subtitle = await getFile(`${testContext.filesDir}/srt_3200.srt`);
      let player = avplayer.OhAVPlayerAddFDSubtitleSource(fileDescriptor, subtitle);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkErrorCode(player.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await fs.close(subtitle.fd);
      console.info(`testOhAVPlayerAddFDSubtitleSource001 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerIsSeekContinuousSupported001
     * @tc.name   testOhAVPlayerIsSeekContinuousSupported001
     * @tc.desc   Set the Seek Continuous Supported of player.
     *            testOhAVPlayerIsSeekContinuousSupported001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerIsSeekContinuousSupported001', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerIsSeekContinuousSupported001 test start `);
      let player: number = avplayer.OhAVPlayerIsSeekContinuousSupported();
      try{
        expect(player).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlayerIsSeekContinuousSupported001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlayerIsSeekContinuousSupported001:${error}`);
      }
      console.info(`testOhAVPlayerIsSeekContinuousSupported001 test end `);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSelectTrackWithMode001
     * @tc.name   testOhAVPlayerSelectTrackWithMode001
     * @tc.desc   test OH_AVPlayer_SelectTrackWithMode
     *            testOhAVPlayerSelectTrackWithMode001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSelectTrackWithMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const validTrackIndex = 0;
      const switchMode = 0;
      let testResult = avplayer.OhAVPlayerSelectTrackWithMode(validTrackIndex, switchMode, fileDescriptor);
      expect(testResult.result).assertEqual(0);
      await sleep(2000);
      expect(avplayer.checkErrorCode(testResult.userData)).assertEqual(0);
      console.info(`testOhAVPlayerSelectTrackWithMode001 test end `); 
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetAmplitudeUpdateCallback001
     * @tc.name   testOhAVPlayerSetAmplitudeUpdateCallback001
     * @tc.desc   test OH_AVPlayer_SetAmplitudeUpdateCallback
     *            testOhAVPlayerSetAmplitudeUpdateCallback001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetAmplitudeUpdateCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = avplayer.OhAVPlayerSetAmplitudeUpdateCallback();
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlayerSetAmplitudeUpdateCallback001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlayerSetAmplitudeUpdateCallback001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlayerSetAmplitudeUpdateCallback001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetSeiReceivedCallback001
     * @tc.name   testOhAVPlayerSetSeiReceivedCallback001
     * @tc.desc   test OH_AVPlayer_SetSeiReceivedCallback
     *            testOhAVPlayerSetSeiReceivedCallback001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetSeiReceivedCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const payloadTypes: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
      const payloadTypesArray: number[] = Array.from(payloadTypes);
      let result: number = avplayer.OhAVPlayerSetSeiReceivedCallback(payloadTypesArray, 1);
      expect(result).assertEqual(0);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetSeiReceivedCallback002
     * @tc.name   testOhAVPlayerSetSeiReceivedCallback002
     * @tc.desc   test OH_AVPlayer_SetSeiReceivedCallback
     *            testOhAVPlayerSetSeiReceivedCallback002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetSeiReceivedCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const payloadTypes: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
      const payloadTypesArray: number[] = Array.from(payloadTypes);
      let result: number = avplayer.OhAVPlayerSetSeiReceivedCallback(payloadTypesArray, 5);
      expect(result).assertEqual(0);
      done();
    });

     /**
     * @tc.number testOhAVSeiMessageGetSEI002
     * @tc.name   testOhAVSeiMessageGetSEI002
     * @tc.desc   test OH_AVSeiMessage_GetSEI
     *            testOhAVSeiMessageGetSEI002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVSeiMessageGetSEI002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = avplayer.OhAVPlayerSetSeiReceivedCallbackWithUserData(fileDescriptor);
      await sleep(2000);
      expect(avplayer.checkSeiMessageGetSEI(result.userData, 9999)).assertEqual(-1);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategyCreate001
     * @tc.name   testOhAVPlaybackStrategyCreate001
     * @tc.desc   test OH_AVPlaybackStrategy_Create
     *            testOhAVPlaybackStrategyCreate001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategyCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategyCreate001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategyCreate();
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategyCreate001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategyCreate001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategyCreate001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlayerSetPlaybackStrategy001
     * @tc.name   testOhAVPlayerSetPlaybackStrategy001
     * @tc.desc   test OH_AVPlayer_SetPlaybackStrategy
     *            testOhAVPlayerSetPlaybackStrategy001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackStrategy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackStrategy001 test start`);
      let result = avplayer.OhAVPlayerSetPlaybackStrategy();
      await sleep(2000);
      expect(avplayer.checkErrorCode(result.userData)).assertEqual(OH_AVErrCode.AV_ERR_OK);
      console.info(`testOhAVPlayerSetPlaybackStrategy001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetSuperResolutionEnable001
     * @tc.name   testOhAVPlaybackStrategySetSuperResolutionEnable001
     * @tc.desc   test OH_AVPlaybackStrategy_SetSuperResolutionEnable
     *            testOhAVPlaybackStrategySetSuperResolutionEnable001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetSuperResolutionEnable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetSuperResolutionEnable001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetSuperResolutionEnable(true);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetSuperResolutionEnable001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetSuperResolutionEnable001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetSuperResolutionEnable001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetSuperResolutionEnable002
     * @tc.name   testOhAVPlaybackStrategySetSuperResolutionEnable002
     * @tc.desc   test OH_AVPlaybackStrategy_SetSuperResolutionEnable
     *            testOhAVPlaybackStrategySetSuperResolutionEnable002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetSuperResolutionEnable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetSuperResolutionEnable002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetSuperResolutionEnable(false);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetSuperResolutionEnable002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetSuperResolutionEnable002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetSuperResolutionEnable002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferHDR001
     * @tc.name   testOhAVPlaybackStrategySetPreferHDR001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferHDR
     *            testOhAVPlaybackStrategySetPreferHDR001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferHDR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferHDR001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferHDR(true);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferHDR001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferHDR001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferHDR001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferHDR002
     * @tc.name   testOhAVPlaybackStrategySetPreferHDR002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferHDR
     *            testOhAVPlaybackStrategySetPreferHDR002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferHDR002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferHDR002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferHDR(false);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferHDR002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferHDR002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferHDR002 test end`);
      done();
    });
    
     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredHeight001
     * @tc.name   testOhAVPlaybackStrategySetPreferredHeight001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredHeight
     *            testOhAVPlaybackStrategySetPreferredHeight001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredHeight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredHeight001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredHeight(1080);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredHeight001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredHeight002
     * @tc.name   testOhAVPlaybackStrategySetPreferredHeight002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredHeight
     *            testOhAVPlaybackStrategySetPreferredHeight002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredHeight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredHeight002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredHeight(-1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredHeight002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredHeight003
     * @tc.name   testOhAVPlaybackStrategySetPreferredHeight003
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredHeight
     *            testOhAVPlaybackStrategySetPreferredHeight003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredHeight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredHeight003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredHeight(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredHeight003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredHeight004
     * @tc.name   testOhAVPlaybackStrategySetPreferredHeight004
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredHeight
     *            testOhAVPlaybackStrategySetPreferredHeight004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredHeight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredHeight004 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredHeight(9999);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredHeight004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredHeight004 test end`);
      done();
    });
     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredWidth001
     * @tc.name   testOhAVPlaybackStrategySetPreferredWidth001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredWidth
     *            testOhAVPlaybackStrategySetPreferredWidth001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredWidth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredWidth001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredWidth(1920);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredWidth001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredWidth002
     * @tc.name   testOhAVPlaybackStrategySetPreferredWidth002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredWidth
     *            testOhAVPlaybackStrategySetPreferredWidth002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredWidth002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredWidth002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredWidth(-1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredWidth002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredWidth003
     * @tc.name   testOhAVPlaybackStrategySetPreferredWidth003
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredWidth
     *            testOhAVPlaybackStrategySetPreferredWidth003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredWidth003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredWidth003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredWidth(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredWidth003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredWidth004
     * @tc.name   testOhAVPlaybackStrategySetPreferredWidth004
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredWidth
     *            testOhAVPlaybackStrategySetPreferredWidth004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredWidth004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredWidth004 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredWidth(9999);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredWidth004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredWidth004 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDuration001
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDuration001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDuration
     *            testOhAVPlaybackStrategySetPreferredBufferDuration001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDuration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDuration(1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDuration002
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDuration002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDuration
     *            testOhAVPlaybackStrategySetPreferredBufferDuration002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDuration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDuration(20);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDuration003
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDuration003
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDuration
     *            testOhAVPlaybackStrategySetPreferredBufferDuration003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDuration003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDuration(-1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDuration004
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDuration004
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDuration
     *            testOhAVPlaybackStrategySetPreferredBufferDuration004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDuration004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration004 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDuration(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration004 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDuration005
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDuration005
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDuration
     *            testOhAVPlaybackStrategySetPreferredBufferDuration005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDuration005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration004 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDuration(21);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration005:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDuration005:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDuration005 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetMutedMediaType001
     * @tc.name   testOhAVPlaybackStrategySetMutedMediaType001
     * @tc.desc   test OH_AVPlaybackStrategy_SetMutedMediaType
     *            testOhAVPlaybackStrategySetMutedMediaType001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetMutedMediaType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetMutedMediaType001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetMutedMediaType(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetMutedMediaType001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetMutedMediaType002
     * @tc.name   testOhAVPlaybackStrategySetMutedMediaType002
     * @tc.desc   test OH_AVPlaybackStrategy_SetMutedMediaType
     *            testOhAVPlaybackStrategySetMutedMediaType002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetMutedMediaType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetMutedMediaType002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetMutedMediaType(1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetMutedMediaType002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetMutedMediaType003
     * @tc.name   testOhAVPlaybackStrategySetMutedMediaType003
     * @tc.desc   test OH_AVPlaybackStrategy_SetMutedMediaType
     *            testOhAVPlaybackStrategySetMutedMediaType003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetMutedMediaType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetMutedMediaType003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetMutedMediaType(2);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetMutedMediaType003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetMutedMediaType004
     * @tc.name   testOhAVPlaybackStrategySetMutedMediaType004
     * @tc.desc   test OH_AVPlaybackStrategy_SetMutedMediaType
     *            testOhAVPlaybackStrategySetMutedMediaType004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetMutedMediaType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetMutedMediaType003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetMutedMediaType(5);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetMutedMediaType004 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetMutedMediaType005
     * @tc.name   testOhAVPlaybackStrategySetMutedMediaType005
     * @tc.desc   test OH_AVPlaybackStrategy_SetMutedMediaType
     *            testOhAVPlaybackStrategySetMutedMediaType005
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetMutedMediaType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetMutedMediaType005 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetMutedMediaType(6);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType005:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetMutedMediaType005:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetMutedMediaType005 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredAudioLanguage001
     * @tc.name   testOhAVPlaybackStrategySetPreferredAudioLanguage001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredAudioLanguage
     *            testOhAVPlaybackStrategyGetPreferredAudioLanguage001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredAudioLanguage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredAudioLanguage001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredAudioLanguage("ung");
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredAudioLanguage001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredAudioLanguage001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredAudioLanguage001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredAudioLanguage002
     * @tc.name   testOhAVPlaybackStrategySetPreferredAudioLanguage002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredAudioLanguage
     *            testOhAVPlaybackStrategySetPreferredAudioLanguage002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredAudioLanguage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredAudioLanguage002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredAudioLanguage("");
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredAudioLanguage002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredAudioLanguage002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredAudioLanguage002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredSubtitleLanguage001
     * @tc.name   testOhAVPlaybackStrategySetPreferredSubtitleLanguage001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredSubtitleLanguage
     *            testOhAVPlaybackStrategyGetPreferredSubtitleLanguage001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredSubtitleLanguage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredAudioLanguage002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredSubtitleLanguage("eng");
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredSubtitleLanguage001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredSubtitleLanguage001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredSubtitleLanguage001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredSubtitleLanguage002
     * @tc.name   testOhAVPlaybackStrategySetPreferredSubtitleLanguage002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredSubtitleLanguage
     *            testOhAVPlaybackStrategySetPreferredSubtitleLanguage002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredSubtitleLanguage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredSubtitleLanguage002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredSubtitleLanguage("");
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredSubtitleLanguage002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredSubtitleLanguage002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredSubtitleLanguage002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001
     * @tc.name   testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001
     * @tc.desc   test OH_AVPlaybackStrategy_SetShowFirstFrameOnPrepare
     *            testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetShowFirstFrameOnPrepare(true);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetShowFirstFrameOnPrepare001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002
     * @tc.name   testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002
     * @tc.desc   test OH_AVPlaybackStrategy_SetShowFirstFrameOnPrepare
     *            testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetShowFirstFrameOnPrepare(false);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetShowFirstFrameOnPrepare002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDurationForPlaying
     *            testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategyGetShowFirstFrameOnPrepare001 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDurationForPlaying(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDurationForPlaying
     *            testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDurationForPlaying(20);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDurationForPlaying
     *            testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDurationForPlaying(-1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004
     * @tc.name   testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004
     * @tc.desc   test OH_AVPlaybackStrategy_SetPreferredBufferDurationForPlaying
     *            testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004 test start`);
      try {
        let result: number = avplayer.OhAVPlaybackStrategySetPreferredBufferDurationForPlaying(21);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetPreferredBufferDurationForPlaying004 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001
     * @tc.name   testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001
     * @tc.desc   test OH_AVPlaybackStrategy_SetThresholdForAutoQuickPlay
     *            testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetThresholdForAutoQuickPlay(0);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002
     * @tc.name   testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002
     * @tc.desc   test OH_AVPlaybackStrategy_SetThresholdForAutoQuickPlay
     *            testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetThresholdForAutoQuickPlay(20);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay002 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003
     * @tc.name   testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003
     * @tc.desc   test OH_AVPlaybackStrategy_SetThresholdForAutoQuickPlay
     *            testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetThresholdForAutoQuickPlay(-1);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay003 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004
     * @tc.name   testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004
     * @tc.desc   test OH_AVPlaybackStrategy_SetThresholdForAutoQuickPlay
     *            testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetThresholdForAutoQuickPlay(21);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetThresholdForAutoQuickPlay004 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetKeepDecodingOnMute001
     * @tc.name   testOhAVPlaybackStrategySetKeepDecodingOnMute001
     * @tc.desc   test OH_AVPlaybackStrategy_SetKeepDecodingOnMute
     *            testOhAVPlaybackStrategySetKeepDecodingOnMute001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetKeepDecodingOnMute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetKeepDecodingOnMute001 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetKeepDecodingOnMute(true);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetKeepDecodingOnMute001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetKeepDecodingOnMute001 test end`);
      done();
    });

     /**
     * @tc.number testOhAVPlaybackStrategySetKeepDecodingOnMute002
     * @tc.name   testOhAVPlaybackStrategySetKeepDecodingOnMute002
     * @tc.desc   test OH_AVPlaybackStrategy_SetKeepDecodingOnMute
     *            testOhAVPlaybackStrategySetKeepDecodingOnMute002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlaybackStrategySetKeepDecodingOnMute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlaybackStrategySetKeepDecodingOnMute002 test start`);
      try{
        let result: number = avplayer.OhAVPlaybackStrategySetKeepDecodingOnMute(false);
        expect(result).assertEqual(OH_AVErrCode.AV_ERR_OK);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVPlaybackStrategySetKeepDecodingOnMute002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVPlaybackStrategySetKeepDecodingOnMute002 test end`);
      done();
    });

    /**
     * @tc.number testOhAVPlayerSetPlaybackRate001
     * @tc.name   testOhAVPlayerSetPlaybackRate001
     * @tc.desc   OH_AVPlayer_GetPlaybackRate, set playback rate to 0.125
     *            testOhAVPlayerSetPlaybackRate001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRate001', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRate001 test start `);
      let rate = 0.125;
      let player = avplayer.setPlaybackRate(fileDescriptor, rate);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkPlaybackRate(player.userData)).assertEqual(rate);
      console.info(`testOhAVPlayerSetPlaybackRate001 test end `);
      done();
    });
    /**
     * @tc.number testOhAVPlayerSetPlaybackRate0011
     * @tc.name   testOhAVPlayerSetPlaybackRate0011
     * @tc.desc   OH_AVPlayer_GetPlaybackRate, set playback rate to 0.5
     *            testOhAVPlayerSetPlaybackRate0011
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRate0011', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRate001 test start `);
      let rate = 0.5;
      let player = avplayer.setPlaybackRate(fileDescriptor, rate);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkPlaybackRate(player.userData)).assertEqual(rate);
      console.info(`testOhAVPlayerSetPlaybackRate001 test end `);
      done();
    });
    /**
     * @tc.number testOhAVPlayerSetPlaybackRate002
     * @tc.name   testOhAVPlayerSetPlaybackRate002
     * @tc.desc   OH_AVPlayer_GetPlaybackRate, set playback rate to 1.0
     *            testOhAVPlayerSetPlaybackRate002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRate002', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRate002 test start `);
      let rate = 1.0;
      let player = avplayer.setPlaybackRate(fileDescriptor, rate);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkPlaybackRate(player.userData)).assertEqual(rate);
      console.info(`testOhAVPlayerSetPlaybackRate002 test end `);
      done();
    });
    /**
     * @tc.number testOhAVPlayerSetPlaybackRate003
     * @tc.name   testOhAVPlayerSetPlaybackRate003
     * @tc.desc   OH_AVPlayer_GetPlaybackRate, set rate to 2.0
     *            testOhAVPlayerSetPlaybackRate003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRate003', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRate003 test start `);
      let rate = 2.0;
      let player = avplayer.setPlaybackRate(fileDescriptor, rate);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkPlaybackRate(player.userData)).assertEqual(rate);
      console.info(`testOhAVPlayerSetPlaybackRate003 test end `);
      done();
    });
    /**
     * @tc.number testOhAVPlayerSetPlaybackRate004
     * @tc.name   testOhAVPlayerSetPlaybackRate004
     * @tc.desc   OH_AVPlayer_GetPlaybackRate, set rate to 4.0
     *            testOhAVPlayerSetPlaybackRate004
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetPlaybackRate004', Level.LEVEL0, async (done: Function) => {
      console.info(`testOhAVPlayerSetPlaybackRate004 test start `);
      let rate = 4.0;
      let player = avplayer.setPlaybackRate(fileDescriptor, rate);
      expect(player.result).assertEqual(OH_AVErrCode.AV_ERR_OK);
      await sleep(2000);
      expect(avplayer.checkPlaybackRate(player.userData)).assertEqual(rate);
      console.info(`testOhAVPlayerSetPlaybackRate004 test end `);
      done();
    });
    /**
     * @tc.number OhAVPlayerSetPlaybackStrategyError0001
     * @tc.name   OhAVPlayerSetPlaybackStrategyError0001
     * @tc.desc   OH_AVPlayer_SetPlaybackStrategy input null player
     *            OhAVPlayerSetPlaybackStrategyError0001
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVPlayerSetPlaybackStrategyError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.OhAVPlayerSetPlaybackStrategyError(0);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number OhAVPlayerSetPlaybackStrategyError0002
     * @tc.name   OhAVPlayerSetPlaybackStrategyError0002
     * @tc.desc   OH_AVPlayer_SetPlaybackStrategy input null strategy
     *            OhAVPlayerSetPlaybackStrategyError0002
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVPlayerSetPlaybackStrategyError0002', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.OhAVPlayerSetPlaybackStrategyError(1);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number OhAVPlayerSetPlaybackStrategyError0003
     * @tc.name   OhAVPlayerSetPlaybackStrategyError0003
     * @tc.desc   OH_AVPlayer_SetPlaybackStrategy called in idle state
     *            OhAVPlayerSetPlaybackStrategyError0003
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVPlayerSetPlaybackStrategyError0003', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.OhAVPlayerSetPlaybackStrategyError(2);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });
    /**
     * @tc.number testAVPlayerSetMediaSourceStateError0001
     * @tc.name   testAVPlayerSetMediaSourceStateError0001
     * @tc.desc   OH_AVPlayer_SetMediaSource called in invalid state
     *            testAVPlayerSetMediaSourceStateError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerSetMediaSourceStateError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.testAVPlayerSetMediaSourceStateError();
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });
    /**
     * @tc.number testAVPlayerGetPlaybackRateError0001
     * @tc.name   testAVPlayerGetPlaybackRateError0001
     * @tc.desc   OH_AVPlayer_GetPlaybackRate input null avplayer
     *            testAVPlayerGetPlaybackRateError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerGetPlaybackRateError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.testAVPlayerGetPlaybackRateError();
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number testAVPlayerSetAmplitudeUpdateCallbackError0001
     * @tc.name   testAVPlayerSetAmplitudeUpdateCallbackError0001
     * @tc.desc   OH_AVPlayer_SetAmplitudeUpdateCallback input null avplayer
     *            AVPlayerSetAmplitudeUpdateCallbackError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerSetAmplitudeUpdateCallbackError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerSetAmplitudeUpdateCallbackError();
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number testAVLoadingRequestError0001
     * @tc.name   testAVLoadingRequestError0001
     * @tc.desc   OH_AVLoadingRequestError 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVLoadingRequestError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVLoadingRequestError();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVHttpHeaderDestroy0001
     * @tc.name   testAVHttpHeaderDestroy0001
     * @tc.desc   testAVHttpHeaderDestroy 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVHttpHeaderDestroy0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVHttpHeaderDestroy();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVHttpHeaderDestroyError0001
     * @tc.name   testAVHttpHeaderDestroyError0001
     * @tc.desc   testAVHttpHeaderDestroyError 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVHttpHeaderDestroyError0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVHttpHeaderDestroyError();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVHttpHeaderCreate0001
     * @tc.name   testAVHttpHeaderCreate0001
     * @tc.desc   testAVHttpHeaderCreate 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVHttpHeaderCreate0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVHttpHeaderCreate();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVPlayerTrackSwitchMode0001
     * @tc.name   testAVPlayerTrackSwitchMode0001
     * @tc.desc   AVPlayerTrackSwitchMode 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerTrackSwitchMode0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerTrackSwitchMode();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVPlayerSeekMode0001
     * @tc.name   testAVPlayerSeekMode0001
     * @tc.desc   AVPlayerSeekMode 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerSeekMode0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerSeekMode();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVErrCode0001
     * @tc.name   testAVErrCode0001
     * @tc.desc   AVErrCode 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVErrCode0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVErrCode();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testOhAVPlayerSetMediaMutedErr0001
     * @tc.name   testOhAVPlayerSetMediaMutedErr0001
     * @tc.desc   AVPlayerSetMediaMutedErr
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMutedErr0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerSetMediaMutedErr();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testOhAVPlayerSetMediaMutedErr10001
     * @tc.name   testOhAVPlayerSetMediaMutedErr10001
     * @tc.desc   AVPlayerSetMediaMutedErr1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerSetMediaMutedErr10001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerSetMediaMutedErr1();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVPlayerSetSeiReceivedCallbackErr0001
     * @tc.name   testAVPlayerSetSeiReceivedCallbackErr0001
     * @tc.desc   AVPlayerSetSeiReceivedCallbackErr
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlayerSetSeiReceivedCallbackErr0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlayerSetSeiReceivedCallbackErr();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVMediaSourceLoaderCreate0001
     * @tc.name   testAVMediaSourceLoaderCreate0001
     * @tc.desc   AVMediaSourceLoaderCreate 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVMediaSourceLoaderCreate0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVMediaSourceLoaderCreate();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVPlaybackStrategyDestoy0001
     * @tc.name   testAVPlaybackStrategyDestoy0001
     * @tc.desc   AVPlaybackStrategyDestoy
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlaybackStrategyDestoy0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlaybackStrategyDestoy();
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number testAVPlaybackStrategyDestoyErr0001
     * @tc.name   testAVPlaybackStrategyDestoyErr0001
     * @tc.desc   AVPlaybackStrategyDestoyErr
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testAVPlaybackStrategyDestoyErr0001', Level.LEVEL0, async (done: Function) => {
      let ret = avplayer.AVPlaybackStrategyDestoyErr();
      expect(ret).assertEqual(0);
      done();
    });
  });
}
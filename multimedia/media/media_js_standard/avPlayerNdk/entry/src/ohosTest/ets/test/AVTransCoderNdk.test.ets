/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * You may not use this file except in compliance with the License.
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

import { beforeAll, beforeEach, afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avTransCoderNdk from 'libavTransCoderNdk.so'
import myavcapability from 'libavcapability.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import router, { RouterOptions } from '@system.router'

let isSupportHdr: Boolean;
let isSupportHEVC: Boolean;
let isExistVpeLib: Boolean;
const VIDEO_AVC_AUDIO_AAC = 'H264_AAC.mp4';
const VIDEO_HDR10 = 'output_hdr10.mp4';
const VIDEO_HLG = 'output_hlg.mp4';
const VIDEO_VP9 = '1vp9_320x240_30.mp4';
const VIDEO_WEBM = 'vp8_720x480_60.webm';
const VIDEO_LARAGE_RESOLUTION = 'output_8k.mp4';
const VIDEO_SMALL_RESOLUTION = 'output_160x120.mp4';
const AUDIO_SOURCE_MP3 = '01.mp3';
const VIDEO_SOURCE_HDR_VIVID = 'test_hdr_1.mp4';
const VIDEO_HIGH_BITRATE = "test_highBit_v46Mbps_a295kbps.mp4";
const VIDEO_LOW_BITRATE = "test_lowBit_v134kbps_akbps.mp4";

const VIDEO_SOURCE_MP4_MPEG2 = "mpeg2.mp4";
const VIDEO_SOURCE_MP4_MPEG4 = "MPEG4_AAC.mp4";
const VIDEO_SOURCE_MP4_H263 = "h263_aac.mp4";
const VIDEO_SOURCE_MP4_HEVC = "hevc_720x480_60.mp4";
const VIDEO_SOURCE_MKV = "mpeg4_320x240_60.mkv";
const VIDEO_SOURCE_TS = "H263_AAC.ts";
const VIDEO_SOURCE_FLV = "avc_mp3.flv";
const VIDEO_SOURCE_MPEG = "01.mpeg";
const VIDEO_SOURCE_AVI = "audio_2video.avi";
const VIDEO_SOURCE_FMP4 = "h264_mp3_3mevx_fmp4.mp4";
const VIDEO_SOURCE_MPG = "output_mpeg2.mpg";
const VIDEO_SOURCE_VVC = "output_vvc.mp4"

const AV_OUTPUT_FORMAT_DEFAULT = 0;
const AV_OUTPUT_FORMAT_MPEG_4 = 2;
const AV_OUTPUT_FORMAT_M4A = 6;
const AV_OUTPUT_FORMAT_AMR = 8;
const AV_OUTPUT_FORMAT_MP3 = 9;
const AV_OUTPUT_FORMAT_WAV = 10;
const AV_OUTPUT_FORMAT_AAC = 11;

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
  /**
   * @error IO error.
   */
  AV_ERR_IO = 4,
  /**
   * @error unsupport interface.
   */
  AV_ERR_UNSUPPORT = 9,
}

const FAIL = -1;
const SUCCESS = 0;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
export function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  });
}
async function getRawFd(fileName: string) {
  let fileDescriptor = await getContext().resourceManager.getRawFd(fileName)
  return fileDescriptor;
}
async function closeRawFd(fileName: string) {
  await getContext().resourceManager.closeRawFd(fileName)
    .then(() => {
      console.log('case closeRawFileDescriptor ' + fileName);
    })
    .catch((error: BusinessError) => {
      console.log('case closeRawFileDescriptor err: ' + error);
    });
}
async function getFileFd(fileName: string) {
  let pathName = globalThis.abilityContext.filesDir + '/' + fileName;
  console.log("pathName is " + pathName)
  let file: fs.File | undefined = undefined;
  await fs.open(pathName).then((f) => {
    file = f;
  }).catch(async (e: BusinessError) => {
    if (e.code == 13900002) {
      file = await fs.open(pathName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    }
  });
  return file!!;
}

async function getFileSize(fileName: string) {
  let pathName = globalThis.abilityContext.filesDir + '/' + fileName;
  let stat = await fs.stat(pathName)
  return stat.size;
}

async function closeFileFd(fdNumber: number) {
  await fs.close(fdNumber);
}

async function isExist(filePath: string) {
  let isExist = false;
  await fs.access(filePath).then((res: boolean) => {
    if (res) {
      console.info("file exists");
      isExist = true;
    } else {
      console.info("file not exists");
      isExist = false;
    }
  }).catch((err: BusinessError) => {
    console.error("access failed with error message: " + err.message + ", error code: " + err.code);
    isExist = false;
  });
  return isExist;
}

async function testOhAvTransCoderAndPlayVideo(testNum: string, srcFileName: string) {
  console.log(`case ${testNum} start`);
  let avFd = await getFileFd(srcFileName);
  let dstFileName = testNum + "_output_video.mp4";
  let dstFd = await getFileFd(dstFileName);
  let transCoderUser: avTransCoderNdk.AvTransCoderNdkUser = avTransCoderNdk.AvTransCoderNdkTest(avFd.fd, 0, 0, dstFd.fd);
  console.log(`case ${testNum} transcoder ret ${transCoderUser != undefined}`);
  let ret = FAIL;
  if (transCoderUser != undefined) {
    while (ret != 0) {
      await sleep(1000);
      ret = avTransCoderNdk.CheckAvTransCoderComplete(transCoderUser);
    }
  } else {
    return FAIL;
  }
  await closeFileFd(dstFd.fd);
  await closeFileFd(avFd.fd);
  let srcFD = await getFileFd(dstFileName);
  let size = await getFileSize(dstFileName);
  ret = avTransCoderNdk.AvPlayerNdkPlayVideo(srcFD.fd, size);
  await closeFileFd(srcFD.fd);
  return ret;
}

export default function AVTransCoderNdkTest() {
  describe('AVTransCoderNdkTest', () => {
    beforeEach(async () => {
      isSupportHdr = await isExist('/system/lib64/ndk/libvideo_processing_capi_impl.so');
      isSupportHEVC = await isExist('/system/lib64/libav_codec_hevc_parser.z.so');
      isExistVpeLib = await isExist('/system/lib64/libvideoprocessingengine.z.so');
    })

    afterEach(async () => {
      console.log('case afterEach');
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0001
     * @tc.name       : testOhAvTransCoderNdkPrepareError0001
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video is HDR10.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isSupportHdr) {
        let avFd = await getFileFd(VIDEO_HDR10);
        let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
        console.log('case testOhAvTransCoderNdkPrepareError0001 ret ' + ret);
        await closeFileFd(avFd.fd);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_UNSUPPORT);
        done();
      } else {
        expect(isSupportHdr).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0002
     * @tc.name       : testOhAvTransCoderNdkPrepareError0002
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video is HLG.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isSupportHdr) {
        let avFd = await getFileFd(VIDEO_HLG);
        let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
        console.log('case testOhAvTransCoderNdkPrepareError0002 ret ' + ret);
        await closeFileFd(avFd.fd);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_UNSUPPORT);
        done();
      } else {
        expect(isSupportHdr).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0003
     * @tc.name       : testOhAvTransCoderNdkPrepareError0003
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video is VP9.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_VP9);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0003 ret ' + ret);
      await closeFileFd(avFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0004
     * @tc.name       : testOhAvTransCoderNdkPrepareError0004
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video is MPEG.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_SOURCE_MPEG);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0004 ret ' + ret);
      await closeFileFd(avFd.fd);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedMPEG2();
      if (isSupport == -1) {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0005
     * @tc.name       : testOhAvTransCoderNdkPrepareError0005
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video is WEBM.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_WEBM);
      let dstFd = await getFileFd('testOhAvTransCoderNdkPrepareError0005_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0005 ret ' + JSON.stringify(ret));
      await closeFileFd(avFd.fd);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0006
     * @tc.name       : testOhAvTransCoderNdkPrepareError0006
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video has large resolution.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_LARAGE_RESOLUTION);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0006 ret ' + JSON.stringify(ret));
      await closeFileFd(avFd.fd);
      let isSupport: number = await myavcapability.AVCapabilityIsVideoSizeSupported(7680, 4320);
      if (isSupport == -1) {
        console.info(`AVCapabilityIsVideoSizeSupported Failed`);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      } else {
        console.info(`AVCapabilityIsVideoSizeSupported Success`);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0007
     * @tc.name       : testOhAvTransCoderNdkPrepareError0007
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input video has small resolution.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_SMALL_RESOLUTION);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0007 ret ' + JSON.stringify(ret));
      await closeFileFd(avFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0008
     * @tc.name       : testOhAvTransCoderNdkPrepareError0008
     * @tc.desc       : Test OH_AVTranscoder_Prepare with error case, input is an audio file.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(AUDIO_SOURCE_MP3);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, avFd.offset, avFd.length);
      console.log('case testOhAvTransCoderNdkPrepareError0008 ret ' + ret);
      await closeRawFd(AUDIO_SOURCE_MP3);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0009
     * @tc.name       : testOhAvTransCoderNdkPrepareError0009
     * @tc.desc       : Test OH_AVTranscoder_Prepare with high bitrate video.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_HIGH_BITRATE);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0009 ret ' + JSON.stringify(ret));
      await closeFileFd(avFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_0010
     * @tc.name       : testOhAvTransCoderNdkPrepareError0010
     * @tc.desc       : Test OH_AVTranscoder_Prepare with low bitrate video.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkPrepareError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_LOW_BITRATE);
      let ret: number = avTransCoderNdk.AvTransCoderErrorCode(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderNdkPrepareError0010 ret ' + JSON.stringify(ret));
      await closeFileFd(avFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_RESOLUTION_0001
     * @tc.name       : testOhAvTransCoderNdkSetResolutionError0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with error case, resolution exceeds origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkSetResolutionError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let originWidth = 720;
      let originHeight = 480;
      let ret: number = avTransCoderNdk.AvTransCoderNdkSetResolutionError(avFd.fd, avFd.offset, avFd.length, originWidth * 2, originHeight * 2);
      console.log('case testOhAvTransCoderNdkSetResolutionError0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_RESOLUTION_0002
     * @tc.name       : testOhAvTransCoderNdkSetResolutionError0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with error case, set width to odd.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkSetResolutionError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isExistVpeLib) {
        let avFd = await getFileFd(VIDEO_AVC_AUDIO_AAC);
        let originWidth = 720;
        let originHeight = 480;
        let ret: number = avTransCoderNdk.AvTransCoderNdkSetResolutionError(avFd.fd, 0, 0, originWidth - 1, originHeight);
        console.log('case testOhAvTransCoderNdkSetResolutionError0002 ret ' + ret);
        await closeFileFd(avFd.fd);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
        done();
      } else {
        expect(isExistVpeLib).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_RESOLUTION_0003
     * @tc.name       : testOhAvTransCoderNdkSetResolutionError0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with error case, set height to odd.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkSetResolutionError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isExistVpeLib) {
        let avFd = await getFileFd(VIDEO_AVC_AUDIO_AAC);
        let originWidth = 720;
        let originHeight = 480;
        let ret: number = avTransCoderNdk.AvTransCoderNdkSetResolutionError(avFd.fd, 0, 0, originWidth, originHeight - 1);
        console.log('case testOhAvTransCoderNdkSetResolutionError0003 ret ' + ret);
        await closeFileFd(avFd.fd);
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
        done();
      } else {
        expect(isExistVpeLib).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_RESOLUTION_0004
     * @tc.name       : testOhAvTransCoderNdkSetResolutionError0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with error case, resolution exceeds 4k.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkSetResolutionError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let newWidth = 3840;
      let newHeight = 2160;
      let ret: number = avTransCoderNdk.AvTransCoderNdkSetResolutionError(avFd.fd, avFd.offset, avFd.length, newWidth, newHeight);
      console.log('case testOhAvTransCoderNdkSetResolutionError0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_RESOLUTION_0005
     * @tc.name       : testOhAvTransCoderNdkSetResolutionError0005
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with error case, resolution less 240P.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkSetResolutionError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let newWidth = 160;
      let newHeight = 120;
      let ret: number = avTransCoderNdk.AvTransCoderNdkSetResolutionError(avFd.fd, avFd.offset, avFd.length, newWidth, newHeight);
      console.log('case testOhAvTransCoderNdkSetResolutionError0005 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_PARAM_ERROR_0001
     * @tc.name       : testOhAvTransCoderPrepareParamError0001
     * @tc.desc       : Test OH_AVTranscoder_Prepare with invalid parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPrepareParamError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderPrepareParamError1();
      console.log('case testOhAvTransCoderPrepareParamError0001 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PREPARE_PARAM_ERROR_0002
     * @tc.name       : testOhAvTransCoderPrepareParamError0002
     * @tc.desc       : Test OH_AVTranscoder_Prepare with invalid parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPrepareParamError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderPrepareParamError2(avFd.fd, avFd.offset, avFd.length);
      console.log('case testOhAvTransCoderPrepareParamError0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PARAM_ERROR_0001
     * @tc.name       : testOhAvTransCoderParamError0001
     * @tc.desc       : Test OH_AVTranscoder with invalid parameters for Start operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderParamError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderParamError("Start");
      console.log('case testOhAvTransCoderParamError0001 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PARAM_ERROR_0002
     * @tc.name       : testOhAvTransCoderParamError0002
     * @tc.desc       : Test OH_AVTranscoder with invalid parameters for Pause operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderParamError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderParamError("Pause");
      console.log('case testOhAvTransCoderParamError0002 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PARAM_ERROR_0003
     * @tc.name       : testOhAvTransCoderParamError0003
     * @tc.desc       : Test OH_AVTranscoder with invalid parameters for Resume operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderParamError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderParamError("Resume");
      console.log('case testOhAvTransCoderParamError0003 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PARAM_ERROR_0004
     * @tc.name       : testOhAvTransCoderParamError0004
     * @tc.desc       : Test OH_AVTranscoder with invalid parameters for Cancel operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderParamError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderParamError("Cancel");
      console.log('case testOhAvTransCoderParamError0004 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PARAM_ERROR_0005
     * @tc.name       : testOhAvTransCoderParamError0005
     * @tc.desc       : Test OH_AVTranscoder with invalid parameters for Release operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderParamError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderParamError("Release");
      console.log('case testOhAvTransCoderParamError0005 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_OPERATE_ERROR_0001
     * @tc.name       : testOhAvTransCoderOperateError0001
     * @tc.desc       : Test OH_AVTranscoder with operation not permitted for Start.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderOperateError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderOperateError("Start");
      console.log('case testOhAvTransCoderOperateError0001 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_OPERATE_ERROR_0002
     * @tc.name       : testOhAvTransCoderOperateError0002
     * @tc.desc       : Test OH_AVTranscoder with operation not permitted for Pause.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderOperateError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderOperateError("Pause");
      console.log('case testOhAvTransCoderOperateError0002 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_OPERATE_ERROR_0003
     * @tc.name       : testOhAvTransCoderOperateError0003
     * @tc.desc       : Test OH_AVTranscoder with operation not permitted for Resume.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderOperateError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderOperateError("Resume");
      console.log('case testOhAvTransCoderOperateError0003 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_OPERATE_ERROR_0004
     * @tc.name       : testOhAvTransCoderOperateError0004
     * @tc.desc       : Test OH_AVTranscoder with operation not permitted for Cancel.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderOperateError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderOperateError("Cancel");
      console.log('case testOhAvTransCoderOperateError0004 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_OPERATE_ERROR_0005
     * @tc.name       : testOhAvTransCoderOperateError0005
     * @tc.desc       : Test OH_AVTranscoder with operation not permitted for Prepare.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderOperateError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCoderOperateError0005_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCoderNdkPrepareNotPermit(avFd.fd, avFd.offset, avFd.length, dstFd.fd);
      console.log('case testOhAvTransCoderOperateError0005 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OPERATE_NOT_PERMIT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CANCELLED_0001
     * @tc.name       : testOhAvTransCoderNdkCancelled
     * @tc.desc       : Test OH_AVTranscoder_Cancel operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkCancelled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dst = await getFileFd("testOhAvTransCoderNdkCancelled_output_video.mp4")
      let ret: number = avTransCoderNdk.AvTransCoderNdkCancelled(avFd.fd, avFd.offset, avFd.length, dst.fd);
      console.log('case testOhAvTransCoderNdkCancelled ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dst.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_COMPLETE_0001
     * @tc.name       : testOhAvTransCoderNdkComplete
     * @tc.desc       : Test OH_AVTranscoder state Complete.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkComplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCoderNdkComplete_output_video.mp4');
      let transCoderUser: avTransCoderNdk.AvTransCoderNdkUser = avTransCoderNdk.AvTransCoderNdkTest(avFd.fd, 0, 0, dstFd.fd);
      console.log(`case testOhAvTransCoderNdkComplete transcoder ret ${transCoderUser != undefined}`);
      let ret = FAIL;
      if (transCoderUser != undefined) {
        while (ret != 0) {
          await sleep(1000);
          ret = avTransCoderNdk.CheckAvTransCoderComplete(transCoderUser)
        }
      }
      await closeFileFd(dstFd.fd);
      await closeFileFd(avFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_STATE_CB_0001
     * @tc.name       : testOhAvTransCoderSetStateCbError
     * @tc.desc       : Test OH_AVTranscoder_SetStateCallback with invalid parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderSetStateCbError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderSetStateCbError();
      console.log('case testOhAvTransCoderSetStateCbError ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_ERROR_CB_0001
     * @tc.name       : testOhAvTransCoderSetErrorCbError
     * @tc.desc       : Test OH_AVTranscoder_SetErrorCallback with invalid parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderSetErrorCbError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderSetErrorCbError();
      console.log('case testOhAvTransCoderSetErrorCbError ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_SET_PROGRESS_UPDATE_CB_0001
     * @tc.name       : testOhAvTransCoderSetProgressUpdateCbError
     * @tc.desc       : Test OH_AVTranscoder_SetProgressUpdateCallback with invalid parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderSetProgressUpdateCbError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderSetProgressUpdateCbError();
      console.log('case testOhAvTransCoderSetProgressUpdateCbError ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PROGRESS_UPDATE_CB_0001
     * @tc.name       : testOhAvTransCoderNdkProgressUpdateCb
     * @tc.desc       : Test OH_AVTranscoder_SetProgressUpdateCallback operation.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderNdkProgressUpdateCb', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCoderNdkProgressUpdateCb_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCoderNdkProgressUpdateCb(avFd.fd, avFd.offset, avFd.length, dstFd.fd);
      console.log('case testOhAvTransCoderNdkProgressUpdateCb ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0001
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD with invalid file descriptor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(-1, avFd.offset, avFd.length);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0002
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD with invalid offset.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(avFd.fd, -1, avFd.length);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0003
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD with invalid length.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(avFd.fd, avFd.offset, -1);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0003 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0004
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD with length exceeding origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(avFd.fd, avFd.offset, avFd.length * 2);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0005
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0005
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD with length below origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(avFd.fd, avFd.offset, avFd.length / 2);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0005 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_SRC_FD_ERROR_0006
     * @tc.name       : testOhAvTransCoderConfigSetSrcFDError0006
     * @tc.desc       : Test OH_AVTranscoderConfig_SetSrcFD.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetSrcFDError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getFileFd(VIDEO_SOURCE_MP4_H263);
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetSrcFDError(avFd.fd, 0, 0);
      console.log('case testOhAvTransCoderConfigSetSrcFDError0006 ret ' + ret);
      await closeFileFd(avFd.fd);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedH263();
      if (isSupport == -1) {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FD_ERROR_0001
     * @tc.name       : testOhAvTransCoderConfigSetDstFDError
     * @tc.desc       : Test OH_AVTranscoder_ConfigSetDstFD with invalid file descriptor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigSetDstFDError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigSetDstFDError(-1);
      console.log('case testOhAvTransCoderConfigSetDstFDError ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_TYPE_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoType0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoType with valid video type AVC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoType0001_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "video/avc");
      console.log('case testOhAvTransCodeConfigSetDstVideoType0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_TYPE_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoType0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoType with valid video type HEVC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isSupportHEVC) {
        let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
        let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoType0002_output_video.mp4');
        let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "video/hevc");
        console.log('case testOhAvTransCodeConfigSetDstVideoType0002 ret ' + ret);
        await closeRawFd(VIDEO_AVC_AUDIO_AAC);
        await closeFileFd(dstFd.fd);
        let isSupport: number = await myavcapability.AVCapabilityIsSupportedHEVC();
        if (isSupport == -1) {
          expect(ret).assertEqual(OH_AVErrCode.AV_ERR_IO);
        } else {
          expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
        }
        done();
      } else {
        expect(isSupportHEVC).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_TYPE_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoType0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoType with empty video type.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoType0003_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "");
      console.log('case testOhAvTransCodeConfigSetDstVideoType0003 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_TYPE_0004
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoType0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoType with invalid video type.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoType0004_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "InvalidCodecMimetype");
      console.log('case testOhAvTransCodeConfigSetDstVideoType0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_TYPE_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioType0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioType with valid audio type AAC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioType0001_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstAudioType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "audio/mp4a-latm");
      console.log('case testOhAvTransCodeConfigSetDstAudioType0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_TYPE_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioType0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioType with empty audio type.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioType0002_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstAudioType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "");
      console.log('case testOhAvTransCodeConfigSetDstAudioType0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_TYPE_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioType0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioType with invalid audio type.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioType0003_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstAudioType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, "InvalidCodecMimetype");
      console.log('case testOhAvTransCodeConfigSetDstAudioType0003 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with default file type.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0001_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_DEFAULT);
      console.log('case testOhAvTransCodeConfigSetDstFileType0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with valid file type MPEG-4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0002_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_MPEG_4);
      console.log('case testOhAvTransCodeConfigSetDstFileType0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with unsupported file type M4A.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0003_output_video.m4a');
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstFileTypeError(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_M4A);
      console.log('case testOhAvTransCodeConfigSetDstFileType0003 ret ' + ret.result);
      let retCode: number = avTransCoderNdk.CheckAvTransCoderCallBackError(ret.userData);
      while(retCode == FAIL) {
        await sleep(500);
        retCode = avTransCoderNdk.CheckAvTransCoderCallBackError(ret.userData);
      }
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(retCode).assertEqual(OH_AVErrCode.AV_ERR_UNSUPPORT);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0004
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with invalid file type AMR.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0004_output_video.amr');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_AMR);
      console.log('case testOhAvTransCodeConfigSetDstFileType0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0005
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0005
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with invalid file type MP3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0005_output_video.mp3');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_MP3);
      console.log('case testOhAvTransCodeConfigSetDstFileType0005 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0006
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0006
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with invalid file type WAV.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0006_output_video.wav');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_WAV);
      console.log('case testOhAvTransCodeConfigSetDstFileType0006 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_FILE_TYPE_0007
     * @tc.name       : testOhAvTransCodeConfigSetDstFileType0007
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstFileType with invalid file type AAC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstFileType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstFileType0007_output_video.aac');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstFileType(avFd.fd, avFd.offset, avFd.length, dstFd.fd, AV_OUTPUT_FORMAT_AAC);
      console.log('case testOhAvTransCodeConfigSetDstFileType0007 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_BITRATE_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioBitrate0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioBitrate with bitrate exceeding origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioBitrate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioBitrate0001_output_video.mp4');
      let originRate = 200000;
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstAudioBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, originRate * 2);
      console.log('case testOhAvTransCodeConfigSetDstAudioBitrate0001 ret ' + ret.result);
      let retCode = FAIL;
      if (ret.result == OH_AVErrCode.AV_ERR_OK) {
        while (retCode != 0) {
          await sleep(1000);
          retCode = avTransCoderNdk.CheckAvTransCoderComplete(ret.userData);
        }
      }
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(retCode).assertEqual(SUCCESS);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_BITRATE_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioBitrate0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioBitrate with bitrate below origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioBitrate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioBitrate0002_output_video.mp4');
      let originRate = 200000;
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstAudioBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, originRate / 2);
      console.log('case testOhAvTransCodeConfigSetDstAudioBitrate0002 ret ' + ret.result);
      let retCode = FAIL;
      if (ret.result == OH_AVErrCode.AV_ERR_OK) {
        while (retCode != 0) {
          await sleep(1000);
          retCode = avTransCoderNdk.CheckAvTransCoderComplete(ret.userData);
        }
      }
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(retCode).assertEqual(SUCCESS);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_BITRATE_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioBitrate0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioBitrate with invalid bitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioBitrate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioBitrate0003_output_video.mp4');
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstAudioBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, -1);
      console.log('case testOhAvTransCodeConfigSetDstAudioBitrate0003 ret ' + ret.result);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret.result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_BITRATE_0004
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioBitrate0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioBitrate with zero bitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioBitrate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioBitrate0004_output_video.mp4');
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstAudioBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, 0);
      console.log('case testOhAvTransCodeConfigSetDstAudioBitrate0004 ret ' + ret.result);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret.result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_AUDIO_BITRATE_0005
     * @tc.name       : testOhAvTransCodeConfigSetDstAudioBitrate0005
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstAudioBitrate with bitrate exceeding maxint32mum.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstAudioBitrate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstAudioBitrate0005_output_video.mp4');
      let ret: avTransCoderNdk.AvTransCoderResult = avTransCoderNdk.AvTransCodeConfigSetDstAudioBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, 4294967295);
      console.log('case testOhAvTransCodeConfigSetDstAudioBitrate0005 ret ' + ret.result);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret.result).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_BITRATE_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoBitrate0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoBitrate with bitrate exceeding origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoBitrate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoBitrate0001_output_video.mp4');
      let originRate = 3000000;
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, originRate * 2);
      console.log('case testOhAvTransCodeConfigSetDstVideoBitrate0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_BITRATE_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoBitrate0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoBitrate with bitrate below origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoBitrate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoBitrate0002_output_video.mp4');
      let originRate = 3000000;
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, originRate / 2);
      console.log('case testOhAvTransCodeConfigSetDstVideoBitrate0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_BITRATE_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoBitrate0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoBitrate with invalid bitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoBitrate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoBitrate0003_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, -1);
      console.log('case testOhAvTransCodeConfigSetDstVideoBitrate0003 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_BITRATE_0004
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoBitrate0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoBitrate with zero bitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoBitrate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoBitrate0004_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, 0);
      console.log('case testOhAvTransCodeConfigSetDstVideoBitrate0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_BITRATE_0005
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoBitrate0005
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoBitrate with bitrate exceeding maxint32mum.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoBitrate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoBitrate0005_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoBitrate(avFd.fd, avFd.offset, avFd.length, dstFd.fd, 4294967295);
      console.log('case testOhAvTransCodeConfigSetDstVideoBitrate0005 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_RESOLUTION_0001
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoResolution0001
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with resolution below origin.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoResolution0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isExistVpeLib) {
        let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
        let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoResolution0001_output_video.mp4');
        let originWidth = 720;
        let originHeight = 480;
        let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoResolution(avFd.fd, avFd.offset, avFd.length, dstFd.fd, originWidth / 2, originHeight / 2);
        console.log('case testOhAvTransCodeConfigSetDstVideoResolution0001 ret ' + ret);
        await closeRawFd(VIDEO_AVC_AUDIO_AAC);
        await closeFileFd(dstFd.fd);
        expect(ret).assertEqual(0);
        done();
      } else {
        expect(isExistVpeLib).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_RESOLUTION_0002
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoResolution0002
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with invalid resolution.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoResolution0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoResolution0002_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoResolution(avFd.fd, avFd.offset, avFd.length, dstFd.fd, -1, -1);
      console.log('case testOhAvTransCodeConfigSetDstVideoResolution0002 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_RESOLUTION_0003
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoResolution0003
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with zero resolution.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoResolution0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoResolution0003_output_video.mp4');
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoResolution(avFd.fd, avFd.offset, avFd.length, dstFd.fd, 0, 0);
      console.log('case testOhAvTransCodeConfigSetDstVideoResolution0003 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_SET_DST_VIDEO_RESOLUTION_0004
     * @tc.name       : testOhAvTransCodeConfigSetDstVideoResolution0004
     * @tc.desc       : Test OH_AVTranscoderConfig_SetDstVideoResolution with resolution exceeding maxint32num.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCodeConfigSetDstVideoResolution0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCodeConfigSetDstVideoResolution0004_output_video.mp4');
      let max = 4294967295;
      let ret: number = avTransCoderNdk.AvTransCodeConfigSetDstVideoResolution(avFd.fd, avFd.offset, avFd.length, dstFd.fd, max, max);
      console.log('case testOhAvTransCodeConfigSetDstVideoResolution0004 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0001
     * @tc.name       : testOhAvTransCoderConfigParamError0001
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetSrcFD.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetSrcFD", 0);
      console.log('case testOhAvTransCoderConfigParamError0001 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0002
     * @tc.name       : testOhAvTransCoderConfigParamError0002
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstFD.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstFD", 0);
      console.log('case testOhAvTransCoderConfigParamError0002 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0003
     * @tc.name       : testOhAvTransCoderConfigParamError0003
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstVideoType.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstVideoType", 1);
      console.log('case testOhAvTransCoderConfigParamError0003 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0004
     * @tc.name       : testOhAvTransCoderConfigParamError0004
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstVideoType.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstVideoType", 0);
      console.log('case testOhAvTransCoderConfigParamError0004 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0005
     * @tc.name       : testOhAvTransCoderConfigParamError0005
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstAudioType.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstAudioType", 1);
      console.log('case testOhAvTransCoderConfigParamError0005 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0006
     * @tc.name       : testOhAvTransCoderConfigParamError0006
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstAudioType.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstAudioType", 0);
      console.log('case testOhAvTransCoderConfigParamError0006 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0007
     * @tc.name       : testOhAvTransCoderConfigParamError0007
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstFileType.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstFileType", 0);
      console.log('case testOhAvTransCoderConfigParamError0007 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0008
     * @tc.name       : testOhAvTransCoderConfigParamError0008
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstAudioBitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstAudioBitrate", 0);
      console.log('case testOhAvTransCoderConfigParamError0008 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0009
     * @tc.name       : testOhAvTransCoderConfigParamError0009
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstVideoBitrate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstVideoBitrate", 0);
      console.log('case testOhAvTransCoderConfigParamError0009 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0010
     * @tc.name       : testOhAvTransCoderConfigParamError0010
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for SetDstVideoResolution.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("SetDstVideoResolution", 0);
      console.log('case testOhAvTransCoderConfigParamError0010 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_PARAM_ERROR_0011
     * @tc.name       : testOhAvTransCoderConfigParamError0011
     * @tc.desc       : Test OH_AVTranscoder_Config with invalid parameters for Release.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderConfigParamError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = avTransCoderNdk.AvTransCoderConfigParamError("Release", 0);
      console.log('case testOhAvTransCoderConfigParamError0011 ret ' + ret);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_INVALID_VAL);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0001
     * @tc.name       : testOhAvTransCoderPlayer0001
     * @tc.desc       : Test OH_AVTranscoder_Player with video type AVC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0001', VIDEO_AVC_AUDIO_AAC);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0002
     * @tc.name       : testOhAvTransCoderPlayer0002
     * @tc.desc       : Test OH_AVTranscoder_Player with video type MPEG-2.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0002', VIDEO_SOURCE_MP4_MPEG2);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedMPEG2();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0003
     * @tc.name       : testOhAvTransCoderPlayer0003
     * @tc.desc       : Test OH_AVTranscoder_Player with video type MPEG-4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0003', VIDEO_SOURCE_MP4_MPEG4);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedMPEG4();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0004
     * @tc.name       : testOhAvTransCoderPlayer0004
     * @tc.desc       : Test OH_AVTranscoder_Player with video type H263.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0004', VIDEO_SOURCE_MP4_H263);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedH263();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0005
     * @tc.name       : testOhAvTransCoderPlayer0005
     * @tc.desc       : Test OH_AVTranscoder_Player with video type HEVC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isSupportHEVC) {
        let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0005', VIDEO_SOURCE_MP4_HEVC);
        let isSupport: number = await myavcapability.AVCapabilityIsSupportedHEVC();
        if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
        } else {
          expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
        }
        done();
      } else {
        expect(isSupportHEVC).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0006
     * @tc.name       : testOhAvTransCoderPlayer0006
     * @tc.desc       : Test OH_AVTranscoder_Player with video type MKV.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0006', VIDEO_SOURCE_MKV);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedMPEG4();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0007
     * @tc.name       : testOhAvTransCoderPlayer0007
     * @tc.desc       : Test OH_AVTranscoder_Player with video type TS.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0007', VIDEO_SOURCE_TS);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedH263();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0008
     * @tc.name       : testOhAvTransCoderPlayer0008
     * @tc.desc       : Test OH_AVTranscoder_Player with video type FLV.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0008', VIDEO_SOURCE_FLV);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0009
     * @tc.name       : testOhAvTransCoderPlayer0009
     * @tc.desc       : Test OH_AVTranscoder_Player with video type MPEG.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0009', VIDEO_SOURCE_MPG);
      let isSupport: number = await myavcapability.AVCapabilityIsSupportedMPEG2();
      if (isSupport == -1) {
        expect(ret).assertEqual(FAIL);
      } else {
        expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      }
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0010
     * @tc.name       : testOhAvTransCoderPlayer0010
     * @tc.desc       : Test OH_AVTranscoder_Player with video type AVI.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0010', VIDEO_SOURCE_AVI);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_PLAYER_0011
     * @tc.name       : testOhAvTransCoderPlayer0011
     * @tc.desc       : Test OH_AVTranscoder_Player with video type FMP4.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderPlayer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = await testOhAvTransCoderAndPlayVideo('testOhAvTransCoderPlayer0011', VIDEO_SOURCE_FMP4);
      expect(ret).assertEqual(OH_AVErrCode.AV_ERR_OK);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVTRANSCODER_CONFIG_ENABLE_B_FRAME_0001
     * @tc.name       : testOhAvTransCoderEnableBFrame0001
     * @tc.desc       : Test OH_AVTranscoderConfig_EnableBFrame with enableBFrame.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvTransCoderEnableBFrame0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avFd = await getRawFd(VIDEO_AVC_AUDIO_AAC);
      let dstFd = await getFileFd('testOhAvTransCoderEnableBFrame0001_output_video.mp4');
      let enableBFrame = true;
      let ret: number = avTransCoderNdk.AvTransCodeConfigEnableBFrame(avFd.fd, avFd.offset, avFd.length, dstFd.fd, enableBFrame);
      console.log('case testOhAvTransCoderEnableBFrame0001 ret ' + ret);
      await closeRawFd(VIDEO_AVC_AUDIO_AAC);
      await closeFileFd(dstFd.fd);
      expect(ret).assertEqual(0);
      done();
    });
  })
}

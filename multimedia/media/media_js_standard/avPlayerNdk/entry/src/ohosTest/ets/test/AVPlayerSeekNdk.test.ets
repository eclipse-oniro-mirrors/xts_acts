/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avplayer from 'libavplayerndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';
import Utils from './Utils';

const TAG = "AVPlayerSeekNdk";
let fileDescriptorFs: resourceManager.RawFileDescriptor = { fd: -1, length: 0, offset: 0 };
let fileDescriptorRaw: resourceManager.RawFileDescriptor | undefined = undefined;
let fileNameTest: string;

async function getFileFd(pathName: string) {
  console.info(`${TAG}: getFileUrl called`);
  let filePath: string = globalThis.abilityContext.filesDir + '/' + pathName;
  let stat = await fs.stat(filePath);
  console.info(`${TAG}: stat: ${JSON.stringify(stat)}`);
  console.info(`${TAG}: size: ${stat.size}`);
  await fs.open(filePath, fs.OpenMode.READ_ONLY).then((file) => {
    console.info(`${TAG}: file fd: ${file.fd}`);
    fileDescriptorFs.fd = file.fd;
    fileDescriptorFs.length = stat.size;

  }).catch((err: BusinessError) => {
    console.info(`${TAG}: open file failed with error message: ${err.message}, error code: ${err.code}`);
  });
  console.info(`${TAG}: getFileUrl done`);
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

async function closeFileFd(fdNumber: number) {
  await fs.close(fdNumber);
}

export default function AVPlayerSeekNdk() {
  describe('AVPlayerSeekNdk', () => {

    beforeAll(async () => {
      await Utils.sleep(2000)
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await Utils.sleep(2000)
    })
    afterEach(async () => {
      console.info('afterEach case');
      if (fileDescriptorRaw != undefined) {
        closeRawFd(fileNameTest);
        fileDescriptorRaw = undefined;
      }
      if (fileDescriptorFs.fd != -1) {
        closeFileFd(fileDescriptorFs.fd);
        fileDescriptorFs.fd = -1;
      }
    });
    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "H264_AAC.mp4";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorRaw fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "demo_video_audio_10s.mp4";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "H264_AAC.mkv";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "01.mp3";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "AAC_48000_32_1.aac";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "vorbis_48000_32_1.wav";
      fileDescriptorRaw = await getRawFd(fileNameTest);
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptorRaw?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorRaw?.fd, fileDescriptorRaw?.offset, fileDescriptorRaw?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "vp8_720x480_60.webm";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "mpeg2video_320x240_60.mkv";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "test_hdr_1.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "mpeg2.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "MPEG4_AAC.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "h263_aac.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "hevc_720x480_60.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "mpeg4_320x240_60.mkv";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "H263_AAC.ts";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "avc_mp3.flv";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "01.mpeg";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "1vp9_320x240_30.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "audio_2video.avi";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700
     * @tc.desc   test seekAvPlayerStateTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700', Level.LEVEL0, async (done: Function) => {
      fileNameTest = "output_8k.mp4";
      await getFileFd(fileNameTest);
      console.info(TAG, 'player fileDescriptorFs fd://' + fileDescriptorFs?.fd);
      let result: number = avplayer.setup('sss', fileDescriptorFs?.fd, fileDescriptorFs?.offset, fileDescriptorFs?.length);
      expect(result).assertEqual(0);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });

  })
}

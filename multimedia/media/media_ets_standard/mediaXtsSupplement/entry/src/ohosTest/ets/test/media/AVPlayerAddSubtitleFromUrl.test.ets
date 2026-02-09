/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep } from '../common';

const TAG = 'xts.AVPlayerAddSubtitleFromUrlTest';
let avPlayer: media.AVPlayer;

async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log(TAG,"pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info(TAG,'[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}

export default function AVPlayerAddSubtitleFromUrlSuppTest() {
  describe('AVPlayerAddSubtitleFromUrlSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_001
     * @tc.desc   AVPlayer_addSubtitleFromUrl
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_001';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
        try {
          console.info(TAG, testName, "Creating AVPlayer...");
          avPlayer = await media.createAVPlayer();
          console.info(TAG, testName, "AVPlayer created successfully");
          let rawFileContent = await getFdRead(FileName);
          avPlayer.fdSrc = { fd: rawFileContent };
          console.info(TAG, testName, "AVPlayer avPlayer.fdSrc successfully");
          avPlayer.addSubtitleFromUrl(null);
          console.info(TAG, testName, "AVPlayer addSubtitleFromUrl successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect().assertFail();
          avPlayer?.release();
          done();
        }
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_002
     * @tc.desc   AVPlayer_addSubtitleFromUrl
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_002';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
        try {
          console.info(TAG, testName, "Creating AVPlayer...");
          avPlayer = await media.createAVPlayer();
          console.info(TAG, testName, "AVPlayer created successfully");
          let rawFileContent = await getFdRead(FileName);
          avPlayer.fdSrc = { fd: rawFileContent };
          console.info(TAG, testName, "AVPlayer avPlayer.fdSrc successfully");
          avPlayer.addSubtitleFromUrl(undefined);
          console.info(TAG, testName, "AVPlayer addSubtitleFromUrl successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect().assertFail();
          avPlayer?.release();
          done();
        }
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_003
     * @tc.desc   AVPlayer_addSubtitleFromUrl
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_ADD_SUBTITLE_FROM_URL_003';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
        try {
          console.info(TAG, testName, "Creating AVPlayer...");
          avPlayer = await media.createAVPlayer();
          console.info(TAG, testName, "AVPlayer created successfully");
          let rawFileContent = await getFdRead(FileName);
          avPlayer.fdSrc = { fd: rawFileContent };
          console.info(TAG, testName, "AVPlayer avPlayer.fdSrc successfully");
          avPlayer.addSubtitleFromUrl('');
          console.info(TAG, testName, "AVPlayer addSubtitleFromUrl successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect().assertFail();
          avPlayer?.release();
          done();
        }
      })
  })
}
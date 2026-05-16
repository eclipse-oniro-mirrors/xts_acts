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
import { drm } from '@kit.DrmKit';

const TAG = 'xts.AVPlayerSetDecryptionConfigTest';
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


export default function AVPlayerSetDecryptionConfigSuppTest() {
  describe('AVPlayerSetDecryptionConfigSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty', '');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      AppStorage.delete('empty');
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_001
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_001';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
        try {
          let keySession : drm.MediaKeySession = AppStorage.get('empty')as ESObject
          avPlayer.setDecryptionConfig(keySession, false);
          console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_002
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_002';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try {
        avPlayer.setDecryptionConfig(null, false);
        console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_003
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_003';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try {
        avPlayer.setDecryptionConfig(undefined, false);
        console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_004
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_004';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try {
        let keySession : drm.MediaKeySession = AppStorage.get('empty')as ESObject
        avPlayer.setDecryptionConfig(keySession, true);
        console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_005
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_005';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try {
        avPlayer.setDecryptionConfig(null, true);
        console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_006
     * @tc.desc   AVPlayer_setDecryptionConfig
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_setDecryptionConfig_006';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try {
        avPlayer.setDecryptionConfig(undefined, true);
        console.info(TAG, testName, "AVPlayer setDecryptionConfig successfully");
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
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

const TAG = 'xts.AVPlayerSetMediaMutedSuppTest';
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

async function setMediaMutedSupp(done: Function, testName: string, FileName: string,
  callback: () => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'prepared':
          console.info(TAG, testName,'state prepared called');
          break;
        case 'initialized':
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          callback();
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer rawFileContent successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

export default function AVPlayerSetMediaMutedSuppTest() {
  describe('AVPlayerSetMediaMutedSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty', '');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await avPlayer.release()
    });
    afterAll(async () => {
      console.info('afterAll case');
      AppStorage.delete('empty');
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_001
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_001', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_001';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_002
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_002';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_003
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_003';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_004
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_004';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_005
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_005';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_006
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_006';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_007
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_007';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_008
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_008';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_009
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_009';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_010
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_010';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_011
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_011';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_012
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_012';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_013
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_013';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_014
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_014';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_015
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_015';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_016
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_016';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_017
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_017
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_017';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_018
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_018
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_018';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_019
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_019
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_019';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_020
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_020
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_020';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_021
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_021
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_021';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_022
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_022
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_022';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_023
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_023
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_023';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_024
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_024
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_024';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_025
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_025
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_025';
      let FileName: string = '1vp9_320x240_30.mp4';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0001
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0001', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0001';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0002
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0002';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0003
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0003';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0004
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0004';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0005
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0005';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0006
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0006';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0007
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0007';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0008
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0008';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0009
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0009';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0010
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0010';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0011
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0011';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0012
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0012';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0013
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0013';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0014
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0014';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0015
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0015';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0016
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0016';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0017
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0017
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0017';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0018
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0018
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0018';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0019
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0019
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0019';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0020
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0020
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0020';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0021
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0021
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0021';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0022
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0022
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0022';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0023
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0023
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0023';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0024
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0024
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0024';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0025
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0025
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_0025';
      let FileName: string = '1h264_320x240_60.3gp';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })




    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_01
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_01
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_01', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_01';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_02
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_02
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_02', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_02';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_03
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_03
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_03', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_03';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_04
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_04
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_04', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_04';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_05
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_05
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_05', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_05';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_06
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_06
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_06', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_06';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_07
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_07
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_07', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_07';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_08
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_08
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_08', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_08';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_09
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_09
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_09', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_09';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_10
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_10
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_10', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_10';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_11
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_11
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_11', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_11';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_12
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_12
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_12', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_12';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_13
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_13
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_13', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_13';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_14
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_14
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_14', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_14';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_15
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_15
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_15', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_15';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_16
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_16
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_16', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_16';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_17
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_17
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_17', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_17';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_18
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_18
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_18', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_18';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_19
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_19
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_19', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_19';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_20
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_20
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_20', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_20';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_21
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_21
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_21', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_21';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_22
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_22
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_22', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_22';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_23
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_23
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_23', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_23';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_24
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_24
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_24', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_24';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_25
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_25
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_25', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_25';
      let FileName: string = 'h261_352x288_30.mkv';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })





    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_001
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_001', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_001';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_002
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_002';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_003
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_003';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_004
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_004';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_005
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_005';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_006
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_006';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_007
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_007';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_008
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_008';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_UNSUPPORTED, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_009
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_009';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_TIMED_METADATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_010
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_010';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_SUBTITLE, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_011
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_011';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_VID, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_012
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_012';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_ATTACHMENT, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_013
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_013';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_DATA, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_014
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_014';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUXILIARY, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_015
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_015';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_016
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_016';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_017
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_017
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_017';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_018
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_018
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_018';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_019
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_019
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_019';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_020
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_020
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_020';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, false);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_021
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_021
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_021';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, true);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_022
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_022
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_022';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_023
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_023
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_023';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      let mediaType: media.MediaType  = AppStorage.get('empty') as ESObject;
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(mediaType, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_024
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_024
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_024';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(null, null);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_025
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_025
     * @tc.desc   AVPlayer_setMediaMuted
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_MUTED_FILE_025';
      let FileName: string = 'h264_320x240_60.m4v';
      console.info(TAG, testName, "AVPlayer created successfully");
      setMediaMutedSupp(done, testName, FileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setMediaMuted(undefined, undefined);
          console.info(TAG, testName, "setMediaMuted  successfully");
          done();
        } catch (error) {
          console.error(TAG, testName, "setMediaMuted failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

  })
}

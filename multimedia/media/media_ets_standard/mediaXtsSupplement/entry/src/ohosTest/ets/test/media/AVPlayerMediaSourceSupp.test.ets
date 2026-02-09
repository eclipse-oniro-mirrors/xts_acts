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

const TAG = 'xts.AVPlayerSetMediaSourceSuppTest';


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

export default function AVPlayerSetMediaSourceSuppTest() {
  describe('AVPlayerSetMediaSourceSuppTest', () => {
    let avPlayer: media.AVPlayer;
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await avPlayer.release();
    });
    afterAll(async () => {
      console.info('afterAll case');
      AppStorage.delete('empty');
      avPlayer?.release();
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_001
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_001';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let playStrategy : media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        thresholdForAutoQuickPlay: 5
      };
    try{
      const path = testContext.filesDir + "/" + FileName;
      let mediaSource = media.createMediaSourceWithUrl(path);
      console.info(TAG,testName,'createMediaSourceWithUrl success :' + mediaSource);
      avPlayer.on('error', (error: BusinessError) => {
        console.info(TAG,testName,'error avPlayer setMediaSource,and error message is :' + error.message+ error.code);
        expect().assertFalse();
      });
      avPlayer.setMediaSource(mediaSource, playStrategy);
      console.info(TAG,testName,'avPlayer setMediaSource success ');
    } catch (error) {
      console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
      expect().assertFalse();
    }
    await sleep(1000);
    done();
  });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_002
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_002';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let playStrategy : media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        thresholdForAutoQuickPlay: 5
      };
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(null, playStrategy);
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_003
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_003';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let playStrategy : media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        thresholdForAutoQuickPlay: 5
      };
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(undefined, playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_004
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_004';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let playStrategy : media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        thresholdForAutoQuickPlay: 5
      };
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        AppStorage.setOrCreate('empty', '');
        let mediaSource: media.MediaSource =AppStorage.get('empty') as ESObject;
        console.info(TAG,testName,'createMediaSourceWithUrl success :' + mediaSource);
        avPlayer.setMediaSource(mediaSource,playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_005
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_005';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        const path = testContext.filesDir + "/" + FileName;
        let mediaSource = media.createMediaSourceWithUrl(path);
        console.info(TAG,testName,'createMediaSourceWithUrl success :' + mediaSource);
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(mediaSource, undefined);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_006
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_006';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        const path = testContext.filesDir + "/" + FileName;
        let mediaSource = media.createMediaSourceWithUrl(path);
        console.info(TAG,testName,'createMediaSourceWithUrl success :' + mediaSource);
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(mediaSource, null);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_007
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_007';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        AppStorage.setOrCreate('empty', '');
        let  playStrategy : media.PlaybackStrategy  =AppStorage.get('empty') as ESObject;
        const path = testContext.filesDir + "/" + FileName;
        let mediaSource = media.createMediaSourceWithUrl(path);
        console.info(TAG,testName,'createMediaSourceWithUrl success :' + mediaSource);
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(mediaSource, playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_008
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_008';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(null, null);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_009
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_009';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        AppStorage.setOrCreate('empty', '');
        let  playStrategy : media.PlaybackStrategy = AppStorage.get('empty') as ESObject;
        let mediaSource: media.MediaSource  = AppStorage.get('empty') as ESObject;
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        await avPlayer.setMediaSource(mediaSource, playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_010
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_010';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(undefined, undefined);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_011
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_011';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        AppStorage.setOrCreate('empty', '');
        let  playStrategy : media.PlaybackStrategy  = AppStorage.get('empty') as ESObject;
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(undefined, playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_012
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_012';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        AppStorage.setOrCreate('empty', '');
        let playStrategy : media.PlaybackStrategy  = AppStorage.get('empty') as ESObject;
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(null, playStrategy);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_013
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_013';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        AppStorage.setOrCreate('empty', 'adfajdkajkdla');
        let  mediaSourceFil : media.MediaSource  = AppStorage.get('empty') as ESObject;
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        avPlayer.setMediaSource(mediaSourceFil, null);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_014
     * @tc.desc   AVPlayer_setMediaSource
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_MEDIA_SOURCE_014';
      let FileName: string = '1vp9_320x240_30.mp4';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      try{
        avPlayer.on('error', (error: BusinessError) => {
          console.info(TAG, testName, 'error avPlayer setMediaSource,and error message is :' + error.message + error.code);
          expect( error.code).assertEqual(401);
        });
        AppStorage.setOrCreate('empty', '');
        let mediaSource : media.MediaSource  = AppStorage.get('empty') as ESObject;
        avPlayer.setMediaSource(mediaSource, undefined);
        console.info(TAG,testName,'avPlayer setMediaSource success ');
      } catch (error) {
        console.error(TAG,testName,'error happened,and error code is :' + error.message,error.code);
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    });


  })
}

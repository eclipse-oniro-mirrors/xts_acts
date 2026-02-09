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
import { audio } from '@kit.AudioKit';


const TAG = 'MediaVideoPlayerOn_audioInterruptTestSupp';


export default function MediaVideoPlayerOn_audioInterruptTest() {
  describe('MediaVideoPlayerOn_audioInterruptTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString','')
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      AppStorage.delete('emptyString')
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_001
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_001
     * @tc.desc   第一个参数为null
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_001';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on(null, (info: audio.InterruptEvent) => {
          console.info('audioInterrupt called,and InterruptEvent info is:' + info);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_002
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_002
     * @tc.desc   第一个参数为undefined
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_002';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on(undefined, (info: audio.InterruptEvent) => {
          console.info('audioInterrupt called,and InterruptEvent info is:' + info);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_003
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_003
     * @tc.desc   第一个参数为空
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_003';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on(AppStorage.get('emptyString') as ESObject, (info: audio.InterruptEvent) => {
          console.info('audioInterrupt called,and InterruptEvent info is:' + info);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG,testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_004
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_004
     * @tc.desc   第二个参数为null
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_004';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on('audioInterrupt', null as ESObject)
        console.info(TAG,testName,'audioInterrupt')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_005
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_005
     * @tc.desc   第二个参数为undefined
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_005';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on('audioInterrupt', undefined as ESObject)
        console.info(TAG,testName,'audioInterrupt')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_006
     * @tc.name   MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_006
     * @tc.desc   第二个参数为空
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_ON_AUDIO_INTERRUPT_006';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.on('audioInterrupt', AppStorage.get('emptyString') as ESObject)
        console.info(TAG,testName,'audioInterrupt')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG,testName, ' audioInterrupt error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
  })
}

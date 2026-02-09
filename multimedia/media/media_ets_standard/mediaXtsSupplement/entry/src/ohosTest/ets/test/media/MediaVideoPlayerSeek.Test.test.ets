/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { LOG_TAG } from '../common';


const TAG = LOG_TAG + 'MediaVideoPlayerSeekTestSupp';


export default function MediaVideoPlayerSeekTest() {
  describe('MediaVideoPlayerSeekTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
    });


    /**
     * @tc.number     MEDIA_VIDEO_PLAYER_SEEK_001
     * @tc.name       MEDIA_VIDEO_PLAYER_SEEK_001
     * @tc.desc       Promise
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('MEDIA_VIDEO_PLAYER_SEEK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_SEEK_001';
      const seekMode: media.SeekMode = media.SeekMode.SEEK_CONTINUOUS
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,'avPlayer')
        let timeMs: number = 1000;
        console.info(TAG,'timeMs')
        await avPlayer.seek(timeMs, seekMode);
        console.info(TAG,'succeed seek')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number     MEDIA_VIDEO_PLAYER_SEEK_002
     * @tc.name       MEDIA_VIDEO_PLAYER_SEEK_002
     * @tc.desc       Promise
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('MEDIA_VIDEO_PLAYER_SEEK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_SEEK_002';
      const seekMode: media.SeekMode = media.SeekMode.SEEK_CLOSEST
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,'avPlayer')
        let timeMs: number = 1000;
        console.info(TAG,'timeMs')
        await avPlayer.seek(timeMs, seekMode);
        console.info(TAG,'succeed seek')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number     MEDIA_VIDEO_PLAYER_SEEK_003
     * @tc.name       MEDIA_VIDEO_PLAYER_SEEK_003
     * @tc.desc       Callback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('MEDIA_VIDEO_PLAYER_SEEK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_SEEK_003';
      const seekMode: media.SeekMode = media.SeekMode.SEEK_CONTINUOUS
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,'avPlayer')
        let timeMs: number = 1000;
        console.info(TAG,'timeMs')
        await avPlayer.seek(timeMs, seekMode);
        console.info(TAG,'succeed seek')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.number     MEDIA_VIDEO_PLAYER_SEEK_004
     * @tc.name       MEDIA_VIDEO_PLAYER_SEEK_004
     * @tc.desc       Callback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('MEDIA_VIDEO_PLAYER_SEEK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_SEEK_004';
      const seekMode: media.SeekMode = media.SeekMode.SEEK_CLOSEST
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,'avPlayer')
        let timeMs: number = 1000;
        console.info(TAG,'timeMs')
        await avPlayer.seek(timeMs, seekMode);
        console.info(TAG,'succeed seek')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.number     MEDIA_VIDEO_PLAYER_SEEK_005
     * @tc.name       MEDIA_VIDEO_PLAYER_SEEK_005
     * @tc.desc       Callback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('MEDIA_VIDEO_PLAYER_SEEK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'MEDIA_VIDEO_PLAYER_SEEK_005';
      const seekMode: media.SeekMode = media.SeekMode.SEEK_PREV_SYNC
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,'avPlayer')
        let timeMs: number = 1000;
        console.info(TAG,'timeMs')
        await avPlayer.seek(timeMs, seekMode);
        console.info(TAG,'succeed seek')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
  });
}
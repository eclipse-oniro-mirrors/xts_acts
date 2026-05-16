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

import { driveFn, getPermission } from '../common';

const TAG = 'AVPlayerOn_BufferingUpdateTestSupp:';

export default function AVPlayerOn_BufferingUpdateTest() {
  describe('AVPlayerOn_BufferingUpdateTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '')

    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number    SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_001
     * @tc.name      SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_001
     * @tc.desc      第二个参数为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.on('bufferingUpdate', null as ESObject)
        expect(avPlayer !== undefined).assertTrue()
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, 'on_bufferingUpdate  error', error.message, error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number    SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_002
     * @tc.name      SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_002
     * @tc.desc      第二个参数为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.on('bufferingUpdate', undefined as ESObject)
        expect(avPlayer !== undefined).assertTrue()
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, 'on_bufferingUpdate  error', error.message, error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number    SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_003
     * @tc.name      SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_003
     * @tc.desc      第二个参数为空
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_AVPLAYER_ON_BUFFERING_UPDATE_TEST_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.on('bufferingUpdate', [] as ESObject)
        expect(avPlayer !== undefined).assertTrue()
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, 'on_bufferingUpdate  error', error.message, error.code);
        expect().assertFail()
        done();
      }
    })

  })
}
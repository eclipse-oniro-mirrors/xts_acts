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



const TAG = 'MediaAVPlayerOff_trackChangeTestSupp';


export default function MediaAVPlayerOff_trackChangeTest() {
  describe('MediaAVPlayerOff_trackChangeTest', () => {

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
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_001
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_001
     * @tc.desc   第一个参数为null
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_001';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off(null, (index: number, isSelect: boolean) => {
          console.info('trackChange info: index=' + index + ' isSelect=' + isSelect);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_002
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_002
     * @tc.desc   第一个参数为undefined
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_002';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off(undefined, (index: number, isSelect: boolean) => {
          console.info('trackChange info: index=' + index + ' isSelect=' + isSelect);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_003
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_003
     * @tc.desc   第一个参数为空
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_003';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off(AppStorage.get('emptyString') as ESObject, (index: number, isSelect: boolean) => {
          console.info(TAG,testName,'trackChange info: index=' + index + ' isSelect=' + isSelect);
        });
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG,testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_004
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_004
     * @tc.desc   第二个参数为null
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_004';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off('trackChange', null as ESObject)
        console.info(TAG,testName,'trackChange')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_005
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_005
     * @tc.desc   第二个参数为undefined
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_005';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off('trackChange', undefined)
        console.info(TAG,testName,'trackChange')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG, testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number MEDIA_AVPLAYER_OFF_TRACK_CHANGE_006
     * @tc.name   MEDIA_AVPLAYER_OFF_TRACK_CHANGE_006
     * @tc.desc   第二个参数为空
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('MEDIA_AVPLAYER_OFF_TRACK_CHANGE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_AVPLAYER_OFF_TRACK_CHANGE_006';
      try {
        let avPlayer = await media.createAVPlayer();
        console.info(TAG,testName,'avPlayer')
        avPlayer.off('trackChange',AppStorage.get('emptyString'))
        console.info(TAG,testName,'trackChange')
        await avPlayer.release();
        done();
      } catch (error) {
        console.info(TAG,testName, ' createAVPlayer error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    })
}

/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
const TAG = 'MediaXts.CreateMediaSourceWithStreamData';

export default function CreateMediaSourceTest() {
  describe('CreateMediaSourceTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number    SUB_MEDIA_CREATEMEDIASOURCE_INVALID_001
     * @tc.name      SUB_MEDIA_CREATEMEDIASOURCE_INVALID_001
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_CREATEMEDIASOURCE_INVALID_001", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATEMEDIASOURCE_INVALID_001';
      try {
        AppStorage.setOrCreate('key', null);
        let streams: Array<media.MediaStream> = AppStorage.get('key') as ESObject;
        let mediaSource: media.MediaSource = media.createMediaSourceWithStreamData(streams);
        console.info(TAG,testName,'SUCCEED',mediaSource)
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_CREATEMEDIASOURCE_INVALID_002
     * @tc.name      SUB_MEDIA_CREATEMEDIASOURCE_INVALID_002
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_CREATEMEDIASOURCE_INVALID_002", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATEMEDIASOURCE_INVALID_002';
      try {
        AppStorage.setOrCreate('key', undefined);
        let streams: Array<media.MediaStream> = AppStorage.get('key') as ESObject;
        let mediaSource: media.MediaSource = media.createMediaSourceWithStreamData(streams);
        console.info(TAG,testName,'SUCCEED',mediaSource)
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_CREATEMEDIASOURCE_INVALID_003
     * @tc.name      SUB_MEDIA_CREATEMEDIASOURCE_INVALID_003
     * @tc.desc      Testing SendableImage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_CREATEMEDIASOURCE_INVALID_003", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATEMEDIASOURCE_INVALID_003';
      try {
        AppStorage.setOrCreate('key', '');
        let streams: Array<media.MediaStream> = AppStorage.get('key') as ESObject;
        let mediaSource: media.MediaSource = media.createMediaSourceWithStreamData(streams);
        console.info(TAG,testName,'SUCCEED',mediaSource)
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}
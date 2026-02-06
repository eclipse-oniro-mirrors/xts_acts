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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG} from '../common';
import { media } from '@kit.MediaKit';
import { VideoPlayerState } from '@ohos.file.PhotoPickerComponent';

const TAG = LOG_TAG + 'MediaAPIEnumSupplementTest';

export default function MediaAPIEnumSupplementTest() {
  describe('MediaAPIEnumSupplementTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.number SYSTEM_PRESSURE_LEVEL_ENUM_002
     * @tc.name   SYSTEM_PRESSURE_LEVEL_ENUM_002
     * @tc.desc   SystemPressureLevel enum values continued
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SYSTEM_PRESSURE_LEVEL_ENUM_002', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------SYSTEM_PRESSURE_LEVEL_ENUM_002---------');
      expect(media.AVErrorCode.AVERR_PARAMETER_OUT_OF_RANGE == 5400108).assertTrue();
      expect(media.AVScreenCaptureFillMode.SCALE_TO_FILL == 1).assertTrue();
      console.info(TAG, '--------SYSTEM_PRESSURE_LEVEL_ENUM_002,end here---------');
      done();
    });

    /**
     * @tc.number VideoPlayerState_ENUM_001
     * @tc.name   VideoPlayerState_ENUM_001
     * @tc.desc   VideoPlayerState enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('VideoPlayerState_ENUM_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------PIXEL_MAP_FORMAT_ENUM_001---------');
      expect(VideoPlayerState.PLAYING == 0).assertTrue();
      expect(VideoPlayerState.PAUSED == 1).assertTrue();
      expect(VideoPlayerState.STOPPED == 2).assertTrue();
      expect(VideoPlayerState.SEEK_START == 3).assertTrue();
      expect(VideoPlayerState.SEEK_FINISH == 4).assertTrue();
      console.info(TAG, '--------PIXEL_MAP_FORMAT_ENUM_001,end here---------');
      done();
    });


  })
}
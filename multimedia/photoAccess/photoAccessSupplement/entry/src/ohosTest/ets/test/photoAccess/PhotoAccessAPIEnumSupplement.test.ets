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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG} from '../common';
import { PixelMapFormat } from '@ohos.multimedia.movingphotoview';

const TAG = LOG_TAG + 'PhotoAccessAPIEnumSupplementTest';

export default function PhotoAccessAPIEnumSupplementTest() {
  describe('PhotoAccessAPIEnumSupplementTest', () => {
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
     * @tc.number DYNAMIC_RANGE_TYPE_001
     * @tc.name   DYNAMIC_RANGE_TYPE_001
     * @tc.desc   DynamicRangeType enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('DYNAMIC_RANGE_TYPE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------DYNAMIC_RANGE_TYPE_001---------');
      console.info(TAG, '--------DYNAMIC_RANGE_TYPE_001, here---------', photoAccessHelper.DynamicRangeType.SDR);
      expect(photoAccessHelper.DynamicRangeType.SDR == 0).assertTrue();
      expect(photoAccessHelper.DynamicRangeType.HDR == 1).assertTrue();
      console.info(TAG, '--------DYNAMIC_RANGE_TYPE_001,end here---------');
      done();
    });
    /**
     * @tc.number NOTIFY_CHANGE_TYPE_001
     * @tc.name   NOTIFY_CHANGE_TYPE_001
     * @tc.desc   NotifyChangeType enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('NOTIFY_CHANGE_TYPE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------NOTIFY_CHANGE_TYPE_001---------');
      expect(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_ADD == 0).assertTrue();
      expect(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_REMOVE == 2).assertTrue();
      console.info(TAG, '--------NOTIFY_CHANGE_TYPE_001,end here---------');
      done();
    });
    /**
     * @tc.number PHOTO_SOURCE_001
     * @tc.name   PHOTO_SOURCE_001
     * @tc.desc   PhotoSource enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_SOURCE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------PHOTO_SOURCE_001---------');
      expect(photoAccessHelper.PhotoSource.ALL == 0).assertTrue();
      expect(photoAccessHelper.PhotoSource.CAMERA == 1).assertTrue();
      expect(photoAccessHelper.PhotoSource.SCREENSHOT == 2).assertTrue();
      console.info(TAG, '--------PHOTO_SOURCE_001,end here---------');
      done();
    });
    /**
     * @tc.number MOVING_PHOTO_BADGE_STATE_TYPE_001
     * @tc.name   MOVING_PHOTO_BADGE_STATE_TYPE_001
     * @tc.desc   MovingPhotoBadgeStateType enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('MOVING_PHOTO_BADGE_STATE_TYPE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------MOVING_PHOTO_BADGE_STATE_TYPE_001---------');
      expect(photoAccessHelper.MovingPhotoBadgeStateType.NOT_MOVING_PHOTO == 0).assertTrue();
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_ENABLED == 1).assertTrue();
      expect(photoAccessHelper.MovingPhotoBadgeStateType.MOVING_PHOTO_DISABLED == 2).assertTrue();
      console.info(TAG, '--------MOVING_PHOTO_BADGE_STATE_TYPE_001,end here---------');
      done();
    });
    /**
     * @tc.number OPERATION_TYPE_001
     * @tc.name   OPERATION_TYPE_001
     * @tc.desc   OperationType enum values part 1
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OPERATION_TYPE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------OPERATION_TYPE_001---------');
      expect(photoAccessHelper.OperationType.EQUAL_TO == 1).assertTrue();
      expect(photoAccessHelper.OperationType.NOT_EQUAL_TO == 2).assertTrue();
      expect(photoAccessHelper.OperationType.GREATER_THAN == 3).assertTrue();
      expect(photoAccessHelper.OperationType.LESS_THAN == 4).assertTrue();
      console.info(TAG, '--------OPERATION_TYPE_001,end here---------');
      done();
    });
    /**
     * @tc.number OPERATION_TYPE_002
     * @tc.name   OPERATION_TYPE_002
     * @tc.desc   OperationType enum values part 2
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OPERATION_TYPE_002', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------OPERATION_TYPE_002---------');
      expect(photoAccessHelper.OperationType.GREATER_THAN_OR_EQUAL_TO == 5).assertTrue();
      expect(photoAccessHelper.OperationType.LESS_THAN_OR_EQUAL_TO == 6).assertTrue();
      expect(photoAccessHelper.OperationType.AND == 7).assertTrue();
      expect(photoAccessHelper.OperationType.OR == 8).assertTrue();
      console.info(TAG, '--------OPERATION_TYPE_002,end here---------');
      done();
    });
    /**
     * @tc.number OPERATION_TYPE_003
     * @tc.name   OPERATION_TYPE_003
     * @tc.desc   OperationType enum values part 3
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OPERATION_TYPE_003', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------OPERATION_TYPE_003---------');
      expect(photoAccessHelper.OperationType.IN == 9).assertTrue();
      expect(photoAccessHelper.OperationType.NOT_IN == 10).assertTrue();
      expect(photoAccessHelper.OperationType.BEGIN_WRAP == 11).assertTrue();
      expect(photoAccessHelper.OperationType.END_WRAP == 12).assertTrue();
      console.info(TAG, '--------OPERATION_TYPE_003,end here---------');
      done();
    });
    /**
     * @tc.number OPERATION_TYPE_004
     * @tc.name   OPERATION_TYPE_004
     * @tc.desc   OperationType enum values part 4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OPERATION_TYPE_004', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------OPERATION_TYPE_004---------');
      expect(photoAccessHelper.OperationType.BETWEEN == 13).assertTrue();
      expect(photoAccessHelper.OperationType.NOT_BETWEEN == 14).assertTrue();
      console.info(TAG, '--------OPERATION_TYPE_004,end here---------');
      done();
    });
    /**
     * @tc.number VIDEO_MODE_001
     * @tc.name   VIDEO_MODE_001
     * @tc.desc   VideoMode enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('VIDEO_MODE_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------VIDEO_MODE_001---------');
      expect(photoAccessHelper.VideoMode.DEFAULT == 0).assertTrue();
      expect(photoAccessHelper.VideoMode.LOG_VIDEO == 1).assertTrue();
      console.info(TAG, '--------VIDEO_MODE_001,end here---------');
      done();
    })
    /**
     * @tc.number PIXEL_MAP_FORMAT_ENUM_001
     * @tc.name   PIXEL_MAP_FORMAT_ENUM_001
     * @tc.desc   PixelMapFormat enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PIXEL_MAP_FORMAT_ENUM_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------PIXEL_MAP_FORMAT_ENUM_001---------');
      expect(PixelMapFormat.YCBCR_P010 == 4).assertTrue();
      expect(PixelMapFormat.RGBA_1010102 == 3).assertTrue();
      expect(PixelMapFormat.YCRCB_P010 == 5).assertTrue();
      console.info(TAG, '--------PIXEL_MAP_FORMAT_ENUM_001,end here---------');
      done();
    });

  })
}
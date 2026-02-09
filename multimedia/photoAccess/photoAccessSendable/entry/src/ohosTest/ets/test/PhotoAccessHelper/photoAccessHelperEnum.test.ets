/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  sleep,
  driveFn,
  getPermission
} from '../../util/common';

export default function photoAccessHelperEnumTest () {

  describe('photoAccessHelperEnumTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
    });

    /**
     * @tc.name   album_Type_enum_001
     * @tc.number Sub_Photo_Access_Sendable_Enum_0100
     * @tc.desc   AlbumType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_Type_enum_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_Type_enum_001';
      try {
        expect( sendablePhotoAccessHelper.AlbumType.SYSTEM).assertEqual(1024);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error code: ${error.code}, error message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   album_sub_Type_enum_002
     * @tc.number Sub_Photo_Access_Sendable_Enum_0200
     * @tc.desc   AlbumSubType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_sub_Type_enum_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_sub_Type_enum_002';
      try {
        expect( sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC).assertEqual(1);
        expect( sendablePhotoAccessHelper.AlbumSubtype.FAVORITE).assertEqual(1025);
        expect( sendablePhotoAccessHelper.AlbumSubtype.VIDEO).assertEqual(1026);
        expect( sendablePhotoAccessHelper.AlbumSubtype.IMAGE).assertEqual(1031);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error code: ${error.code}, error message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
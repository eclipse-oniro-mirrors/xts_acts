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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { albumKeys, driveFn, ErrorCode, fetchOption, getPermission, LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';

import { BusinessError } from '@kit.BasicServicesKit';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'sendablePhotoAccessHelperGetAlbumsSupp';

async function getAlbumsPromiseTest(done: Function, type: sendablePhotoAccessHelper.AlbumType,
  subType: sendablePhotoAccessHelper.AlbumSubtype, callback: (count: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(type, subType).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      console.info(TAG, `getAlbums success, count: ${count}`);
      fetchResult.close();
      callback(count);
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect().assertFail();
      done();
    });
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}



export default function sendablePhotoAccessHelperGetAlbumsTest() {
  describe('sendablePhotoAccessHelperGetAlbumsTest', () => {
    const albumName = 'testAlbum';
    const abnormalAlbum = 'invalidAlbum';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_001
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_001
     * @tc.desc      promise, AlbumType.SYSTEM AlbumSubtype.USER_GENERIC
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_002
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_002
     * @tc.desc      promise, AlbumType.SYSTEM AlbumSubtype.FAVORITE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_003
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_003
     * @tc.desc      promise, AlbumType.SYSTEM AlbumSubtype.VIDEO
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_004
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_004
     * @tc.desc      promise, AlbumType.SYSTEM AlbumSubtype.IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_005
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_005
     * @tc.desc      promise, AlbumType.SYSTEM AlbumSubtype.IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })

    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_006
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_006
     * @tc.desc      promise, AlbumType.USER AlbumSubtype.USER_GENERIC
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_007
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_007
     * @tc.desc      promise, AlbumType.USER AlbumSubtype.FAVORITE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_007';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_008
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_008
     * @tc.desc      promise, AlbumType.USER AlbumSubtype.VIDEO
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_008';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_009
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_009
     * @tc.desc      promise, AlbumType.USER AlbumSubtype.IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_009';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_0010
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_0010
     * @tc.desc      promise, AlbumType.USER AlbumSubtype.IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_0010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_0010';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType, (count) => {
        expect(count >= 0).assertTrue();
      });
    })

    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_001
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_001
     * @tc.desc      promise, AlbumType
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_001---------')
      expect(sendablePhotoAccessHelper.AlbumType.USER == 0).assertTrue();
      expect(sendablePhotoAccessHelper.AlbumType.SYSTEM == 1024).assertTrue();
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_001,end here---------')
      done();
    })

    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_002
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_002
     * @tc.desc      promise, AlbumSubtype
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_002', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_002---------')
      expect(sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC == 1).assertTrue();
      expect(sendablePhotoAccessHelper.AlbumSubtype.FAVORITE == 1025).assertTrue();
      expect(sendablePhotoAccessHelper.AlbumSubtype.VIDEO == 1026).assertTrue();
      expect(sendablePhotoAccessHelper.AlbumSubtype.IMAGE == 1031).assertTrue();
      expect(sendablePhotoAccessHelper.AlbumSubtype.ANY == 2147483647).assertTrue();
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_002,end here---------')
      done();
    })
    /**
     * @tc.number    SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_003
     * @tc.name      SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_003
     * @tc.desc      promise, DynamicRangeType
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_003', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_003---------')
      expect(sendablePhotoAccessHelper.DynamicRangeType.SDR == 0).assertTrue();
      expect(sendablePhotoAccessHelper.DynamicRangeType.HDR == 1).assertTrue();
      console.info(TAG,'--------SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_EUM_003,end here---------')
      done();
    })

  })
}
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
import { copyImageToSandbox, driveFn, ErrorCode, fetchOption, getPermission, isEmpty, LOG_TAG, sleep} from '../common';
import { common } from '@kit.AbilityKit';

const TAG = LOG_TAG + 'PhotoAccessHelperEnumAlbumKeys';

async function getAlbumsPromiseWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined, fetchOps: photoAccessHelper.FetchOptions | undefined, callback: () => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult = await helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions);
    const count = fetchResult.getCount();
    console.info(TAG, `count,`+ count);
    console.info(TAG, `getAlbums success, count: ${count}`);
    fetchResult.close();
    expect(count >= 0).assertTrue()
    done();
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    callback();
    done();
  }
}

async function getAlbumsCallbackTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, callback: () => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type, subType, async (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
          callback();
        } else {
          const count = fetchResult.getCount();
          console.info(TAG, `getAlbums success, count: ${count}`);
          fetchResult.close();
        }
        done();
      } catch (error) {
        console.error(TAG, `getAlbums callback failed; code: ${error?.code}, msg: ${error?.message}`);
        expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
        done();
      }
    })
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

export default function PhotoAccessHelperEnumAlbumKeys() {
  describe('PhotoAccessHelperEnumAlbumKeys', () => {
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
     * @tc.number    getAlbums_callback_system_001
     * @tc.name      getAlbums_callback_system_001
     * @tc.desc      AlbumType.SYSTEM
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('getAlbums_callback_system_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_001';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.SCREENSHOT;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    getAlbums_callback_system_002
     * @tc.name      getAlbums_callback_system_002
     * @tc.desc      AlbumType.USER
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('getAlbums_callback_system_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_002';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.SCREENSHOT;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })


    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_001
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_001
     * @tc.desc      AlbumSubtype.USER_GENERIC
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_001';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_002
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_002
     * @tc.desc      AlbumSubtype.FAVORITE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_002';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.FAVORITE;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_003
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_003
     * @tc.desc      AlbumType.VIDEO
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_003';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_004
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_004
     * @tc.desc      AlbumSubtype.IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_004';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.IMAGE;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_005
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_005
     * @tc.desc      AlbumSubtype.ANY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMSUBTYPE_005';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsCallbackTest(done, type, subType, () => {
        expect().assertFail();
      });
    })





    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_001
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_001
     * @tc.desc      AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_001';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_002
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_002
     * @tc.desc      AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_002';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })



    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_001
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_001';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_002
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_002
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_002';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_003
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_003
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.uri
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_003';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_004
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_004
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.IMAGE AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_004';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_005
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_005
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.IMAGE AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_005';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_006
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_006
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.VIDEO AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_006';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_007
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_007
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.VIDEO AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_007';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_008
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_008
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.FAVORITE AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_008';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_009
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_009
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.FAVORITE AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_009';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_0010
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_0010
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.USER_GENERIC AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_0010';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUM_0011
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUM_0011
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.USER_GENERIC AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUM_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_ALBUM_0011';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number    PHOTO_ACCESS_HELPER_ALBUM_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_ALBUM_EUM_001
     * @tc.desc      AlbumKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_ALBUM_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_001---------')
      expect(photoAccessHelper.AlbumKeys.URI == 'uri').assertTrue();
      expect(photoAccessHelper.AlbumKeys.ALBUM_NAME == 'album_name').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_ALBUM_EUM_002
     * @tc.name      PHOTO_ACCESS_HELPER_ALBUM_EUM_002
     * @tc.desc      AlbumType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_ALBUM_EUM_002', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_002---------')
      expect(photoAccessHelper.AlbumType.USER == 0).assertTrue();
      expect(photoAccessHelper.AlbumType.SYSTEM == 1024).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_002,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_ALBUM_EUM_003
     * @tc.name      PHOTO_ACCESS_HELPER_ALBUM_EUM_003
     * @tc.desc      AlbumSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_ALBUM_EUM_003', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_003---------')
      expect(photoAccessHelper.AlbumSubtype.USER_GENERIC == 1).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.FAVORITE == 1025).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.VIDEO == 1026).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.IMAGE == 1031).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.ANY == 2147483647).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_003,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_ALBUM_EUM_004
     * @tc.name      PHOTO_ACCESS_HELPER_ALBUM_EUM_004
     * @tc.desc      AlbumSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_ALBUM_EUM_004', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_004---------')
      expect(photoAccessHelper.AlbumSubtype.USER_GENERIC == 1).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.FAVORITE == 1025).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.VIDEO == 1026).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.IMAGE == 1031).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.ANY == 2147483647).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ALBUM_EUM_004,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_001
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_001---------')
      expect(photoAccessHelper.PhotoKeys.SIZE == 'size').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DATE_ADDED == 'date_added').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DATE_MODIFIED == 'date_modified').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DURATION == 'duration').assertTrue();
      expect(photoAccessHelper.PhotoKeys.WIDTH == 'width').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_002
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_002
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_002', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_002---------')
      expect(photoAccessHelper.PhotoKeys.HEIGHT == 'height').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DATE_TAKEN == 'date_taken').assertTrue();
      expect(photoAccessHelper.PhotoKeys.ORIENTATION == 'orientation').assertTrue();
      expect(photoAccessHelper.PhotoKeys.FAVORITE == 'is_favorite').assertTrue();
      expect(photoAccessHelper.PhotoKeys.TITLE == 'title').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_002,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_003
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_003
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_003', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_003---------')
      expect(photoAccessHelper.PhotoKeys.POSITION == 'position').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DATE_ADDED_MS == 'date_added_ms').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS == 'date_modified_ms').assertTrue();
      expect(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE == 'subtype').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE == 'dynamic_range_type').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_003,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_004
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_004
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_004', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_004---------')
      expect(photoAccessHelper.PhotoKeys.COVER_POSITION == 'cover_position').assertTrue();
      expect(photoAccessHelper.PhotoKeys.BURST_KEY == 'burst_key').assertTrue();
      expect(photoAccessHelper.PhotoKeys.LCD_SIZE == 'lcd_size').assertTrue();
      // expect(photoAccessHelper.PhotoKeys.THM_SIZE == 'thm_size').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DETAIL_TIME == 'detail_time').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_004,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_005
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_005
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_005', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_005---------')
      expect(photoAccessHelper.PhotoKeys.DATE_TAKEN_MS == 'date_taken_ms').assertTrue();
      expect(photoAccessHelper.PhotoKeys.MEDIA_SUFFIX == 'media_suffix').assertTrue();
      expect(photoAccessHelper.PhotoKeys.URI == 'uri').assertTrue();
      expect(photoAccessHelper.PhotoKeys.PHOTO_TYPE == 'media_type').assertTrue();
      expect(photoAccessHelper.PhotoKeys.DISPLAY_NAME == 'display_name').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_005,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_001
     * @tc.desc      PhotoType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_001---------')
      expect(photoAccessHelper.PhotoType.IMAGE == 1).assertTrue();
      expect(photoAccessHelper.PhotoType.VIDEO == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_PHOTO_SUBTYPE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_PHOTO_SUBTYPE_EUM_001
     * @tc.desc      PhotoSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_PHOTO_SUBTYPE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_SUBTYPE_EUM_001---------')
      expect(photoAccessHelper.PhotoSubtype.DEFAULT == 0).assertTrue();
      expect(photoAccessHelper.PhotoSubtype.MOVING_PHOTO == 3).assertTrue();
      expect(photoAccessHelper.PhotoSubtype.BURST == 4).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_PHOTO_SUBTYPE_EUM_001,end here---------')
      done();
    })
      /**
     * @tc.number    PHOTO_ACCESS_HELPER_DYNAMIC_RANGE_TYPE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_DYNAMIC_RANGE_TYPE_EUM_001
     * @tc.desc      DynamicRangeType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /*it('PHOTO_ACCESS_HELPER_DYNAMIC_RANGE_TYPE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_DYNAMIC_RANGE_TYPE_EUM_001---------')
      expect(photoAccessHelper.DynamicRangeType.SDR ==0).assertTrue();
      expect(photoAccessHelper.DynamicRangeType.HDR ==1).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_DYNAMIC_RANGE_TYPE_EUM_001,end here---------')
      done();
    })
     */
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_001
     * @tc.desc      PositionType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_001---------')
      expect(photoAccessHelper.PositionType.LOCAL == 1).assertTrue();
      expect(photoAccessHelper.PositionType.CLOUD == 2).assertTrue();
      expect(photoAccessHelper.PositionType.LOCAL_AND_CLOUD == 3).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_001,end here---------')
      done();
    })

    /**
     * @tc.number    PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_001
     * @tc.desc      RecommendationType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_001---------')
      expect(photoAccessHelper.RecommendationType.QR_OR_BAR_CODE == 1).assertTrue();
      expect(photoAccessHelper.RecommendationType.QR_CODE == 2).assertTrue();
      expect(photoAccessHelper.RecommendationType.BAR_CODE == 3).assertTrue();
      expect(photoAccessHelper.RecommendationType.ID_CARD == 4).assertTrue();
      expect(photoAccessHelper.RecommendationType.PROFILE_PICTURE == 5).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_002
     * @tc.name      PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_002
     * @tc.desc      RecommendationType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_002', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_002---------')
      expect(photoAccessHelper.RecommendationType.PASSPORT == 6).assertTrue();
      expect(photoAccessHelper.RecommendationType.BANK_CARD == 7).assertTrue();
      expect(photoAccessHelper.RecommendationType.DRIVER_LICENSE == 8).assertTrue();
      expect(photoAccessHelper.RecommendationType.DRIVING_LICENSE == 9).assertTrue();
      expect(photoAccessHelper.RecommendationType.FEATURED_SINGLE_PORTRAIT == 10).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_002,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_001
     * @tc.desc      DeliveryMode emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_001---------')
      expect(photoAccessHelper.DeliveryMode.FAST_MODE == 0).assertTrue();
      expect(photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE == 1).assertTrue();
      expect(photoAccessHelper.DeliveryMode.BALANCE_MODE == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_001
     * @tc.desc      CompatibleMode emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_001---------')
      expect(photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE == 0).assertTrue();
      expect(photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE == 1).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_001,end here---------')
      done();
    })
    /**
     * @tc.number    PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_001
     * @tc.name      PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_001
     * @tc.desc      CompleteButtonText emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_001', Level.LEVEL2, async (done: Function) => {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_001---------')
      expect(photoAccessHelper.CompleteButtonText.TEXT_DONE == 0).assertTrue();
      expect(photoAccessHelper.CompleteButtonText.TEXT_SEND == 1).assertTrue();
      expect(photoAccessHelper.CompleteButtonText.TEXT_ADD == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_001,end here---------')
      done();
    })
  })
}



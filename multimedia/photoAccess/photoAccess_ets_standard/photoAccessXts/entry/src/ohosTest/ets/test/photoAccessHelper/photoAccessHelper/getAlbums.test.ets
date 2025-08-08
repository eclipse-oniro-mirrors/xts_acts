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
import { albumKeys, albumSubtype, albumType, driveFn, fetchOption, getPermission, LOG_TAG } from '../../common';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { ErrorCode } from '../../CommonErrorCode';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getAlbumsTest';

async function getAlbumsCallbackWithOptionsTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type, subType, fetchOps, async (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
          expect().assertFail();
        } else {
          const count = fetchResult.getCount();
          let album = await fetchResult.getFirstObject();
          console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
          expect(true).assertTrue();
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

async function getAlbumsCallbackWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined, fetchOps: photoAccessHelper.FetchOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions, async (error, fetchResult) => {
        try {
          if (error !== undefined) {
            console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
            expect().assertFail();
          } else {
            const count = fetchResult.getCount();
            let album = await fetchResult.getFirstObject();
            console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
            expect(true).assertTrue();
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

async function getAlbumsCallbackTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type, subType, async (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
          expect().assertFail();
        } else {
          const count = fetchResult.getCount();
          let album = await fetchResult.getFirstObject();
          console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
          expect(true).assertTrue();
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

async function getAlbumsCallbackAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      async (error, fetchResult) => {
        try {
          if (error !== undefined) {
            console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
            expect().assertFail();
          } else {
            const count = fetchResult.getCount();
            let album = await fetchResult.getFirstObject();
            console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
            expect(true).assertTrue();
            fetchResult.close();
          }
          done();
        } catch (error) {
          console.error(TAG, `getAlbums callback failed; code: ${error?.code}, msg: ${error?.message}`);
          expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
          done();
        }
        done();
      })
  } catch (error) {
    console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseWithOptionsTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type, subType, fetchOps).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      let album = await fetchResult.getFirstObject();
      console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
      expect(true).assertTrue();
      fetchResult.close();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    });
    done();
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined, fetchOps: photoAccessHelper.FetchOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      let album = await fetchResult.getFirstObject();
      console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
      expect(true).assertTrue();
      fetchResult.close();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    });
    done();
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type, subType).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      let album = await fetchResult.getFirstObject();
      console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
      expect(true).assertTrue();
      fetchResult.close();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    });
    done();
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype)
      .then(async (fetchResult) => {
        const count = fetchResult.getCount();
        let album = await fetchResult.getFirstObject();
        console.info(TAG, `getAlbums success, count: ${count}, uri: ${album.albumUri}, name: ${album.albumName}`);
        expect(true).assertTrue();
        fetchResult.close();
      })
      .catch((error: BusinessError) => {
        console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
        expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
      });
    done();
  } catch (error) {
    console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

export default function getAlbumsTest() {
  describe('getAlbumsTest', () => {
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
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_001
     * @tc.name      : getAlbums_callback_user_ops_001
     * @tc.desc      : callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_002
     * @tc.name      : getAlbums_callback_user_ops_002
     * @tc.desc      : callback, USER-FAVORITE, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_003
     * @tc.name      : getAlbums_callback_user_ops_003
     * @tc.desc      : callback, USER-VIDEO, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_004
     * @tc.name      : getAlbums_callback_user_ops_004
     * @tc.desc      : callback, USER-IMAGE, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_005
     * @tc.name      : getAlbums_callback_user_ops_005
     * @tc.desc      : callback, USER-ANY, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_006
     * @tc.name      : getAlbums_callback_user_ops_006
     * @tc.desc      : callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_006';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_007
     * @tc.name      : getAlbums_callback_user_ops_007
     * @tc.desc      : callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_007';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalAlbum],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_008
     * @tc.name      : getAlbums_callback_user_ops_abnormal_001
     * @tc.desc      : callback, USER-USER_GENERIC, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_009
     * @tc.name      : getAlbums_callback_user_ops_abnormal_002
     * @tc.desc      : callback, USER-USER_GENERIC, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_user_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_010
     * @tc.name      : getAlbums_callback_user_ops_abnormal_003
     * @tc.desc      : callback, USER-USER_GENERIC, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_user_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_user_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_011     //TODO
     * @tc.name      : getAlbums_callback_user_ops_abnormal_004
     * @tc.desc      : callback, USER-USER_GENERIC, fetchOps->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*
            it('getAlbums_callback_user_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
              const testName = 'getAlbums_callback_user_ops_abnormal_004';
              console.info(TAG, testName);
              const type: photoAccessHelper.AlbumType = albumType.USER;
              const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
              const fetchOps: photoAccessHelper.FetchOptions | undefined = undefined;
              await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
            })
    */

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_012
     * @tc.name      : getAlbums_callback_user_001
     * @tc.desc      : callback, USER-USER_GENERIC, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_013
     * @tc.name      : getAlbums_callback_user_002
     * @tc.desc      : callback, USER-FAVORITE, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_014
     * @tc.name      : getAlbums_callback_user_003
     * @tc.desc      : callback, USER-VIDEO, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.VIDEO;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_015
     * @tc.name      : getAlbums_callback_user_004
     * @tc.desc      : callback, USER-IMAGE, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.IMAGE;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_016
     * @tc.name      : getAlbums_callback_user_005
     * @tc.desc      : callback, USER-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_user_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_user_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_017
     * @tc.name      : getAlbums_callback_user_abnormal_001
     * @tc.desc      : callback, USER-USER_GENERIC, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_user_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_user_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await getAlbumsCallbackAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_018
     * @tc.name      : getAlbums_callback_user_abnormal_002
     * @tc.desc      : callback, USER-USER_GENERIC, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_user_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_user_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsCallbackAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_019
     * @tc.name      : getAlbums_callback_system_ops_001
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_020
     * @tc.name      : getAlbums_callback_system_ops_002
     * @tc.desc      : callback, SYSTEM-FAVORITE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_021
     * @tc.name      : getAlbums_callback_system_ops_003
     * @tc.desc      : callback, SYSTEM-VIDEO, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_022
     * @tc.name      : getAlbums_callback_system_ops_004
     * @tc.desc      : callback, SYSTEM-IMAGE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_023
     * @tc.name      : getAlbums_callback_system_ops_005
     * @tc.desc      : callback, SYSTEM-ANY, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_024
     * @tc.name      : getAlbums_callback_system_ops_006
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_006';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_025
     * @tc.name      : getAlbums_callback_system_ops_abnormal_001
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsCallbackWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_026
     * @tc.name      : getAlbums_callback_system_ops_abnormal_002
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_system_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_027
     * @tc.name      : getAlbums_callback_system_ops_abnormal_003
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_system_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_system_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_028    //TODO
     * @tc.name      : getAlbums_callback_system_ops_abnormal_004
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, fetchOps->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*
        it('getAlbums_callback_system_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
          const testName = 'getAlbums_callback_system_ops_abnormal_004';
          console.info(TAG, testName);
          const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
          const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
          const fetchOps: photoAccessHelper.FetchOptions | undefined = undefined;
          await getAlbumsCallbackWithOptionsAbnormalTest(done, type, subType, fetchOps);
        })
    */

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_029
     * @tc.name      : getAlbums_callback_system_001
     * @tc.desc      : callback, SYSTEM-USER_GENERIC, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_030
     * @tc.name      : getAlbums_callback_system_002
     * @tc.desc      : callback, SYSTEM-FAVORITE, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_031
     * @tc.name      : getAlbums_callback_system_003
     * @tc.desc      : callback, SYSTEM-VIDEO, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.VIDEO;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_032
     * @tc.name      : getAlbums_callback_system_004
     * @tc.desc      : callback, SYSTEM-IMAGE, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.IMAGE;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_033
     * @tc.name      : getAlbums_callback_system_005
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_system_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_callback_system_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsCallbackTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_034
     * @tc.name      : getAlbums_callback_system_abnormal_001
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_system_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_system_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsCallbackAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_035
     * @tc.name      : getAlbums_callback_system_abnormal_002
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_system_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_callback_system_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsCallbackAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_036
     * @tc.name      : getAlbums_promise_user_ops_001
     * @tc.desc      : callback, USER-ANY, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_user_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_user_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_037
     * @tc.name      : getAlbums_promise_user_ops_002
     * @tc.desc      : callback, USER-ANY, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_user_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_user_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_038
     * @tc.name      : getAlbums_promise_user_ops_abnormal_001
     * @tc.desc      : callback, USER-ANY, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_user_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_user_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_039
     * @tc.name      : getAlbums_promise_user_ops_abnormal_002
     * @tc.desc      : callback, USER-ANY, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_user_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_user_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_040
     * @tc.name      : getAlbums_promise_user_ops_abnormal_003
     * @tc.desc      : callback, USER-ANY, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_user_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_user_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_042
     * @tc.name      : getAlbums_promise_user_001
     * @tc.desc      : callback, USER-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_user_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_user_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_043
     * @tc.name      : getAlbums_promise_user_abnormal_001
     * @tc.desc      : callback, USER-ANY, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_user_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_user_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_044
     * @tc.name      : getAlbums_promise_user_abnormal_002
     * @tc.desc      : callback, USER-ANY, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_user_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_user_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_045
     * @tc.name      : getAlbums_promise_system_ops_001
     * @tc.desc      : callback, SYSTEM-ANY, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_system_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_system_ops_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_046
     * @tc.name      : getAlbums_promise_system_ops_002
     * @tc.desc      : callback, SYSTEM-ANY, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_system_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_system_ops_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_047
     * @tc.name      : getAlbums_promise_system_ops_abnormal_001
     * @tc.desc      : callback, SYSTEM-ANY, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_system_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_system_ops_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_048
     * @tc.name      : getAlbums_promise_system_ops_abnormal_002
     * @tc.desc      : callback, SYSTEM-ANY, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_system_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_system_ops_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_049
     * @tc.name      : getAlbums_promise_system_ops_abnormal_003
     * @tc.desc      : callback, SYSTEM-ANY, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_system_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_system_ops_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_051
     * @tc.name      : getAlbums_promise_system_001
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_system_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_promise_system_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_052
     * @tc.name      : getAlbums_promise_system_abnormal_001
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_system_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_system_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType | undefined = undefined;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.ANY;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_ALBUMS_053
     * @tc.name      : getAlbums_promise_system_abnormal_002
     * @tc.desc      : callback, SYSTEM-ANY, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_system_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_promise_system_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })
  })
}
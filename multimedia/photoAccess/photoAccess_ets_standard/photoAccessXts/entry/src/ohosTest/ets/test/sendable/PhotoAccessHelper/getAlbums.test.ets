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
import { albumKeys, driveFn, fetchOption, getPermission, LOG_TAG } from '../../common';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { ErrorCode } from '../../CommonErrorCode';
import { BusinessError } from '@kit.BasicServicesKit';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'sendablePhotoAccessHelperGetAlbumsTest';

async function getAlbumsPromiseWithOptionsTest(done: Function, type: sendablePhotoAccessHelper.AlbumType,
  subType: sendablePhotoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(type, subType, fetchOps).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      console.info(TAG, `getAlbums success, count: ${count}`);
      fetchResult.close();
      expect(true).assertTrue();
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
      done();
    });
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseWithOptionsAbnormalTest(done: Function,
  type: sendablePhotoAccessHelper.AlbumType | undefined, subType: sendablePhotoAccessHelper.AlbumSubtype | undefined,
  fetchOps: photoAccessHelper.FetchOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(type as sendablePhotoAccessHelper.AlbumType,
      subType as sendablePhotoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      console.info(TAG, `getAlbums success, count: ${count}`);
      fetchResult.close();
      expect(true).assertTrue();
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
      done();
    });
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseTest(done: Function, type: sendablePhotoAccessHelper.AlbumType,
  subType: sendablePhotoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(type, subType).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      console.info(TAG, `getAlbums success, count: ${count}`);
      fetchResult.close();
      expect(true).assertTrue();
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
      done();
    });
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseAbnormalTest(done: Function, type: sendablePhotoAccessHelper.AlbumType | undefined,
  subType: sendablePhotoAccessHelper.AlbumSubtype | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(type as sendablePhotoAccessHelper.AlbumType,
      subType as sendablePhotoAccessHelper.AlbumSubtype)
      .then(async (fetchResult) => {
        const count = fetchResult.getCount();
        console.info(TAG, `getAlbums success, count: ${count}`);
        fetchResult.close();
        expect(true).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
        expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
        done();
      });
  } catch (error) {
    console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseOnlyOptionsTest(done: Function, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(fetchOps).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      console.info(TAG, `getAlbums success, count: ${count}`);
      fetchResult.close();
      expect(true).assertTrue();
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
      expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
      done();
    });
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE).assertTrue();
    done();
  }
}

async function getAlbumsPromiseOnlyOptionsAbnormalTest(done: Function,
  fetchOps: photoAccessHelper.FetchOptions | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    sendablePhAccessHelper.getAlbums(fetchOps as photoAccessHelper.FetchOptions)
      .then(async (fetchResult) => {
        const count = fetchResult.getCount();
        console.info(TAG, `getAlbums success, count: ${count}`);
        fetchResult.close();
        expect(true).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        console.error(TAG, `getAlbums result failed; code: ${error?.code}, msg: ${error?.message}`);
        expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
        done();
      });
  } catch (error) {
    console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
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
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_001
     * @tc.name      : getAlbums_sendable_promise_user_ops_001
     * @tc.desc      : promise, USER-USER_GENERIC, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_002
     * @tc.name      : getAlbums_sendable_promise_user_ops_002
     * @tc.desc      : promise, USER-FAVORITE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_003
     * @tc.name      : getAlbums_sendable_promise_user_ops_003
     * @tc.desc      : promise, USER-VIDEO, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_004
     * @tc.name      : getAlbums_sendable_promise_user_ops_004
     * @tc.desc      : promise, USER-IMAGE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_005
     * @tc.name      : getAlbums_sendable_promise_user_ops_005
     * @tc.desc      : promise, USER-ANY, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_006
     * @tc.name      : getAlbums_sendable_promise_user_ops_006
     * @tc.desc      : promise, USER-ANY, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_007
     * @tc.name      : getAlbums_sendable_promise_user_ops_abnormal_001
     * @tc.desc      : promise, USER-ANY, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_008
     * @tc.name      : getAlbums_sendable_promise_user_ops_abnormal_002
     * @tc.desc      : promise, USER-ANY, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_user_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType | undefined = undefined;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_009
     * @tc.name      : getAlbums_sendable_promise_user_ops_abnormal_003
     * @tc.desc      : promise, USER-ANY, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_user_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_010     //TODO
     * @tc.name      : getAlbums_sendable_promise_user_ops_abnormal_004
     * @tc.desc      : promise, USER-ANY, fetchOps->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_user_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_ops_abnormal_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions | undefined = undefined;
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_011
     * @tc.name      : getAlbums_sendable_promise_user_001
     * @tc.desc      : promise, USER-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_user_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_012
     * @tc.name      : getAlbums_sendable_promise_user_abnormal_001
     * @tc.desc      : promise, USER-ANY, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_user_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType | undefined = undefined;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_013
     * @tc.name      : getAlbums_sendable_promise_user_abnormal_002
     * @tc.desc      : promise, USER-ANY, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_user_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_user_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const subType: sendablePhotoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_014
     * @tc.name      : getAlbums_sendable_promise_system_ops_001
     * @tc.desc      : promise, SYSTEM-USER_GENERIC, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_015
     * @tc.name      : getAlbums_sendable_promise_system_ops_002
     * @tc.desc      : promise, SYSTEM-FAVORITE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_016
     * @tc.name      : getAlbums_sendable_promise_system_ops_003
     * @tc.desc      : promise, SYSTEM-VIDEO, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_017
     * @tc.name      : getAlbums_sendable_promise_system_ops_004
     * @tc.desc      : promise, SYSTEM-IMAGE, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_018
     * @tc.name      : getAlbums_sendable_promise_system_ops_005
     * @tc.desc      : promise, SYSTEM-ANY, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_005';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_019
     * @tc.name      : getAlbums_sendable_promise_system_ops_006
     * @tc.desc      : promise, SYSTEM-ANY, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_006';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_020
     * @tc.name      : getAlbums_sendable_promise_system_ops_abnormal_001
     * @tc.desc      : promise, SYSTEM-ANY, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_ops_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_021
     * @tc.name      : getAlbums_sendable_promise_system_ops_abnormal_002
     * @tc.desc      : promise, SYSTEM-ANY, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_system_ops_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType | undefined = undefined;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_022
     * @tc.name      : getAlbums_sendable_promise_system_ops_abnormal_003
     * @tc.desc      : promise, SYSTEM-ANY, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_system_ops_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_abnormal_003';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype | undefined = undefined;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_023    //TODO
     * @tc.name      : getAlbums_sendable_promise_system_ops_abnormal_004
     * @tc.desc      : promise, SYSTEM-ANY, fetchOps->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_system_ops_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_ops_abnormal_004';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions | undefined = undefined;
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_024
     * @tc.name      : getAlbums_sendable_promise_system_001
     * @tc.desc      : promise, SYSTEM-ANY, no fetchOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_system_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_025
     * @tc.name      : getAlbums_sendable_promise_system_abnormal_001
     * @tc.desc      : promise, SYSTEM-ANY, no fetchOptions, type->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_system_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_abnormal_001';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType | undefined = undefined;
      const subType: sendablePhotoAccessHelper.AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_026
     * @tc.name      : getAlbums_sendable_promise_system_abnormal_002
     * @tc.desc      : promise, SYSTEM-ANY, no fetchOptions, subType->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_sendable_promise_system_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_system_abnormal_002';
      console.info(TAG, testName);
      const type: sendablePhotoAccessHelper.AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const subType: sendablePhotoAccessHelper.AlbumSubtype | undefined = undefined;
      await getAlbumsPromiseAbnormalTest(done, type, subType);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_027
     * @tc.name      : getAlbums_sendable_promise_only_options_001
     * @tc.desc      : promise, fetchOps->new
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_only_options_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_only_options_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseOnlyOptionsTest(done, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_028
     * @tc.name      : getAlbums_sendable_promise_only_options_002
     * @tc.desc      : promise, fetchColumns->album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_only_options_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_only_options_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await getAlbumsPromiseOnlyOptionsTest(done, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_029
     * @tc.name      : getAlbums_sendable_promise_only_options_abnormal_001
     * @tc.desc      : promise, album->invalid name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_sendable_promise_only_options_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_only_options_abnormal_001';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseOnlyOptionsAbnormalTest(done, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_SENDABLE_030
     * @tc.name      : getAlbums_sendable_promise_only_options_abnormal_002
     * @tc.desc      : promise, fetchOps->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*it('getAlbums_sendable_promise_only_options_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'getAlbums_sendable_promise_only_options_abnormal_002';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions | undefined = undefined;
      await getAlbumsPromiseOnlyOptionsAbnormalTest(done, fetchOps);
    })*/
  })
}
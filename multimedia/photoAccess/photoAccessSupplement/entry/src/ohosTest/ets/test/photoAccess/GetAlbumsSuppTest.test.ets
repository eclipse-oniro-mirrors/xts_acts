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
import { albumSubtype, albumType, driveFn, getPermission, LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'GetAlbumsSuppTest';

async function GetAlbumsCallbackWithOptionsTest(done: Function, testName: string, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions,
  callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info(TAG, testName, 'Start');
    helper.getAlbums(type, subType, fetchOps, async (error, fetchResult) => {
      if (error !== undefined) {
        console.error(TAG, testName, `getAlbums failed `, error.code, JSON.stringify(error));
        done();
        return;
      } else {
        const count = fetchResult.getCount();
        let album = await fetchResult.getFirstObject();
        console.info(TAG, testName, `getAlbums success`, count, JSON.stringify(album));
        expect(album).not().assertUndefined();
        fetchResult.close();
        done();
      }
    })
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName, `getAlbums catch failed; error: `, error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

async function GetAlbumsCallbackWithOptionsAbnormalTest(done: Function, testName: string,
  type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info(TAG, testName, 'Start');
    helper.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      async (error, fetchResult) => {
        if (error !== undefined) {
          console.error(TAG, testName, `getAlbums failed `, error.code, JSON.stringify(error));
          done();
          return;
        } else {
          const count = fetchResult.getCount();
          let album = await fetchResult.getFirstObject();
          console.info(TAG, testName, `getAlbums success`, count, JSON.stringify(album));
          expect(album).not().assertUndefined();
          fetchResult.close();
          done();
        }
      })
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName, `getAlbums catch failed; error: `, error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

async function GetAlbumsPromiseWithOptionsTest(done: Function, testName: string, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions,
  callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info(TAG, testName, 'Start');
    helper.getAlbums(type, subType, fetchOps).then(async (fetchResult) => {
      const count = fetchResult.getCount();
      let album = await fetchResult.getFirstObject();
      console.info(TAG, testName, `getAlbums success`, count, JSON.stringify(album));
      expect(true).assertTrue();
      fetchResult.close();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName, `getAlbums catch failed `, error.code, JSON.stringify(error));
      expect(error?.code == 13900020).assertTrue();
    });
    done();
  } catch (error) {
    console.error(TAG, testName, `getAlbums catch failed; error: `, error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ', maxValue);
  return maxValue;
}

export default function GetAlbumsSuppTest() {
  describe('GetAlbumsSuppTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate<number>('testNumber', 123);
      AppStorage.setOrCreate<string>('testString', 'abc');
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
      AppStorage.delete('testNumber');
      AppStorage.delete('testString');
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0001
     * @tc.desc   callback, USER-USER_GENERIC, type=enum_max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0001';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0002
     * @tc.desc   callback, USER-USER_GENERIC, type=enum_max+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0002';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0003
     * @tc.desc   callback, USER-USER_GENERIC, type=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0003';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0004
     * @tc.desc   callback, USER-USER_GENERIC, type=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0004';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0005
     * @tc.desc   callback, USER-USER_GENERIC, type=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0005';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, null as ESObject, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0006
     * @tc.desc   callback, USER-USER_GENERIC, type=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0006';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, undefined as ESObject, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0007
     * @tc.desc   callback, USER-USER_GENERIC, type=AppStorage_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0007';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, AppStorage.get('testString') as ESObject, subType,
        fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0008
     * @tc.desc   callback, USER-USER_GENERIC, type=AppStorage_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0008';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, AppStorage.get('testNumber') as ESObject, subType,
        fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0009
     * @tc.desc   callback, USER-FAVORITE, subType=enum_max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0009';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0010
     * @tc.desc   callback, USER-FAVORITE, subType=enum_max+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0010';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0011
     * @tc.desc   callback, USER-FAVORITE, subType=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0011';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = 0;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0012
     * @tc.desc   callback, USER-FAVORITE, subType=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0012';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0013
     * @tc.desc   callback, USER-FAVORITE, subType=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0013';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0014
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0014
     * @tc.desc   callback, USER-FAVORITE, subType=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0014';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, null as ESObject, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0015
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0015
     * @tc.desc   callback, USER-FAVORITE, subType=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0015';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, undefined as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0016
     * @tc.desc   callback, USER-FAVORITE, subType=AppStorage_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0016';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, AppStorage.get('testString') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0017
     * @tc.desc   callback, USER-FAVORITE, subType=AppStorage_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0017';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, AppStorage.get('testNumber') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0018
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0018
     * @tc.desc   callback, USER-FAVORITE, fetchOps=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0018';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = null as ESObject;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0019
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0019
     * @tc.desc   callback, USER-FAVORITE, fetchOps=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0019';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = undefined as ESObject;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011');
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0020
     * @tc.desc   callback, USER-FAVORITE, fetchOps=AppStorage_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0020';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0021
     * @tc.desc   callback, USER-FAVORITE, fetchOps=AppStorage_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0021';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0022
     * @tc.desc   callback, SYSTEM, subtype=maxEnum+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0022';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0023
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0023
     * @tc.desc   callback, SYSTEM, subtype=maxEnum+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0023';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0024
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0024
     * @tc.desc   callback, SYSTEM, subtype=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0024';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = 0;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0025
     * @tc.desc   callback, SYSTEM, subtype=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0025';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0026
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0026
     * @tc.desc   callback, SYSTEM, subtype=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0026';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0027
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0027
     * @tc.desc   callback, SYSTEM, subtype=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0027';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, null as ESObject, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0028
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0028
     * @tc.desc   callback, SYSTEM, subtype=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0028';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, undefined as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0029
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0029
     * @tc.desc   callback, SYSTEM, subtype=AppStorage_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0029';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, AppStorage.get('testString') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0030
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0030
     * @tc.desc   callback, SYSTEM, subtype=AppStorage_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0030';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, AppStorage.get('testNumber') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0031
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0031
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0031';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = null as ESObject
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0032
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0032
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0032';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = undefined as ESObject
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0033
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0033
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=AppStorage_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0033';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0034
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0034
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=AppStorage_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_0034';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0001
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0001';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0002
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0002';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0003
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0003';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0004
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0004';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0005
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0005';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, null as ESObject, subType, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0006
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0006';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, undefined as ESObject, subType,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0007
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType from AppStorage (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0007';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, AppStorage.get('testNumber') as ESObject, subType,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0008
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType from AppStorage (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0008';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, AppStorage.get('testString') as ESObject, subType,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0009
     * @tc.desc   callback, USER type, test with AlbumSubtype=maxEnum+1 (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0009';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0010
     * @tc.desc   callback, USER type, test with AlbumSubtype=maxEnum+1000 (large out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0010';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0011
     * @tc.desc   callback, USER type, test with AlbumSubtype=0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0011';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      let maxEnum = 0;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0012
     * @tc.desc   callback, USER type, test with AlbumSubtype=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0012';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0013
     * @tc.desc   callback, USER type, test with AlbumSubtype=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0013';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0014
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0014
     * @tc.desc   callback, USER type, test with AlbumSubtype=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0014';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, null as ESObject, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0015
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0015
     * @tc.desc   callback, USER type, test with AlbumSubtype=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0015';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, undefined as ESObject, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0016
     * @tc.desc   callback, USER type, test with AlbumSubtype from AppStorage (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0016';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0017
     * @tc.desc   callback, USER type, test with AlbumSubtype from AppStorage (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0017';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0018
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0018
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=maxEnum+1 (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0018';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0019
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0019
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=maxEnum+1000 (large out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0019';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0020
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0020';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      let maxEnum = 0;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0021
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0021';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      let maxEnum = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0022
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0022';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      let maxEnum = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0023
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0023
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0023';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, null as ESObject, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0024
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0024
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0024';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, undefined as ESObject, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0025
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype from AppStorage (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0025';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0026
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0026
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype from AppStorage (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_CALLBACK_0026';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0001
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0001';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0002
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0002';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumType) + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0003
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0003';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0004
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0004';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0005
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0005';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, null as ESObject, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0006
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0006';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, undefined as ESObject, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0007
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0007';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, AppStorage.get('testNumber') as ESObject, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0008
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0008';
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, AppStorage.get('testString') as ESObject, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0009
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0009';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0010
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0010';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0011
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0011';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = 0;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0012
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0012';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0013
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0013';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0014
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0014
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0014';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, null as ESObject, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0015
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0015
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0015';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, undefined as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0016
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0016';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, AppStorage.get('testString') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0017
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0017';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, AppStorage.get('testNumber') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0018
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0018
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0018';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = null as ESObject
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0019
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0019
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0019';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = undefined as ESObject
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0020
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0020';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0021
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0021';
      const type: photoAccessHelper.AlbumType = albumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_00021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_00021
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_00021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_00021';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0022
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0022';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = getEnumMaxValue(photoAccessHelper.AlbumSubtype) + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0023
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0023
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0023';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = 0;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0024
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0024
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0024';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0025
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0025';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0026
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0026
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0026';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, null as ESObject, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('13900020')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0027
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0027
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0027';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, undefined as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0028
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0028
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0028';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, AppStorage.get('testString') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0029
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0029
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0029';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, AppStorage.get('testNumber') as ESObject, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual('13900020')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0030
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0030
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0030';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = null as ESObject
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0031
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0031
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0031';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = undefined as ESObject
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual('14000011')
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0032
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0032
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0032';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, AppStorage.get('testString') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0033
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0033
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_OPTIONS_0033';
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, AppStorage.get('testNumber') as ESObject,
        (errCode: number) => {
          expect(errCode).assertEqual('14000011')
        })
    })
  })
}
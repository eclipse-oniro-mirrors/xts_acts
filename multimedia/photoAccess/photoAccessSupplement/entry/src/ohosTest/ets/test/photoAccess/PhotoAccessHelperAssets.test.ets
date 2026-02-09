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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'addRemoveAssetsSupp';


async function addAssetsPromiseTest(done: Function, testName: string, type:photoAccessHelper.AlbumType, subType:photoAccessHelper.AlbumSubtype, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
  const fetchOptions = fetchAllOption();
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
    const count = await fetchResult.getCount();
    console.info(TAG, `getcount count success:`+ count);
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(type, subType);
    console.info(TAG, `albumFetchResult  success`+ albumFetchResult.getCount());
    if (albumFetchResult.getCount() == 0) {
      if (albumValid(type,subType)) {
        await createUserAlbum(testContext, 'addAssets', genRandomStr(10));
        albumFetchResult = await phAccessHelper.getAlbums(type, subType);
        console.info(TAG, testName,`createUserAlbum success `);
      } else {
        return;
      }
    }
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
    await albumChangeRequest.addAssets([asset]);
    console.info(TAG, testName,`add success first`);
    await albumChangeRequest.addAssets([asset]);
    console.info(TAG, testName,`add success Second`);
    await phAccessHelper.applyChanges(albumChangeRequest);
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error}`, error.code,testName);
    callback(error.code)
    done();
  }
}

function albumValid(type:photoAccessHelper.AlbumType,subType:photoAccessHelper.AlbumSubtype): Boolean {
  if (type == photoAccessHelper.AlbumType.SYSTEM) {
    if (subType == photoAccessHelper.AlbumSubtype.USER_GENERIC) {
      return false;
    }
  }
  if (type == photoAccessHelper.AlbumType.USER) {
    if (subType == photoAccessHelper.AlbumSubtype.IMAGE ||
        subType == photoAccessHelper.AlbumSubtype.VIDEO ||
        subType == photoAccessHelper.AlbumSubtype.FAVORITE) {
      return false;
    }
  }
  return true;
}

async function removeAssetsPromiseTest(done: Function, testName: string,
  type:photoAccessHelper.AlbumType,subType:photoAccessHelper.AlbumSubtype, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
  const fetchOptions = fetchAllOption();
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
    const count = await fetchResult.getCount();
    console.info(TAG, `getcount count success:`+ count);
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(type, subType);
    console.info(TAG, `albumFetchResult  success`+ albumFetchResult.getCount());
    if (albumFetchResult.getCount() == 0) {
      if (albumValid(type,subType)) {
        await createUserAlbum(testContext, 'addAssets', genRandomStr(10));
        albumFetchResult = await phAccessHelper.getAlbums(type, subType);
        console.info(TAG, testName,`createUserAlbum success `);
      } else {
        return;
      }
    }
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =  new photoAccessHelper.MediaAlbumChangeRequest(album);
    console.info(TAG, `albumChangeRequest  success`+ albumChangeRequest  );
    await albumChangeRequest.removeAssets([asset]);
    console.info(TAG, testName,`remove success first`);
    await albumChangeRequest.removeAssets([asset]);
    console.info(TAG, testName,`remove success Second `);
    await phAccessHelper.applyChanges( albumChangeRequest);
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName,`failed; error: ${error}`,error.code,);
    callback(error.code)
    done();
  }
}

export default function PhotoAccessHelperAssetsTest() {
  describe('PhotoAccessHelperAssetsTest', () => {
    const abnormalAlbum = 'invalidAlbum';
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
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_001
     * @tc.number mediaAlbumChangeRequest_addAssets_error_001
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_001';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_002
     * @tc.number mediaAlbumChangeRequest_addAssets_error_002
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_002';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_003
     * @tc.number mediaAlbumChangeRequest_addAssets_error_003
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_003';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_004
     * @tc.number mediaAlbumChangeRequest_addAssets_error_004
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_004';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_005
     * @tc.number mediaAlbumChangeRequest_addAssets_error_005
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_005';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('14000016');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_006
     * @tc.number mediaAlbumChangeRequest_addAssets_error_006
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_006';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('14000016');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_007
     * @tc.number mediaAlbumChangeRequest_addAssets_error_007
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_008
     * @tc.number mediaAlbumChangeRequest_addAssets_error_008
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_009
     * @tc.number mediaAlbumChangeRequest_addAssets_error_009
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_addAssets_error_0010
     * @tc.number mediaAlbumChangeRequest_addAssets_error_0010
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_addAssets_error_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_addAssets_error_0010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_001
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_001
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_001';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('14000016');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_002
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_002
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_002';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('14000016');
      })
      done();
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_003
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_003
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_003';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_004
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_004
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_004';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_005
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_005
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_005';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_006
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_006
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_006';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_007
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_007
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_008
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_008
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_009
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_009
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   mediaAlbumChangeRequest_removeAssets_error_0010
     * @tc.number mediaAlbumChangeRequest_removeAssets_error_0010
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_removeAssets_error_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_error_0010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done();
    })
  })
}
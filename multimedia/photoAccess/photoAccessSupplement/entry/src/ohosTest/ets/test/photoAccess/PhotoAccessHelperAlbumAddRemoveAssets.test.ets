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
import { BusinessError } from '@kit.BasicServicesKit';
import { asset } from '@kit.AssetStoreKit';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'

const TAG = LOG_TAG + 'AlbumAddRemoveAssetsSupp';
let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
  sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);

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

async function addAssetsPromiseTestForFirstParameters(done: Function, testName: string, type:photoAccessHelper.AlbumType,
  subType:photoAccessHelper.AlbumSubtype, asset: photoAccessHelper.PhotoAsset, callback: (errCode: number) => void) {
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
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    console.info(TAG, `album getFirstObject`,album);
    album.addAssets([asset]).then(() => {
      console.info(TAG, 'album addAssets successfully');
    }).catch((err: BusinessError) => {
      console.error(TAG, `album addAssets failed with error: ${err.code}, ${err.message}`);
    });
  } catch (error) {
    console.error(TAG, `failed; error: ${error}`, error.code,testName);
    callback(error.code)
    done();
  }
}


async function addAssetsCallbackTestForFirstParameters(done: Function, testName: string, type:photoAccessHelper.AlbumType,
  subType:photoAccessHelper.AlbumSubtype, asset: photoAccessHelper.PhotoAsset, callback: (errCode: number) => void) {
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
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
    console.info(TAG, testName,`photoAccessHelper.MediaAlbumChangeRequest`,albumChangeRequest);
    album.addAssets([asset], (err) => {
      if (err === undefined) {
        console.info(TAG, 'album addAssets successfully');
      } else {
        console.error(TAG, `album addAssets failed with error: ${err.code}, ${err.message}`);
      }
    });
  } catch (error) {
    console.error(TAG, `failed; error: ${error}`, error.code,testName);
    callback(error.code)
    done();
  }
}
async function removeAssetsCallbackTest(done: Function, testName: string,asset: photoAccessHelper.PhotoAsset,
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
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =  new photoAccessHelper.MediaAlbumChangeRequest(album);
    console.info(TAG, `albumChangeRequest  success`+ albumChangeRequest  );
    album.removeAssets([asset], (err) => {
      if (err === undefined) {
        console.info(TAG,testName,'album removeAssets successfully');
      } else {
        console.error(TAG,`album removeAssets failed with error: ${err.code}, ${err.message}`);
      }
    });
  } catch (error) {
    console.error(TAG, testName,testName,`failed; error: ${error}`,error.code,);
    callback(error.code)
    done();
  }
}
async function removeAssetsPromiseTest(done: Function, testName: string,asset: photoAccessHelper.PhotoAsset,
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
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =  new photoAccessHelper.MediaAlbumChangeRequest(album);
    console.info(TAG, `albumChangeRequest  success`+ albumChangeRequest  );
    album.removeAssets([asset]).then(() => {
      console.info(TAG,testName,'album removeAssets successfully');
    }).catch((err: BusinessError) => {
      console.error(TAG,`album removeAssets failed with error: ${err.code}, ${err.message}`);
    });
  } catch (error) {
    console.error(TAG, testName,testName,`failed; error: ${error}`,error.code,);
    callback(error.code)
    done();
  }
}
export default function PhotoAccessHelperAlbumAssetsTest() {
  describe('PhotoAccessHelperAlbumAssetsTest', () => {
    const abnormalAlbum = 'invalidAlbum';
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('testNumber', -1);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('testNumber');
    });



    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_001
     * @tc.number Photo_Album_addAssets_ForFirstParameter_001
     * @tc.desc   addAssets addAssets asset  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_001';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_002
     * @tc.number Photo_Album_addAssets_ForFirstParameter_002
     * @tc.desc   addAssets asset  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_002';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_003
     * @tc.number Photo_Album_addAssets_ForFirstParameter_003
     * @tc.desc   addAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_003';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_004
     * @tc.number Photo_Album_addAssets_ForFirstParameter_004
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_004';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_005
     * @tc.number Photo_Album_addAssets_ForFirstParameter_005
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_005';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_006
     * @tc.number Photo_Album_addAssets_ForFirstParameter_006
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_006';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_007
     * @tc.number Photo_Album_addAssets_ForFirstParameter_007
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })

    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_008
     * @tc.number Photo_Album_addAssets_ForFirstParameter_008
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_009
     * @tc.number Photo_Album_addAssets_ForFirstParameter_009
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_010
     * @tc.number Photo_Album_addAssets_ForFirstParameter_010
     * @tc.desc   addAssets addAssets SYSTEM,VIDEO；asset：undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_011
     * @tc.number Photo_Album_addAssets_ForFirstParameter_011
     * @tc.desc   addAssets addAssets SYSTEM,VIDEO；asset：null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_011';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_012
     * @tc.number Photo_Album_addAssets_ForFirstParameter_012
     * @tc.desc   addAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_012';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsPromiseTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_001
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_001
     * @tc.desc   addAssets addAssets asset  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_001';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_002
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_002
     * @tc.desc   addAssets asset  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_002';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_003
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_003
     * @tc.desc   addAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_003';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_004
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_004
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_004';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_005
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_005
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_005';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_006
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_006
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_006';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_007
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_007
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })

    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_008
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_008
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_009
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_009
     * @tc.desc   addAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_010
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_010
     * @tc.desc   addAssets addAssets SYSTEM,VIDEO；asset：undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_011
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_011
     * @tc.desc   addAssets addAssets SYSTEM,VIDEO；asset：null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_011';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_addAssets_ForFirstParameter_CallBack_012
     * @tc.number Photo_Album_addAssets_ForFirstParameter_CallBack_012
     * @tc.desc   addAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_addAssets_ForFirstParameter_CallBack_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_addAssets_ForFirstParameter_CallBack_012';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await addAssetsCallbackTestForFirstParameters(done, testName, type , subType, asset,errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })


    /**
     * @tc.name   Photo_Album_removeAssets_Callback_001
     * @tc.number Photo_Album_removeAssets_Callback_001
     * @tc.desc   removeAssets asset is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_001';
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_002
     * @tc.number Photo_Album_removeAssets_Callback_002
     * @tc.desc   removeAssets asset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_002';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_003
     * @tc.number Photo_Album_removeAssets_Callback_003
     * @tc.desc   removeAssets asset is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_003';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_004
     * @tc.number Photo_Album_removeAssets_Callback_004
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_004';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_005
     * @tc.number Photo_Album_removeAssets_Callback_005
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_005';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_006
     * @tc.number Photo_Album_removeAssets_Callback_006
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_006';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_007
     * @tc.number Photo_Album_removeAssets_Callback_007
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })

    /**
     * @tc.name   Photo_Album_removeAssets_Callback_008
     * @tc.number Photo_Album_removeAssets_Callback_008
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_009
     * @tc.number Photo_Album_removeAssets_Callback_009
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_010
     * @tc.number Photo_Album_removeAssets_Callback_010
     * @tc.desc   removeAssets addAssets SYSTEM,VIDEO；asset：undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_011
     * @tc.number Photo_Album_removeAssets_Callback_011
     * @tc.desc   removeAssets addAssets SYSTEM,VIDEO；asset：null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_011';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Callback_012
     * @tc.number Photo_Album_removeAssets_Callback_012
     * @tc.desc   removeAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Callback_012';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsCallbackTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })



    /**
     * @tc.name   Photo_Album_removeAssets_Promise_001
     * @tc.number Photo_Album_removeAssets_Promise_001
     * @tc.desc   removeAssets asset is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_001';
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_002
     * @tc.number Photo_Album_removeAssets_Promise_002
     * @tc.desc   removeAssets asset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_002';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_003
     * @tc.number Photo_Album_removeAssets_Promise_003
     * @tc.desc   removeAssets asset is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_003';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_004
     * @tc.number Photo_Album_removeAssets_Promise_004
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_004';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_005
     * @tc.number Photo_Album_removeAssets_Promise_005
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_005';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_006
     * @tc.number Photo_Album_removeAssets_Promise_006
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_006';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_007
     * @tc.number Photo_Album_removeAssets_Promise_007
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_007';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })

    /**
     * @tc.name   Photo_Album_removeAssets_Promise_008
     * @tc.number Photo_Album_removeAssets_Promise_008
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_008';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_009
     * @tc.number Photo_Album_removeAssets_Promise_009
     * @tc.desc   removeAssets asset USER USER_GENERIC,asset:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_009';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_010
     * @tc.number Photo_Album_removeAssets_Promise_010
     * @tc.desc   removeAssets addAssets SYSTEM,VIDEO；asset：undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_010';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      AppStorage.setOrCreate('key', undefined);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_011
     * @tc.number Photo_Album_removeAssets_Promise_011
     * @tc.desc   removeAssets addAssets SYSTEM,VIDEO；asset：null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_011';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      AppStorage.setOrCreate('key', null);
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Album_removeAssets_Promise_012
     * @tc.number Photo_Album_removeAssets_Promise_012
     * @tc.desc   removeAssets asset  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Album_removeAssets_Promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Album_removeAssets_Promise_012';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      AppStorage.setOrCreate('key', '');
      let asset: photoAccessHelper.PhotoAsset  = AppStorage.get('key') as ESObject;
      await removeAssetsPromiseTest(done, testName, asset, type, subType, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0100
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0100
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0100'
      try {
        await sendablePhAccessHelper.getAssets(null as ESObject);
        console.info(TAG, testName, "getAssets successfully");
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' failed ', JSON.stringify(error), error.code, error);
        expect(error != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0200
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0200
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0200'
      try {
        await sendablePhAccessHelper.getAssets(AppStorage.get('testString') as ESObject);
        console.info(TAG, testName, "getAssets successfully");
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' failed ', JSON.stringify(error), error.code);
        expect(error != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0300
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0300
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0300'
      try {
        await sendablePhAccessHelper.getAssets(AppStorage.get('testNumber') as ESObject);
        console.info(TAG, testName, "getAssets successfully");
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' failed ', JSON.stringify(error), error.code);
        expect(error != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0400
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0400
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_0400'
      try {
        await sendablePhAccessHelper.getAssets('' as ESObject);
        console.info(TAG, testName, "getAssets successfully");
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' failed ', JSON.stringify(error), error.code);
        expect(error != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(null as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code, err);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(undefined as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets('' as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(null as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(undefined as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600'
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM,
            sendablePhotoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets('' as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code, err);
        expect(err != undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0100
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0100
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0100'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets(null, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0200
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0200
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0200'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets(undefined, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0300
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0300
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0300'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets('' as ESObject, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0400
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0400
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0400'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets(null, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0500
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0500
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0500'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets(undefined, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0600
     * @tc.name       SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0600
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_CALLBACK_0600'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        album.getAssets('' as ESObject, (err, albumFetchResult) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ', albumFetchResult.getCount());
            expect().assertFail();
            done();
          } else {
            console.error(`album getAssets failed with error:`, JSON.stringify(err), err.code);
            expect(err.code).assertEqual('14000011');
            done();
          }
        });
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code, err);
        expect(err.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0100'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(null as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0200'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(undefined as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0300'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets('' as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0400'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(null as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0500'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets(undefined as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600
     * @tc.name       SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600
     * @tc.desc       get assets with invalid fetchColumns
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ABS_ALBUM_GET_ASSETS_PROMISE_0600'
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
        const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        console.info(TAG, testName, JSON.stringify(fetchOps));
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
            fetchOps);
        console.info(TAG, testName, JSON.stringify(albumList));
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        console.info(TAG, testName, JSON.stringify(album));
        let res = await album.getAssets('' as ESObject);
        console.info(TAG, testName, 'SUCCESS');
        expect(res.getCount() > 0).assertTrue()
        done();
      } catch (err) {
        console.error(TAG, testName, 'FAILED', JSON.stringify(err), err.code);
        expect(err.code).assertEqual('14000011')
        done();
      }
    });
  })
}
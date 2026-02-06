/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import {
  checkSet,
  checkUri,
  checkReadAndWrite,
  columns,
  photoExtensions,
  videoExtensions,
  sizes,
  getPhotoAssetAttrs,
  fetchOptions_allocate_file
} from './common'
import { BusinessError } from '@ohos.base';
import { driveFn, getPermission, sleep } from '../Common.test.ets'
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Hypium,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Context from "application.Context"
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'

interface size {
  width: number,
  height: number
}

export default function PhotoAccessHelperTest() {

  describe('PhotoAccessHelperTest', () => {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let options: photoAccessHelper.CreateOptions = {
      title: 'testPhoto',
      subtype: photoAccessHelper.PhotoSubtype.DEFAULT
    }
    let fetchResultCount: int = 0
    let testContext: Context = Hypium.get('context') as Context;
    const imageType = photoAccessHelper.PhotoType.IMAGE
    const videoType = photoAccessHelper.PhotoType.VIDEO

    let keyNumCallback = 0

    let releaseHelperCallback: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      done: () => void
    ) => void) | undefined;

    let getAssetsForKeysCallback: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions,
      tag: string,
      done: () => void
    ) => void) | undefined;

    getAssetsForKeysCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null, fetchOptions, tag, done) => {
      fetchOptions.fetchColumns = [columns[keyNumCallback]];
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          keyNumCallback++
          if (keyNumCallback == columns.length - 1) {
            keyNumCallback = 0
            console.info('getAssetsForKeysCallback getAssets end');
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            getAssetsForKeysCallback!(phAccessHelper, fetchOptions, tag, done)
          }
        } else {
          console.error(`getAssetsForKeysCallback ${tag} fetchResult fail ${keyNumCallback}` + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let keyNumPromise = 0

    let getAssetsForKeysPromise: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions,
      done: () => void
    ) => Promise<void>) | undefined;

    let releaseHelperPromise: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      done: () => void
    ) => Promise<void>) | undefined;

    getAssetsForKeysPromise = async (phAccessHelper, fetchOptions, done) => {
      try {
        fetchOptions.fetchColumns = [columns[keyNumPromise]]
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          keyNumPromise++
          if (keyNumPromise == 13) {
            keyNumPromise = 0
            console.info('getAssetsForKeysPromise getAssets end');
            await releaseHelperPromise!(phAccessHelper, done)
          } else {
            await getAssetsForKeysPromise!(phAccessHelper, fetchOptions, done)
          }
        }
      } catch (err) {
        console.error('getAssets failed, message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let getAssetsAndReleaseCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void): void => {
      console.info('getAssets start');
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset != undefined) {
            console.info('photoAsset.displayName : ' + photoAsset.displayName);
            console.info('photoAsset.uri : ' + photoAsset.uri);
            console.info('photoAsset.photoType : ' + photoAsset.photoType);
          }
          console.info('fetchOptions.fetchColumns : ' + fetchOptions.fetchColumns);
          console.info('getAssets end');
          releaseHelperCallback!(phAccessHelper, done)
        } else {
          console.error('fetchResult fail' + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let getAssetsAndReleasePromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        if (fetchResult != undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset != undefined) {
            console.info('photoAsset.displayName : ' + photoAsset.displayName);
            console.info('photoAsset.uri : ' + photoAsset.uri);
            console.info('photoAsset.photoType : ' + photoAsset.photoType);
          }
          releaseHelperPromise!(phAccessHelper, done)
        }
      } catch (err) {
        console.error('getAssets failed, message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let setArgGetAssetsCallback = (photoHelper: photoAccessHelper.PhotoAccessHelper | null,
      columns: photoAccessHelper.PhotoKeys[], tag: string, done: () => void) => {
      try {
        fetchOptions.fetchColumns = columns.map<string>(key => key.toString());
        getAssetsAndReleaseCallback(photoHelper, fetchOptions, done)
        console.info(`${tag} excute pass`);
      } catch (err) {
        console.error(`${tag} getAssets failed , catch err is ` + err.message);
        expect(false).assertTrue();
        done();
      }
    }

    let setArgGetAssetsPromise = (photoHelper: photoAccessHelper.PhotoAccessHelper | null,
      columns: photoAccessHelper.PhotoKeys[], tag: string, done: () => void) => {
      try {
        fetchOptions.fetchColumns = columns.map<string>(key => key.toString());
        getAssetsAndReleasePromise(photoHelper, fetchOptions, done)
        console.info(`${tag} excute pass`);
      } catch (err) {
        console.error(`${tag} getAssets failed , catch err is ` + err.message);
        expect(false).assertTrue();
        done();
      }
    }

    let createAsset = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null, photoType: photoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions, done: () => void) => {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err, uri) => {
        if (uri != undefined) {
          console.info('createAsset uri' + uri);
          checkUri(uri, photoType, extension)
          releaseHelperCallback!(phAccessHelper, done)
        } else {
          console.error('createAsset failed, message = ', err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let suffixNum1 = 0

    let createAssetWithSuffixesCallback1: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      photoType: photoAccessHelper.PhotoType,
      extension: string,
      options: photoAccessHelper.CreateOptions,
      extensions: string[],
      done: () => void
    ) => void) | undefined;

    createAssetWithSuffixesCallback1 = (phAccessHelper, photoType, extension, options, extensions, done) => {
      console.info('createAssetWithSuffixesCallback1 start');
      extension = extensions[suffixNum1]
      console.info(`createAssetWithSuffixesCallback1 set suffix is:` + extension);
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err, uri) => {
        if (uri != undefined) {
          console.info('createAssetWithSuffixesCallback1 createAsset uri123: ' + uri);
          checkUri(uri, photoType, extension)
          console.info('createAssetWithSuffixesCallback1 checkUri ok ' + uri + " extensions.length " +
          extensions.length);
          suffixNum1++
          if (suffixNum1 == extensions.length) {
            suffixNum1 = 0
            console.info('createAssetWithSuffixesCallback1 getAssets end');
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            createAssetWithSuffixesCallback1!(phAccessHelper, photoType, extension, options, extensions, done)
          }
        } else {
          console.error('createAsset failed, message = ', err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let suffixNum2 = 0

    let createAssetWithSuffixesCallback2: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      photoType: photoAccessHelper.PhotoType,
      extension: string,
      extensions: string[],
      done: () => void
    ) => void) | undefined;

    createAssetWithSuffixesCallback2 = (phAccessHelper, photoType, extension, extensions, done) => {
      console.info('createAssetWithSuffixesCallback2 start');
      extension = extensions[suffixNum2]
      console.info(`createAssetWithSuffixesCallback2 set suffix is:` + extension);
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, (err, uri) => {
        if (uri != undefined) {
          console.info('createAsset uri' + uri);
          checkUri(uri, photoType, extension)
          suffixNum2++
          if (suffixNum2 == extensions.length) {
            suffixNum2 = 0
            console.info('createAssetWithSuffixesCallback2 getAssets end');
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            createAssetWithSuffixesCallback2!(phAccessHelper, photoType, extension, extensions, done)
          }
        } else {
          console.error('createAsset failed, message = ', err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let suffixNum3 = 0

    let createAssetWithSuffixesPromise: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      photoType: photoAccessHelper.PhotoType,
      extension: string,
      options: photoAccessHelper.CreateOptions,
      extensions: string[],
      done: () => void
    ) => Promise<void>) | undefined;

    createAssetWithSuffixesPromise = async (phAccessHelper, photoType, extension, options, extensions, done) => {
      console.info('createAssetWithSuffixesPromise start');
      extension = extensions[suffixNum3]
      console.info(`createAssetWithSuffixesPromise set suffix is:` + extension);
      try {
        let uri: string;
        if (options.title == "no") {
          uri = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension);
          checkUri(uri, photoType, extension)
        } else {
          uri = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          checkUri(uri, photoType, extension)
        }
        console.info('createAsset uri' + uri);
        suffixNum3++
        if (suffixNum3 == extensions.length) {
          suffixNum3 = 0
          console.info('createAssetWithSuffixesPromise getAssets end');
          releaseHelperPromise!(phAccessHelper, done)
        } else {
          createAssetWithSuffixesPromise!(phAccessHelper, photoType, extension, options, extensions, done)
        }
      } catch (err) {
        console.error('createAsset failed, message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let registerChangeCallback = (callBackSet: boolean, uriSet: boolean,
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null, forChildUris: boolean, done: () => void) => {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          console.info('fetchResult success');
          fetchResult.getFirstObject((err, photoAsset) => {
            if (photoAsset != undefined) {
              console.info('photoAsset displayName: ', photoAsset.displayName);
              let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
              }
              checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
              setTimeout(() => {
                releaseHelperCallback!(phAccessHelper, done)
              }, 1000);
            } else {
              console.error('photoAsset failed with err:' + err);
              expect(false).assertTrue();
              done();
            }
          });
        } else {
          console.error('fetchResult fail' + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let registerChangePromise = async (callBackSet: boolean, uriSet: boolean,
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null, forChildUris: boolean, done: () => void) => {
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
        console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
      }
      checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
      releaseHelperPromise!(phAccessHelper, done)
    }

    let getPhotoAssetAttrsCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      console.info('photoAsset.get start');
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          console.info('fetchResult success1');
          try {
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            console.info('fetchResult success2');
            if (photoAsset != undefined) {
              getPhotoAssetAttrs(photoAsset)
            }
          } catch (err) {
            console.error('getFirstObject fail, err is: ' + err.message);
            expect(false).assertTrue();
            done();
          }
          releaseHelperCallback!(phAccessHelper, done)
        } else {
          console.error('fetchResult fail' + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let getPhotoAssetAttrsPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      console.info('photoAsset.get start');
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(photoAsset).not().assertUndefined()
        getPhotoAssetAttrs(photoAsset)
        releaseHelperPromise!(phAccessHelper, done)
      } catch (err) {
        console.error('getPhotoAssetAttrsPromise failed. message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let keyNum1 = 0

    let getPhotoAssetForKeysCallback: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions,
      done: () => void
    ) => void) | undefined;

    getPhotoAssetForKeysCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null, fetchOptions, done) => {
      fetchOptions.fetchColumns = [columns[keyNum1]];
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let photoAssetKey: photoAccessHelper.MemberType = photoAsset.get(columns[keyNum1].toString());
          expect(photoAssetKey).not().assertUndefined()
          console.log(`photoAssetKey ${columns[keyNum1]} is : ${photoAssetKey}`)
          keyNum1++
          if (keyNum1 == 13) {
            keyNum1 = 0
            console.info('getPhotoAssetForKeysCallback getAssets end');
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            getPhotoAssetForKeysCallback!(phAccessHelper, fetchOptions, done)
          }
        } else {
          console.error(`getPhotoAssetForKeysCallback fetchResult fail ${keyNum1}` + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let keyNum2 = 0

    let getPhotoAssetForKeysPromise: ((
      phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions,
      done: () => void
    ) => Promise<void>) | undefined;

    getPhotoAssetForKeysPromise = async (phAccessHelper, fetchOptions, done) => {
      try {
        fetchOptions.fetchColumns = [columns[keyNum2]]
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let photoAssetKey: photoAccessHelper.MemberType = photoAsset.get(columns[keyNum2].toString());
          expect(photoAssetKey).not().assertUndefined()
          console.log(`photoAssetKey ${columns[keyNum2]} is : ${photoAssetKey}`)
          keyNum2++
          if (keyNum2 == 13) {
            keyNum2 = 0
            console.info('getPhotoAssetForKeysPromise getAssets end');
            releaseHelperPromise!(phAccessHelper, done)
          } else {
            getPhotoAssetForKeysPromise!(phAccessHelper, fetchOptions, done)
          }
        }
      } catch (err) {
        console.error('getAssets failed, message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let setPhotoAssetTitleCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
          photoAsset.set(titleStr, 'newTitle');
          let result = photoAsset.get(titleStr);
          expect(result).assertEqual('newTitle');
          console.log(`photoAsset.title is: ${result}`)
          releaseHelperCallback!(phAccessHelper, done)
        } else {
          console.error(`setPhotoAssetTitleCallback fetchResult fail is: ` + err);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let setPhotoAssetTitlePromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        if (fetchResult != undefined) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
          photoAsset.set(titleStr, 'newTitle');
          let result = photoAsset.get(titleStr);
          expect(result).assertEqual('newTitle');
          console.log(`photoAsset.title is: ${result}`)
          releaseHelperPromise!(phAccessHelper, done)
        }
      } catch (err) {
        console.error('setPhotoAssetTitlePromise failed, message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let commitModifyCallback = (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      fetchOptions.fetchColumns = columns.map<string>(key => key.toString());
      console.log(`commitModify fetchOptions.fetchColumns =  ${fetchOptions.fetchColumns} `);
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
        if (fetchResult != undefined) {
          console.log(`commitModify fetchResult != undefined  `)
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          console.log(`commitModify getFirstObject success  `)
          for (let i = 0; i < columns.length; i++) {
            let keyStr1: string = columns[i].toString();
            let initKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr1);
            expect(initKeyValue).not().assertUndefined()
            console.log(`photoAsset.get init ${columns[i]} is: ${initKeyValue} `)
          }
          photoAsset.commitModify((err: BusinessError | null) => {
            if (err?.code == 0) {
              console.log(`commitModify error: ${err} ${err?.code}`);
              console.log(`photoAsset.commitModify `)
              for (let i = 0; i < columns.length; i++) {
                let keyStr2: string = columns[i].toString();
                console.log(`photoAsset.commitModify keyStr2 = ${keyStr2}`);
                let newKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr2);
                console.log(`get success keyStr2 = ${keyStr2}`);
                expect(newKeyValue).not().assertUndefined()
                console.log(`photoAsset.get new ${columns[i]} is: ${newKeyValue} `)
                if (i == columns.length - 1) {
                  releaseHelperCallback!(phAccessHelper, done)
                }
              }
            } else {
              console.error('123commitModify failed, message123 =', err?.code);
              expect(false).assertTrue();
              done();
            }
          });
        } else {
          console.error(`commitModifyCallback fetchResult fail is: ` + err?.message);
          expect(false).assertTrue();
          done();
        }
      });
    }

    let commitModifyPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      fetchOptions.fetchColumns = columns.map<string>(key => key.toString());
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      let titleStr: string = photoAccessHelper.PhotoKeys.TITLE.toString();
      for (let i = 0; i < columns.length; i++) {
        let keyStr: string = columns[i].toString();
        let photoAssetKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr);
        console.log(`photoAsset.get ${columns[i]} is: ${photoAssetKeyValue} `)
      }
      let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(titleStr);
      photoAsset.set(titleStr, 'newTitle3');
      try {
        await photoAsset.commitModify();
        for (let i = 0; i < columns.length; i++) {
          let keyStr2: string = columns[i].toString();
          let newKeyValue: photoAccessHelper.MemberType = photoAsset.get(keyStr2);
          console.log(`photoAsset.get new ${columns[i]} is: ${newKeyValue} `)
          if (i == columns.length - 1) {
            releaseHelperPromise!(phAccessHelper, done)
          }
        }
      } catch (err) {
        console.error('release failed. message = ', err);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      console.info('getThumbnailCallback start getAssets ');
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      console.info('getThumbnailCallback getAssets Finish');
      if (fetchResult != undefined) {
        fetchResultCount = fetchResult.getCount();
        console.info('getThumbnailCallback getAssets success ' + fetchResultCount);
      } else {
        console.info('getThumbnailCallback getAssets failed');
      }
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info('photoAsset displayName = ', photoAsset.displayName);
      photoAsset.getThumbnail((err: BusinessError | null, pixelMap) => {
        console.log(`commitModify error: ${err} ${err?.code}`);
        if (err?.code == 0) {
          expect(pixelMap).not().assertUndefined()
          console.info('getThumbnail successful ' + pixelMap);
        } else {
          console.error('getThumbnail fail', err);
          expect(false).assertTrue();
          done();
        }
      });
      releaseHelperCallback!(phAccessHelper, done)
    }

    let getThumbnailCallbackWithSize = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void): Promise<void> => {
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info('photoAsset displayName = ', photoAsset.displayName);
      for (let i = 0; i < sizes.length; i++) {
        console.info('getThumbnail current index = ', i);
        console.info('getThumbnail current sizes = ', sizes[i]);
        photoAsset.getThumbnail(sizes[i], (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          if (err == undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            if (i > 0 && i < 4) {
              console.info('getThumbnail errorA');
              expect(false).assertTrue();
              done();
            }
            if (i == sizes.length - 1) {
              releaseHelperCallback!(phAccessHelper, done)
            }
          } else {
            console.info('getThumbnail fail', err);
            if (i > 3 || i < 1) {
              console.error('getThumbnail errorB index = ' + i);
              expect(false).assertTrue();
              done();
            }
          }
        });
      }
    }

    let getThumbnailPromiseWithSize = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info('photoAsset displayName = ', photoAsset.displayName);
      for (let i = 0; i < sizes.length; i++) {
        photoAsset.getThumbnail(sizes[i] as image.Size).then((pixelMap: image.PixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          if (i > 0 && i < 4) {
            console.info('getThumbnail error');
            expect(false).assertTrue();
            done();
          }
          if (i == sizes.length - 1) {
            releaseHelperPromise!(phAccessHelper, done)
          }
        }).catch((err: Error) => {
          console.error('getThumbnail fail ' + err);
          console.error('getThumbnail fail i = ' + i);
          if (i > 3 || i < 1) {
            console.info('getThumbnail error');
            expect(false).assertTrue();
            done();
          }
        });
      }
    }

    let getCount = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      fetchResultCount = fetchResult.getCount();
      console.info('fetchResultCount = ', fetchResultCount);
      expect(fetchResultCount).assertLarger(0)
      releaseHelperPromise!(phAccessHelper, done)
    }

    let checkIsAfterLast = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
      if (fetchResult.isAfterLast()) {
        console.info('photoAsset isAfterLast displayName = ', photoAsset.displayName);
      } else {
        console.info('photoAsset  not isAfterLast ');
        expect(false).assertTrue();
        done();
      }
      releaseHelperPromise!(phAccessHelper, done)
    }

    let closeFetchResult = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        fetchResult.close();
        try {
          fetchResult.getCount();
          expect(false).assertTrue();
          done();
        } catch (err) {
          console.info('fetchResult.getCount() fail. message = ' + err);
          console.info('close succeed.');
          releaseHelperPromise!(phAccessHelper, done)
        }
      } catch (err) {
        console.error('closeFetchResult fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getFirstObjectCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        fetchResult.getFirstObject((err, photoAsset) => {
          if (photoAsset != undefined) {
            console.info('photoAsset displayName: ', photoAsset.displayName);
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            console.error('photoAsset failed with err:' + err);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error('getFirstObjectCallback fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getFirstObjectPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        if (photoAsset != undefined) {
          console.info('photoAsset displayName: ', photoAsset.displayName);
          releaseHelperPromise!(phAccessHelper, done)
        } else {
          console.error('getFirstObjectPromise failed');
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.error('getFirstObjectPromise fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getNextObjectCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          fetchResult.getNextObject((err, photoAsset) => {
            if (photoAsset != undefined) {
              console.info('photoAsset displayName: ', photoAsset.displayName);
              releaseHelperCallback!(phAccessHelper, done)
            } else {
              console.error('photoAsset failed with err: ' + err);
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (err) {
        console.error('getNextObjectCallback fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getNextObjectPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
          expect(photoAsset).not().assertUndefined()
          console.info('photoAsset displayName: ', photoAsset.displayName);
          releaseHelperPromise!(phAccessHelper, done)
        }
      } catch (err) {
        console.error('getNextObjectPromise fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getLastObjectCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          fetchResult.getLastObject((err, photoAsset) => {
            if (photoAsset != undefined) {
              expect(fetchResult.isAfterLast()).assertTrue()
              console.info('photoAsset displayName: ', photoAsset.displayName);
              releaseHelperCallback!(phAccessHelper, done)
            } else {
              console.error('photoAsset failed with err: ' + err);
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (err) {
        console.error('getLastObjectCallback fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getLastObjectPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        console.info('getLastObjectPromise getAssets success');
        await fetchResult.getFirstObject();
        console.info('getLastObjectPromise getFirstObject success');
        if (!fetchResult.isAfterLast()) {
          console.info('getLastObjectPromise !fetchResult.isAfterLast()');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
          console.info('getLastObjectPromise getLastObject');
          expect(fetchResult.isAfterLast()).assertTrue()
          console.info('getLastObjectPromise getLastObject');
          releaseHelperPromise!(phAccessHelper, done)
          console.info('getLastObjectPromise releaseHelperPromise finish');
        }
      } catch (err) {
        console.error('getLastObjectPromise fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getObjectByPositionCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        await fetchResult.getFirstObject();
        fetchResultCount = fetchResult.getCount() as int;
        let positions: Array<int> = [
          0, 1, fetchResultCount - 1
        ]
        for (let i = 0; i < 3; i++) {
          console.log(`positions[${i}] is: ${positions[i]}`)
          fetchResult.getObjectByPosition(positions[i],
            (err: BusinessError | null, photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
              if (photoAsset != undefined) {
                console.log(`positions[${i}]:${positions[i]} get success`)
                console.info('photoAsset displayName: ', photoAsset.displayName);
                if (i == 1) {
                  releaseHelperCallback!(phAccessHelper, done)
                }
              } else {
                console.error('photoAsset current index =  ' + i);
                console.error('photoAsset failed with err: ' + err);
                expect(false).assertTrue();
                done();
              }
            });
        }
      } catch (err) {
        console.error('getObjectByPositionCallback fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getObjectByPositionPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        fetchResultCount = fetchResult.getCount() as int;
        let positions: Array<int> = [
          0, 1, fetchResultCount - 1
        ]
        for (let i = 0; i < 3; i++) {
          console.log(`positions[${i}] is: ${positions[i]}`)
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(positions[i]);
          if (photoAsset != undefined) {
            console.log(`positions[${i}]:${positions[i]} get success`)
            console.info('photoAsset displayName: ', photoAsset.displayName);
            if (i == 1) {
              releaseHelperPromise!(phAccessHelper, done)
            }
          }
        }
      } catch (err) {
        console.error('close fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getAllObjectsCallback = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        fetchResultCount = fetchResult.getCount();
        fetchResult.getAllObjects((err, photoAssetList) => {
          if (photoAssetList != undefined) {
            console.info('photoAssetList length: ', (photoAssetList as Array<photoAccessHelper.PhotoAsset>).length);
            expect((photoAssetList as Array<photoAccessHelper.PhotoAsset>).length).assertEqual(fetchResultCount)
            releaseHelperCallback!(phAccessHelper, done)
          } else {
            console.error('photoAssetList failed with err:' + err);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error('close fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    let getAllObjectsPromise = async (phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
      fetchOptions: photoAccessHelper.FetchOptions, done: () => void) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        fetchResultCount = fetchResult.getCount();
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        console.info('photoAssetList length: ', photoAssetList.length);
        expect(photoAssetList.length).assertEqual(fetchResultCount)
        releaseHelperPromise!(phAccessHelper, done)
      } catch (err) {
        console.error('close fail. message = ' + err);
        expect(false).assertTrue();
        done();
      }
    }

    releaseHelperCallback = (phAccessHelper, done) => {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).release((err: BusinessError | null) => {
        console.info('releaseDemo');
        if (err?.code != 0) {
          console.error('release failed. message = ', err);
          expect(false).assertTrue();
          done();
        } else {
          console.info('release ok.');
          done();
        }
      });
    }

    releaseHelperPromise = async (phAccessHelper, done) => {
      try {
        await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).release();
        console.info('release ok.');
        done();
      } catch (err) {
        console.error('release failed. message = ', err);
        expect(false).assertTrue();
        done();
      }
    }


    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    beforeEach(async () => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
      fetchOptions.fetchColumns = []
      options = {
        title: 'testPhoto'
      }
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100
     * @tc.desc   getPhotoAccessHelper with correct context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
          let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
          releaseHelperCallback!(photoHelper, done)
          console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100 excute pass');
        } catch (err) {
          console.error('getPhotoAccessHelper failed , catch err is  ' + err.message);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0200
     * @tc.desc   getAssets with callback fetchOptions.fetchColumns = []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        try {
          getAssetsAndReleaseCallback(photoHelper, fetchOptions, done)
        } catch (err) {
          console.error('getPhotoAccessHelper 0200 getAssets failed , catch err is  ' + err.message);
          expect(false).assertTrue();
          done();
        }
        console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0200 excute pass');
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0210
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0210
     * @tc.desc   getAssets with promise fetchOptions.fetchColumns = []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        try {
          getAssetsAndReleasePromise(photoHelper, fetchOptions, done)
        } catch (err) {
          console.error('getPhotoAccessHelper 0210 getAssets failed , catch err is  ' + err.message);
          expect(false).assertTrue();
          done();
        }
        console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0210 excute pass');
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300
     * @tc.desc   getAssets with callback fetchOptions.fetchColumns = columns, all photoAccessHelper.PhotoKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getAssetsForKeysCallback!(photoHelper, fetchOptions,
          'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300', done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0400
     * @tc.desc   getAssets with promise fetchOptions.fetchColumns = columns, all photoAccessHelper.PhotoKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getAssetsForKeysPromise!(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500
     * @tc.desc   getAssets with callback fetchOptions.fetchColumns = [uri,displayName,photoType]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        setArgGetAssetsCallback(photoHelper, [photoAccessHelper.PhotoKeys.URI, photoAccessHelper.PhotoKeys.DISPLAY_NAME,
          photoAccessHelper.PhotoKeys.PHOTO_TYPE],
          'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500', done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0510
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0510
     * @tc.desc   getAssets with promise fetchOptions.fetchColumns = [uri,displayName,photoType]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        setArgGetAssetsPromise(photoHelper, [photoAccessHelper.PhotoKeys.URI, photoAccessHelper.PhotoKeys.DISPLAY_NAME,
          photoAccessHelper.PhotoKeys.PHOTO_TYPE],
          'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0510', done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600
     * @tc.desc   createAsset callback with imageType and photoExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesCallback1!(photoHelper, imageType, 'jpg', options, photoExtensions, done)
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0700
     * @tc.desc   createAsset callback with videoType and videoExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesCallback1!(photoHelper, videoType, 'mp4', options, videoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0800
     * @tc.desc   createAsset callback with imageType and photoExtensions, without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesCallback2!(photoHelper, imageType, 'jpg', photoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900
     * @tc.desc   createAsset callback with videoType and videoExtensions, without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesCallback2!(photoHelper, videoType, 'mp4', videoExtensions, done)
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000
     * @tc.desc   createAsset promise with imageType and photoExtensions, without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesPromise!(photoHelper, imageType, 'jpg', options, photoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1100
     * @tc.desc   createAsset promise with videoType and videoExtensions, without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        createAssetWithSuffixesPromise!(photoHelper, videoType, 'mp4', options, videoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200
     * @tc.desc   createAsset promise with imageType and photoExtensions, with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        let withoutOptions: photoAccessHelper.CreateOptions = {
          title: 'no'
        }
        createAssetWithSuffixesPromise!(photoHelper, imageType, 'jpg', withoutOptions, photoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300
     * @tc.desc   createAsset promise with videoType and videoExtensions, with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        let withoutOptions: photoAccessHelper.CreateOptions = {
          title: 'no'
        }
        createAssetWithSuffixesPromise!(photoHelper, videoType, 'mp4', withoutOptions, videoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400
     * @tc.desc   createAsset promise with imageType and photoExtensions, with disallowed options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        let optionsErr: photoAccessHelper.CreateOptions = {
          title: 'testError'
        }
        createAssetWithSuffixesPromise!(photoHelper, imageType, 'jpg', optionsErr, photoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1500
     * @tc.desc   createAsset promise with videoType and videoExtensions, with disallowed options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        let optionsErr: photoAccessHelper.CreateOptions = {
          title: 'testError'
        }
        createAssetWithSuffixesPromise!(photoHelper, videoType, 'mp4', optionsErr, videoExtensions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600
     * @tc.desc   registerChange promise, register photoAsset.uri,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(true, true, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1700
     * @tc.desc   registerChange promise, register photoAsset.uri,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(true, true, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800
     * @tc.desc   registerChange promise, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(true, false, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900
     * @tc.desc   registerChange promise, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(true, false, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000
     * @tc.desc   registerChange promise, register photoAsset.uri,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(false, true, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2100
     * @tc.desc   registerChange promise, register photoAsset.uri,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(false, true, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200
     * @tc.desc   registerChange promise, register DEFAULT_PHOTO_URI,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(false, false, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300
     * @tc.desc   registerChange promise, register DEFAULT_PHOTO_URI,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangePromise(false, false, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400
     * @tc.desc   registerChange callback, register photoAsset.uri,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(true, true, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2500
     * @tc.desc   registerChange callback, register photoAsset.uri,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(true, true, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600
     * @tc.desc   registerChange callback, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(true, false, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2700
     * @tc.desc   registerChange callback, register DEFAULT_PHOTO_URI,unRegister prescriptive callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(true, false, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800
     * @tc.desc   registerChange callback, register photoAsset.uri,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(false, true, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2900
     * @tc.desc   registerChange callback, register photoAsset.uri,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(false, true, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000
     * @tc.desc   registerChange callback, register DEFAULT_PHOTO_URI,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(false, false, photoHelper, true, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3100
     * @tc.desc   registerChange callback, register DEFAULT_PHOTO_URI,unRegister all callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        registerChangeCallback(false, false, photoHelper, false, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400
     * @tc.desc   photoAsset.get callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getPhotoAssetAttrsCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3500
     * @tc.desc   photoAsset.get promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getPhotoAssetAttrsPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600
     * @tc.desc   photoAsset.get callback, for all photoAccessHelper.PhotoKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper;
        getPhotoAssetForKeysCallback!((photoHelper as photoAccessHelper.PhotoAccessHelper), fetchOptions, done);
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700
     * @tc.desc   photoAsset.get promise, for all photoAccessHelper.PhotoKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getPhotoAssetForKeysPromise!(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800
     * @tc.desc   photoAsset.set(title) callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        setPhotoAssetTitleCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900
     * @tc.desc   photoAsset.set(title) promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        setPhotoAssetTitlePromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000
     * @tc.desc   photoAsset.commitModify callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        commitModifyCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100
     * @tc.desc   photoAsset.commitModify promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        commitModifyPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400
     * @tc.desc   getThumbnail callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getThumbnailCallback(photoHelper, fetchOptions_allocate_file, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4700
     * @tc.desc   fetchResult.getCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getCount(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4800
     * @tc.desc   fetchResult.isAfterLast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        checkIsAfterLast(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4900
     * @tc.desc   fetchResult.close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        closeFetchResult(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5000
     * @tc.desc   getFirstObject callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getFirstObjectCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5010
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5010
     * @tc.desc   getFirstObject promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getFirstObjectPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5100
     * @tc.desc   getNextObject callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getNextObjectCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5200
     * @tc.desc   getNextObject promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getNextObjectPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5300
     * @tc.desc   getLastObject callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getLastObjectCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5400
     * @tc.desc   getLastObject promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getLastObjectPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5600
     * @tc.desc   getObjectByPosition promise -1 0 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getObjectByPositionPromise(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5700
     * @tc.desc   getAllObjects callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getAllObjectsCallback(photoHelper, fetchOptions, done)
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5800
     * @tc.desc   getAllObjects promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        let getPhotoHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let photoHelper: photoAccessHelper.PhotoAccessHelper | null = getPhotoHelper
        getAllObjectsPromise(photoHelper, fetchOptions, done)
      })
  })
}
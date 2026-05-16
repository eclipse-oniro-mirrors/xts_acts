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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  createUserAlbum,
  sleep,
  getPermission,
  driveFn,
  genRandomStr,
  fetchOption,
  albumSubtype,
  albumKeys,
  albumType
} from '../common'
import common from '@ohos.app.ability.common'

export default function GetObjectByPositionTest() {
  let TAG = 'GetObjectByPositionTest';
  describe('GetObjectByPositionTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const testCallback = async (testName: string, options: ESObject, callback: (errCode: ESObject) => void) => {
      try {
        console.info(TAG, testName, 'Start');
        const albumName = genRandomStr(10);
        await createUserAlbum(testContext, testName, albumName);
        const fetchOps = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        fetchResult.getObjectByPosition(options, async (err, asset) => {
          if (asset) {
            console.info(TAG + 'getObjectByPosition success', asset)
            expect().assertFail();
          } else {
            console.info(TAG, testName, `getObjectByPosition failed; err:`, JSON.stringify(err), err.code);
            callback(err);
          }
          fetchResult.close();
        })
      } catch (error) {
        console.info(TAG, testName, `getObjectByPosition failed; err:`, JSON.stringify(error), error.code)
        expect().assertFail();
      }
    }
    const testPromise = async (testName: string, options: ESObject, callback: (errCode: ESObject) => void) => {
      try {
        console.info(TAG, testName, 'Start');
        const albumName = genRandomStr(10);
        await createUserAlbum(testContext, testName, albumName);
        const fetchOps = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        const res = await fetchResult.getObjectByPosition(options);
        fetchResult.close();
        expect().assertFail()
      } catch (error) {
        console.info(TAG, testName, `getObjectByPosition failed; err:`, JSON.stringify(error), error.code)
        callback(error);
      }
    }

    const testPromise1 = async (testName: string, options: ESObject, callback: (errCode: ESObject) => void) => {
      try {
        console.info(TAG, testName, 'Start');
        const albumName = genRandomStr(10);
        await createUserAlbum(testContext, testName, albumName);
        const fetchOps = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        const res = await fetchResult.getObjectByPosition(options);
        fetchResult.close();
        callback(res);
      } catch (error) {
        console.info(TAG, testName, `getObjectByPosition failed; err:`, JSON.stringify(error), error.code)
        expect().assertFail();
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });


    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0001
     * @tc.desc   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0001';
      await testCallback(testNum, -1, (errCode: ESObject) => {
        expect(errCode.code == 14000011).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0002
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0002';
      await testCallback(testNum, -1000, (errCode: ESObject) => {
        expect(errCode.code == 14000011).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0003
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0003';

      await testCallback(testNum, 1, (errCode: ESObject) => {
        expect(errCode.code == 14000011).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0004
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0004';
      await testCallback(testNum, null, (errCode: ESObject) => {
        expect(errCode.code == 14000011).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0005
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_0005';
      await testCallback(testNum, undefined, (errCode: ESObject) => {
        expect(errCode.code == 14000011).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0001
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0001';
      await testPromise(testNum, -1, (err: ESObject) => {
        if (err != undefined) {
          expect(err.code).assertEqual('14000011');
        } else {
          expect().assertFail();
        }
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0002
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0002';
      await testPromise(testNum, -1000, (err: ESObject) => {
        if (err != undefined) {
          expect(err.code).assertEqual('14000011');
        } else {
          expect().assertFail();
        }
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0003
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0003';
      await testPromise(testNum, 1, (err: ESObject) => {
        if (err != undefined) {
          expect(err.code).assertEqual('14000011');
        } else {
          expect().assertFail();
        }
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0004
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0004';
      await testPromise1(testNum, null, (err: ESObject) => {
        if (err != undefined) {
          expect().assertFail();
        }
      });
      done();
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0005
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_0005';
      await testPromise1(testNum, undefined, (err: ESObject) => {
        if (err != undefined) {
          expect().assertFail();
        }
      });
      done();
    });
  })
}
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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  albumKeys,
  albumType,
  albumSubtype,
  fetchOption,
  checkUserAlbum,
  checkSystemAlbum,
  sleep,
  getPermission,
  driveFn,
  isNum,
} from '../../common'
import common from '@ohos.app.ability.common';

export default function getAlbumIdByLPathTest () {
  describe('getAlbumIdByLPathTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0100
     * @tc.name       getAlbumIdByLpath_001
     * @tc.desc       getAlbumIdByLpath get albumsId by '/DCIM/Camera'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_001';
      try {
        let albumId: number = await helper.getAlbumIdByLpath('/DCIM/Camera');
        expect(isNum(albumId)).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0200
     * @tc.name       getAlbumIdByLpath_002
     * @tc.desc       getAlbumIdByLpath get albumsId by '/Pictures/Screenshots'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_002';
      try {
        let albumId: number = await helper.getAlbumIdByLpath('/Pictures/Screenshots');
        expect(isNum(albumId)).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0300
     * @tc.name       getAlbumIdByLpath_003
     * @tc.desc       getAlbumIdByLpath get albumsId by '/Pictures/Screenrecords'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_003';
      try {
        let albumId: number = await helper.getAlbumIdByLpath('/Pictures/Screenrecords');
        expect(isNum(albumId)).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0400
     * @tc.name       getAlbumIdByLpath_004
     * @tc.desc       getAlbumIdByLpath get albumsId by ''
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_004';
      try {
        let albumId: number = await helper.getAlbumIdByLpath('');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0500
     * @tc.name       getAlbumIdByLpath_005
     * @tc.desc       getAlbumIdByLpath get albumsId by null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_005';
      try {
        let albumId: number = await helper.getAlbumIdByLpath(null);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0600
     * @tc.name       getAlbumIdByLpath_006
     * @tc.desc       getAlbumIdByLpath get albumsId by undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_006';
      try {
        let albumId: number = await helper.getAlbumIdByLpath(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_GETALBUMBYLPATH_0700
     * @tc.name       getAlbumIdByLpath_007
     * @tc.desc       getAlbumIdByLpath get albumsId by 256 length string
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('getAlbumIdByLpath_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getAlbumIdByLpath_007';
      try {
        let str = ''
        for (let index = 0; index < 256; index++) {
          str+='a'
        }
        let albumId: number = await helper.getAlbumIdByLpath(str);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(error.code).assertEqual('23800151');
        done();
      }
    });
  })
}


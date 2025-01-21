/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
} from '../../../../../../../common'

export default function getTest () {
  describe('getTest', function () {
    async function get (done, testNum, fetchOps, key, value) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        console.info(`${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        if (key === 'uri') {
          const id = getAssetId(asset.get(key));
          const expectUri = value + id;
          const uri = asset.get(key).toString();
          const isIncludes = uri.includes(expectUri);
          expect(isIncludes).assertTrue();
        } else if (key === 'date_added' || key === 'date_modified' || key === 'date_taken') {
          expect(isNum(asset.get(key))).assertTrue();
        } else {
          expect(asset.get(key)).assertEqual(value);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    //callback
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0000
     * @tc.name      : get_000
     * @tc.desc      : image get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_000', 2, async function (done) {
      const testNum = 'get_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.URI;
      const value = 'file://media/Photo/';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0100
     * @tc.name      : get_001
     * @tc.desc      : image get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_001', 2, async function (done) {
      const testNum = 'get_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.PHOTO_TYPE;
      const value = photoType.IMAGE;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0200
     * @tc.name      : get_002
     * @tc.desc      : image get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_002', 2, async function (done) {
      const testNum = 'get_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DISPLAY_NAME;
      const value = '01.jpg';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0300
     * @tc.name      : get_003
     * @tc.desc      : image get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_003', 2, async function (done) {
      const testNum = 'get_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DATE_ADDED;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0400
     * @tc.name      : get_004
     * @tc.desc      : image get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_004', 2, async function (done) {
      const testNum = 'get_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DATE_MODIFIED;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0500
     * @tc.name      : get_005
     * @tc.desc      : image get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_005', 2, async function (done) {
      const testNum = 'get_005';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DURATION;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0600
     * @tc.name      : get_006
     * @tc.desc      : image get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_006', 2, async function (done) {
      const testNum = 'get_006';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.WIDTH;
      const value = 1279;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0700
     * @tc.name      : get_007
     * @tc.desc      : image get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_007', 2, async function (done) {
      const testNum = 'get_007';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.HEIGHT;
      const value = 1706;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0800
     * @tc.name      : get_008
     * @tc.desc      : image get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_008', 2, async function (done) {
      const testNum = 'get_008';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DATE_TAKEN;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0900
     * @tc.name      : get_009
     * @tc.desc      : image get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_009', 2, async function (done) {
      const testNum = 'get_009';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.ORIENTATION;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1000
     * @tc.name      : get_010
     * @tc.desc      : image get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_010', 2, async function (done) {
      const testNum = 'get_010';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.FAVORITE;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1100
     * @tc.name      : get_011
     * @tc.desc      : image get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_011', 2, async function (done) {
      const testNum = 'get_011';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.SIZE;
      const value = 348113;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1200
     * @tc.name      : get_012
     * @tc.desc      : image get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_012', 2, async function (done) {
      const testNum = 'get_012';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.TITLE;
      const value = '01';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1300
     * @tc.name      : get_013
     * @tc.desc      : image get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_013', 2, async function (done) {
      const testNum = 'get_013';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.POSITION;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1400
     * @tc.name      : get_014
     * @tc.desc      : image get photoKeys.DATE_TRASHED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_014', 2, async function (done) {
      const testNum = 'get_014';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.DATE_TRASHED;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1500
     * @tc.name      : get_015
     * @tc.desc      : image get photoKeys.HIDDEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_015', 2, async function (done) {
      const testNum = 'get_015';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const key = photoKeys.HIDDEN;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5000
     * @tc.name      : get_050
     * @tc.desc      : video get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_050', 2, async function (done) {
      const testNum = 'get_050';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.URI;
      const value = 'file://media/Photo/';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5100
     * @tc.name      : get_051
     * @tc.desc      : video get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_051', 2, async function (done) {
      const testNum = 'get_051';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.PHOTO_TYPE;
      const value = photoType.VIDEO;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5200
     * @tc.name      : get_052
     * @tc.desc      : video get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_052', 2, async function (done) {
      const testNum = 'get_052';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DISPLAY_NAME;
      const value = '01.mp4';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5300
     * @tc.name      : get_053
     * @tc.desc      : video get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_053', 2, async function (done) {
      const testNum = 'get_053';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DATE_ADDED;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5400
     * @tc.name      : get_054
     * @tc.desc      : video get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_054', 2, async function (done) {
      const testNum = 'get_054';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DATE_MODIFIED;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5500
     * @tc.name      : get_055
     * @tc.desc      : video get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_055', 2, async function (done) {
      const testNum = 'get_055';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DURATION;
      const value = 10100;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5600
     * @tc.name      : get_056
     * @tc.desc      : video get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_056', 2, async function (done) {
      const testNum = 'get_056';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.WIDTH;
      const value = 1280;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5700
     * @tc.name      : get_057
     * @tc.desc      : video get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_057', 2, async function (done) {
      const testNum = 'get_057';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.HEIGHT;
      const value = 720;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5800
     * @tc.name      : get_058
     * @tc.desc      : video get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_058', 2, async function (done) {
      const testNum = 'get_058';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DATE_TAKEN;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5900
     * @tc.name      : get_059
     * @tc.desc      : video get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_059', 2, async function (done) {
      const testNum = 'get_059';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.ORIENTATION;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6000
     * @tc.name      : get_060
     * @tc.desc      : video get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_060', 2, async function (done) {
      const testNum = 'get_060';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.FAVORITE;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6100
     * @tc.name      : get_061
     * @tc.desc      : video get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_061', 2, async function (done) {
      const testNum = 'get_061';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.SIZE;
      const value = 4853005;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6200
     * @tc.name      : get_062
     * @tc.desc      : video get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_062', 2, async function (done) {
      const testNum = 'get_062';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.TITLE;
      const value = '01';
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6300
     * @tc.name      : get_063
     * @tc.desc      : video get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_063', 2, async function (done) {
      const testNum = 'get_063';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.POSITION;
      const value = 1;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6400
     * @tc.name      : get_064
     * @tc.desc      : video get photoKeys.DATE_TRASHED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_064', 2, async function (done) {
      const testNum = 'get_064';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.DATE_TRASHED;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6500
     * @tc.name      : get_065
     * @tc.desc      : video get photoKeys.HIDDEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_065', 2, async function (done) {
      const testNum = 'get_065';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const key = photoKeys.HIDDEN;
      const value = 0;
      await get(done, testNum, fetchOps, key, value);
    });
  })
}

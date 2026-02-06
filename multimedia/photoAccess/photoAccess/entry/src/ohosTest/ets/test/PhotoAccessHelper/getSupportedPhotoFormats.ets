/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import {
  sleep,
  photoKeys,
  getPermission,
  getBurstKey,
  pushCreateAsset,
  photoFetchOption,
  fetchAllOption,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common';

export default function getSupportedPhotoFormatsTest() {

  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const imageArray = ["gif", "heic", "heics", "heifs", "bmp", "bm", "heif", "hif", "avif", "cur", "webp", "dng",
                    "raf", "ico", "nrw", "rw2", "pef", "srw", "arw", "jpg", "jpeg", "jpe", "png", "svg", "raw", "svgz",
                     "ief", "jp2", "jpg2", "ipm", "jpm", "jpx", "jpf", "pcx", "tiff", "tif", "djvu", "djv", "wbmp", 
                     "xbm", "xpm", "xwd"];
  const videoArray = ["3gpp2", "3gp2", "3g2", "3gpp", "3gp", "m4v", "f4v", "mp4v", "mpeg4", "mp4", "m2ts", "mts",
                    "ts", "yt", "wrf", "mpeg", "mpeg2", "mpv2", "mp2v", "m2v", "m2t", "mpeg1", "mpv1", "mp1v",
                    "m1v", "mpg", "mov", "mkv", "webm", "h264", "flv", "avi", "mpe", "qt", "mpv", "rmvb", "axv",
                    "dl", "dif", "dv", "fli", "gl", "ogv", "mxu", "lsf", "lsx", "wmx", "wvx", "movie"];

  describe('getSupportedPhotoFormatsTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   get_supported_photo_formats_000
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_0000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'get_supported_photo_formats_000';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(1);
        for (let element of result) {
          expect(element.length >= 1).assertTrue();
        }
        expect(result).assertContain("jpg");
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_001
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_1000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_001';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(2);
        for (let element of result) {
          expect(element.length >= 1).assertTrue();
        }
        expect(result).assertContain("mp4");
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_002
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_2000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_002';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(1000);
        for (let element of result) {
          expect(videoArray).assertContain(element);
          expect(imageArray).assertContain(element);
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_003
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_3000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_003';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(null);
        for (let element of result) {
          expect(videoArray).assertContain(element);
          expect(imageArray).assertContain(element);
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_004
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_4000
     * @tc.desc   get supported photo formats, photoType error, error code 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_004', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_004';
      try {
        await phAccessHelper.getSupportedPhotoFormats(3);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_005
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_5000
     * @tc.desc   get supported photo formats, photoType undefined, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_005', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_005';
      try {
        await phAccessHelper.getSupportedPhotoFormats(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(error.code === '13900020' || error.code === '401').assertTrue();
        done();
      }
    })
    });
}
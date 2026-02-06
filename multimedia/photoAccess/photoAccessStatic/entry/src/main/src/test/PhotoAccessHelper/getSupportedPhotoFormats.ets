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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base'
import { sleep, getPermission, getBurstKey, photoFetchOption, fetchAllOption, driveFn } from '../Common.test.ets'
import Context from "application.Context"

export default function getSupportedPhotoFormatsTest() {

  let testContext: Context = Hypium.get("context") as Context;
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
     * @tc.name   get_supported_photo_formats_static_000
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_STATIC_0000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_supported_photo_formats_static_000';
        try {
          let result: Array<string> = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE);
          for (let i = 0; i < result.length; i++) {
            expect(result[i].length >= 1).assertTrue();
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
     * @tc.name   get_supported_photo_formats_static_001
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_STATIC_1000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_supported_photo_formats_static_001';
        try {
          let result: Array<string> = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
          for (let i = 0; i < result.length; i++) {
            expect(result[i].length >= 1).assertTrue();
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
     * @tc.name   get_supported_photo_formats_static_002
     * @tc.number GET_SUPPOTTED_PHOTO_FORMATS_STATIC_2000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_supported_photo_formats_static_002';
        try {
          let result: Array<string> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getSupportedPhotoFormats(1000 as photoAccessHelper.PhotoType);
          for (let i = 0; i < result.length; i++) {
            expect(videoArray).assertContain(result[i]);
            expect(imageArray).assertContain(result[i]);
          }
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(false).assertFalse();
          done();
        }
      })
  });
}
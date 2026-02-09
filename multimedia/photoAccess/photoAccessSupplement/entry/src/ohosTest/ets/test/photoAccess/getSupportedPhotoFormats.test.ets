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
  sleep,
  getPermission,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common';

export default function getSupportedPhotoFormatsTest() {

  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const TAG = "PhotoXts.GetSupportedPhotoFormatsSuppTest";

  describe('getSupportedPhotoFormatsTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   get_supported_photo_formats_0000
     * @tc.number get_supported_photo_formats_0000
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_0000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'get_supported_photo_formats_0000';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(1);
        expect(result.length >= 1).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0001
     * @tc.number get_supported_photo_formats_0001
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0001';
      try {
        let result = await phAccessHelper.getSupportedPhotoFormats(2);
        expect(result.length >= 1).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0002
     * @tc.number get_supported_photo_formats_0002
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0002';
      try {
        await phAccessHelper.getSupportedPhotoFormats(1000);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code === '14000011').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0003
     * @tc.number get_supported_photo_formats_0003
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_supported_photo_formats_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0003';
      try {
        await phAccessHelper.getSupportedPhotoFormats(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0004
     * @tc.number get_supported_photo_formats_0004
     * @tc.desc   get supported photo formats, photoType error, error code 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_0004', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0004';
      try {
        await phAccessHelper.getSupportedPhotoFormats(3);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0005
     * @tc.number get_supported_photo_formats_0005
     * @tc.desc   get supported photo formats, photoType undefined, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_0005', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0005';
      try {
        await phAccessHelper.getSupportedPhotoFormats(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0006
     * @tc.number get_supported_photo_formats_0006
     * @tc.desc   get supported photo formats, photoType undefined, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_0006', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0006';
      try {
        await phAccessHelper.getSupportedPhotoFormats(-1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0007
     * @tc.number get_supported_photo_formats_0007
     * @tc.desc   get supported photo formats, photoType undefined, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_0007', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0007';
      try {
        await phAccessHelper.getSupportedPhotoFormats(-10000);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })

    /**
     * @tc.name   get_supported_photo_formats_0008
     * @tc.number get_supported_photo_formats_0008
     * @tc.desc   get supported photo formats, photoType undefined, error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_supported_photo_formats_0008', Level.LEVEL2, async (done: Function) => {
      let testNum = 'get_supported_photo_formats_0008';
      try {
        await phAccessHelper.getSupportedPhotoFormats(0);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })



    });
}
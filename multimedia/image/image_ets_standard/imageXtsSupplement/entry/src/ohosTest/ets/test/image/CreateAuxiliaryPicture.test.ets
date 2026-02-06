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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'CreateAuxiliaryPictureTestSupp';



export default function CreateAuxiliaryPictureTest() {
  describe('CreateAuxiliaryPictureTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('empty_value','')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('empty_value')
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_001
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_001
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_001';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(null,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_002
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_002
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_002';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(null,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_003
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_003
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_003';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(null,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_004
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_004
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_004';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(null,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_005
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_005
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_005';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(null,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_006
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_006
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_006';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(undefined,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_007
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_007
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_007';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(undefined,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_008
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_008
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_008';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(undefined,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_009
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_009
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_009';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(undefined,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_010
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_010
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_010';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(undefined,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_011
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_011
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_011';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,null,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_012
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_012
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_012';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,null,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_013
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_013
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_013';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,null,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_014
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_014
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_014';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,null,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_015
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_015
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_015';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,null,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_016
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_016
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_016';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,undefined,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_017
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_017
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_017';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,undefined,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_018
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_018
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_018';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,undefined,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_019
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_019
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_019';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,undefined,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_020
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_020
     * @tc.desc   第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_020';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,undefined,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_021
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_021
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_021';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_022
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_022
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_022';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_023
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_023
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_023';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_024
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_024
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_024';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_025
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_025
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_025';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(1000);
      const auxSize: image.Size = { width: 10, height: 10 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        let result = image.createAuxiliaryPicture(buffer,auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
        expect(result != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_026
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_026
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_026';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_027
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_027
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_027';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_028
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_028
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_028';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_029
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_029
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_029';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_030
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_030
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_030';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_031
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_031
     * @tc.desc   第二个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_031';
      const path = 'test_exif_v2.jpg';
      const auxSize: image.Size = { width: 100, height: 100 };
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(AppStorage.get('empty_value'),auxSize,auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });


    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_032
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_032
     * @tc.desc   第二个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_032';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,AppStorage.get('empty_value'),auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_033
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_033
     * @tc.desc   第二个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_033';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,AppStorage.get('empty_value'),auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_034
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_034
     * @tc.desc   第二个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_034';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,AppStorage.get('empty_value'),auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.name   IMAGE_CREATE_AUXILIARY_PICTURE_035
     * @tc.number IMAGE_CREATE_AUXILIARY_PICTURE_035
     * @tc.desc   第二个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_AUXILIARY_PICTURE_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_AUXILIARY_PICTURE_035';
      const path = 'test_exif_v2.jpg';
      const buffer = new ArrayBuffer(10);
      const auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        console.info(TAG, testName, `Start`);
        image.createAuxiliaryPicture(buffer,AppStorage.get('empty_value'),auxType)
        console.info(TAG, testName, `Success createAuxiliaryPicture`);
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });
  })
}
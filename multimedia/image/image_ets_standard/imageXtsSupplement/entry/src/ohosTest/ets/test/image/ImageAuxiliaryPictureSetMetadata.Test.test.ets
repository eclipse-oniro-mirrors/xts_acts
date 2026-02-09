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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'AuxiliaryPictureSetMetadataTestSupp';


export default function ImageAuxiliaryPictureSetMetadataTest() {
  describe('ImageAuxiliaryPictureSetMetadataTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString','')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('emptyString')
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_001
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_001
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_001';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_002
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_002
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_002';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_003
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_003
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_003';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_004
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_004
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_004';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_005
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_005
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_005';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_006
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_006
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_006';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_007
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_007
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_007';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_008
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_008
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_008';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_009
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_009
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_009';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_010
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_010
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_010';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,null)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_011
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_011
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_011';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_012
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_012
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_012';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_013
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_013
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_013';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_014
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_014
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_014';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_015
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_015
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_015';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_016
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_016
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_016';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_017
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_017
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_017';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_018
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_018
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_018';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_019
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_019
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_019';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_020
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_020
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_020';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,undefined)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_021
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_021
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_021';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_022
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_022
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_022';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_023
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_023
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_023';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_024
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_024
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_024';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_025
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_025
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_025';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_026
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_026
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_026';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_027
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_027
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_027';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_028
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_028
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_028';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_029
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_029
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_029';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_030
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_030
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_030';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_031
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_031
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_031';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_032
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_032
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_032';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_033
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_033
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_033';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_034
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_034
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_034';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_035
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_035
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_035';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_036
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_036
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_036';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_037
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_037
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_037';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_038
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_038
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_038';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_039
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_039
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_039';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_SET_METADATA_040
     * @tc.number IMAGE_AUXILIARY_PICTURE_SET_METADATA_040
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_040';
      try {
        let auxBuffer: ArrayBuffer = new ArrayBuffer(10);
        console.info(TAG,'auxBuffer')
        let auxSize: Size = { height: 180, width: 240 };
        console.info(TAG,'auxSize')
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        console.info(TAG,testName,'auxType',auxType)
        let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG,'auxiliaryPicture')
        let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
        console.info(TAG,testName,'metadataType',metadataType)
        let metadata: image.Metadata = await auxiliaryPicture.getMetadata(metadataType);
        console.info(TAG,'metadata')
        auxiliaryPicture.setMetadata(metadataType,metadata)
        console.info(TAG,'succeed setMetadata')
        done()
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    });
  })
}
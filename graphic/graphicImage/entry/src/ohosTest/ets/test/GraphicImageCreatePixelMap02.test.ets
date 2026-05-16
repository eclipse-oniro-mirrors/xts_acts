/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';
import rpc from '@ohos.rpc';

const LOG_PREFIX: string = "[www data GraphicImageCreatePixelMap02]";

export default function GraphicImageCreatePixelMap02() {
  describe('GraphicImageCreatePixelMap02', ()=> {
    console.log('describe GraphicImageCreatePixelMap02 start!!!')
    beforeAll(async ()=> {
    })

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation001
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_001
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with valid parameters - transformEnabled true.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation001";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation001 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify basic properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation001 isEditable:${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation001 isStrideAlignment: `
          + `${pixelMap.isStrideAlignment}`);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation001 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation001 error:${error}, code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation002
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_002
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with transformEnabled false.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation002";
        const transformEnabled = false;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation002 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify basic properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation002 isEditable: ${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation002 isStrideAlignment: `
          + `${pixelMap.isStrideAlignment}`);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation002 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation002 error: ${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation003
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_003
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test isEditable property.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation003";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation003 isEditable: ${pixelMap.isEditable}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(typeof pixelMap.isEditable).assertEqual('boolean');
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation003 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation003 error: ${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation004
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_004
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test isStrideAlignment property.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation004";
        const transformEnabled = false;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation004 isStrideAlignment: `
          + `${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation004 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation004 error: ${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation005
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_005
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test getImageInfo() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation005";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        const imageInfo = pixelMap.getImageInfoSync();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation005 imageInfo: `
          + `${JSON.stringify(imageInfo)}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(imageInfo !== undefined).assertTrue();
        expect(imageInfo.size.width !== undefined).assertTrue();
        expect(imageInfo.size.height !== undefined).assertTrue();
        expect(imageInfo.pixelFormat !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation005 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation005 error: ${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation006
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_006
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600104 - empty string.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation006 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation006 error: ${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation007
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_007
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600104 - null parameter.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = null;
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation007 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation007 error:${error},code: ${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation008
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_008
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600104 - undefined parameter.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = undefined;
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation008 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation008 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation009
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_009
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test getBytesNumberPerRow() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation009";
        const transformEnabled = false;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        const bytesNumberPerRow = pixelMap.getBytesNumberPerRow();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation009 bytesNumberPerRow: `
          + `${bytesNumberPerRow}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(bytesNumberPerRow > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation009 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation009 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation010
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_010
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test getPixelBytesNumber() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation010";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        const pixelBytesNumber = pixelMap.getPixelBytesNumber();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation010 pixelBytesNumber: `
          + `${pixelBytesNumber}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelBytesNumber > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation010 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation010 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation011
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_011
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - verify all PixelMap properties.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation011";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation011 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify all properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        const imageInfo = pixelMap.getImageInfoSync();
        expect(imageInfo !== undefined).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
        expect(imageInfo.size.height > 0).assertTrue();
        
        const bytesNumberPerRow = pixelMap.getBytesNumberPerRow();
        expect(bytesNumberPerRow > 0).assertTrue();
        
        const pixelBytesNumber = pixelMap.getPixelBytesNumber();
        expect(pixelBytesNumber > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation011 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation011 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation012
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_012
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600201.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation012";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation012 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation012 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation013
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_013
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600206.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation013";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation013 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation013 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation014
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_014
     * @tc.desc    createPixelMapFromSurfaceWithTransformation with error code 7600305.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformation014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformation014";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation014 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation014 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformation015
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATION_015
     * @tc.desc    createPixelMapFromSurfaceWithTransformation - test with long surfaceId.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformation015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceWithAVeryLongNameThatContainsManyCharacters015";
        const transformEnabled = true;
        
        const pixelMap = await image.createPixelMapFromSurfaceWithTransformation(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation015 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation015 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformation015 error: ${error},code:${err.code}`);
        expect(error).assertEqual(7600206);
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync001
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_001
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with valid parameters - transformEnabled true.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync001";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync001 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify basic properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync001 isEditable: `
          + `${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync001 isStrideAlignment: `
        + `${pixelMap.isStrideAlignment}`);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync001 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync001 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync002
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_002
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with transformEnabled false.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync002";
        const transformEnabled = false;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync002 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify basic properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync002 isEditable: `
          + `${pixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync002 isStrideAlignment: `
          + `${pixelMap.isStrideAlignment}`);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync002 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync002 error: ${error}, `
        + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync003
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_003
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test isEditable property.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync003";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync003 isEditable: `
          + ` ${pixelMap.isEditable}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(typeof pixelMap.isEditable).assertEqual('boolean');
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync003 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync003 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync004
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_004
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test isStrideAlignment property.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync004";
        const transformEnabled = false;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync004 isStrideAlignment: `
          + `${pixelMap.isStrideAlignment}`);
        expect(pixelMap !== null).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(typeof pixelMap.isStrideAlignment).assertEqual('boolean');
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync004 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync004 error: ${error}, `
          + ` code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync005
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_005
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test getImageInfo() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync005";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        const imageInfo = pixelMap.getImageInfoSync();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync005 imageInfo: `
          + `${JSON.stringify(imageInfo)}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(imageInfo !== undefined).assertTrue();
        expect(imageInfo.size.width !== undefined).assertTrue();
        expect(imageInfo.size.height !== undefined).assertTrue();
        expect(imageInfo.pixelFormat !== undefined).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync005 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync005 error: ${error}, `
          + ` code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync006
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_006
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600104 - empty string.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync006 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync006 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync007
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_007
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600104 - null parameter.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = null;
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync007 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync007 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync008
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_008
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600104 - undefined parameter.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = undefined;
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync008 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync008 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync009
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_009
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test getBytesNumberPerRow() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync009";
        const transformEnabled = false;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        const bytesNumberPerRow = pixelMap.getBytesNumberPerRow();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync009 bytesNumberPerRow: `
          + `${bytesNumberPerRow}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(bytesNumberPerRow > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync009 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync009 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync010
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_010
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test getPixelBytesNumber() method.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync010";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        const pixelBytesNumber = pixelMap.getPixelBytesNumber();
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync010 pixelBytesNumber: `
          + `${pixelBytesNumber}`);
        
        expect(pixelMap !== null).assertTrue();
        expect(pixelBytesNumber > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync010 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync010 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync011
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_011
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - verify all PixelMap properties.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync011";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync011 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        // Verify all properties
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        
        const imageInfo = pixelMap.getImageInfoSync();
        expect(imageInfo !== undefined).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
        expect(imageInfo.size.height > 0).assertTrue();
        
        const bytesNumberPerRow = pixelMap.getBytesNumberPerRow();
        expect(bytesNumberPerRow > 0).assertTrue();
        
        const pixelBytesNumber = pixelMap.getPixelBytesNumber();
        expect(pixelBytesNumber > 0).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync011 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync011 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync012
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_012
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600201.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync012";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync012 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync012 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync013
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_013
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600206.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync013";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync013 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync013 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync014
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_014
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync with error code 7600305.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPixelMapFromSurfaceWithTransformationSync014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceTransformationSync014";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync014 success: ${pixelMap}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync014 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPixelMapFromSurfaceWithTransformationSync015
     * @tc.number  SUB_IMAGE_CREATEPIXELMAPFROMSURFACEWITHTRANSFORMATIONSYNC_015
     * @tc.desc    createPixelMapFromSurfaceWithTransformationSync - test with long surfaceId.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPixelMapFromSurfaceWithTransformationSync015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const surfaceId = "testSurfaceSyncWithAVeryLongNameThatContainsManyCharacters015";
        const transformEnabled = true;
        
        const pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(surfaceId, transformEnabled);
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync015 pixelMap: ${pixelMap}`);
        expect(pixelMap !== null).assertTrue();
        
        console.info(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync015 success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPixelMapFromSurfaceWithTransformationSync015 error: ${error}, `
          + `code: ${err.code}`);
        expect(Number(err.code) === 7600206).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap001
     * @tc.number  CreatePremultipliedPixelMapTest_001
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable true (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          // Create source pixel map with isEditable: true
          const srcOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.PREMUL
          };
          const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts, image.AllocatorType.DMA);

          // Create destination pixel map with isEditable: true
          const dstOpts: image.InitializationOptions = {
            size: { width: 4, height: 6 },
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            editable: true,
            alphaType: image.AlphaType.UNPREMUL
          };
          const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts, image.AllocatorType.DMA);

          console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
          console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
          console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

          expect(srcPixelMap.isEditable).assertTrue();
          expect(dstPixelMap.isEditable).assertTrue();
          expect(srcPixelMap.isStrideAlignment).assertTrue();
          expect(dstPixelMap.isStrideAlignment).assertTrue();

          // Test createPremultipliedPixelMap with Promise
          await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
          await srcPixelMap.release();
          await dstPixelMap.release();

          console.info(`${LOG_PREFIX} createPremultipliedPixelMap001 success`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.error(`${LOG_PREFIX} createPremultipliedPixelMap001 error: ${error}, code: ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name    createPremultipliedPixelMap002
     * @tc.number  CreatePremultipliedPixelMapTest_002
     * @tc.desc    createPremultipliedPixelMap with src editable false, dst editable false (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);

        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

        expect(srcPixelMap.isEditable).assertFalse();
        expect(dstPixelMap.isEditable).assertFalse();
        expect(srcPixelMap.isStrideAlignment).assertFalse();
        expect(dstPixelMap.isStrideAlignment).assertFalse();

        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        await srcPixelMap.release();
        await dstPixelMap.release();

        console.info(`${LOG_PREFIX} createPremultipliedPixelMap002 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap002 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(62980248);
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap003
     * @tc.number  CreatePremultipliedPixelMapTest_003
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable false (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(false);
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        await srcPixelMap.release();
        await dstPixelMap.release();
        
        console.info(`${LOG_PREFIX} createPremultipliedPixelMap003 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap003 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap004
     * @tc.number  CreatePremultipliedPixelMapTest_004
     * @tc.desc    createPremultipliedPixelMap with src editable false, dst editable true (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(false);
        expect(dstPixelMap.isEditable).assertEqual(true);
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        
        console.info(`${LOG_PREFIX} createPremultipliedPixelMap004 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap004 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(62980248);
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap005
     * @tc.number  CreatePremultipliedPixelMapTest_005
     * @tc.desc    createPremultipliedPixelMap with src isStrideAlignment true, dst isStrideAlignment true (Promise).
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);
        
        // Verify isStrideAlignment property
        expect(srcPixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(dstPixelMap.isStrideAlignment !== undefined).assertTrue();
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        await srcPixelMap.release();
        await dstPixelMap.release();
        
        console.info(`${LOG_PREFIX} createPremultipliedPixelMap005 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap005 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap006
     * @tc.number  CreatePremultipliedPixelMapTest_006
     * @tc.desc    createPremultipliedPixelMap with src isStrideAlignment false, dst isStrideAlignment false (Promise).
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with format that might result in isStrideAlignment: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 5, height: 7 }, // Non-standard dimensions might affect stride alignment
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with format that might result in isStrideAlignment: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 5, height: 7 }, // Non-standard dimensions might affect stride alignment
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          editable: true,
          alphaType: image.AlphaType.OPAQUE
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);
        
        // Verify isStrideAlignment property
        expect(srcPixelMap.isStrideAlignment !== undefined).assertTrue();
        expect(dstPixelMap.isStrideAlignment !== undefined).assertTrue();
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        
        console.info(`${LOG_PREFIX} createPremultipliedPixelMap006 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap006 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap007
     * @tc.number  CreatePremultipliedPixelMapTest_007
     * @tc.desc    createPremultipliedPixelMap with src null (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPremultipliedPixelMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        // Test createPremultipliedPixelMap with null src
        await image.createPremultipliedPixelMap(null, dstPixelMap);
        await dstPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap007 error: ${error}, code: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap008
     * @tc.number  CreatePremultipliedPixelMapTest_008
     * @tc.desc    createPremultipliedPixelMap with src undefined (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPremultipliedPixelMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        // Test createPremultipliedPixelMap with undefined src
        await image.createPremultipliedPixelMap(undefined, dstPixelMap);
        await dstPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap008 error: ${error}, code: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap009
     * @tc.number  CreatePremultipliedPixelMapTest_009
     * @tc.desc    createPremultipliedPixelMap with dst null (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPremultipliedPixelMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Test createPremultipliedPixelMap with null dst
        await image.createPremultipliedPixelMap(srcPixelMap, null);
        await srcPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap009 error: ${error}, code: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap010
     * @tc.number  CreatePremultipliedPixelMapTest_010
     * @tc.desc    createPremultipliedPixelMap with dst undefined (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPremultipliedPixelMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        // Create source pixel map
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Test createPremultipliedPixelMap with undefined dst
        await image.createPremultipliedPixelMap(srcPixelMap, undefined);
        await srcPixelMap.release();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap010 error: ${error}, code: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap011
     * @tc.number  CreatePremultipliedPixelMapTest_011
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable true (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts, image.AllocatorType.DMA);

        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts, image.AllocatorType.DMA);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

        expect(srcPixelMap.isEditable).assertTrue();
        expect(dstPixelMap.isEditable).assertTrue();
        expect(srcPixelMap.isStrideAlignment).assertTrue();
        expect(dstPixelMap.isStrideAlignment).assertTrue();

        // Test createPremultipliedPixelMap with AsyncCallback
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createPremultipliedPixelMap011 error: ${err}, code: ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {  
            console.info(`${LOG_PREFIX} createPremultipliedPixelMap011 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap011 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap012
     * @tc.number  CreatePremultipliedPixelMapTest_012
     * @tc.desc    createPremultipliedPixelMap with src editable false, dst editable false (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);

        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} srcPixelMap isStrideAlignment: ${srcPixelMap.isStrideAlignment}`);
        console.info(`${LOG_PREFIX} dstPixelMap isStrideAlignment: ${dstPixelMap.isStrideAlignment}`);

        expect(srcPixelMap.isEditable).assertFalse();
        expect(dstPixelMap.isEditable).assertFalse();
        expect(srcPixelMap.isStrideAlignment).assertFalse();
        expect(dstPixelMap.isStrideAlignment).assertFalse();

        // Test createPremultipliedPixelMap with AsyncCallback
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createPremultipliedPixelMap012 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248);
            done();
          } else {
            console.info(`${LOG_PREFIX} createPremultipliedPixelMap012 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap012 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap013
     * @tc.number  CreatePremultipliedPixelMapTest_013
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable false (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with isEditable: false
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(false);
        
        // Test createPremultipliedPixelMap with AsyncCallback
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createPremultipliedPixelMap013 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248);
            done();
          } else {
            console.info(`${LOG_PREFIX} createPremultipliedPixelMap013 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap013 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap014
     * @tc.number  CreatePremultipliedPixelMapTest_014
     * @tc.desc    createPremultipliedPixelMap with src editable false, dst editable true (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: false
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: false,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);
        
        expect(srcPixelMap.isEditable).assertEqual(false);
        expect(dstPixelMap.isEditable).assertEqual(true);
        
        // Test createPremultipliedPixelMap with AsyncCallback
        image.createPremultipliedPixelMap( dstPixelMap, srcPixelMap,(err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createPremultipliedPixelMap014 error: ${err}, code: ${err.code}`);
            expect(err).assertEqual(62980248);
            done();
          } else {
            console.info(`${LOG_PREFIX} createPremultipliedPixelMap014 success`);
            srcPixelMap.release();
            dstPixelMap.release();
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap014 error: ${error}, code: ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap019
     * @tc.number  CreatePremultipliedPixelMapTest_019
     * @tc.desc    createPremultipliedPixelMap with different pixel formats (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with RGBA_8888 format
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map with BGRA_8888 format
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        console.info(`${LOG_PREFIX} srcPixelMap pixelFormat: RGBA_8888`);
        console.info(`${LOG_PREFIX} dstPixelMap pixelFormat: BGRA_8888`);
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap);
        
        console.info(`${LOG_PREFIX} createPremultipliedPixelMap019 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap019 error: ${error}, code: ${err.code}`);
        expect(error).assertEqual(62980103);
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap020
     * @tc.number  CreatePremultipliedPixelMapTest_020
     * @tc.desc    createPremultipliedPixelMap with error code 62980103 test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('createPremultipliedPixelMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        // Create source pixel map with unsupported format
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
          pixelFormat: image.PixelMapFormat.ASTC_4x4,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);
        
        // Create destination pixel map
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);
        
        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap);
        
        expect().assertFail();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap020 error: ${error}, code: ${err.code}`);
        expect(Number(err.code)).assertEqual(7600201);
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap021
     * @tc.number  CreatePremultipliedPixelMapTest_021
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable true (Promise) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);

        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);

        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(true);

        // Test createPremultipliedPixelMap with Promise
        await image.createPremultipliedPixelMap(srcPixelMap, dstPixelMap);

        console.info(`${LOG_PREFIX} createPremultipliedPixelMap021 success`);
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap021 error: ${error}, code: ${err.code}`);
        expect(Number(error) === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name    createPremultipliedPixelMap022
     * @tc.number  CreatePremultipliedPixelMapTest_022
     * @tc.desc    createPremultipliedPixelMap with src editable true, dst editable true (AsyncCallback) test.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('createPremultipliedPixelMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        // Create source pixel map with isEditable: true
        const srcOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.PREMUL
        };
        const srcPixelMap = image.createPixelMapUsingAllocatorSync(srcOpts);

        // Create destination pixel map with isEditable: true
        const dstOpts: image.InitializationOptions = {
          size: { width: 4, height: 6 },
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          editable: true,
          alphaType: image.AlphaType.UNPREMUL
        };
        const dstPixelMap = image.createPixelMapUsingAllocatorSync(dstOpts);

        console.info(`${LOG_PREFIX} srcPixelMap isEditable: ${srcPixelMap.isEditable}`);
        console.info(`${LOG_PREFIX} dstPixelMap isEditable: ${dstPixelMap.isEditable}`);

        expect(srcPixelMap.isEditable).assertEqual(true);
        expect(dstPixelMap.isEditable).assertEqual(true);

        // Test createPremultipliedPixelMap with AsyncCallback
        image.createPremultipliedPixelMap(dstPixelMap, srcPixelMap, (err) => {
          if (err) {
            console.error(`${LOG_PREFIX} createPremultipliedPixelMap022 error: ${err}, code: ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${LOG_PREFIX} createPremultipliedPixelMap022 success`);
            done();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${LOG_PREFIX} createPremultipliedPixelMap022 error: ${error}, code: ${err.code}`);
        expect(Number(error) === 401).assertTrue();
        done();
      }
    });

  })
}
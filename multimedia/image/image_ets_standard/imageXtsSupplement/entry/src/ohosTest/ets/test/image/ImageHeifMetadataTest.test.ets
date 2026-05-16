/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import common from '@ohos.app.ability.common';
import { fileIo as fs } from '@kit.CoreFileKit';
import { JSON } from '@kit.ArkTS';
import { isEmpty } from '../common';

const TAG = 'Image.ImageHeifsTest'

let imageSource: image.ImageSource;

export default function ImageHeifsTest() {
  describe('ImageHeifsTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('number', 1);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   IMAGE_META_DATA_GET_PROPERTIES_00001
     * @tc.number IMAGE_META_DATA_GET_PROPERTIES_00001
     * @tc.desc   Metadata getProperties the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_META_DATA_GET_PROPERTIES_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_META_DATA_GET_PROPERTIES_00001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
        let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap);
        console.info(TAG, testName, 'metadataType')
        await exifPictureObj.getMetadata(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   IMAGE_META_DATA_GET_PROPERTIES_00002
     * @tc.number IMAGE_META_DATA_GET_PROPERTIES_00002
     * @tc.desc   Metadata getProperties the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_META_DATA_GET_PROPERTIES_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_META_DATA_GET_PROPERTIES_00002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
        let exifPictureObj: image.Picture = image.createPicture(exifCommodityPixelMap);
        console.info(TAG, testName, 'metadataType')
        await exifPictureObj.getMetadata(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_PROPERTY_KEY_HEIFS_DELAY_TIME_00001
     * @tc.number IMAGE_HEIFS_PROPERTY_KEY_HEIFS_DELAY_TIME_00001
     * @tc.desc   HeifsPropertyKey HEIFS_DELAY_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_HEIFS_PROPERTY_KEY_HEIFS_DELAY_TIME_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_PROPERTY_KEY_HEIFS_DELAY_TIME_00001';
      try {
        let result = image.HeifsPropertyKey.HEIFS_DELAY_TIME;
        expect(result == 'HeifsDelayTime').assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' HeifsPropertyKey error', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_CREATE_INSTANCE_00001
     * @tc.number IMAGE_HEIFS_METADATA_CREATE_INSTANCE_00001
     * @tc.desc   HeifsMetadata createInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_HEIFS_METADATA_CREATE_INSTANCE_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_CREATE_INSTANCE_00001';
      try {
        let heifsMetadata = image.HeifsMetadata.createInstance();
        expect(isEmpty(heifsMetadata)).assertFalse();
        expect(isEmpty(heifsMetadata.heifsDelayTime)).assertTrue();
        console.info(TAG, testName, "createInstance success", JSON.stringify(heifsMetadata));
        done();
      } catch (error) {
        console.error(TAG, testName, ' createInstance error', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_GET_PROPERTIES_001
     * @tc.number IMAGE_HEIFS_METADATA_GET_PROPERTIES_001
     * @tc.desc   heifsMetadata getProperties the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_HEIFS_METADATA_GET_PROPERTIES_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_GET_PROPERTIES_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, testName, 'metadataType')
        imageData.heifsMetadata?.getProperties(null)
        console.info(TAG, testName, 'success getProperties')
        done();
      } catch (error) {
        console.error(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_GET_PROPERTIES_002
     * @tc.number IMAGE_HEIFS_METADATA_GET_PROPERTIES_002
     * @tc.desc   heifsMetadata getProperties the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_HEIFS_METADATA_GET_PROPERTIES_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_GET_PROPERTIES_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, testName, 'metadataType')
        imageData.heifsMetadata?.getProperties(undefined)
        console.info(TAG, testName, 'success getProperties')
        done();
      } catch (error) {
        console.error(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_GET_PROPERTIES_003
     * @tc.number IMAGE_HEIFS_METADATA_GET_PROPERTIES_003
     * @tc.desc   heifsMetadata getProperties the first parameter is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_HEIFS_METADATA_GET_PROPERTIES_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_GET_PROPERTIES_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, testName, 'metadataType')
        imageData.heifsMetadata?.getProperties([])
        console.info(TAG, testName, 'success getProperties')
        done();
      } catch (error) {
        console.error(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_SET_PROPERTIES_001
     * @tc.number IMAGE_HEIFS_METADATA_SET_PROPERTIES_001
     * @tc.desc   heifsMetadata setProperties the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_HEIFS_METADATA_SET_PROPERTIES_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_SET_PROPERTIES_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, testName, 'metadataType')
        imageData.heifsMetadata?.setProperties(null);
        console.info(TAG, testName, 'success setProperties');
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_HEIFS_METADATA_SET_PROPERTIES_002
     * @tc.number IMAGE_HEIFS_METADATA_SET_PROPERTIES_002
     * @tc.desc   heifsMetadata setProperties the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_HEIFS_METADATA_SET_PROPERTIES_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_HEIFS_METADATA_SET_PROPERTIES_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        imageSource = image.createImageSource(array, ops);
        let imageData = await imageSource.readImageMetadata()
        console.info(TAG, testName, 'metadataType')
        imageData.heifsMetadata?.setProperties(undefined);
        console.info(TAG, testName, 'success setProperties');
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(Number(error.code)).assertEqual(7600202);
      } finally {
        imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_TOP_RIGHT_001
     * @tc.number IMAGE_ORIENTATION_TOP_RIGHT_001
     * @tc.desc   Orientation TOP_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_TOP_RIGHT_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_TOP_RIGHT_001';
      try {
        expect(image.Orientation.TOP_RIGHT == 2).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_BOTTOM_RIGHT_002
     * @tc.number IMAGE_ORIENTATION_BOTTOM_RIGHT_002
     * @tc.desc   Orientation BOTTOM_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_BOTTOM_RIGHT_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_BOTTOM_RIGHT_002';
      try {
        expect(image.Orientation.BOTTOM_RIGHT == 3).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_BOTTOM_LEFT_004
     * @tc.number IMAGE_ORIENTATION_BOTTOM_LEFT_004
     * @tc.desc   Orientation BOTTOM_LEFT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_BOTTOM_LEFT_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_BOTTOM_LEFT_004';
      try {
        expect(image.Orientation.BOTTOM_LEFT == 4).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_LEFT_TOP_005
     * @tc.number IMAGE_ORIENTATION_LEFT_TOP_005
     * @tc.desc   Orientation LEFT_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_LEFT_TOP_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_LEFT_TOP_005';
      try {
        expect(image.Orientation.LEFT_TOP == 5).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_RIGHT_TOP_006
     * @tc.number IMAGE_ORIENTATION_RIGHT_TOP_006
     * @tc.desc   Orientation RIGHT_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_RIGHT_TOP_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_RIGHT_TOP_006';
      try {
        expect(image.Orientation.RIGHT_TOP == 6).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_RIGHT_BOTTOM_007
     * @tc.number IMAGE_ORIENTATION_RIGHT_BOTTOM_007
     * @tc.desc   Orientation RIGHT_BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_RIGHT_BOTTOM_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_RIGHT_BOTTOM_007';
      try {
        expect(image.Orientation.RIGHT_BOTTOM == 7).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_ORIENTATION_LEFT_BOTTOM_008
     * @tc.number IMAGE_ORIENTATION_LEFT_BOTTOM_008
     * @tc.desc   Orientation LEFT_BOTTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_ORIENTATION_LEFT_BOTTOM_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_ORIENTATION_LEFT_BOTTOM_008';
      try {
        expect(image.Orientation.LEFT_BOTTOM == 8).assertTrue();
        console.info(TAG, testName, ' Orientation success');
        done();
      } catch (error) {
        console.error(TAG, testName, ' Orientation error', error, error.code);
        expect().assertFail();
        done();
      }
    });
  })
}

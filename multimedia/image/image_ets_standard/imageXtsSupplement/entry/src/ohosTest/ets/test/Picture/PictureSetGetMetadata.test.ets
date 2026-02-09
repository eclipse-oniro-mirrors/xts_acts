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
import common from '@ohos.app.ability.common';
import { LOG_TAG, sleep } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'setGetMetadataSupp';

async function setMetadataPromiseTest(done: Function, testName: string, pathUri: string,
  metadataType: image.MetadataType,callback: (errCode?: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(3000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    console.info(TAG, testName, `path: ${path}`);
    const fd = await fs.open(path);
    console.info(TAG, testName, `open: ${fd.fd}`);
    await fs.close(fd );
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    console.info(TAG,'createImageSource success');
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    if (pictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType);
      pictureObj.setMetadata(metadataType, exifMetaData).then(() => {
        console.info(TAG,'Set metadata success');
        expect(exifMetaData != null).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG,'Failed to set metadata. error.code: ' + JSON.stringify(error.code) + ' ,error.message:' +
        JSON.stringify(error.message));
        callback(error.code)
      });
      done();
    } else {
      console.error(TAG,TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
    callback(error.code)
    done();
  }
}
async function getMetadataPromiseTest(done: Function, testName: string, pathUri: string,
  metadataType: image.MetadataType|null|undefined,callback: (res:image.Metadata,errCode?: number) => void) {
  try {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(3000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    console.info(TAG, testName, `path: ${path}`);
    const fd = await fs.open(path);
    console.info(TAG, testName, `open: ${fd.fd}`);
    await fs.close(fd );
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    console.info(TAG,'createImageSource success');
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    console.info(TAG,'get exifCommodityPixelMap  success');
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    console.info(TAG,'get exifPictureObj  success');
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    if (pictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType);
      if (exifMetaData != null) {
        console.info(TAG,'get picture metadata success');
        expect(exifMetaData != null).assertTrue();
      } else {
        console.error(TAG,'get picture metadata is failed');
        callback(exifMetaData,undefined)
      }
    } else {
      console.error(TAG," pictureObj is null");
      expect().assertFail();
      done();
    }
      done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
    callback(error.code)
    done();
  }
}

export default function PictureSetMetadataTestSupp() {
  describe('PictureSetMetadataTestSupp', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
      sleep(1000);
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_001
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_001
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_001';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataPromiseTest(done, testName, '', metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_002
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_002
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_002';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, '', metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_003
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_003
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_003';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, '', metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_004
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_004
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_004';
      const path = 'test_exif_v2.jpg';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_005
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_005
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_005';
      const path = 'test_exif_v2.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_006
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_006
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_006';
      const path = 'test61.gif';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_007
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_007
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_007';
      const path = 'test6.gif';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,( errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_008
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_008
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_008';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_009
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_009
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_009';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,( errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_010
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_010
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_010';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_011
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_011
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_011';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_012
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_012
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_012';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_013
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_013
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_013';
      const path = 'test_exif_v2.webp';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,( errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })

    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_014
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_014
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_014';
      const path = 'test_exif_v2.webp';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_015
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_015
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_015';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_016
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_016
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_016';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })

    /**
     * @tc.name   PICTURE_SET_METADATA_ERROR_CODE_017
     * @tc.number PICTURE_SET_METADATA_ERROR_CODE_017
     * @tc.desc   setMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_SET_METADATA_ERROR_CODE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_SET_METADATA_ERROR_CODE_017';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataPromiseTest(done, testName, path, metadataType,(errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })

    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_001
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_001
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_001';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, '', metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_002
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_002
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_002';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataPromiseTest(done, testName, '', metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_003
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_003
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_003';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, '', metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_004
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_004
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_004';
      const path = 'test_exif_v2.jpg';
        let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        await getMetadataPromiseTest(done, testName, 'test_exif_v2.jpg', metadataType,(res:image.Metadata,errCode?: number) => {
          if (errCode != undefined) {
            expect(errCode).assertEqual(9001005);
          }
        })
      })

    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_005
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_005
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_005';
      const path = 'test_exif_v2.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(7600202);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_006
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_006
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_006';
      const path = 'test61.gif';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_007
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_007
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_007';
      const path = 'test6.gif';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual('7600202');
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_008
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_008
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_008';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual('7600202');
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_009
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_009
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_009';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(13900020);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_010
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_010
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_010';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_011
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_011
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_011';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_012
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_012
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_012';
      const path = 'test_exif_empty.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual(9001005);
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_013
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_013
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_013';
      const path = 'test_exif_v2.webp';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,( res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual('7600202');
        }
      })
    })

    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_014
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_014
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_014';
      const path = 'test_exif_v2.webp';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,( res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(res).assertUndefined();
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_015
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_015
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_015';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,( res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(res).assertUndefined();
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_016
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_016
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_016';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,( res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(errCode).assertEqual('7600202');
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_ERROR_CODE_017
     * @tc.number PICTURE_GET_METADATA_ERROR_CODE_017
     * @tc.desc   getMetadata abnormal input parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_ERROR_CODE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_ERROR_CODE_017';
      const path = 'test8.bmp';
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType,(res:image.Metadata,errCode?: number) => {
        if (errCode != undefined) {
          expect(res).assertUndefined();
        }
      })
    })


  })
}

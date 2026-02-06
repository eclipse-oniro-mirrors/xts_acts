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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
const TAG = 'getPropertiesTestSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image case open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function getImageSource(testName: string, pathUri: string): Promise<image.ImageSource> {
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
  let imageSourceApi: image.ImageSource = image.createImageSource(array, ops);
  return imageSourceApi;
}

async function getPropertiesAbnormalPromiseTest(done: Function, testName: string, path: string,callback: (Metadata?: image.Metadata) => void) {
  const imageSourceApi = await getImageSource(testName ,path);
  let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
  let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
  let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
  let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
  console.log(TAG,testName, JSON.stringify(metaData));
  callback(metaData);
}

export default function getPropertiesTest() {
  describe('getPropertiesTest', () => {

    beforeAll(async () => {
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
    });

    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_001
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_001
     * @tc.desc       jpg格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_001';
      const path = 'test_exif.jpg';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties(null);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_002
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_002
     * @tc.desc       jpg格式图片的空数组覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_002';
      const path = 'test_exif.jpg';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties([]);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_003
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_003
     * @tc.desc       png格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_003';
      const path = 'test_aisr.png';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties(null);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_004
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_004
     * @tc.desc       png格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_004';
      const path = 'test_aisr.png';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties([]);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_005
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_005
     * @tc.desc       jpeg格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_005';
      const path = 'test.jpeg';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
           await metaData?.getProperties(null);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_006
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_006
     * @tc.desc       jpeg格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_006';
      const path = 'test.jpeg';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties([]);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_007
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_007
     * @tc.desc       dng格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_007';
      const path = 'mimeType_test.dng';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties(null);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_008
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_008
     * @tc.desc       dng格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_008';
      const path = 'mimeType_test.dng';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties([]);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })

    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_009
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_009
     * @tc.desc       srw格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_009';
      const path = 'mimeType_test.srw';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, path, async (metaData) => {
          await metaData?.getProperties(null);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.number     GET_PROPERTIES_ABNORMAL_TEST_010
     * @tc.name       GET_PROPERTIES_ABNORMAL_TEST_010
     * @tc.desc       srw格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_PROPERTIES_ABNORMAL_TEST_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_PROPERTIES_ABNORMAL_TEST_010';
      const pathUri = 'mimeType_test.srw';
      try {
        await getPropertiesAbnormalPromiseTest(done, testName, pathUri, async (metaData) => {
          await metaData?.getProperties([])
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(TAG, testName, ' getProperties error', error.message, error.code);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
  })
}
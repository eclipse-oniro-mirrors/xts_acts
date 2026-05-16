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
import App from '@system.app';

const TAG = 'setPropertiesTestSupp'
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

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}


async function setPropertiesAbnormalPromiseTest(done: Function, testName: string, path: string,callback: (Metadata?: image.Metadata) => void) {
  const imageSourceApi = await getImageSource(path);
  let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
  let pictureObj: image.Picture = await image.createPicture(commodityPixelMap);
  let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
  let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
  console.log(TAG,testName, JSON.stringify(metaData));
  callback(metaData);
}

export default function setPropertiesTest() {
  describe('setPropertiesTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('emptyString', '')
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_001
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_001
     * @tc.desc       jpg图片第一个参数null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_001';
      const path = 'test_exif.jpg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(null);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_002
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_002
     * @tc.desc       jpg图片第一个参数undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_002';
      const path = 'test_exif.jpg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(undefined);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_003
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_003
     * @tc.desc       jpg图片第一个参数空字符串覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_003';
      const path = 'test_exif.jpg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(AppStorage.get('emptyString'));
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_004
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_004
     * @tc.desc       arw图片第一个参数null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_004';
      const path = 'mimeType_test.arw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(null);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_005
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_005
     * @tc.desc       arw图片第一个参数undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_005';
      const path = 'mimeType_test.arw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(undefined);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_006
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_006
     * @tc.desc       arw图片第一个参数空字符串覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_006';
      const path = 'mimeType_test.arw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(AppStorage.get('emptyString'));
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_007
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_007
     * @tc.desc       jpeg图片第一个参数null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_007';
      const path = 'test.jpeg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(null);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_008
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_008
     * @tc.desc       jpeg图片第一个参数undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_008';
      const path = 'test.jpeg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(undefined);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_009
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_009
     * @tc.desc       jpeg图片第一个参数空覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_009';
      const path = 'test.jpeg';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(AppStorage.get('emptyString'));
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_010
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_010
     * @tc.desc       srw图片第一个参数null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_010';
      const path = 'mimeType_test.srw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(null);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_011
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_011
     * @tc.desc       srw图片第一个参数undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_011';
      const path = 'mimeType_test.srw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(undefined);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_012
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_012
     * @tc.desc       srw图片第一个参数空覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_012';
      const path = 'mimeType_test.srw';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(AppStorage.get('emptyString'));
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_013
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_013
     * @tc.desc       dng图片第一个参数null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_013';
      const path = 'mimeType_test.dng';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(null);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_014
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_014
     * @tc.desc       dng图片第一个参数undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_014';
      const path = 'mimeType_test.dng';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(undefined);
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number     SET_PROPERTIES_ABNORMAL_TEST_015
     * @tc.name       SET_PROPERTIES_ABNORMAL_TEST_015
     * @tc.desc       dng图片第一个参数空覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SET_PROPERTIES_ABNORMAL_TEST_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_PROPERTIES_ABNORMAL_TEST_015';
      const path = 'mimeType_test.dng';
      try {
        await setPropertiesAbnormalPromiseTest(done, testName, path, (metaData) => {
          metaData?.setProperties(AppStorage.get('emptyString'));
          expect().assertFail();
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' setProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}
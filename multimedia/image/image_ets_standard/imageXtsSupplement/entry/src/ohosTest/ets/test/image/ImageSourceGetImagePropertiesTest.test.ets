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
import common from '@ohos.app.ability.common';
const TAG = 'getImagePropertiesTestSupp'
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
export default function getImagePropertiesTest() {
  describe('getImagePropertiesTest', () => {

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
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_001
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_001
     * @tc.desc       jpeg格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_001';
      const path = 'test.jpeg';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties(null)
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_002
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_002
     * @tc.desc       jpeg格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_002';
      const path = 'test.jpeg';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties([])
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_003
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_003
     * @tc.desc       png格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_003';
      const path = 'test_aisr.png';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties(null)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_004
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_004
     * @tc.desc       png格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_004';
      const path = 'test_aisr.png';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties([])
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_005
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_005
     * @tc.desc       HEIC格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_005';
      const path = 'test_exif_empty.heic';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties(null)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_006
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_006
     * @tc.desc       HEIC格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_006';
      const path = 'test_exif_empty.heic';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties([])
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_007
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_007
     * @tc.desc       webp格式图片的第一个参数为null的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_007';
      const path = 'test_large.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties(null)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number     GET_IMAGE_PROPERTIES_ABNORMAL_TEST_008
     * @tc.name       GET_IMAGE_PROPERTIES_ABNORMAL_TEST_008
     * @tc.desc       webp格式图片的第一个参数为空数组的覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('GET_IMAGE_PROPERTIES_ABNORMAL_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_PROPERTIES_ABNORMAL_TEST_008';
      const path = 'test_large.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        await imageSourceApi.getImageProperties([])
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'getImageProperties error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}
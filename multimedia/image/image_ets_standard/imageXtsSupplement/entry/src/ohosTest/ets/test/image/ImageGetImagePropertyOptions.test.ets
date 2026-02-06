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

const TAG = 'ImageSource.ImageGetImagePropertyOptions'
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
    console.info(TAG, "image cese open fd fail" + err)
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

export default function ImageGetImagePropertyOptionsSupp() {
  describe('ImageGetImagePropertyOptionsSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_001
     * @tc.desc   getImageProperty first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let options: image.ImagePropertyOptions = { index:0, defaultValue:'9999'}
      try {
        imageSourceApi.getImageProperty(image.PropertyKey.BITS_PER_SAMPLE, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_002
     * @tc.desc   getImageProperty first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let options: image.ImagePropertyOptions = { index:0, defaultValue:'9999'}
      try {
        imageSourceApi.getImageProperty('', options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('9999');
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_003
     * @tc.desc   getImageProperty first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(null, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_004
     * @tc.desc   getImageProperty first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(undefined, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value , error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })



    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_005
     * @tc.desc   getImageProperty first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_005';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let options: image.ImagePropertyOptions = { index:0, defaultValue:'9999'}
      try {
        imageSourceApi.getImageProperty(image.PropertyKey.BITS_PER_SAMPLE, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_006
     * @tc.desc   getImageProperty first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_006';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let options: image.ImagePropertyOptions = { index:0, defaultValue:'9999'}
      try {
        imageSourceApi.getImageProperty('', options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('9999');
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_007
     * @tc.desc   getImageProperty first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_007';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(null, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_008
     * @tc.desc   getImageProperty first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_008';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(undefined, options)
          .then((data: string) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value , error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })





    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_001
     * @tc.desc   getImageProperty callback first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperty("BitsPerSample",(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }
      })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_002
     * @tc.desc   getImageProperty callback first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperty("",(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect(data).assertUndefined();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_003
     * @tc.desc   getImageProperty callback first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperty(null,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_004
     * @tc.desc   getImageProperty callback first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        try {
          imageSourceApi.getImageProperty(undefined,(error: BusinessError, data: string) => {
            if (error) {
              console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
              expect().assertFail();
            } else {
              console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
              expect().assertFail();
            }
          })
        }catch (err) {
          console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
          expect(err.code).assertEqual('401');
        }
        done();
      })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_005
     * @tc.desc   getImageProperty callback first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_005';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperty("BitsPerSample",(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_006
     * @tc.desc   getImageProperty callback first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_006';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperty("",(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect(data).assertUndefined();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_007
     * @tc.desc   getImageProperty callback first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_007';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperty(null,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_008
     * @tc.desc   getImageProperty callback first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_CALLBACK_008';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperty(undefined,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })



    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_001
     * @tc.desc   getImageProperty AsyncCallback first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty("BitsPerSample",property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_002
     * @tc.desc   getImageProperty AsyncCallback first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty("",property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('9999');
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_003
     * @tc.desc   getImageProperty AsyncCallback first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(null,property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_004
     * @tc.desc   getImageProperty AsyncCallback first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(undefined,property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_005
     * @tc.desc   getImageProperty AsyncCallback first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_005';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty("BitsPerSample",property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('1, 1, 1');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_006
     * @tc.desc   getImageProperty AsyncCallback first key cover ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_006';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty("",property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect(data).assertEqual('9999');
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_007
     * @tc.desc   getImageProperty AsyncCallback first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_007';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(null,property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_008
     * @tc.desc   getImageProperty AsyncCallback first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_getImageProperty_ASYNC_CALLBACK_008';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let property: image.GetImagePropertyOptions = { index: 0, defaultValue: '9999' }
      try {
        imageSourceApi.getImageProperty(undefined,property,(error: BusinessError, data: string) => {
          if (error) {
            console.error(TAG,testName,'Failed to get the value of the specified attribute key of the image.',data);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_001
     * @tc.desc   getImageProperties first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_001';
      const imageSourceApi = await getImageSource('ttest_exif_v2.jpg');
      let key = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.getImageProperties(key).then((data) => {
          console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
          expect(data!=undefined).assertTrue();
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_002
     * @tc.desc   getImageProperties first key cover []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperties([]).then((data) => {
          console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_003
     * @tc.desc   getImageProperties first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperties(null).then((data) => {
          console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_004
     * @tc.desc   getImageProperties first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.getImageProperties(undefined).then((data) => {
          console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value , error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_005
     * @tc.desc   getImageProperties first key normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_005';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let key = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.getImageProperties(key).then((data) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
          expect(data!=undefined).assertTrue();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_006
     * @tc.desc   getImageProperties first key cover []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_006';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperties([]).then((data) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_007
     * @tc.desc   getImageProperties first key cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_007';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperties(null).then((data) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_008
     * @tc.desc   getImageProperties first key cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GetImageProperties_008';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        imageSourceApi.getImageProperties(undefined).then((data) => {
            console.info(TAG,testName,'Succeeded in getting the value of the specified attribute key of the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to get the value of the specified attribute key of the image, error.code ${error.code}, error.message ${error.message}`);
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to get the value , error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })

  });
}
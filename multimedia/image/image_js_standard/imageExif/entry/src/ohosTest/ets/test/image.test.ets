/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image'
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility'
import { BusinessError } from '@ohos.base';

let filePath: ESObject;
let fdNumber: number;
let globalpixelmap: PixelMap;

async function getFd(fileName: string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + '/' + fileName;
  console.info('image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info("image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info("image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info("image case open fd err " + err);
  })
}

export default function imageExif() {
  describe('imageExif', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        await globalpixelmap.release();
      }
      await fileio.close(fdNumber).then(() => {
        console.info("close file succeed");
      }).catch((err: BusinessError) => {
        console.info("close file failed with error:" + err);
      });
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif1.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("BitsPerSample")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 BitsPerSample ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0100 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("Orientation")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 Orientation ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0200 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("ImageLength")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 ImageLength ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0300 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("ImageWidth")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 ImageWidth ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0400 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLatitude")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 GPSLatitude ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0500 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLongitude")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 GPSLongitude ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0600 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLatitudeRef")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 GPSLatitudeRef ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0700 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLongitudeRef")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 GPSLongitudeRef ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0800 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("DateTimeOriginal")
          .then(data => {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 DateTimeOriginal ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROMISE_0900 error: ' + error);
            expect(false).assertFail();
            done();
          })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif1.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("BitsPerSample", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 getImageProperty BitsPerSample error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0100 BitsPerSample ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("Orientation", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 getImageProperty Orientation error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0200 Orientation ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("ImageLength", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 getImageProperty ImageLength error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0300 ImageLength ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("ImageWidth", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 getImageProperty ImageWidth error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0400 ImageWidth ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLatitude", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 getImageProperty GPSLatitude error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0500 GPSLatitude ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLongitude", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 getImageProperty GPSLongitude error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0600 GPSLongitude ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLatitudeRef", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 getImageProperty GPSLatitudeRef error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0700 GPSLatitudeRef ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("GPSLongitudeRef", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 getImageProperty GPSLongitudeRef error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0800 GPSLongitudeRef ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty("DateTimeOriginal", (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 getImageProperty DateTimeOriginal error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_CALLBACK_0900 DateTimeOriginal ' + data);
            expect(data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif1.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("BitsPerSample", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 getImageProperty BitsPerSample error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0100 BitsPerSample ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("Orientation", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 getImageProperty Orientation error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0200 Orientation ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("ImageLength", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 getImageProperty ImageLength error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0300 ImageLength ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("ImageWidth", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 getImageProperty ImageWidth error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0400 ImageWidth ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("GPSLatitude", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 getImageProperty GPSLatitude error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0500 GPSLatitude ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("GPSLongitude", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 getImageProperty GPSLongitude error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0600 GPSLongitude ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("GPSLatitudeRef", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 getImageProperty GPSLatitudeRef error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0700 GPSLatitudeRef ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("GPSLongitudeRef", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 getImageProperty GPSLongitudeRef error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0800 GPSLongitudeRef ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
      await getFd('test_exif.jpg');
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        let property: ESObject = {
          index: 0, defaultValue: '9999'
        }
        imageSourceApi.getImageProperty("DateTimeOriginal", property, (error, data) => {
          if (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 getImageProperty DateTimeOriginal error');
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_MULTIMEDIA_IMAGE_EXIF_GETIMAGEPROPERTY_PROPERTY_CALLBACK_0900 DateTimeOriginal ' + data);
            expect(data != '9999' && data != undefined && data != '').assertTrue();
            done();
          }
        })
      }
    })
  })
}

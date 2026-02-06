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
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';
import fileio from '@ohos.fileio'
let fdNumber: number;

const TAG = 'pictureMarshallingSupp';



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

async function marshallingTest(done: Function, testName: string, path: string ,callback :(picture: image.Picture) => void) {
    const imageSourceApi = await getImageSource(path);
    let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
    let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
    callback(PictureObj);

}

export default function PictureMarshallingTest() {
  describe('PictureMarshallingTest', () => {

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
     * @tc.name   PICTURE_MARSHALLING_001
     * @tc.number PICTURE_MARSHALLING_001
     * @tc.desc   picture_marshalling webp图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_001';
      const path = 'test_large.webp';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
           picture.marshalling(null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_002
     * @tc.number PICTURE_MARSHALLING_002
     * @tc.desc   picture_marshalling webp图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_002';
      const path = 'test_large.webp';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_003
     * @tc.number PICTURE_MARSHALLING_003
     * @tc.desc   picture_marshalling webp图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_003';
      const path = 'test_large.webp';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          picture.marshalling(data);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_004
     * @tc.number PICTURE_MARSHALLING_004
     * @tc.desc   picture_marshalling png图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_004';
      const path = 'test_aisr.png';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_005
     * @tc.number PICTURE_MARSHALLING_005
     * @tc.desc   picture_marshalling png图片第一个参数为undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_005';
      const path = 'test_aisr.png';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_006
     * @tc.number PICTURE_MARSHALLING_006
     * @tc.desc   picture_marshalling png图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_006';
      const path = 'test_aisr.png';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          picture.marshalling(data);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_007
     * @tc.number PICTURE_MARSHALLING_007
     * @tc.desc   picture_marshalling jpg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_007';
      const path = 'test_exif.jpg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

     /**
      * @tc.name   PICTURE_MARSHALLING_008
      * @tc.number PICTURE_MARSHALLING_008
      * @tc.desc   picture_marshalling jpg图片第一个参数为undefined覆盖
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('PICTURE_MARSHALLING_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_008';
      const path = 'test_exif.jpg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_009
     * @tc.number PICTURE_MARSHALLING_009
     * @tc.desc   picture_marshalling jpg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_009';
      const path = 'test_exif.jpg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          picture.marshalling(data);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_010
     * @tc.number PICTURE_MARSHALLING_010
     * @tc.desc   picture_marshalling jpeg图片第一个参数为null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_010';
      const path = 'test.jpeg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(null);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

     /**
      * @tc.name   PICTURE_MARSHALLING_011
      * @tc.number PICTURE_MARSHALLING_011
      * @tc.desc   picture_marshalling jpeg图片第一个参数为undefined覆盖
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('PICTURE_MARSHALLING_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_011';
      const path = 'test.jpeg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          picture.marshalling(undefined);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PICTURE_MARSHALLING_012
     * @tc.number PICTURE_MARSHALLING_012
     * @tc.desc   picture_marshalling jpeg图片第一个参数为空覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_MARSHALLING_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_MARSHALLING_012';
      const path = 'test.jpeg';
      try {
        await marshallingTest(done, testName, path, (picture: image.Picture) => {
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          picture.marshalling(data);
        });
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}
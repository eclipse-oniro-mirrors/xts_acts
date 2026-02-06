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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';
import { common } from '@kit.AbilityKit';
import fileio from '@ohos.fileio'
import { BusinessError } from '@ohos.base';

const TAG = LOG_TAG + 'getImagePropertySync';

let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, ' image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, " image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, " image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, " image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, " createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function getImagePropertySyncNormalTest(done: Function, testName: string, path: string,
  propertyKey: image.PropertyKey, callback: (data: string) => void) {
  console.info(TAG, testName + ' - start');
  try {
    const imageSourceApi = await getImageSource(path);
    console.info(TAG, testName, ' getImageSource: ', imageSourceApi);
    let data = imageSourceApi.getImagePropertySync(propertyKey);
    console.info(TAG, testName, " get key : ", propertyKey, 'value: ', data);
    callback(data);
    done();
  } catch (err) {
    console.info(TAG, testName, ' getImageProperty error', err.message, err.code);
    expect().assertFail();
    done();
  }
}

export async function copyImageToSandbox(fileName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  console.log(' sandbox file path:', path);
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}

export default function getImagePropertySyncTest() {
  describe('getImagePropertySyncTest', () => {

    const testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0001
     * @tc.desc   验证获取图片GPS_VERSION_ID属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0001';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.GPS_VERSION_ID,
        (data: string) => {
          expect(data).assertEqual('2.2.0.0');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0002
     * @tc.desc   验证获取图片NEW_SUBFILE_TYPE属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0002';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.NEW_SUBFILE_TYPE,
        (data: string) => {
          expect(data).assertEqual('3');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0003
     * @tc.desc   验证获取图片SUBFILE_TYPE属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0003';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.SUBFILE_TYPE,
        (data: string) => {
          expect(data).assertEqual('2');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0004
     * @tc.desc   验证获取图片IMAGE_WIDTH属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0004';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.IMAGE_WIDTH,
        (data: string) => {
          expect(data).assertEqual('0');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0005
     * @tc.desc   验证获取图片IMAGE_LENGTH属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0005';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.IMAGE_LENGTH,
        (data: string) => {
          expect(data).assertEqual('0');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0006
     * @tc.desc   验证获取图片BITS_PER_SAMPLE属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0006';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.BITS_PER_SAMPLE,
        (data: string) => {
          expect(data).assertEqual('1, 1, 1');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0007
     * @tc.desc   验证获取图片COMPRESSION属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0007';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.COMPRESSION,
        (data: string) => {
          expect(data).assertEqual('Uncompressed');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0008
     * @tc.desc   验证获取图片PHOTOMETRIC_INTERPRETATION属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0008';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        (data: string) => {
          expect(data).assertEqual('Reversed mono');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0009
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0009
     * @tc.desc   验证获取图片IMAGE_DESCRIPTION属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0009';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.IMAGE_DESCRIPTION,
        (data: string) => {
          expect(data).assertEqual(`_cuva%s\\d`);
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0010
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0010
     * @tc.desc   验证获取图片MAKE属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0010';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.MAKE,
        (data: string) => {
          expect(data).assertEqual('华为');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0011
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0011
     * @tc.desc   验证获取图片MODEL属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0011';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.MODEL,
        (data: string) => {
          expect(data).assertEqual('TNY-AL00');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0012
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0012
     * @tc.desc   验证获取图片STRIP_OFFSETS属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0012';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.STRIP_OFFSETS,
        (data: string) => {
          expect(data).assertEqual('123');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0013
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0013
     * @tc.desc   验证获取图片ORIENTATION属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0013';
      await getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.ORIENTATION,
        (data: string) => {
          expect(data).assertEqual('Top-left');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0014
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0014
     * @tc.desc   验证获取图片SAMPLES_PER_PIXEL属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0014';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.SAMPLES_PER_PIXEL,
        (data: string) => {
          expect(data).assertEqual('0');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0015
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0015
     * @tc.desc   验证获取图片ROWS_PER_STRIP属性的同步接口返回值正确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_IMAGE_PROPERTY_SYNC_0015';
      getImagePropertySyncNormalTest(done, testName, 'test_exif_v2.jpg', image.PropertyKey.ROWS_PER_STRIP,
        (data: string) => {
          expect(data).assertEqual('123');
        })
    })

  })
}
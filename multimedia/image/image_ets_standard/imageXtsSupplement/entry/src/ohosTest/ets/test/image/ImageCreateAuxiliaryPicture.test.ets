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
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';
const TAG = LOG_TAG + 'createAuxiliaryPicture';

async function createAuxiliaryPictureAbnormalTest(done: Function, testName: string, path: string, auxSize: Size,
  auxType: image.AuxiliaryPictureType, callback: (errorCode: string) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(3000);
    let pathUri = 'file://' + testContext.filesDir + "/" + path;
    const fd = await fs.open(pathUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, ` readLength: ${readLength}`);
    await fs.close(fd);
    let auxPictureObj: image.AuxiliaryPicture | null = await image.createAuxiliaryPicture(array, auxSize, auxType);
    console.info(TAG, testName, 'auxPictureObj  value：  ' + JSON.stringify(auxPictureObj) + auxPictureObj.getAuxiliaryPictureInfo());
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code)
    done();
  }
}

export default function ImageCreateAuxiliaryPictureTest() {
  describe('ImageCreateAuxiliaryPictureTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('testMap', [-1, 0, 1])
      AppStorage.setOrCreate('testString', 'abc')

      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('testMap')
      AppStorage.delete('testString')
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_001
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_001';
      const path = 'test_exif_v2.jpg';

      let auxSize: Size = { height: null as ESObject, width: 300 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_002
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_002';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = {
        height: undefined as ESObject, width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_003
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_003';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: -1, width: 300 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_004
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_004';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: -100, width: 300 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_005
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_005';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: AppStorage.get('testMap') as ESObject, width: 300 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_006
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_006';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = {
        height: AppStorage.get('testString') as ESObject, width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_007
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_007';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: null as ESObject };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_008
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_008
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_008';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: undefined as ESObject };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_009
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_009
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_009';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: -1 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_010
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_0010
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_010';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: -100 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_011
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_011
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_011';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: AppStorage.get('testMap') as ESObject };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_012
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_012
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_012';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = { height: 300, width: AppStorage.get('testString') as ESObject };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_013
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_013
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_013';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = null as ESObject
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_014
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_014
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_014';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = undefined as ESObject
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_015
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_015
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_015';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = AppStorage.get('testMap') as ESObject
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_016
     * @tc.number SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_016
     * @tc.desc   Test createAuxiliaryPicture with Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_AUXILIARY_PICTURE_ABNORMAL_ERROR_016';
      const path = 'test_exif_v2.jpg';
      let auxSize: Size = AppStorage.get('testString') as ESObject
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalTest(done, testName, path, auxSize, auxType, (errorCode) => {
        expect(errorCode).assertEqual('401');
      });
    })
  })
}
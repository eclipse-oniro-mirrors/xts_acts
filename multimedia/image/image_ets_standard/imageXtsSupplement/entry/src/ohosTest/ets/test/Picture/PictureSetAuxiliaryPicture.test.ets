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
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'PictureSetAuxiliaryPicture';

async function setAuxiliaryPictureAbPromiseTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType, callback: (errorCode: boolean) => void,
  auxPictureData: image.AuxiliaryPicture) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(3000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, `readLength: ${readLength}`);
    await fs.close(fd);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
    console.info(TAG, testName, `setAuxiliaryPicture start`);
    PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureData);
    PictureObj.release();
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    callback(error.code);
    done();
  }
}

async function setAuxiliaryPictureTypeAbPromiseTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType, errorCallback: (errorCode: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(3000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    await fs.close(fd);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
    let auxSize: Size = {
      height: 180,
      width: 240
    };
    let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
    let auxPictureObj: image.AuxiliaryPicture | null =
      image.createAuxiliaryPicture(array, auxSize, auxType);
    console.info(TAG, testName, `createAuxiliaryPicture success: ${auxPictureObj}`);
    PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj);
    PictureObj.release();
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    errorCallback(error.code);
    done();
  }
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function PictureSetAuxiliaryPictureTest() {
  describe('PictureSetAuxiliaryPictureTest', () => {

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
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0test_exif_v2
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_00test_exif_v2
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0test_exif_v2', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0test_exif_v2';
      const path = 'test.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = 0;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0002
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0002
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0002';
      const path = 'test.jpg';
      let AuxiliaryPictureType = -1;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0003
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0003
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0003';
      const path = 'test.jpg';
      let AuxiliaryPictureType = -10000;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0004
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0004
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0004';
      const path = 'test.jpg';
      let AuxiliaryPictureType = getEnumMaxValue(image.AuxiliaryPictureType) + 1;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0005
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0005
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0005';
      const path = 'test.jpg';
      let AuxiliaryPictureType = 1006;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0006
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0006
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0006';
      const path = 'test.jpg';
      AppStorage.setOrCreate('key', '');
      let AuxiliaryPictureType: image.AuxiliaryPictureType = AppStorage.get('key') as ESObject;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0007
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0007
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0007';
      const path = 'test.jpg';
      AppStorage.setOrCreate('key', []);
      let AuxiliaryPictureType: image.AuxiliaryPictureType = AppStorage.get('key') as ESObject;
      await setAuxiliaryPictureTypeAbPromiseTest(done, testName, path, AuxiliaryPictureType,
        (errorCode: number) => {
          expect(errorCode).assertEqual('401');
        });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0008
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0008
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0008';
      const path = 'test.jpg';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      const auxPictureObj: image.AuxiliaryPicture = undefined as ESObject;
      await setAuxiliaryPictureAbPromiseTest(done, testName, path, AuxiliaryPictureType, (errorCode: boolean) => {
        expect(errorCode).assertEqual('401');
      }, auxPictureObj);
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0009
     * @tc.number SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0009
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_SET_AUXILIARY_PICTURE_ABNORMAL_0009';
      const path = 'test.jpg';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      AppStorage.setOrCreate('key', '');
      const auxPictureObj: image.AuxiliaryPicture = AppStorage.get('key') as ESObject;
      await setAuxiliaryPictureAbPromiseTest(done, testName, path, AuxiliaryPictureType, (errorCode: boolean) => {
        expect(errorCode).assertEqual('401');
      }, auxPictureObj);
    })
  })
}
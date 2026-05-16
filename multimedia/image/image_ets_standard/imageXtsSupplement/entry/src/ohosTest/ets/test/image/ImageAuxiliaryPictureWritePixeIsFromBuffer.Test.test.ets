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

const TAG = LOG_TAG + 'AuxiliaryPictureWritePixelsFromBufferTestSupp';
const imagePackerApi = image.createImagePacker();


async function writePixelsFromBufferAbnormalPromiseTest(done: Function, testName: string, path: string,callback:(auxPictureObj?: image.AuxiliaryPicture)=>void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let fullPath = testContext.filesDir + '/' + path
  let imageSource = image.createImageSource(fullPath);
  console.info(TAG, testName, 'imageSource', imageSource)
  let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
  let buffer = await imagePackerApi.packToData(imageSource, packOpts)
  let auxPictureObj: image.AuxiliaryPicture | null =
    image.createAuxiliaryPicture(buffer as ArrayBuffer, { width: 200, height: 300 },
      image.AuxiliaryPictureType.GAINMAP);
  console.info(TAG, testName, 'auxPictureObj', auxPictureObj)
  callback(auxPictureObj);
}

export default function ImageAuxiliaryPictureWritePixelIsFromBufferTest() {
  describe('ImageAuxiliaryPictureWritePixelIsFromBufferTest', () => {

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
     * @tc.name   IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_001
     * @tc.number IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_001
     * @tc.desc   第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_001';
      const path = 'AllAuxiliaryPictures.jpg';
      try {
        await writePixelsFromBufferAbnormalPromiseTest(done, testName, path, async (auxiliaryPic) => {
          await auxiliaryPic?.writePixelsFromBuffer(new ArrayBuffer(0));
          expect().assertFail();
        })
        done();
      } catch (error) {
        console.info(TAG,testName, `Null param test failed; error: ${error}, code: ${error.code}, Test: ${testName}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_002
     * @tc.number IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_002
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_002';
      const path = 'AllAuxiliaryPictures.jpg';
      try {
        await writePixelsFromBufferAbnormalPromiseTest(done, testName, path, async (auxiliaryPic) => {
          await auxiliaryPic?.writePixelsFromBuffer(new ArrayBuffer(null));
          expect().assertFail();
        })
        done();
      } catch (error) {
        console.info(TAG,testName, `Null param test failed; error: ${error}, code: ${error.code}, Test: ${testName}`);
        expect(error.code).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_003
     * @tc.number IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_003
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_003';
      const path = 'AllAuxiliaryPictures.jpg';
      try {
        await writePixelsFromBufferAbnormalPromiseTest(done, testName, path, async (auxiliaryPic) => {
          await auxiliaryPic?.writePixelsFromBuffer(new ArrayBuffer(undefined));
          expect().assertFail();
        })
        done();
      } catch (error) {
        console.info(TAG,testName, `Null param test failed; error: ${error}, code: ${error.code}, Test: ${testName}`);
        expect(error.code).assertEqual(401);
        done();
      }

    })
  })
}
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
import { LOG_TAG, copyImageToSandbox } from '../../common';

const TAG = LOG_TAG + 'createPicture';

async function createPicturePromiseTest(done: Function, testName: string, pathUri: string,
  options: image.DecodingOptionsForPicture) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    let pictureObj: image.Picture = await imageSourceApi.createPicture(options);
    await imageSourceApi.release();
    expect(pictureObj != null).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceCreatePictureTest() {
  describe('imageSourceCreatePictureTest', () => {

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
     * @tc.number    : IMAGE_SOURCE_CREATE_PICTURE_001
     * @tc.name      : imageSource_createPicture_promise_001
     * @tc.desc      : imageSource_createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPicture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPicture_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.GAINMAP]
      };
      await copyImageToSandbox(fileName, path);
      await createPicturePromiseTest(done, testName, path, options);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PICTURE_002
     * @tc.name      : imageSource_createPicture_promise_002
     * @tc.desc      : imageSource_createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPicture_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPicture_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.DEPTH_MAP]
      };
      await copyImageToSandbox(fileName, path);
      await createPicturePromiseTest(done, testName, path, options);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PICTURE_003
     * @tc.name      : imageSource_createPicture_promise_003
     * @tc.desc      : imageSource_createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPicture_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPicture_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.UNREFOCUS_MAP]
      };
      await copyImageToSandbox(fileName, path);
      await createPicturePromiseTest(done, testName, path, options);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PICTURE_004
     * @tc.name      : imageSource_createPicture_promise_004
     * @tc.desc      : imageSource_createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPicture_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPicture_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.LINEAR_MAP]
      };
      await copyImageToSandbox(fileName, path);
      await createPicturePromiseTest(done, testName, path, options);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_CREATE_PICTURE_005
     * @tc.name      : imageSource_createPicture_promise_005
     * @tc.desc      : imageSource_createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_createPicture_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_createPicture_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.FRAGMENT_MAP]
      };
      await copyImageToSandbox(fileName, path);
      await createPicturePromiseTest(done, testName, path, options);
    })
  })
}
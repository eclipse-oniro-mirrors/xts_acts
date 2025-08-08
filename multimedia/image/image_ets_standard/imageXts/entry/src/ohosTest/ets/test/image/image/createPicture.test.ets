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
import { ErrorCode } from '../../CommonErrorCode';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPicture';

async function createPicturePromiseTest(done: Function, testName: string, path: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
    expect(pictureObj != null).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPictureAbnormalPromiseTest(done: Function, testName: string, picture: ESObject) {
  try {
    let pictureObj: image.Picture = image.createPicture(picture);
    expect(pictureObj != null).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function createPictureTest() {
  describe('createPictureTest', () => {

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
     * @tc.number    : IMAGE_CREATE_PICTURE_001
     * @tc.name      : createPicture_promise_001
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_promise_001';
      const path = 'test.jpg';
      await createPicturePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_002
     * @tc.name      : createPicture_promise_002
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_promise_002';
      const path = 'test.svg';
      await createPicturePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_003
     * @tc.name      : createPicture_promise_003
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_promise_003';
      const path = 'test_dng.dng';
      await createPicturePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_004
     * @tc.name      : createPicture_promise_004
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_promise_004';
      const path = 'test.jpeg';
      await createPicturePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_005
     * @tc.name      : createPicture_abnormal_promise_001
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_abnormal_promise_001';
      const picture = undefined;
      await createPictureAbnormalPromiseTest(done, testName, picture);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_006
     * @tc.name      : createPicture_abnormal_promise_002
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_abnormal_promise_002';
      const picture = null;
      await createPictureAbnormalPromiseTest(done, testName, picture);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_007
     * @tc.name      : createPicture_abnormal_promise_003
     * @tc.desc      : createPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPicture_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPicture_abnormal_promise_003';
      const picture = '';
      await createPictureAbnormalPromiseTest(done, testName, picture);
    })
  })
}
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

import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { sendableImage } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox, genRandomStr } from '../../common';

const TAG = LOG_TAG + 'createImageSource';

async function createImageFdPromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    const sendableImageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(file.fd);
    let imageInfo = await sendableImageSourceApi.createPixelMap();
    expect(imageInfo.getImageInfoSync().size.height > 0).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImagePromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const sendableImageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(path);
    let imageInfo = await sendableImageSourceApi.createPixelMap();
    expect(imageInfo.getImageInfoSync().size.height > 0).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageBufPromiseTest(done: Function, testName: string, bufferSize: number) {
  try {
    const buf: ArrayBuffer = new ArrayBuffer(bufferSize);
    const sendableImageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(buf);
    expect(JSON.stringify(sendableImageSourceApi) != undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableCreateImageSourceTest() {
  describe('sendableCreateImageSourceTest', () => {

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
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_001
     * @tc.name      : sendableImage_createImageSource_sendable_promise_001
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_001';
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_002
     * @tc.name      : sendableImage_createImageSource_sendable_promise_002
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_002';
      const fileName = 'test6.gif';
      const path = '_test_6.gif';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_003
     * @tc.name      : sendableImage_createImageSource_sendable_promise_003
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_003';
      const fileName = 'test7.png';
      const path = '_汉字_7.png';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_004
     * @tc.name      : sendableImage_createImageSource_sendable_promise_004
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_004';
      const fileName = 'test_exif_empty2.webp';
      const path = '123456.webp';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_005
     * @tc.name      : sendableImage_createImageSource_sendable_promise_005
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_005';
      const fileName = 'test_dng.dng';
      const path = '53_sasd.dng';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_006
     * @tc.name      : sendableImage_createImageSource_sendable_promise_006
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_006';
      const fileName = 'test_aisr.ico';
      const path = 'testAisr.ico';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_007
     * @tc.name      : sendableImage_createImageSource_sendable_promise_007
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_007';
      const fileName = 'test.svg';
      const path = 'test66.svg';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_008
     * @tc.name      : sendableImage_createImageSource_sendable_promise_008
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_008';
      const fileName = 'test8.bmp';
      const path = '53_sasd.bmp';
      await copyImageToSandbox(fileName, path);
      await createImagePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_009
     * @tc.name      : sendableImage_createImageSource_sendable_promise_009
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_009';
      const fileName = 'test.jpg';
      const path = 'Abc123.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageFdPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_010
     * @tc.name      : sendableImage_createImageSource_sendable_promise_010
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_010';
      const fileName = 'test6.gif';
      const path = '_test_6.gif';
      await copyImageToSandbox(fileName, path);
      await createImageFdPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_011
     * @tc.name      : sendableImage_createImageSource_sendable_promise_011
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_011';
      const fileName = 'test6.gif';
      const path = genRandomStr(100) + '.gif';
      await copyImageToSandbox(fileName, path);
      await createImageFdPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_012
     * @tc.name      : sendableImage_createImageSource_sendable_promise_012
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_012';
      const bufferSize = 10;
      await createImageBufPromiseTest(done, testName, bufferSize);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_013
     * @tc.name      : sendableImage_createImageSource_sendable_promise_013
     * @tc.desc      : sendableImage_createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageSource_sendable_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageSource_sendable_promise_013';
      const bufferSize = 1000;
      await createImageBufPromiseTest(done, testName, bufferSize);
    })
  })
}
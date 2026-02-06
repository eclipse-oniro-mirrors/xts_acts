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

import image from "@ohos.multimedia.image";
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import fs from '@ohos.file.fs';

const TAG ='packToFileFromPixelmapSequenceSupp';

export default function imagePackerPackToFileFromPixelmapSequenceTest() {
  describe('imagePackerPackToFileFromPixelmapSequenceTest', () => {

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
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0001
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0001
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0001';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = await imageSource.createPixelMapList();
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0002
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0002
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0002';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = [];
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0003
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0003
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0003';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = null;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0004
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0004
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0004';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = undefined;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0005
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0005
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0005';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = [];
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0006
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0006
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0006';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = await imageSource.createPixelMapList();
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0007
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0007
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0007';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = [];
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0008
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0008
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0008';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = null;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0009
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0009
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0009';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = undefined;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0010
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0010
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0010';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = null;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0011
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0011
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0011';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = await imageSource.createPixelMapList();
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0012
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0012
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0012';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = [];
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0013
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0013
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0013';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = null;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0014
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0014
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0014';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = undefined;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })

    /**
     * @tc.number  imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0015
     * @tc.name    imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0015
     * @tc.desc    imagePacker_packToFileFromPixelmapSequence
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_0015';
      const pathUri = 'moving_test.gif';
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr = testContext.resourceManager;
        const fileData = await resourceMgr.getRawFileContent(pathUri);
        const color = fileData.buffer;
        let imageSource = await image.createImageSource(color);
        let pixelMapList = undefined;
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual(9001005);
        done();
      }
    })
  })
}
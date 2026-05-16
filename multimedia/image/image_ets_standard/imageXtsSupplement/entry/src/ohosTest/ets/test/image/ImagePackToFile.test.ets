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
import { fileIo as fs } from '@kit.CoreFileKit';


const TAG = 'packToFileSupp';

export default function imagePackerPackToFileTest() {
  describe('imagePackerPackToFileTest', () => {

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
     * @tc.number     imagePacker_packToFile_promise_abnormal_001
     * @tc.name       imagePacker_packToFile_promise_abnormal_001
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_001';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_002
     * @tc.name       imagePacker_packToFile_promise_abnormal_002
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_002';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_003
     * @tc.name       imagePacker_packToFile_promise_abnormal_003
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_003';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_004
     * @tc.name       imagePacker_packToFile_promise_abnormal_004
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_004';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = '' as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_005
     * @tc.name       imagePacker_packToFile_promise_abnormal_005
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_005';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = null as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_006
     * @tc.name       imagePacker_packToFile_promise_abnormal_006
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_006';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = undefined as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_007
     * @tc.name       imagePacker_packToFile_promise_abnormal_007
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_007';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_008
     * @tc.name       imagePacker_packToFile_promise_abnormal_008
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_008';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_009
     * @tc.name       imagePacker_packToFile_promise_abnormal_009
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_009';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_010
     * @tc.name       imagePacker_packToFile_promise_abnormal_010
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_010';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_011
     * @tc.name       imagePacker_packToFile_promise_abnormal_011
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_011';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_012
     * @tc.name       imagePacker_packToFile_promise_abnormal_012
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_012';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_013
     * @tc.name       imagePacker_packToFile_promise_abnormal_013
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_013';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_014
     * @tc.name       imagePacker_packToFile_promise_abnormal_014
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_014';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_015
     * @tc.name       imagePacker_packToFile_promise_abnormal_015
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_015';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(imageSourceApi,file.fd, packOpts);
        expect().assertFail();
        await imageSourceApi.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_016
     * @tc.name       imagePacker_packToFile_promise_abnormal_016
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_016';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_017
     * @tc.name       imagePacker_packToFile_promise_abnormal_017
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_017';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_018
     * @tc.name       imagePacker_packToFile_promise_abnormal_018
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_018';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_019
     * @tc.name       imagePacker_packToFile_promise_abnormal_019
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_019';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_020
     * @tc.name       imagePacker_packToFile_promise_abnormal_020
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_020';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_021
     * @tc.name       imagePacker_packToFile_promise_abnormal_021
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_021';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_022
     * @tc.name       imagePacker_packToFile_promise_abnormal_022
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_022';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_023
     * @tc.name       imagePacker_packToFile_promise_abnormal_023
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_023';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_024
     * @tc.name       imagePacker_packToFile_promise_abnormal_024
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_024';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_025
     * @tc.name       imagePacker_packToFile_promise_abnormal_025
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_025';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_026
     * @tc.name       imagePacker_packToFile_promise_abnormal_026
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_026';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_027
     * @tc.name       imagePacker_packToFile_promise_abnormal_027
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_027';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_028
     * @tc.name       imagePacker_packToFile_promise_abnormal_028
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_028';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_029
     * @tc.name       imagePacker_packToFile_promise_abnormal_029
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_029';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_promise_abnormal_030
     * @tc.name       imagePacker_packToFile_promise_abnormal_030
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_promise_abnormal_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_abnormal_030';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        await imagePackerApi.packToFile(pixelmap,file.fd, packOpts);
        expect().assertFail();
        await pixelmap.release();
        await imagePackerApi.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_001
     * @tc.name       imagePacker_packToFile_callback_abnormal_001
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_001';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = '' as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_002
     * @tc.name       imagePacker_packToFile_callback_abnormal_002
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_002';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_003
     * @tc.name       imagePacker_packToFile_callback_abnormal_003
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_003';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_004
     * @tc.name       imagePacker_packToFile_callback_abnormal_004
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_004';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_005
     * @tc.name       imagePacker_packToFile_callback_abnormal_005
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_005';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_006
     * @tc.name       imagePacker_packToFile_callback_abnormal_006
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_006';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_007
     * @tc.name       imagePacker_packToFile_callback_abnormal_007
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_007';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_008
     * @tc.name       imagePacker_packToFile_callback_abnormal_008
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_008';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_009
     * @tc.name       imagePacker_packToFile_callback_abnormal_009
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_009';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_010
     * @tc.name       imagePacker_packToFile_callback_abnormal_010
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_010';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_011
     * @tc.name       imagePacker_packToFile_callback_abnormal_011
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_011';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_012
     * @tc.name       imagePacker_packToFile_callback_abnormal_012
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_012';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_013
     * @tc.name       imagePacker_packToFile_callback_abnormal_013
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_013';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_014
     * @tc.name       imagePacker_packToFile_callback_abnormal_014
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_014';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = null as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_015
     * @tc.name       imagePacker_packToFile_callback_abnormal_015
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_015';
      const pathUri ='test.jpeg';
      let array = new ArrayBuffer(30000);
      let packOpts: image.PackingOption = undefined as ESObject;
      let ops: image.SourceOptions = { sourceDensity: 98,};
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const imageSourceApi: image.ImageSource = await image.createImageSource(array, ops);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          imageSourceApi.release();
          imagePackerApi.release();
          done();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_016
     * @tc.name       imagePacker_packToFile_callback_abnormal_016
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_016';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_017
     * @tc.name       imagePacker_packToFile_callback_abnormal_017
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_017';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_018
     * @tc.name       imagePacker_packToFile_callback_abnormal_018
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_018';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_019
     * @tc.name       imagePacker_packToFile_callback_abnormal_019
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_019';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = '' as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_020
     * @tc.name       imagePacker_packToFile_callback_abnormal_020
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_020';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_021
     * @tc.name       imagePacker_packToFile_callback_abnormal_021
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_021';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_022
     * @tc.name       imagePacker_packToFile_callback_abnormal_022
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_022';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_023
     * @tc.name       imagePacker_packToFile_callback_abnormal_023
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_023';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_024
     * @tc.name       imagePacker_packToFile_callback_abnormal_024
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_024';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = null as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_025
     * @tc.name       imagePacker_packToFile_callback_abnormal_025
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_025';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_026
     * @tc.name       imagePacker_packToFile_callback_abnormal_026
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_026';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_027
     * @tc.name       imagePacker_packToFile_callback_abnormal_027
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_027';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = '' as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_028
     * @tc.name       imagePacker_packToFile_callback_abnormal_028
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_028';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = null as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_029
     * @tc.name       imagePacker_packToFile_callback_abnormal_029
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_029';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = undefined as ESObject;
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     imagePacker_packToFile_callback_abnormal_030
     * @tc.name       imagePacker_packToFile_callback_abnormal_030
     * @tc.desc       imagePacker_packToFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('imagePacker_packToFile_callback_abnormal_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_abnormal_030';
      const pathUri ='test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.close(file);
        const pixelmap: image.PixelMap = undefined as ESObject;
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in packing the image to file.');
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    })

  })
}
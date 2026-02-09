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
import { LOG_TAG, copyImageToSandbox } from '../../common';
import fs from '@ohos.file.fs';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'packToFileFromPixelmapSequence';

async function packToFileFromPixelmapSequencePromiseTest(done: Function, testName: string, pathUri: string,
  ops: image.PackingOptionsForSequence,fileName:string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const fileData = await resourceMgr.getRawFileContent(fileName);
    const color = fileData.buffer;
    let imageSource = await image.createImageSource(color);
    let pixelMapList = await imageSource.createPixelMapList();
    const path = 'file://' + testContext.filesDir + "/" + new Date().getTime() + fileName;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let Packer = image.createImagePacker();
    let data = await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFileFromPixelmapSequenceAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  ops: image.PackingOptionsForSequence,fileName:string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const fileData = await resourceMgr.getRawFileContent(fileName);
    const color = fileData.buffer;
    let imageSource = await image.createImageSource(color);
    let pixelMapList = await imageSource.createPixelMapList();
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let Packer = image.createImagePacker();
    let data = await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

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
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_001
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_001
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_001';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_002
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_002
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_002';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 99,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 3],
        loopCount: 65535
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_003
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_003
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_003';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 1,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 2, 3],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_004
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_004
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_004';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 1],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_005
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_005
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_005';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [0, 0, 0],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_006
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_006
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_006';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 1, 1],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_007
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_007
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_007';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [2, 2, 2],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_008
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_008
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_008';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_009
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_009
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_009';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_010
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_010
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_010';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3]
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_011
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_011
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_011';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_012
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_012
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_012';
      const path = new Date().getTime() + 'test.jpg';
      const fileName = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_013
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_013
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_013';
      const path = new Date().getTime() + 'test.svg';
      const fileName = 'test.svg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_014
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_014  //TODO 超时
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFileFromPixelmapSequence_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_014';
      const path = new Date().getTime() + 'test.jpeg';
      const fileName = 'test.jpeg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_015
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_015
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_015';
      const path = new Date().getTime() + 'test7.png';
      const fileName = 'test7.png';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_016
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_016
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_016';
      const path = new Date().getTime() + 'test8.bmp';
      const fileName = 'test8.bmp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_017
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_017 //TODO 超时
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFileFromPixelmapSequence_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_017';
      const path = new Date().getTime() + 'test_aisr.dng';
      const fileName = 'test_aisr.dng';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_018
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_018
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_018';
      const path = new Date().getTime() + 'test_aisr.ico';
      const fileName = 'test_aisr.ico';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_promise_019
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_019
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_promise_019';
      const path = new Date().getTime() + 'test_exif_empty2.webp';
      const fileName = 'test_exif_empty2.webp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequencePromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_abnormal_promise_001
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_020  //TODO 中断
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_001';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: -1,
        delayTimeList: [100, 100, 100],
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequenceAbnormalPromiseTest(done, testName, path, ops,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_abnormal_promise_002
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_021
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_002';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [4, 4, 4],
        loopCount: 0
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequenceAbnormalPromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_abnormal_promise_003
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_022
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_003';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: -1
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequenceAbnormalPromiseTest(done, testName, path, ops,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFileFromPixelmapSequence_abnormal_promise_004
     * @tc.number IMAGE_PACKER_PACK_TO_FILE_FROM_PIXEL_MAP_SEQUENCE_023
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFileFromPixelmapSequence_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFileFromPixelmapSequence_abnormal_promise_004';
      const path = new Date().getTime() + 'test6.gif';
      const fileName = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 65536
      };
      await copyImageToSandbox(fileName, path);
      await packToFileFromPixelmapSequenceAbnormalPromiseTest(done, testName, path, ops,fileName);
    })
  })
}
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
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'packToDataFromPixelmapSequence';

async function packToDataFromPixelmapSequencePromiseTest(done: Function, testName: string, path: string,
  ops: image.PackingOptionsForSequence) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const fileData = await resourceMgr.getRawFileContent(path);
    const color = fileData.buffer;
    let imageSource = image.createImageSource(color);
    let pixelMapList = await imageSource.createPixelMapList();
    let Packer = image.createImagePacker();
    let data = await Packer.packToDataFromPixelmapSequence(pixelMapList, ops);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToDataFromPixelmapSequence_abnormalPromiseTest(done: Function, testName: string, path: string,
  ops: image.PackingOptionsForSequence) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const fileData = await resourceMgr.getRawFileContent(path);
    const color = fileData.buffer;
    let imageSource = image.createImageSource(color);
    let pixelMapList = await imageSource.createPixelMapList();
    let Packer = image.createImagePacker();
    let data = await Packer.packToDataFromPixelmapSequence(pixelMapList, ops);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function imagePackerPackToDataFromPixelmapSequenceTest() {
  describe('imagePackerPackToDataFromPixelmapSequenceTest', () => {

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
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_001
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_001
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_001';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_002
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_002
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_002';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 99,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 3],
        loopCount: 65535
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_003
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_003
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_003';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 1,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 2, 3],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_004
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_004
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_004';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 1],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_005
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_005
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_005';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [0, 0, 0],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_006
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_006
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_006';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 1, 1],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_007
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_007
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_007';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [2, 2, 2],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_008
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_008
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_008';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_009
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_009
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_009';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        loopCount: 0
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_010
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_010
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_010';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3]
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_011
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_011
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_011';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_012
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_012
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_012';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_013
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_013
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_013';
      let path = 'test.svg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_014 //TODO 超时
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_014
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imagePacker_packToDataFromPixelmapSequence_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_014';
      let path = 'test.jpeg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })*/

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_015
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_015
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_015';
      let path = 'test7.png';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_016
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_016
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_016';
      let path = 'test8.bmp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_017 //TODO 超时
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_017
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imagePacker_packToDataFromPixelmapSequence_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_017';
      let path = 'test_aisr.dng';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })*/

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_018
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_018
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_018';
      let path = 'test_aisr.ico';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_019
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_promise_019
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_promise_019';
      let path = 'test_exif_empty2.webp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_020 //TODO 中断
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_abnormal_promise_001
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imagePacker_packToDataFromPixelmapSequence_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_abnormal_promise_001';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: -1,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3],
        loopCount: 0
      };
      await packToDataFromPixelmapSequence_abnormalPromiseTest(done, testName, path, ops);
    })*/

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_021
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_abnormal_promise_002
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_abnormal_promise_002';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [4, 4, 4],
        loopCount: 0
      };
      await packToDataFromPixelmapSequence_abnormalPromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_022
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_abnormal_promise_003
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_abnormal_promise_003';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: -1
      };
      await packToDataFromPixelmapSequence_abnormalPromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_023
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_abnormal_promise_004
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_abnormal_promise_004';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 65536
      };
      await packToDataFromPixelmapSequence_abnormalPromiseTest(done, testName, path, ops);
    })

    /**
     * @tc.number    : IMAGE_PACKER_PACK_TO_DATA_FROM_PIXEL_MAP_SEQUENCE_023
     * @tc.name      : imagePacker_packToDataFromPixelmapSequence_abnormal_promise_005
     * @tc.desc      : imagePacker_packToDataFromPixelmapSequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_packToDataFromPixelmapSequence_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToDataFromPixelmapSequence_abnormal_promise_005';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 99999
      };
      await packToDataFromPixelmapSequence_abnormalPromiseTest(done, testName, path, ops);
    })
  })
}
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { image } from "@kit.ImageKit";
import MediaTestBase from "./MediaTestBase";
import { LOG_TAG, MediaErrorCode, SLEEP_TIME_200 } from "../Constants";
import { sleep } from '../common';

const TAG = LOG_TAG + 'AVImageGeneratorTest';
const VIDEO_SOURCE = 'H264_AAC.mp4';

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let mImageGenerator: media.AVImageGenerator | undefined;

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

function createAVImageGeneratorCallback(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  media.createAVImageGenerator(async (error: BusinessError, generator: media.AVImageGenerator) => {
    if (generator) {
      console.info(TAG, testName + ' Succeeded in creating AVImageGenerator.');
      mImageGenerator = generator;
      mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
      console.info(TAG,
        testName + ' Succeeded in creating AVImageGenerator, fd: ' + mImageGenerator.fdSrc?.fd + ', offset: ' +
          mImageGenerator.fdSrc?.offset + ', length: ' + mImageGenerator.fdSrc?.length);
      expect(true).assertTrue();
    } else {
      console.error(TAG,
        testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    }
    done();
  });
}

async function createAVImageGeneratorPromise(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  await media.createAVImageGenerator().then(async (generator: media.AVImageGenerator) => {
    if (generator) {
      mImageGenerator = generator;
      mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
      console.info(TAG,
        testName + ' Succeeded in creating AVImageGenerator, fd: ' + mImageGenerator.fdSrc?.fd + ', offset: ' +
          mImageGenerator.fdSrc?.offset + ', length: ' + mImageGenerator.fdSrc?.length);
      expect(true).assertTrue();
    }
    done();
  }).catch((error: BusinessError) => {
    console.error(TAG,
      testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
}

function fetchFrameByTimeCallback(done: Function, testName: string, fileName: string, timeUs: number,
  options: media.AVImageQueryOptions, param: media.PixelMapParams) {
  console.info(TAG, testName + ' begin.');
  media.createAVImageGenerator(async (error: BusinessError, generator: media.AVImageGenerator) => {
    if (error) {
      console.error(TAG,
        testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      mImageGenerator = generator;
      mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
      console.info(TAG,
        testName + ' Succeeded in creating AVImageGenerator, fd: ' + mImageGenerator.fdSrc?.fd + ', offset: ' +
          mImageGenerator.fdSrc?.offset + ', length: ' + mImageGenerator.fdSrc?.length);
      await sleep(SLEEP_TIME_200);
      mImageGenerator.fetchFrameByTime(timeUs, options, param,
        async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG,
              testName + ' Failed to fetch FrameByTime, code: ' + error.code + ', msg: ' + error.message);
            expect(error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
          } else {
            console.info(TAG,
              testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
            let imageInfo = await pixelMap.getImageInfo();
            console.info(TAG, testName + ' imageInfo: ' + JSON.stringify(imageInfo));
            expect(imageInfo.size.height > 0).assertTrue();
            expect(imageInfo.size.width > 0).assertTrue();
          }
        });
    }
    done();
  });
}

async function fetchFrameByTimePromise(done: Function, testName: string, fileName: string, timeUs: number,
  options: media.AVImageQueryOptions, param: media.PixelMapParams) {
  console.info(TAG, testName + ' begin.');
  mImageGenerator = await media.createAVImageGenerator();
  if (mImageGenerator !== undefined) {
    console.info(TAG, testName + ' Succeeded in creating AVImageGenerator.');
    mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    await mImageGenerator.fetchFrameByTime(timeUs, options, param).then(async (pixelMap: image.PixelMap) => {
      if (pixelMap) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.info(TAG, testName + ' pixelMap is undefined.');
      }
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to fetch FrameByTime, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
      done();
    });
  } else {
    console.error(TAG, testName + ' Failed to create AVImageGenerator.');
    expect().assertFail();
  }
  done();
}

function fetchFrameByTimeCallbackAbnormal(done: Function, testName: string, timeUs: number,
  options: media.AVImageQueryOptions, param: media.PixelMapParams) {
  console.info(TAG, testName + ' begin.');
  media.createAVImageGenerator(async (error: BusinessError, generator: media.AVImageGenerator) => {
    if (error) {
      console.error(TAG,
        testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      return;
    } else {
      mImageGenerator = generator;
      mImageGenerator.fetchFrameByTime(timeUs, options, param,
        async (error: BusinessError, pixelMap: image.PixelMap) => {
          if (error) {
            console.error(TAG,
              testName + ' Failed to fetch FrameByTime, code: ' + error.code + ', msg: ' + error.message);
            expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
          } else {
            console.info(TAG,
              testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
            let imageInfo = await pixelMap.getImageInfo();
            expect(imageInfo.size.height > 0).assertTrue();
            expect(imageInfo.size.width > 0).assertTrue();
          }
        });
    }
    done();
  });
}

async function fetchFrameByTimePromiseAbnormal(done: Function, testName: string, timeUs: number,
  options: media.AVImageQueryOptions, param: media.PixelMapParams) {
  console.info(TAG, testName + ' begin.');
  mImageGenerator = await media.createAVImageGenerator();
  if (mImageGenerator !== undefined) {
    console.info(TAG, testName + ' Succeeded in creating AVImageGenerator.');
    await mImageGenerator.fetchFrameByTime(timeUs, options, param).then(async (pixelMap: image.PixelMap) => {
      if (pixelMap) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.info(TAG, testName + ' pixelMap is undefined.');
      }
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to fetch FrameByTime, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
      done();
    });
  } else {
    console.error(TAG, testName + ' Failed to create AVImageGenerator.');
    expect().assertFail();
  }
  done();
}

function releaseCallback(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  media.createAVImageGenerator(async (error: BusinessError, generator: media.AVImageGenerator) => {
    if (error) {
      console.error(TAG,
        testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      mImageGenerator = generator;
      mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
      console.info(TAG,
        testName + ' Succeeded in creating AVImageGenerator, fd: ' + mImageGenerator.fdSrc?.fd + ', offset: ' +
          mImageGenerator.fdSrc?.offset + ', length: ' + mImageGenerator.fdSrc?.length);
      await sleep(SLEEP_TIME_200);
      mImageGenerator.release((error: BusinessError) => {
        if (error) {
          console.error(TAG,
            testName + ' Failed to release AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' release AVImageGenerator success.');
          mImageGenerator = undefined;
          expect(true).assertTrue();
        }
      });
    }
    done();
  });
}

async function releasePromise(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  mImageGenerator = await media.createAVImageGenerator();
  if (mImageGenerator !== undefined) {
    console.info(TAG, testName + ' Succeeded in creating AVImageGenerator.');
    mImageGenerator.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    await mImageGenerator.release().then(async () => {
      console.info(TAG, testName + ' release AVImageGenerator success.');
      mImageGenerator = undefined;
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to release AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  } else {
    console.error(TAG, testName + ' Failed to create AVImageGenerator.');
    expect().assertFail();
  }
  done();
}

function releaseCallbackNoFdSrc(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  media.createAVImageGenerator(async (error: BusinessError, generator: media.AVImageGenerator) => {
    if (error) {
      console.error(TAG,
        testName + ' Failed to create AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      mImageGenerator = generator;
      mImageGenerator.release((error: BusinessError) => {
        if (error) {
          console.error(TAG,
            testName + ' Failed to release AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' release AVImageGenerator success.');
          mImageGenerator = undefined;
          expect(true).assertTrue();
        }
      });
    }
    done();
  });
}

async function releasePromiseNoFdSrc(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  mImageGenerator = await media.createAVImageGenerator();
  if (mImageGenerator !== undefined) {
    console.info(TAG, testName + ' Succeeded in creating AVImageGenerator.');
    await mImageGenerator.release().then(async () => {
      console.info(TAG, testName + ' release AVImageGenerator success.');
      mImageGenerator = undefined;
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to release AVImageGenerator, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  } else {
    console.error(TAG, testName + ' Failed to create AVImageGenerator.');
    expect().assertFail();
  }
  done();
}

export default function AVImageGeneratorTest() {
  describe('AVImageGeneratorTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_200);
      if (mImageGenerator !== undefined) {
        await mImageGenerator.release();
        mImageGenerator = undefined;
      }
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
    });

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_001
     * @tc.name      : createAVImageGenerator_callback_001
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('createAVImageGenerator_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVImageGenerator_callback_001';
      createAVImageGeneratorCallback(done, testName, VIDEO_SOURCE);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_002
     * @tc.name      : createAVImageGenerator_promise_001
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('createAVImageGenerator_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVImageGenerator_promise_001';
      await createAVImageGeneratorPromise(done, testName, VIDEO_SOURCE);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_003
     * @tc.name      : fetchFrameByTime_callback_001
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_001';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallback(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_004
     * @tc.name      : fetchFrameByTime_callback_002
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_002';
      let timeUs: number = 5;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallback(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_005
     * @tc.name      : fetchFrameByTime_callback_003
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_003';
      let timeUs: number = 10;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallback(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_006
     * @tc.name      : fetchFrameByTime_callback_004
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_004';
      let timeUs: number = 10;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallback(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_007
     * @tc.name      : fetchFrameByTime_promise_001
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_001';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromise(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_008
     * @tc.name      : fetchFrameByTime_promise_002
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_002';
      let timeUs: number = 5;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromise(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_009
     * @tc.name      : fetchFrameByTime_promise_003
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_003';
      let timeUs: number = 10;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromise(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_010
     * @tc.name      : fetchFrameByTime_promise_004
     * @tc.desc      : Test normal scene of screen record.
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_004';
      let timeUs: number = 10;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromise(done, testName, VIDEO_SOURCE, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_011
     * @tc.name      : fetchFrameByTime_callback_abnormal_001
     * @tc.desc      : Not set fdSrc - 5400102
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_abnormal_001';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallbackAbnormal(done, testName, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_012
     * @tc.name      : fetchFrameByTime_callback_abnormal_002
     * @tc.desc      : Unsupported fdSrc type - 5400106
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_callback_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_callback_abnormal_002';
      let fileName: string = 'test.jpg';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      fetchFrameByTimeCallback(done, testName, fileName, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_013
     * @tc.name      : fetchFrameByTime_promise_abnormal_001
     * @tc.desc      : Not set fdSrc - 5400102
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_abnormal_001';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromiseAbnormal(done, testName, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_014
     * @tc.name      : fetchFrameByTime_promise_abnormal_002
     * @tc.desc      : Unsupported fdSrc type - 5400106
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('fetchFrameByTime_promise_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchFrameByTime_promise_abnormal_002';
      let fileName: string = 'test.jpg';
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      await fetchFrameByTimePromise(done, testName, fileName, timeUs, queryOption, param);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_015
     * @tc.name      : release_callback_001
     * @tc.desc      : release callback
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_callback_001';
      releaseCallback(done, testName, VIDEO_SOURCE);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_016
     * @tc.name      : release_promise_001
     * @tc.desc      : release promise
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_promise_001';
      await releasePromise(done, testName, VIDEO_SOURCE);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_017
     * @tc.name      : release_callback_002
     * @tc.desc      : release callback-unsupported fdSrc
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_callback_002';
      let fileName: string = 'test.jpg';
      releaseCallback(done, testName, fileName);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_018
     * @tc.name      : release_promise_002
     * @tc.desc      : release promise-unsupported fdSrc
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_promise_002';
      let fileName: string = 'test.jpg';
      await releasePromise(done, testName, fileName);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_019
     * @tc.name      : release_callback_003
     * @tc.desc      : release callback-no fdSrc
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_callback_003';
      releaseCallbackNoFdSrc(done, testName);
    })

    /**
     * @tc.number    : AV_IMAGE_GENERATOR_TEST_020
     * @tc.name      : release_promise_003
     * @tc.desc      : release promise-no fdSrc
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('release_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_promise_003';
      await releasePromiseNoFdSrc(done, testName);
    })
  })
}
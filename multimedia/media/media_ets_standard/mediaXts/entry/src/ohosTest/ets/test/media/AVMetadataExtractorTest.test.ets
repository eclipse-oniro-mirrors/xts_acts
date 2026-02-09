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

const TAG = LOG_TAG + 'AVMetadataExtractorTest';
const AUDIO_SOURCE = 'mjpeg_mp3.mp3';
const VIDEO_SOURCE = 'H264_AAC_Matedata.mp4';

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let fileDescriptor2: media.AVFileDescriptor;
let mMetadataExtractor: media.AVMetadataExtractor | undefined;

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

function createAVMetadataExtractorCallback(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  media.createAVMetadataExtractor((error: BusinessError, extractor: media.AVMetadataExtractor) => {
    if (extractor !== undefined) {
      console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
      mMetadataExtractor = extractor;
      mMetadataExtractor.fdSrc = descriptor;
      console.info(TAG,
        testName + ' Succeeded in creating AVMetadataExtractor, fd: ' + mMetadataExtractor.fdSrc.fd + ', offset: ' +
        mMetadataExtractor.fdSrc.offset + ', length: ' + mMetadataExtractor.fdSrc.length);
      expect(true).assertTrue();
    } else {
      console.error(TAG,
        testName + ' Failed to create AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    }
    done();
  });
}

async function createAVMetadataExtractorPromise(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  await media.createAVMetadataExtractor().then((extractor: media.AVMetadataExtractor) => {
    if (extractor) {
      console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
      mMetadataExtractor = extractor;
      mMetadataExtractor.fdSrc = descriptor;
      console.info(TAG,
        testName + ' Succeeded in creating AVMetadataExtractor, fd: ' + mMetadataExtractor.fdSrc.fd + ', offset: ' +
        mMetadataExtractor.fdSrc.offset + ', length: ' + mMetadataExtractor.fdSrc.length);
      expect(true).assertTrue();
    } else {
      console.info(TAG, testName + ' extractor is undefined.');
      expect().assertFail();
    }
    done();
  }).catch((error: BusinessError) => {
    console.error(TAG,
      testName + ' Failed to create AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
}

async function fetchMetadataCallback(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    mMetadataExtractor.fetchMetadata((error: BusinessError, metadata: media.AVMetadata) => {
      if (metadata) {
        console.info(TAG, testName + ' media duration: ' + metadata.duration);
        expect(Number(metadata.duration) > 0).assertTrue();
      } else {
        console.error(TAG, testName + ' Failed to fetch Metadata, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
    });
  }
  done();
}

async function fetchMetadataPromise(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    await mMetadataExtractor.fetchMetadata().then((metadata: media.AVMetadata) => {
      if (metadata) {
        console.info(TAG, testName + ' media duration: ' + metadata.duration);
        expect(Number(metadata.duration) > 0).assertTrue();
      } else {
        console.info(TAG, testName + ' metadata is null.');
      }
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to fetch Metadata, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
  done();
}

async function fetchMetadataCallbackAbnormal(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    if (fileName !== '') {
      mMetadataExtractor.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    }
    mMetadataExtractor.fetchMetadata((error: BusinessError, metadata: media.AVMetadata) => {
      if (metadata !== undefined) {
        console.info(TAG, testName + ' media duration: ' + metadata.duration);
        expect(metadata.duration).assertUndefined();
      } else {
        console.error(TAG, testName + ' Failed to fetch Metadata, code: ' + error.code + ', msg: ' + error.message);
        expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT || error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT)
          .assertTrue();
      }
    });
  }
  done();
}

async function fetchMetadataPromiseAbnormal(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    if (fileName !== '') {
      mMetadataExtractor.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    }
    await mMetadataExtractor.fetchMetadata().then((metadata: media.AVMetadata) => {
      if (metadata !== undefined) {
        console.info(TAG, testName + ' media duration: ' + metadata.duration);
        expect(metadata.duration).assertUndefined();
      } else {
        console.info(TAG, testName + ' metadata is null.');
      }
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to fetch Metadata, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT || error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT)
        .assertTrue();
      done();
    });
  }
  done();
}

async function fetchAlbumCoverCallback(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    // await mMetadataExtractor.fetchMetadata();
    // await sleep(SLEEP_TIME_MIN);
    mMetadataExtractor.fetchAlbumCover(async (error: BusinessError, pixelMap: image.PixelMap) => {
      if (pixelMap !== undefined) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.error(TAG, testName + ' Failed to fetch AlbumCover, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      done();
    });
  }
  done();
}

async function fetchAlbumCoverPromise(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    console.info(TAG, testName + ' descriptor fd: ' + descriptor.fd + ', offset: ' + descriptor.offset + ', length: ' +
    descriptor.length);
    console.info(TAG, testName + ' mMetadataExtractor fdSrc: ' + mMetadataExtractor.fdSrc.fd + ', offset: ' +
    mMetadataExtractor.fdSrc.offset + ', length: ' + mMetadataExtractor.fdSrc.length);
    await mMetadataExtractor.fetchAlbumCover().then(async (pixelMap: image.PixelMap) => {
      if (pixelMap !== undefined) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.info(TAG, testName + ' pixelMap is null.');
      }
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to fetch AlbumCover, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
  done();
}

async function fetchAlbumCoverCallbackAbnormal(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    if (fileName !== '') {
      mMetadataExtractor.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    }
    mMetadataExtractor.fetchAlbumCover(async (error: BusinessError, pixelMap: image.PixelMap) => {
      if (pixelMap) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.error(TAG, testName + ' Failed to fetch AlbumCover, code: ' + error.code + ', msg: ' + error.message);
        expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT || error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT)
          .assertTrue();
      }
    });
  }
  done();
}

async function fetchAlbumCoverPromiseAbnormal(done: Function, testName: string, fileName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    if (fileName !== '') {
      mMetadataExtractor.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd(fileName);
    }
    await mMetadataExtractor.fetchAlbumCover().then(async (pixelMap: image.PixelMap) => {
      if (pixelMap) {
        console.info(TAG,
          testName + ' isEditable: ' + pixelMap.isEditable + ', isStrideAlignment: ' + pixelMap.isStrideAlignment);
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.size.height > 0).assertTrue();
        expect(imageInfo.size.width > 0).assertTrue();
      } else {
        console.info(TAG, testName + ' metadata is null.');
      }
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to fetch AlbumCover, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT || error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT)
        .assertTrue();
      done();
    });
  }
  done();
}

async function releaseCallback(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    mMetadataExtractor.release(async (error: BusinessError) => {
      if (error) {
        console.error(TAG,
          testName + ' Failed to release AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, testName + ' release AVMetadataExtractor success.');
        mMetadataExtractor = undefined;
        expect(true).assertTrue();
      }
    });
  }
  done();
}

async function releasePromise(done: Function, testName: string, descriptor: media.AVFileDescriptor) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.fdSrc = descriptor;
    await mMetadataExtractor.release().then(() => {
      console.info(TAG, testName + ' release AVMetadataExtractor success.');
      mMetadataExtractor = undefined;
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to release AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
  done();
}

async function releaseCallbackNoFdSrc(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    mMetadataExtractor.release(async (error: BusinessError) => {
      if (error) {
        console.error(TAG,
          testName + ' Failed to release AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, testName + ' release AVMetadataExtractor success.');
        mMetadataExtractor = undefined;
        expect(true).assertTrue();
      }
    });
  }
  done();
}

async function releasePromiseNoFdSrc(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  mMetadataExtractor = await media.createAVMetadataExtractor();
  if (mMetadataExtractor) {
    console.info(TAG, testName + ' Succeeded in creating AVMetadataExtractor.');
    await mMetadataExtractor.release().then(() => {
      console.info(TAG, testName + ' release AVMetadataExtractor success.');
      mMetadataExtractor = undefined;
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        testName + ' Failed to release AVMetadataExtractor, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
  done();
}

export default function AVMetadataExtractorTest() {
  describe('AVMetadataExtractorTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor2 = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_200);
      if (mMetadataExtractor !== undefined) {
        await mMetadataExtractor.release();
        mMetadataExtractor = undefined;
      }
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor2.fd);
    });

    /**
     * @tc.name   createAVMetadataExtractor_video_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_001
     * @tc.desc   create AVMetadataExtractor callback-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVMetadataExtractor_video_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVMetadataExtractor_video_callback_001';
      createAVMetadataExtractorCallback(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   createAVMetadataExtractor_audio_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_002
     * @tc.desc   create AVMetadataExtractor callback-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVMetadataExtractor_audio_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVMetadataExtractor_audio_callback_001';
      createAVMetadataExtractorCallback(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   createAVMetadataExtractor_video_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_003
     * @tc.desc   create AVMetadataExtractor promise-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVMetadataExtractor_video_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVMetadataExtractor_video_promise_001';
      await createAVMetadataExtractorPromise(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   createAVMetadataExtractor_audio_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_004
     * @tc.desc   create AVMetadataExtractor promise-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVMetadataExtractor_audio_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVMetadataExtractor_audio_promise_001';
      await createAVMetadataExtractorPromise(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   fetchMetadata_video_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_005
     * @tc.desc   fetch Metadata callback-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_video_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_video_callback_001';
      await fetchMetadataCallback(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   fetchMetadata_audio_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_006
     * @tc.desc   fetch Metadata callback-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_audio_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_audio_callback_001';
      await fetchMetadataCallback(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   fetchMetadata_video_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_007
     * @tc.desc   fetch Metadata promise-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_video_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_video_promise_001';
      await fetchMetadataPromise(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   fetchMetadata_audio_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_008
     * @tc.desc   fetch Metadata promise-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_audio_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_audio_promise_001';
      await fetchMetadataPromise(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   fetchMetadata_callback_abnormal_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_009
     * @tc.desc   fetch Metadata callback-unSupported file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_callback_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_callback_abnormal_001';
      let fileName: string = 'test.jpg';
      await fetchMetadataCallbackAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchMetadata_callback_abnormal_002
     * @tc.number AV_METADATA_EXTRACTOR_TEST_010
     * @tc.desc   fetch Metadata callback-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_callback_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_callback_abnormal_001';
      let fileName: string = '';
      await fetchMetadataCallbackAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchMetadata_promise_abnormal_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_011
     * @tc.desc   fetch Metadata promise-unSupported file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_promise_abnormal_001';
      let fileName: string = 'test.jpg';
      await fetchMetadataPromiseAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchMetadata_promise_abnormal_002
     * @tc.number AV_METADATA_EXTRACTOR_TEST_012
     * @tc.desc   fetch Metadata promise-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchMetadata_promise_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchMetadata_promise_abnormal_002';
      let fileName: string = '';
      await fetchMetadataPromiseAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchAlbumCover_audio_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_014
     * @tc.desc   fetch AlbumCover callback-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_audio_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_audio_callback_001';
      await fetchAlbumCoverCallback(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   fetchAlbumCover_audio_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_016
     * @tc.desc   fetch AlbumCover promise-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_audio_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_audio_promise_001';
      await fetchAlbumCoverPromise(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   fetchAlbumCover_callback_abnormal_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_017
     * @tc.desc   fetch AlbumCover callback-unSupported file type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_callback_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_callback_abnormal_001';
      let fileName: string = 'test.jpg';
      await fetchAlbumCoverCallbackAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchAlbumCover_callback_abnormal_002
     * @tc.number AV_METADATA_EXTRACTOR_TEST_018
     * @tc.desc   fetch AlbumCover callback-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_callback_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_callback_abnormal_002';
      let fileName: string = '';
      await fetchAlbumCoverCallbackAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchAlbumCover_promise_abnormal_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_019
     * @tc.desc   fetch AlbumCover promise-unSupported file type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_promise_abnormal_001';
      let fileName: string = 'test.jpg';
      await fetchAlbumCoverPromiseAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   fetchAlbumCover_promise_abnormal_002
     * @tc.number AV_METADATA_EXTRACTOR_TEST_020
     * @tc.desc   fetch AlbumCover promise-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchAlbumCover_promise_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchAlbumCover_promise_abnormal_002';
      let fileName: string = '';
      await fetchAlbumCoverPromiseAbnormal(done, testName, fileName);
    })

    /**
     * @tc.name   release_video_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_021
     * @tc.desc   release callback-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_video_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_callback_001';
      await releaseCallback(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   release_audio_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_022
     * @tc.desc   release callback-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_audio_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_audio_callback_001';
      await releaseCallback(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   release_video_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_023
     * @tc.desc   release promise-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_video_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_promise_001';
      await releasePromise(done, testName, fileDescriptor);
    })

    /**
     * @tc.name   release_audio_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_024
     * @tc.desc   release promise-mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_audio_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_audio_promise_001';
      await releasePromise(done, testName, fileDescriptor2);
    })

    /**
     * @tc.name   release_no_fdSrc_callback_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_025
     * @tc.desc   release callback-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_no_fdSrc_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_no_fdSrc_callback_001';
      await releaseCallbackNoFdSrc(done, testName);
    })

    /**
     * @tc.name   release_no_fdSrc_promise_001
     * @tc.number AV_METADATA_EXTRACTOR_TEST_026
     * @tc.desc   release promise-no fdSrc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_no_fdSrc_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_no_fdSrc_promise_001';
      await releasePromiseNoFdSrc(done, testName);
    })
  })
}
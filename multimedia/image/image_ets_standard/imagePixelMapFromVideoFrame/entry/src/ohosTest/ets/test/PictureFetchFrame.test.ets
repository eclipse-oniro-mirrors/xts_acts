/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import resourceManager from '@ohos.resourceManager';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import taskpool from '@ohos.taskpool';
import media from '@ohos.multimedia.media';

let mImageGenerator: media.AVImageGenerator | undefined;
let isSupportedFetchFrameByTime: boolean = true;

async function taskpoolTest(pixelMap : image.PixelMap) {
  console.info("start taskpoolTest");
  try {
    let task = new taskpool.Task(pixelTest, pixelMap);
    taskpool.execute(task);
  } catch (error) {
    console.error('taskpool execute error is ' + error)
  }
}

@Concurrent
async function pixelTest(pixelMap: image.PixelMap) {
  console.info("Start first time");
  // 模拟异步操作
  setTimeout(() => {
    console.log('Start asynchronous blocking');
  }, 1000);
  return pixelMap;
}

export default function pictureFetchFrame() {
  let testContext: common.UIAbilityContext;

  describe('pictureFetchFrame', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      await checkIsSupportedFetchFrameByTime();
    })

    afterEach(() => {
      hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'after each case');
    })

    class Logger {
      testNum: string;
      constructor(testNum: string) {
        this.testNum = testNum;
      }
      log(msg: string) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const checkIsSupportedFetchFrameByTime  = async() => {
      let TAG = 'check device:: '
      console.info(TAG + ' begin.');
      mImageGenerator = await media.createAVImageGenerator();
      if (mImageGenerator == undefined) {
          console.info(TAG + ' failed createAVImageGenerator');
          expect().assertFail();
      }
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
      mImageGenerator.fdSrc = await resourceMgr.getRawFd('test.mp4');
      let timeUs: number = 0;
      let options: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      mImageGenerator.fetchFrameByTime(timeUs, options, param, async (error: BusinessError) => {
        if (error) {
          console.info(TAG + ' Failed to fetch FrameByTime, code: ' + error.code + ', msg: ' + error.message);
          expect(error.code == 5400106).assertTrue();
          isSupportedFetchFrameByTime = false;
        }
      });
      await mImageGenerator.release();
    }

    const fetchFrameByTimeFromVideo = async(testName: string, fileName: string, timeUs: number,
      options: media.AVImageQueryOptions, param: media.PixelMapParams): Promise<PixelMap> => {
      console.info(testName + ' begin.');
      mImageGenerator = await media.createAVImageGenerator();
      if(mImageGenerator == undefined){
          console.info(testName + ' failed createAVImageGenerator');
          expect().assertFail();
      }
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
      mImageGenerator.fdSrc = await resourceMgr.getRawFd(fileName)
      let pixelMap = await mImageGenerator.fetchFrameByTime(timeUs, options, param);
      if(pixelMap == undefined){
          console.info(testName + ' failed fetch pixelmap');
          expect().assertFail();
      }
      await mImageGenerator.release();
      return pixelMap
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SCALE_0100
     * @tc.number testImageScale0100
     * @tc.desc   1.fetchFrameByTimeFromVideo scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SCALE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SCALE_0100";
      if (!isSupportedFetchFrameByTime) {
        console.info(tag + " The device does not support");
        done();
        return
      }
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      let pixelMap = await fetchFrameByTimeFromVideo(tag, 'test.mp4', timeUs, queryOption, param);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
          console.info(tag + ' Succeeded in scaling.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to scale. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100
     * @tc.number testImageCreateScaledPixelMap0100
     * @tc.desc   1.fetchFrameByTimeFromVideo createScaledPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100";
      if (!isSupportedFetchFrameByTime) {
        console.info(tag + " The device does not support");
        done();
        return
      }
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      let pixelMap = await fetchFrameByTimeFromVideo(tag, 'test.mp4', timeUs, queryOption, param);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        let scaledPixelMap = pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
          console.info(tag + ' Succeeded in scaling pixelmap.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to scale pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CLONE_0100
     * @tc.number testImageClone0100
     * @tc.desc   fetchFrameByTimeFromVideo clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CLONE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CLONE_SYNC_0100";
      if (!isSupportedFetchFrameByTime) {
        console.info(tag + " The device does not support");
        done();
        return
      }
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      let pixelMap = await fetchFrameByTimeFromVideo(tag, 'test.mp4', timeUs, queryOption, param);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.clone().then((clonePixelMap: image.PixelMap) => {
          console.info(tag + ' Succeeded in cloning.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to clone. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_SET_METADATA_0100
     * @tc.number testImageSetMetadata0100
     * @tc.desc   fetchFrameByTimeFromVideo setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SET_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_SET_METADATA_0100";
      if (!isSupportedFetchFrameByTime) {
        console.info(tag + " The device does not support");
        done();
        return
      }
      let staticMetadata: image.HdrStaticMetadata = {
        displayPrimariesX: [1.1, 1.1, 1.1],
        displayPrimariesY: [1.2, 1.2, 1.2],
        whitePointX: 1.1,
        whitePointY: 1.2,
        maxLuminance: 2.1,
        minLuminance: 1.0,
        maxContentLightLevel: 2.1,
        maxFrameAverageLightLevel: 2.1,
      }
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      let pixelMap = await fetchFrameByTimeFromVideo(tag, 'test.mp4', timeUs, queryOption, param);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(() => {
          console.info(tag + ' Succeeded in Setting Metadata.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to set metadata. Error code is ` + error);
          expect(Number(error) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

  })
}
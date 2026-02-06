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

let isSupportHdr: boolean;

let isSupportedFetchFrameByTime: boolean = true;

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function pixelMapSupportYuvFetchFrame() {
  let testContext: common.UIAbilityContext;

  describe('pixelMapSupportYuvFetchFrame', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so').then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      })
      await checkIsSupportedFetchFrameByTime();
    })

    afterEach(() => {
      hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'after each case');
    })

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

    class Logger {
      testNum: string;
      constructor(testNum: string) {
        this.testNum = testNum;
      }
      log(msg: string) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
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

    //测试pixelMap flip 接口，校验宽高，返回 true/false；
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //horizontal：水平翻转，取值为 true/false
    //vertical：垂直翻转，取值为 true/false
    //width：预期图片宽度
    //height：预期图片高度
    const testPixelMapFlip = async(testNum: string, pixelMap: image.PixelMap, type: string,
                                   horizontal: boolean, vertical: boolean, width:number, height:number) => {
      let result = true
      if (type == 'promise') {
        await pixelMap.flip(horizontal, vertical)
      } else if (type == 'callback') {
        pixelMap.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${err}`)
            result = false
          }
        })
        await sleep(500)
      }else{
        pixelMap.flipSync(horizontal, vertical)
      }
      const imageInfo = pixelMap.getImageInfoSync()
      const imageHeight = imageInfo.size.height
      const imageWidth = imageInfo.size.width
      return imageHeight == height && imageWidth == width && result == true
    }

    //测试pixelMap接口scale,根据参数 scaleX scaleY 对pixelmap进行操作，完成后对操作结果宽高进行比例校验，校验通过则用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、sync
    //scaleX: 宽度的缩放倍数。
    //scaleY: 高度的缩放倍数。
    let testPixelMapScale = async(done: Function, testNum: string, pixelMap: image.PixelMap, type: string,
                                  scaleX: number, scaleY: number) => {
      let newImageInfo:image.ImageInfo | undefined
      const oldMapImageInfo = pixelMap.getImageInfoSync()
      if (type == 'promise') {
        await pixelMap.scale(scaleX, scaleY)
      } else if (type == 'callback') {
        pixelMap.scale(scaleX, scaleY, async(error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${error}`);
            expect().assertFail()
            done()
          }
        })
        await sleep(500)
      }else{
        pixelMap.scaleSync(scaleX, scaleY)
      }
      newImageInfo = pixelMap.getImageInfoSync()
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: compareImageInfo${JSON.stringify(newImageInfo)}`)
      const widthCheck = Math.round(oldMapImageInfo.size.width * scaleX) === newImageInfo.size.width
      const heightCheck = Math.round(oldMapImageInfo.size.height * scaleY) === newImageInfo.size.height
      expect(widthCheck && heightCheck).assertTrue();
      done()
    }

    //测试pixelMap rotate 接口，当旋转90、-90度时，使用历史宽高与当前宽高进行校验，校验通过则用例通过
    //testNum 用例编号
    //pixelMap: 测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、 sync
    //angle: 旋转角度 90/-90, 因无法获取pixelmap对象的角度进行校验，所以此参数只测输入 90/-90
    let testPixelMapRotate = async(done: Function, testNum: string, pixelMap: image.PixelMap,
                                   type: string, angle: number) => {
      const oldImageInfo = await pixelMap.getImageInfo()
      if (type == 'promise') {
        await pixelMap.rotate(angle)
      } else if (type == 'callback') {
        pixelMap.rotate(angle, async (error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: error${JSON.stringify(error)}`)
            expect().assertFail()
            done()
          }
        })
        await sleep(500)
      }else{
        pixelMap.rotateSync(angle)
      }
      const newImageInfo = await pixelMap.getImageInfo()
      const checkWidth = newImageInfo.size.width === oldImageInfo.size.height
      const checkHeight = newImageInfo.size.height === oldImageInfo.size.width
      expect(checkWidth && checkHeight).assertTrue()
      done()
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SCALE_USE_FETCHFRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_SCALE_USE_FETCHFRAME_0100
     * @tc.desc   1.fetchFrameByTimeFromVideo testPixelMapScale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_MULTIMEDIA_IMAGE_SCALE_USE_FETCHFRAME_0100', Level.LEVEL0, async(done: Function) => {
        const testTag = 'SUB_MULTIMEDIA_IMAGE_SCALE_USE_FETCHFRAME_0100'
        if (!isSupportedFetchFrameByTime) {
          console.info(testTag + " The device does not support");
          done();
          return
        }
        try{
          let timeUs: number = 0;
          let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
          let param: media.PixelMapParams = {
            width: 1920,
            height: 1440
          }
          let pixelMap = await fetchFrameByTimeFromVideo(testTag, 'test.mp4', timeUs, queryOption, param);
          await testPixelMapScale(done, testTag, pixelMap, 'promise', 0.5, 2)
        }catch(error){
          hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
          expect().assertFail();
          done();
        }
     })

     /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_ROTATE_USE_FETCHFRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_ROTATE_USE_FETCHFRAME_0100
     * @tc.desc   1.fetchFrameByTimeFromVideo testPixelMapRotate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_MULTIMEDIA_IMAGE_ROTATE_USE_FETCHFRAME_0100', Level.LEVEL0, async(done: Function) => {
        const testTag = 'SUB_MULTIMEDIA_IMAGE_ROTATE_USE_FETCHFRAME_0100'
        if (!isSupportedFetchFrameByTime) {
          console.info(testTag + " The device does not support");
          done();
          return
        }
        try{
          let timeUs: number = 0;
          let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
          let param: media.PixelMapParams = {
            width: 1920,
            height: 1440
          }
          let pixelMap_NV21 = await fetchFrameByTimeFromVideo(testTag, 'test.mp4', timeUs, queryOption, param);
          await testPixelMapRotate(done, testTag, pixelMap_NV21, 'sync', -90)
        }catch(error){
          hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
          expect().assertFail();
          done();
        }
     })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_FLIP_USE_FETCHFRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_FLIP_USE_FETCHFRAME_0100
     * @tc.desc   1.fetchFrameByTimeFromVideo testPixelMapFlip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_MULTIMEDIA_IMAGE_FLIP_USE_FETCHFRAME_0100', Level.LEVEL0, async(done: Function) => {
        const testTag = 'SUB_MULTIMEDIA_IMAGE_FLIP_USE_FETCHFRAME_0100'
        if (!isSupportedFetchFrameByTime) {
          console.info(testTag + " The device does not support");
          done();
          return
        }
        try{
          let timeUs: number = 0;
          let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
          let param: media.PixelMapParams = {
            width: 1920,
            height: 1440
          }
          let pixelMap_NV21 = await fetchFrameByTimeFromVideo(testTag, 'test.mp4', timeUs, queryOption, param);
          const result = await testPixelMapFlip(testTag, pixelMap_NV21, 'promise', true, true, 1080, 1920)
          expect(result).assertTrue()
          done()
        }catch(error){
          hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
          expect().assertFail();
          done();
        }
     })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CONVERT_PIXEL_USE_FETCHFRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CONVERT_PIXEL_USE_FETCHFRAME_0100
     * @tc.desc   1.fetchFrameByTimeFromVideo convertPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CONVERT_PIXEL_USE_FETCHFRAME_0100', Level.LEVEL0, async(done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_CONVERT_PIXEL_USE_FETCHFRAME_0100';
      if (!isSupportedFetchFrameByTime) {
        console.info(testTag + " The device does not support");
        done();
        return
      }
      if (!isSupportHdr) {
        hilog.info(0x0000, "imagesupportYUV", 'case: %{public}s msg:%{public}s', testTag, 'device is not support hdr');
        done();
      } else {
        try{
            let timeUs: number = 0;
            let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
            let param: media.PixelMapParams = {
            width: 1920,
            height: 1440
            }
            let pixelMap = await fetchFrameByTimeFromVideo(testTag, 'test.mp4', timeUs, queryOption, param);
            console.info(testTag,' pixelMap')
            pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_1010102)
            let newImageInfo = await pixelMap.getImageInfo();
            console.info(testTag, ' Success convertPixelFormat:' + newImageInfo.pixelFormat)
            expect(newImageInfo.pixelFormat == image.PixelMapFormat.RGBA_1010102).assertTrue();
            done()
        }catch(error){
            console.error(testTag, ' failed; error:', JSON.stringify(error), error.code);
            expect().assertFail();
            done();
        }
      }
    })
    
 })
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'Image.EnumSupp'
let fdNumber: number;
async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG,"image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG,"image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG,"image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function imagePropertyTest(done: Function, testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = await getImageSource(path);
    console.info(TAG, testName, 'getImageSource: ',imageSourceApi);
    imageSourceApi.getImageProperty(propertyKey)
      .then((data: string) => {
        console.info(TAG, testName, "get key : ", propertyKey, 'value: ', data);
        callback(data,undefined);
      })
      .catch((error: BusinessError) => {
        console.info(TAG, testName,'getImageProperty error' , error.message, error.code);
        callback(undefined,error);
      })
      .finally(() => {
        console.info(TAG, testName + '- end');
        imageSourceApi.release();
        done();
      })
  } catch (err) {
    expect().assertFail();
    console.error(TAG, testName, err.message, err.code);
    done();
  }
}
export default function ImageEnumSupp() {
  describe('ImageEnumSupp', ()=>{
    beforeAll(async ()=>{
      console.info('beforeAll case');
    });
    beforeEach(async ()=>{
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
    });
    afterAll(()=>{
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_001
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_001
     * @tc.desc   ImageFormat Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_001', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_001---------')
      expect(image.ImageFormat.YCBCR_422_SP == 1000).assertTrue();
      expect(image.ImageFormat.JPEG == 2000).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_001,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_002
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_002
     * @tc.desc   AlphaType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_002', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_002---------')
      expect(image.AlphaType.UNKNOWN == 0).assertTrue();
      expect(image.AlphaType.OPAQUE == 1).assertTrue();
      expect(image.AlphaType.PREMUL == 2).assertTrue();
      expect(image.AlphaType.UNPREMUL == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_002,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_003
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_003
     * @tc.desc   DecodingDynamicRange Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_003', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_003---------')
      expect(image.DecodingDynamicRange.AUTO == 0).assertTrue();
      expect(image.DecodingDynamicRange.HDR == 2).assertTrue();
      expect(image.DecodingDynamicRange.SDR == 1).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_003,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_004
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_004
     * @tc.desc   PackingDynamicRange Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_004', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_004---------')
      expect(image.PackingDynamicRange.AUTO == 0).assertTrue();
      expect(image.PackingDynamicRange.SDR == 1).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_004,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_005
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_005
     * @tc.desc   AntiAliasingLevel Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_005', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_005---------')
      expect(image.AntiAliasingLevel.NONE == 0).assertTrue();
      expect(image.AntiAliasingLevel.LOW == 1).assertTrue();
      expect(image.AntiAliasingLevel.MEDIUM == 2).assertTrue();
      expect(image.AntiAliasingLevel.HIGH == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_005,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_006
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_006
     * @tc.desc   ComponentType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_006', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_006---------')
      expect(image.ComponentType.YUV_Y == 1).assertTrue();
      expect(image.ComponentType.YUV_U == 2).assertTrue();
      expect(image.ComponentType.YUV_V == 3).assertTrue();
      expect(image.ComponentType.JPEG == 4).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_006,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_007
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_007
     * @tc.desc   ScaleMode Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_007', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_007---------')
      expect(image.ScaleMode.CENTER_CROP == 1).assertTrue();
      expect(image.ScaleMode.FIT_TARGET_SIZE == 0).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_007,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_008
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_008
     * @tc.desc   HdrMetadataKey Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_008', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_008---------')
      expect(image.HdrMetadataKey.HDR_METADATA_TYPE == 0).assertTrue();
      expect(image.HdrMetadataKey.HDR_STATIC_METADATA == 1).assertTrue();
      expect(image.HdrMetadataKey.HDR_DYNAMIC_METADATA == 2).assertTrue();
      expect(image.HdrMetadataKey.HDR_GAINMAP_METADATA == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_008,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_009
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_009
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_009', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_009---------')
      expect(image.HdrMetadataType.NONE== 0).assertTrue();
      expect(image.HdrMetadataType.BASE == 1).assertTrue();
      expect(image.HdrMetadataType.GAINMAP == 2).assertTrue();
      expect(image.HdrMetadataType.ALTERNATE == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_009,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_010
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_010
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_010', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_010---------')
      expect(image.AllocatorType.AUTO== 0).assertTrue();
      expect(image.AllocatorType.DMA == 1).assertTrue();
      expect(image.AllocatorType.SHARE_MEMORY == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_010,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_ENUM_List_011
     * @tc.number SUB_MEDIA_IMAGE_ENUM_List_011
     * @tc.desc   HdrMetadataType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_ENUM_List_011', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_011---------')
      expect(image.CropAndScaleStrategy.SCALE_FIRST== 1).assertTrue();
      expect(image.CropAndScaleStrategy.CROP_FIRST == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_ENUM_List_011,end here---------')
      done();
    })
  })
}

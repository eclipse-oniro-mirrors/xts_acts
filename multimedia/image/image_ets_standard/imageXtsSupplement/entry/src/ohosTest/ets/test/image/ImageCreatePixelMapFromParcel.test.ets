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
import { rpc } from '@kit.IPCKit';


const TAG = 'Image.ImageCreatePixelMapFromParcelSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function createPixelMapFromParcelTest(done: Function, testName: string,callback:(pixelMap: image.PixelMap)=>void) {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let bufferArr: Uint8Array = new Uint8Array(color);
  for (let i = 0; i < bufferArr.length; i++) {
    bufferArr[i] = 0x80;
  }
  let opts: image.InitializationOptions = {
    editable: true,
    pixelFormat: image.PixelMapFormat.BGRA_8888,
    size: { height: 4, width: 6 },
    alphaType: image.AlphaType.UNPREMUL
  }
  let pixelMap: image.PixelMap | undefined = undefined;
  await image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
    pixelMap = srcPixelMap;
  })
  if (pixelMap != undefined) {
    callback(pixelMap);
  }
}

export default function ImageCreatePixelMapFromParcelSupp() {
  describe('ImageCreatePixelMapFromParcelSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty','')
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
      AppStorage.delete('empty')
    });


    /**
     * @tc.number   SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001
     * @tc.name     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001
     * @tc.desc     sendableImage_createPixelMapFromParcel
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001';
      createPixelMapFromParcelTest(done,testName,(pixelMap) => {
        try{
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          console.info(TAG,testName,"rpc.MessageSequence back date is",data);
          pixelMap.marshalling(data);
          console.info(TAG,testName," data.marshalling success");
          let unMarshPixelmap = image.createPixelMapFromParcel(data);
          console.info(TAG,testName," data.unmarshalling success", unMarshPixelmap);
        }catch (error) {
          console.error(TAG,testName,`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
        done();
      })
    })

    /**
     * @tc.number   SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_002
     * @tc.name     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_002
     * @tc.desc     sendableImage_createPixelMapFromParcel
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_002';
      createPixelMapFromParcelTest(done, testName, (pixelMap) => {
        try{
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          console.info(TAG,testName,"rpc.MessageSequence back date is",data);
          pixelMap.marshalling(data);
          console.info(TAG,testName," data.marshalling success");
          let unMarshPixelmap =  image.createPixelMapFromParcel(undefined);
          console.info(TAG,testName," image.createPixelMapFromParcel success",unMarshPixelmap);
        }catch (error) {
          console.error(TAG,testName,`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980178');
        }
        done();
      })
    })

    /**
     * @tc.number   SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003
     * @tc.name     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003
     * @tc.desc     sendableImage_createPixelMapFromParcel
     * @tc.size     MEDIUM
     * @tc.type     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003
     * @tc.level    Level 0
     */
    it('SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003';
      createPixelMapFromParcelTest(done, testName, (pixelMap) => {
        try{
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          console.info(TAG,testName,"rpc.MessageSequence back date is",data);
          pixelMap.marshalling(data);
          console.info(TAG,testName," data.marshalling success");
          let unMarshPixelmap =  image.createPixelMapFromParcel(null);
          console.info(TAG,testName," image.createPixelMapFromParcel success",unMarshPixelmap);
        }catch (error) {
          console.error(TAG,testName,`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980178');
        }
        done();
      })
    })
    /**
     * @tc.number   SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004
     * @tc.name     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004
     * @tc.desc     sendableImage_createPixelMapFromParcel
     * @tc.size     MEDIUM
     * @tc.type     SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004
     * @tc.level    Level 0
     */
    it('SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004';
      createPixelMapFromParcelTest(done, testName, (pixelMap) => {
        try{
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          console.info(TAG,testName,"rpc.MessageSequence back date is",data);
          pixelMap.marshalling(data);
          console.info(TAG,testName," data.marshalling success");
          let dataEmpty: rpc.MessageSequence = AppStorage.get('empty')as ESObject
          let unMarshPixelmap =  image.createPixelMapFromParcel(dataEmpty);
          console.info(TAG,testName," image.createPixelMapFromParcel success",unMarshPixelmap);
        }catch (error) {
          console.error(TAG,testName,`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('62980178');
        }
        done();
      })
    })

  })
}
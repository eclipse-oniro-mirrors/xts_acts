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
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'CreatePictureFromParcelTestSupp';

class MySequenceAbnormal implements rpc.Parcelable {
  picture: image.Picture | null = null;

  constructor(conPicture: image.Picture) {
    this.picture = conPicture;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    if (this.picture != null) {
      this.picture.marshalling(messageSequence);
      console.info(TAG, 'Marshalling success !');
      return true;
    } else {
      console.info(TAG, 'Marshalling failed !');
      return false;
    }
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    this.picture = image.createPictureFromParcel(undefined);
    this.picture.getMainPixelmap()
      .getImageInfo()
      .then((imageInfo: image.ImageInfo) => {
        console.info(TAG, 'Unmarshalling to get mainPixelmap information height:' + imageInfo.size.height + ' width:' +
        imageInfo.size.width);
      })
      .catch((error: BusinessError) => {
        console.error(TAG, `Unmarshalling failed error.code: ${error.code} ,error.message: ${error.message}`);
      });
    return true;
  }
}

async function createPictureFromParcelAbnormalParamTest(done: Function, testName: string, path: string, param: rpc.MessageSequence | null | undefined,callback:(err:number)=>void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
    if (pictureObj != null) {
      let parcelable: rpc.Parcelable;
      if (param === undefined) {
        parcelable = new MySequenceAbnormal(pictureObj);
      } else {
        parcelable = new MySequenceAbnormal(pictureObj);
      }
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      let ret: rpc.Parcelable = param === undefined ? new MySequenceAbnormal(pictureObj) : new MySequenceAbnormal(pictureObj);
      data.readParcelable(ret);
      done();
    } else {
      console.info(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code)
    done();
  }
}

export default function ImageCreatePictureFromParcelTest() {
  describe('ImageCreatePictureFromParcelTest', () => {

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
     * @tc.name   IMAGE_CREATE_PICTURE_FROM_PARCEL_001
     * @tc.number IMAGE_CREATE_PICTURE_FROM_PARCEL_001
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PICTURE_FROM_PARCEL_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PICTURE_FROM_PARCEL_001';
      const path = 'test_air.ico';
      await createPictureFromParcelAbnormalParamTest(done, testName, path, null, (errorCode: number) => {
        expect(errorCode).assertEqual(9001005)
      })
    })


    /**
     * @tc.name   IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.number IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.desc   IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PICTURE_FROM_PARCEL_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PICTURE_FROM_PARCEL_002';
      const path = 'test_air.ico';
      await createPictureFromParcelAbnormalParamTest(done, testName, path, undefined,(errorCode: number) => {
        expect(errorCode).assertEqual(9001005)
      })
  })
  })
}
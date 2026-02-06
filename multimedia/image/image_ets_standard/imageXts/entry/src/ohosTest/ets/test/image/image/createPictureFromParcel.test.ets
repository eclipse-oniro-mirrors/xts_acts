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
import { ErrorCode } from '../../CommonErrorCode';
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPictureFromParcel';

class MySequence implements rpc.Parcelable {
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
    this.picture = image.createPictureFromParcel(messageSequence);
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

async function createPictureFromParcelPromiseTest(done: Function, testName: string, path: string) {
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
      let parcelable: MySequence = new MySequence(pictureObj);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      let ret: MySequence = new MySequence(pictureObj);
      data.readParcelable(ret);
      done();
    } else {
      console.info(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

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

async function createPictureFromParcelAbnormalPromiseTest(done: Function, testName: string, path: string) {
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
      let parcelable: MySequenceAbnormal = new MySequenceAbnormal(pictureObj);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      let ret: MySequenceAbnormal = new MySequenceAbnormal(pictureObj);
      data.readParcelable(ret);
      done();
    } else {
      console.info(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.IPC_ERROR || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue()
    done();
  }
}

export default function createPictureFromParcelTest() {
  describe('createPictureFromParcelTest', () => {

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
     * @tc.number    : IMAGE_CREATE_PICTURE_FROM_PARCEL_001
     * @tc.name      : createPictureFromParcel_promise_001
     * @tc.desc      : createPictureFromParcel
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPictureFromParcel_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPictureFromParcel_promise_001';
      const path = 'test.jpg'
      await createPictureFromParcelPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.name      : createPictureFromParcel_promise_002
     * @tc.desc      : createPictureFromParcel
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPictureFromParcel_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPictureFromParcel_promise_002';
      const path = 'test.svg'
      await createPictureFromParcelPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_FROM_PARCEL_003
     * @tc.name      : createPictureFromParcel_promise_003
     * @tc.desc      : createPictureFromParcel
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPictureFromParcel_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPictureFromParcel_promise_003';
      const path = 'test_aisr.ico'
      await createPictureFromParcelPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PICTURE_FROM_PARCEL_004
     * @tc.name      : createPictureFromParcel_abnormal_promise_001
     * @tc.desc      : createPictureFromParcel
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPictureFromParcel_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPictureFromParcel_abnormal_promise_001';
      const path = 'test_aisr.ico'
      await createPictureFromParcelAbnormalPromiseTest(done, testName, path);
    })
  })
}
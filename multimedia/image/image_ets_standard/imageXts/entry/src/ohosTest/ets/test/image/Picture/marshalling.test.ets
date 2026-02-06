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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../../common';
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'marshalling';

class MySequence implements rpc.Parcelable {
  picture: image.Picture | null = null;

  constructor(conPicture: image.Picture) {
    this.picture = conPicture;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    if (this.picture != null) {
      this.picture.marshalling(messageSequence);
      console.info('Marshalling success !');
      return true;
    } else {
      console.error('Marshalling failed !');
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

async function marshallingPromiseTest(done: Function, testName: string, path: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let PictureObj: image.Picture | null = await imageSource.createPicture();
    if (PictureObj != null) {
      let parcelable: MySequence = new MySequence(PictureObj);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      // marshalling.
      data.writeParcelable(parcelable);
      let ret: MySequence = new MySequence(PictureObj);
      // unmarshalling.
      data.readParcelable(ret);
      PictureObj.release();
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function PictureMarshallingTest() {
  describe('PictureMarshallingTest', () => {

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
     * @tc.number    : PICTURE_MARSHALLING_001
     * @tc.name      : picture_marshalling_promise_001
     * @tc.desc      : picture_marshalling
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('picture_marshalling_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_marshalling_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      await marshallingPromiseTest(done, testName, path);
    })
  })
}